﻿// ----------------------------------------------------------------------------------
//
// Copyright Microsoft Corporation
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// ----------------------------------------------------------------------------------

namespace Microsoft.Azure.Commands.Storage.Common
{
    using Microsoft.Azure.Commands.Storage.Model.Contract;
    using Microsoft.Azure.Storage;
    using Microsoft.Azure.Storage.Blob;
    using Microsoft.Azure.Storage.File;
    using Microsoft.Azure.Storage.Queue;
    using Microsoft.Azure.Storage.Queue.Protocol;
    using XTable = Microsoft.Azure.Cosmos.Table;
    using System;
    using System.Collections.Generic;


    internal class SasTokenHelper
    {
        /// <summary>
        /// Validate the container access policy
        /// </summary>
        /// <param name="policy">SharedAccessBlobPolicy object</param>
        /// <param name="policyIdentifier">The policy identifier which need to be checked.</param>
        public static bool ValidateContainerAccessPolicy(IStorageBlobManagement channel, string containerName,
            SharedAccessBlobPolicy policy, string policyIdentifier)
        {
            if (string.IsNullOrEmpty(policyIdentifier)) return true;
            CloudBlobContainer container = channel.GetContainerReference(containerName);
            AccessCondition accessCondition = null;
            BlobRequestOptions options = null;
            OperationContext context = null;
            BlobContainerPermissions permission = channel.GetContainerPermissions(container, accessCondition, options, context);

            SharedAccessBlobPolicy sharedAccessPolicy =
                GetExistingPolicy<SharedAccessBlobPolicy>(permission.SharedAccessPolicies, policyIdentifier);

            if (policy.Permissions != SharedAccessBlobPermissions.None)
            {
                throw new ArgumentException(ResourceV2.SignedPermissionsMustBeOmitted);
            }

            if (policy.SharedAccessExpiryTime.HasValue && sharedAccessPolicy.SharedAccessExpiryTime.HasValue)
            {
                throw new ArgumentException(ResourceV2.SignedExpiryTimeMustBeOmitted);
            }

            return !sharedAccessPolicy.SharedAccessExpiryTime.HasValue;
        }

        /// <summary>
        /// Validate the file share access policy
        /// </summary>
        /// <param name="policy">SharedAccessFilePolicy object</param>
        /// <param name="policyIdentifier">The policy identifier which need to be checked.</param>
        public static bool ValidateShareAccessPolicy(IStorageFileManagement channel, string shareName,
             string policyIdentifier, bool shouldNoPermission, bool shouldNoStartTime, bool shouldNoExpiryTime)
        {
            if (string.IsNullOrEmpty(policyIdentifier)) return true;
            CloudFileShare fileShare = channel.GetShareReference(shareName);
            FileSharePermissions permission;

            try
            {
                permission = fileShare.GetPermissionsAsync().Result;
            }
            catch (AggregateException e) when (e.InnerException is StorageException)
            {
                throw e.InnerException;
            }

            SharedAccessFilePolicy sharedAccessPolicy =
                GetExistingPolicy<SharedAccessFilePolicy>(permission.SharedAccessPolicies, policyIdentifier);

            if (shouldNoPermission && sharedAccessPolicy.Permissions != SharedAccessFilePermissions.None)
            {
                throw new InvalidOperationException(ResourceV2.SignedPermissionsMustBeOmitted);
            }

            if (shouldNoStartTime && sharedAccessPolicy.SharedAccessStartTime.HasValue)
            {
                throw new InvalidOperationException(ResourceV2.SignedStartTimeMustBeOmitted);
            }

            if (shouldNoExpiryTime && sharedAccessPolicy.SharedAccessExpiryTime.HasValue)
            {
                throw new InvalidOperationException(ResourceV2.SignedExpiryTimeMustBeOmitted);
            }

            return !sharedAccessPolicy.SharedAccessExpiryTime.HasValue;
        }

        /// <summary>
        /// Validate the queue access policy
        /// </summary>
        /// <param name="policy">SharedAccessBlobPolicy object</param>
        /// <param name="policyIdentifier">The policy identifier which need to be checked.</param>
        public static bool ValidateQueueAccessPolicy(IStorageQueueManagement channel, string queueName,
            SharedAccessQueuePolicy policy, string policyIdentifier)
        {
            if (string.IsNullOrEmpty(policyIdentifier)) return true;
            CloudQueue queue = channel.GetQueueReference(queueName);
            QueueRequestOptions options = null;
            OperationContext context = null;
            QueuePermissions permission = channel.GetPermissions(queue, options, context);

            SharedAccessQueuePolicy sharedAccessPolicy =
                GetExistingPolicy<SharedAccessQueuePolicy>(permission.SharedAccessPolicies, policyIdentifier);

            if (policy.Permissions != SharedAccessQueuePermissions.None)
            {
                throw new ArgumentException(ResourceV2.SignedPermissionsMustBeOmitted);
            }

            if (policy.SharedAccessExpiryTime.HasValue && sharedAccessPolicy.SharedAccessExpiryTime.HasValue)
            {
                throw new ArgumentException(ResourceV2.SignedExpiryTimeMustBeOmitted);
            }

            return !sharedAccessPolicy.SharedAccessExpiryTime.HasValue;
        }

