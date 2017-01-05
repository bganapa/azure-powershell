// ----------------------------------------------------------------------------------
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

using Microsoft.Azure.Commands.Common.Authentication;
using Microsoft.Azure.Commands.Common.Authentication.Models;
using Microsoft.Azure.Commands.ResourceManager.Common;
using Microsoft.AzureStack.Management.GalleryAdmin;
using System.Management.Automation;

namespace Microsoft.AzureStack.Commands.GalleryAdmin
{
    public class GalleryAdminCmdletBase : AzureRMCmdlet
    {
        internal IGalleryAdminClient galleryAdminClient;

        internal IGalleryAdminClient GalleryAdminClient
        {
            get
            {
                if (galleryAdminClient == null)
                {
                    galleryAdminClient = AzureSession.ClientFactory.CreateArmClient<GalleryAdminClient>(this.DefaultContext, AzureEnvironment.Endpoint.ResourceManager);
                }
                return galleryAdminClient;
            }
            set
            {
                galleryAdminClient = value;
            }
        }
    }
}
