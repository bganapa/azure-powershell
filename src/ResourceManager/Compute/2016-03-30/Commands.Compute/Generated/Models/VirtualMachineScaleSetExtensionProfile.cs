// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for
// license information.
// 
// Code generated by Microsoft (R) AutoRest Code Generator 0.14.0.0
// Changes may cause incorrect behavior and will be lost if the code is
// regenerated.

namespace Microsoft.Azure.Management.Compute.Models
{
    using System;
    using System.Linq;
    using System.Collections.Generic;
    using Newtonsoft.Json;
    using Microsoft.Rest;
    using Microsoft.Rest.Serialization;
    using Microsoft.Rest.Azure;

    /// <summary>
    /// Describes a virtual machine scale set extension profile.
    /// </summary>
    public partial class VirtualMachineScaleSetExtensionProfile
    {
        /// <summary>
        /// Initializes a new instance of the
        /// VirtualMachineScaleSetExtensionProfile class.
        /// </summary>
        public VirtualMachineScaleSetExtensionProfile() { }

        /// <summary>
        /// Initializes a new instance of the
        /// VirtualMachineScaleSetExtensionProfile class.
        /// </summary>
        public VirtualMachineScaleSetExtensionProfile(IList<VirtualMachineScaleSetExtension> extensions = default(IList<VirtualMachineScaleSetExtension>))
        {
            Extensions = extensions;
        }

        /// <summary>
        /// Gets the virtual machine scale set child extension resources.
        /// </summary>
        [JsonProperty(PropertyName = "extensions")]
        public IList<VirtualMachineScaleSetExtension> Extensions { get; set; }

    }
}
