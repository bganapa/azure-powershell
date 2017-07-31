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

using System;
using Microsoft.Azure.Commands.Common.Authentication.Abstractions;
using Microsoft.Azure.Commands.Common.Authentication.Models;
using System.Threading;

namespace Microsoft.Azure.Commands.Common.Authentication.ResourceManager
{
    public class AzureRmAutosaveProfile : IProfileOperations, IDisposable
    {
        AzureRmProfile _current, _default;
        IFileProvider _provider;

        AzureRmProfile DefaultProfile
        {
            get
            {
                if (_default == null)
                {
                    _default = new AzureRmProfile(_provider);
                }
                return _default;
            }
        }

        public AzureRmAutosaveProfile(AzureRmProfile currentProfile, IFileProvider defaultProvider)
        {
            _current = currentProfile;
            _provider = defaultProvider;
        }

        public AzureRmProfile Profile
        {
            get
            {
                return _current;
            }
        }

        public bool TryAddContext(IAzureContext context)
        {
            bool local = Profile.TryAddContext(context);
            bool remote = DefaultProfile.TryAddContext(context);
            return local || remote;
        }

        public bool TryAddContext(string name, IAzureContext context)
        {
            bool result = false;
            if (!(Profile.Contexts.ContainsKey(name) || DefaultProfile.Contexts.ContainsKey(name)))
            {
                result = Profile.TryAddContext(name, context) && DefaultProfile.TryAddContext(name, context);
            }

            return result;
        }

        public bool TryFindContext(IAzureContext context, out string name)
        {
            return Profile.TryFindContext(context, out name);
        }

        public bool TryGetContextName(IAzureContext context, out string name)
        {
            return Profile.TryGetContextName(context, out name);
        }

        public bool TryRemoveContext(string name)
        {
            bool result = false;

            if (Profile.TryRemoveContext(name))
            {
                DefaultProfile.TryRemoveContext(name);
                result = true;
            }

            return result;
        }

        public bool TryRenameContext(string sourceName, string targetName)
        {
            bool result = false;
            if (Profile.TryRenameContext(sourceName, targetName))
            {
                DefaultProfile.TryRenameContext(sourceName, targetName);
                result = true;
            }

            return result;
        }

        public bool TrySetContext(IAzureContext context)
        {
            bool local = Profile.TrySetContext(context);
            bool remote = DefaultProfile.TrySetContext(context);
            return local || remote;
        }

        public bool TrySetContext(string name, IAzureContext context)
        {
            bool result = Profile.TrySetContext(name, context);
            DefaultProfile.TrySetContext(name, context);
            return result;
        }

        public bool TrySetDefaultContext(string name)
        {
            bool result = Profile.TrySetDefaultContext(name);
            if (result)
            {
                if (!!DefaultProfile.Contexts.ContainsKey(name))
                {
                    var localContext = Profile.Contexts[name];
                    DefaultProfile.TrySetContext(name, localContext);
                }

                DefaultProfile.TrySetDefaultContext(name);
            }

            return result;
        }

        protected virtual void Dispose(bool disposing)
        {
            if (disposing)
            {
                IFileProvider disposable = Interlocked.Exchange(ref _provider, null);
                if (disposable != null)
                {
                    disposable.Dispose();
                }
            }
        }
        public void Dispose()
        {
            Dispose(true);
        }
    }
}
