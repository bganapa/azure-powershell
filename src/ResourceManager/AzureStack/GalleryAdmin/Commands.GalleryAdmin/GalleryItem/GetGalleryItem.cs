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

    /// <summary>
    /// Gallery Item Cmdlet
    /// </summary>
    [Cmdlet(VerbsCommon.Get, Nouns.GalleryItem)]
    [OutputType(typeof(ResourceDefinition))]
    public class GetGalleryItem : GalleryAdminCmdletBase
    {
        /// <summary>
        /// Gets or sets the name.
        /// </summary>
        [Parameter(ValueFromPipelineByPropertyName = true)]
        [ValidateNotNull]
        public string Name { get; set; }

        /// <summary>
        /// Executes the API call(s) against Azure Resource Management API(s).
        /// </summary>
        public override void ExecuteCmdlet()
        {
            if (string.IsNullOrEmpty(this.Name))
            {
                this.WriteVerbose(Resources.ListingGalleryItems);
                this.GalleryAdminClient.AdminGalleryItems.ListBySubscription();
            }
            else
            {
                this.WriteVerbose(string.Format(CultureInfo.CurrentCulture, Resources.GettingGalleryItem, this.Name));
                this.GalleryAdminClient.AdminGalleryItems.GetGalleryItem(this.Name);
            }
        }
    }
}
