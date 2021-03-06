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

namespace Microsoft.Azure.Commands.Storage
{
    using Commands.Common.Storage.ResourceModel;
    using Microsoft.WindowsAzure.Commands.Common.Storage.ResourceModel;
    using Microsoft.WindowsAzure.Commands.Common.Storage;
    using Microsoft.Azure.Commands.Storage.Common;


    using Microsoft.Azure.Commands.Storage.Model.Contract;
    using Microsoft.Azure.Storage;
    using Microsoft.Azure.Storage.Blob;
    using System;
    using System.Collections.Generic;
    using System.Globalization;

    /// <summary>
    /// Base cmdlet for storage blob/container cmdlet
    /// </summary>
    public class StorageCloudBlobCmdletBase : StorageCloudCmdletBase<IStorageBlobManagement>
    {
        /// <summary>
        /// Initializes a new instance of the StorageCloudBlobCmdletBase class.
        /// </summary>
        public StorageCloudBlobCmdletBase()
            : this(null)
        {
        }

        /// <summary>
        /// Initializes a new instance of the StorageCloudBlobCmdletBase class.
        /// </summary>
        /// <param name="channel">IStorageBlobManagement channel</param>
        public StorageCloudBlobCmdletBase(IStorageBlobManagement channel)
        {
            Channel = channel;
        }

        /// <summary>
        /// Blob request options
        /// </summary>
        public BlobRequestOptions RequestOptions
        {
            get
            {
                return (BlobRequestOptions)GetRequestOptions(StorageServiceType.Blob);
            }
        }

        protected static CloudBlob GetBlobReferenceFromServerWithContainer(
            IStorageBlobManagement localChannel,
            CloudBlobContainer container,
            string blobName,
            AccessCondition accessCondition = null,
            BlobRequestOptions requestOptions = null,
            OperationContext operationContext = null,
            DateTimeOffset? snapshotTime = null)
        {
            return GetBlobReferenceWrapper(() =>
                {
                    try
                    {
                        return localChannel.GetBlobReferenceFromServer(container, blobName, accessCondition, requestOptions, operationContext, snapshotTime);
                    }
                    catch (InvalidOperationException)
                    {
                        return null;
                    }
                },
                blobName,
                container.Name);
        }

        protected static CloudBlob GetBlobSnapshotReferenceFromServerWithContainer(
            IStorageBlobManagement localChannel,
            CloudBlobContainer container,
            string blobName,
            DateTime SrcBlobSnapshotTime,
            AccessCondition accessCondition = null,
            BlobRequestOptions requestOptions = null,
            OperationContext operationContext = null)
        {
            return GetBlobReferenceWrapper(() =>
            {
                try
                {
                    return localChannel.GetBlobReferenceFromServer(container, blobName, accessCondition, requestOptions, operationContext);
                }
                catch (InvalidOperationException)
                {
                    return null;
                }
            },
                blobName,
                container.Name);
        }

        protected static CloudBlob GetBlobReferenceWrapper(Func<CloudBlob> getBlobReference, string blobName, string containerName)
        {
            CloudBlob blob = getBlobReference();

            if (null == blob)
            {
                throw new ResourceNotFoundException(String.Format(ResourceV2.BlobNotFound, blobName, containerName));
            }

            return blob;
        }

        /// <summary>
        /// Make sure the pipeline blob is valid and already existing
        /// </summary>
        /// <param name="blob">CloudBlob object</param>
        internal void ValidatePipelineCloudBlob(CloudBlob blob)
        {
            if (null == blob)
            {
                throw new ArgumentException(String.Format(ResourceV2.ObjectCannotBeNull, typeof(CloudBlob).Name));
            }

            if (!NameUtil.IsValidBlobName(blob.Name))
            {
                throw new ArgumentException(String.Format(ResourceV2.InvalidBlobName, blob.Name));
            }

            ValidatePipelineCloudBlobContainer(blob.Container);
            //BlobRequestOptions requestOptions = RequestOptions;

            //if (!Channel.DoesBlobExist(blob, requestOptions, OperationContext))
            //{
            //    throw new ResourceNotFoundException(String.Format(ResourceV2.BlobNotFound, blob.Name, blob.Container.Name));
            //}
        }

