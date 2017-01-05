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

namespace Microsoft.AzureStack.Commands.GalleryAdmin
{
    using System;
    using System.Management.Automation;
    using Microsoft.AzureStack.Management.GalleryAdmin;
    using Microsoft.AzureStack.Management.GalleryAdmin.Models;
    using Microsoft.AzureStack.Commands.GalleryAdmin.Properties;
    using System.Globalization;
    using WindowsAzure.Commands.Common;

    /// <summary>
    /// Gallery Item Cmdlet - Remove Operation
    /// Todo: Define  output type
    /// </summary>
    [Cmdlet(VerbsCommon.Add, Nouns.GalleryItem)]
    public class RemoveGalleryItem : GalleryAdminCmdletBase
    {
        //Todo: Allow piping from Get-GalleryItem to be passed to RemoveGalleryItem
        /// <summary>
        /// Gets or sets the name.
        /// </summary>
        [Parameter(ValueFromPipelineByPropertyName = true, Mandatory = true)]
        [ValidateNotNull]
        public string Name { get; set; }

        /// <summary>
        /// Executes the API call(s) against Azure Resource Management API(s).
        /// </summary>
        public override void ExecuteCmdlet()
        {
            //ToDo: Confirm Action
            this.WriteVerbose(Resources.RemovingGalleryItem);
            this.GalleryAdminClient.AdminGalleryItems.DeleteGalleryItem(this.Name);
        }
    }
}