        /// <summary>
        /// Validate the table access policy
        /// </summary>
        /// <param name="policy">SharedAccessBlobPolicy object</param>
        /// <param name="policyIdentifier">The policy identifier which need to be checked.</param>
        internal static bool ValidateTableAccessPolicy(IStorageTableManagement channel,
            string tableName, XTable.SharedAccessTablePolicy policy, string policyIdentifier)
        {
            if (string.IsNullOrEmpty(policyIdentifier)) return true;
            XTable.CloudTable table = channel.GetTableReference(tableName);
            XTable.TableRequestOptions options = null;
            XTable.OperationContext context = null;
            XTable.TablePermissions permission = channel.GetTablePermissions(table, options, context);

            XTable.SharedAccessTablePolicy sharedAccessPolicy =
                GetExistingPolicy<XTable.SharedAccessTablePolicy>(permission.SharedAccessPolicies, policyIdentifier);

            if (policy.Permissions != XTable.SharedAccessTablePermissions.None)
            {
                throw new ArgumentException(ResourceV2.SignedPermissionsMustBeOmitted);
            }

            if (policy.SharedAccessExpiryTime.HasValue && sharedAccessPolicy.SharedAccessExpiryTime.HasValue)
            {
                throw new ArgumentException(ResourceV2.SignedExpiryTimeMustBeOmitted);
            }

            return !sharedAccessPolicy.SharedAccessExpiryTime.HasValue;
        }

        /// <summary>
        /// Valiate access policy
        /// </summary>
        /// <param name="policies">Access policy</param>
        /// <param name="policyIdentifier">policyIdentifier</param>
        internal static T GetExistingPolicy<T>(IDictionary<string, T> policies, string policyIdentifier)
        {
            policyIdentifier = policyIdentifier.ToLower();//policy name should case-insensitive in url.
            foreach (KeyValuePair<string, T> pair in policies)
            {
                if (pair.Key.ToLower() == policyIdentifier)
                {
                    return pair.Value;
                }
            }

            throw new ArgumentException(string.Format(ResourceV2.InvalidAccessPolicy, policyIdentifier));
        }

        public static void SetupAccessPolicyLifeTime(DateTime? startTime, DateTime? expiryTime,
            out DateTimeOffset? SharedAccessStartTime, out DateTimeOffset? SharedAccessExpiryTime, bool shouldSetExpiryTime)
        {
            SharedAccessStartTime = null;
            SharedAccessExpiryTime = null;
            //Set up start/expiry time
            if (startTime != null)
            {
                SharedAccessStartTime = startTime.Value.ToUniversalTime();
            }

            if (expiryTime != null)
            {
                SharedAccessExpiryTime = expiryTime.Value.ToUniversalTime();
            }
            else if (shouldSetExpiryTime)
            {
                double defaultLifeTime = 1.0; //Hours

                if (SharedAccessStartTime != null)
                {
                    SharedAccessExpiryTime = SharedAccessStartTime.Value.AddHours(defaultLifeTime).ToUniversalTime();
                }
                else
                {
                    SharedAccessExpiryTime = DateTime.UtcNow.AddHours(defaultLifeTime).ToUniversalTime();
                }
            }

            if (SharedAccessStartTime != null && SharedAccessExpiryTime.HasValue
                && SharedAccessExpiryTime <= SharedAccessStartTime)
            {
                throw new ArgumentException(String.Format(ResourceV2.ExpiryTimeGreatThanStartTime,
                    SharedAccessExpiryTime.ToString(), SharedAccessStartTime.ToString()));
            }
        }

        public static string GetFullUriWithSASToken(string absoluteUri, string sasToken)
        {

            if (absoluteUri.Contains("?"))
            {
                // There is already a query string in the URI,
                // remove "?" from sas token.
                return absoluteUri + sasToken.Substring(1);
            }
            else
            {
                return absoluteUri + sasToken;
            }
        }
    }
}