        /// <summary>
        /// Make sure the container is valid and already existing 
        /// </summary>
        /// <param name="container">A CloudBlobContainer object</param>
        internal void ValidatePipelineCloudBlobContainer(CloudBlobContainer container)
        {
            if (null == container)
            {
                throw new ArgumentException(String.Format(ResourceV2.ObjectCannotBeNull, typeof(CloudBlobContainer).Name));
            }

            if (!NameUtil.IsValidContainerName(container.Name))
            {
                throw new ArgumentException(String.Format(ResourceV2.InvalidContainerName, container.Name));
            }

            //BlobRequestOptions requestOptions = RequestOptions;

            //if (container.ServiceClient.Credentials.IsSharedKey 
            //    && !Channel.DoesContainerExist(container, requestOptions, OperationContext))
            //{
            //    throw new ResourceNotFoundException(String.Format(ResourceV2.ContainerNotFound, container.Name));
            //}
        }

        /// <summary>
        /// Create blob client and storage service management channel if need to.
        /// </summary>
        /// <returns>IStorageManagement object</returns>
        protected override IStorageBlobManagement CreateChannel()
        {
            //Init storage blob management channel
            if (Channel == null || !ShareChannel)
            {
                Channel = new StorageBlobManagement(GetCmdletStorageContext());
            }

            return Channel;
        }

        /// <summary>
        /// Get a service channel object using specified storage account
        /// </summary>
        /// <param name="account">Cloud storage account object</param>
        /// <returns>IStorageBlobManagement channel object</returns>
        protected IStorageBlobManagement CreateChannel(AzureStorageContext context)
        {
            return new StorageBlobManagement(context);
        }

        /// <summary>
        /// whether the specified blob is a snapshot
        /// </summary>
        /// <param name="blob">CloudBlob object</param>
        /// <returns>true if the specified blob is snapshot, otherwise false</returns>
        internal bool IsSnapshot(CloudBlob blob)
        {
            return !string.IsNullOrEmpty(blob.Name) && blob.SnapshotTime != null;
        }

        /// <summary>
        /// Write CloudBlob to output using specified service channel
        /// </summary>
        /// <param name="blob">The output CloudBlob object</param>
        /// <param name="channel">IStorageBlobManagement channel object</param>
        internal void WriteCloudBlobObject(long taskId, IStorageBlobManagement channel, CloudBlob blob, BlobContinuationToken continuationToken = null)
        {
            Microsoft.Azure.Commands.Common.Storage.ResourceModel.AzureStorageBlob azureBlob = new Microsoft.Azure.Commands.Common.Storage.ResourceModel.AzureStorageBlob(blob);
            azureBlob.Context = channel.StorageContext;
            azureBlob.ContinuationToken = continuationToken;
            OutputStream.WriteObject(taskId, azureBlob);
        }

        /// <summary>
        /// Write CloudBlob to output using specified service channel
        /// </summary>
        /// <param name="blob">The output CloudBlob object</param>
        /// <param name="channel">IStorageBlobManagement channel object</param>
        internal void WriteCloudContainerObject(long taskId, IStorageBlobManagement channel,
            CloudBlobContainer container, BlobContainerPermissions permissions, BlobContinuationToken continuationToken = null)
        {
            Microsoft.Azure.Commands.Common.Storage.ResourceModel.AzureStorageContainer azureContainer = new Microsoft.Azure.Commands.Common.Storage.ResourceModel.AzureStorageContainer(container, permissions);
            azureContainer.Context = channel.StorageContext;
            azureContainer.ContinuationToken = continuationToken;
            OutputStream.WriteObject(taskId, azureContainer);
        }

        protected void ValidateBlobType(CloudBlob blob)
        {
            if ((BlobType.BlockBlob != blob.BlobType)
                && (BlobType.PageBlob != blob.BlobType)
                && (BlobType.AppendBlob != blob.BlobType))
            {
                throw new InvalidOperationException(string.Format(
                    CultureInfo.CurrentCulture,
                    ResourceV2.InvalidBlobType,
                    blob.BlobType,
                    blob.Name));
            }
        }

        protected void ValidateBlobTier(BlobType type, PremiumPageBlobTier? pageBlobTier)
        {
            if ((pageBlobTier != null)
                && (type != BlobType.PageBlob))
            {
                throw new ArgumentOutOfRangeException("BlobType, PageBlobTier", String.Format("PremiumPageBlobTier can only be set to Page Blob. The Current BlobType is: {0}", type));
            }
        }

        protected bool ContainerIsEmpty(CloudBlobContainer container)
        {
            try
            {
                BlobContinuationToken blobToken = new BlobContinuationToken();
                using (IEnumerator<IListBlobItem> listedBlobs = container
                    .ListBlobsSegmentedAsync("", true, BlobListingDetails.None, 1, blobToken, RequestOptions,
                        OperationContext).Result.Results.GetEnumerator())
                {
                    return !(listedBlobs.MoveNext() && listedBlobs.Current != null);
                }
            }
            catch(Exception)
            {
                return false;
            }
        }

    }
}