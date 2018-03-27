// <auto-generated>
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for
// license information.
//
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is
// regenerated.
// </auto-generated>

namespace Microsoft.Azure.Commands.Common.Compute.Version2016_04_preview.Models
{
    using Newtonsoft.Json;
    using System.Linq;

    /// <summary>
    /// Specifies information about the operating system disk used by the
    /// virtual machine. &lt;br&gt;&lt;br&gt; For more information about disks,
    /// see [About disks and VHDs for Azure virtual
    /// machines](https://docs.microsoft.com/azure/virtual-machines/virtual-machines-windows-about-disks-vhds?toc=%2fazure%2fvirtual-machines%2fwindows%2ftoc.json).
    /// </summary>
    public partial class OSDisk
    {
        /// <summary>
        /// Initializes a new instance of the OSDisk class.
        /// </summary>
        public OSDisk()
        {
            CustomInit();
        }

        /// <summary>
        /// Initializes a new instance of the OSDisk class.
        /// </summary>
        /// <param name="createOption">Specifies how the virtual machine should
        /// be created.&lt;br&gt;&lt;br&gt; Possible values
        /// are:&lt;br&gt;&lt;br&gt; **Attach** \u2013 This value is used when
        /// you are using a specialized disk to create the virtual
        /// machine.&lt;br&gt;&lt;br&gt; **FromImage** \u2013 This value is
        /// used when you are using an image to create the virtual machine. If
        /// you are using a platform image, you also use the imageReference
        /// element described above. If you are using a marketplace image, you
        /// also use the plan element previously described. Possible values
        /// include: 'FromImage', 'Empty', 'Attach'</param>
        /// <param name="osType">This property allows you to specify the type
        /// of the OS that is included in the disk if creating a VM from
        /// user-image or a specialized VHD. &lt;br&gt;&lt;br&gt; Possible
        /// values are: &lt;br&gt;&lt;br&gt; **Windows** &lt;br&gt;&lt;br&gt;
        /// **Linux**. Possible values include: 'Windows', 'Linux'</param>
        /// <param name="encryptionSettings">Specifies the encryption settings
        /// for the OS Disk. &lt;br&gt;&lt;br&gt; Minimum api-version:
        /// 2015-06-15</param>
        /// <param name="name">The disk name.</param>
        /// <param name="vhd">The virtual hard disk.</param>
        /// <param name="image">The source user image virtual hard disk. The
        /// virtual hard disk will be copied before being attached to the
        /// virtual machine. If SourceImage is provided, the destination
        /// virtual hard drive must not exist.</param>
        /// <param name="caching">Specifies the caching requirements.
        /// &lt;br&gt;&lt;br&gt; Possible values are: &lt;br&gt;&lt;br&gt;
        /// **None** &lt;br&gt;&lt;br&gt; **ReadOnly** &lt;br&gt;&lt;br&gt;
        /// **ReadWrite** &lt;br&gt;&lt;br&gt; Default: **None for Standard
        /// storage. ReadOnly for Premium storage**. Possible values include:
        /// 'None', 'ReadOnly', 'ReadWrite'</param>
        /// <param name="diskSizeGB">Specifies the size of an empty data disk
        /// in gigabytes. This element can be used to overwrite the name of the
        /// disk in a virtual machine image. &lt;br&gt;&lt;br&gt; This value
        /// cannot be larger than 1023 GB</param>
        /// <param name="managedDisk">The managed disk parameters.</param>
        public OSDisk(DiskCreateOptionTypes createOption, OperatingSystemTypes? osType = default(OperatingSystemTypes?), DiskEncryptionSettings encryptionSettings = default(DiskEncryptionSettings), string name = default(string), VirtualHardDisk vhd = default(VirtualHardDisk), VirtualHardDisk image = default(VirtualHardDisk), CachingTypes? caching = default(CachingTypes?), int? diskSizeGB = default(int?), ManagedDiskParameters managedDisk = default(ManagedDiskParameters))
        {
            OsType = osType;
            EncryptionSettings = encryptionSettings;
            Name = name;
            Vhd = vhd;
            Image = image;
            Caching = caching;
            CreateOption = createOption;
            DiskSizeGB = diskSizeGB;
            ManagedDisk = managedDisk;
            CustomInit();
        }

        /// <summary>
        /// An initialization method that performs custom operations like setting defaults
        /// </summary>
        partial void CustomInit();

        /// <summary>
        /// Gets or sets this property allows you to specify the type of the OS
        /// that is included in the disk if creating a VM from user-image or a
        /// specialized VHD. &amp;lt;br&amp;gt;&amp;lt;br&amp;gt; Possible
        /// values are: &amp;lt;br&amp;gt;&amp;lt;br&amp;gt; **Windows**
        /// &amp;lt;br&amp;gt;&amp;lt;br&amp;gt; **Linux**. Possible values
        /// include: 'Windows', 'Linux'
        /// </summary>
        [JsonProperty(PropertyName = "osType")]
        public OperatingSystemTypes? OsType { get; set; }

        /// <summary>
        /// Gets or sets specifies the encryption settings for the OS Disk.
        /// &amp;lt;br&amp;gt;&amp;lt;br&amp;gt; Minimum api-version:
        /// 2015-06-15
        /// </summary>
        [JsonProperty(PropertyName = "encryptionSettings")]
        public DiskEncryptionSettings EncryptionSettings { get; set; }

        /// <summary>
        /// Gets or sets the disk name.
        /// </summary>
        [JsonProperty(PropertyName = "name")]
        public string Name { get; set; }

        /// <summary>
        /// Gets or sets the virtual hard disk.
        /// </summary>
        [JsonProperty(PropertyName = "vhd")]
        public VirtualHardDisk Vhd { get; set; }

        /// <summary>
        /// Gets or sets the source user image virtual hard disk. The virtual
        /// hard disk will be copied before being attached to the virtual
        /// machine. If SourceImage is provided, the destination virtual hard
        /// drive must not exist.
        /// </summary>
        [JsonProperty(PropertyName = "image")]
        public VirtualHardDisk Image { get; set; }

        /// <summary>
        /// Gets or sets specifies the caching requirements.
        /// &amp;lt;br&amp;gt;&amp;lt;br&amp;gt; Possible values are:
        /// &amp;lt;br&amp;gt;&amp;lt;br&amp;gt; **None**
        /// &amp;lt;br&amp;gt;&amp;lt;br&amp;gt; **ReadOnly**
        /// &amp;lt;br&amp;gt;&amp;lt;br&amp;gt; **ReadWrite**
        /// &amp;lt;br&amp;gt;&amp;lt;br&amp;gt; Default: **None for Standard
        /// storage. ReadOnly for Premium storage**. Possible values include:
        /// 'None', 'ReadOnly', 'ReadWrite'
        /// </summary>
        [JsonProperty(PropertyName = "caching")]
        public CachingTypes? Caching { get; set; }

        /// <summary>
        /// Gets or sets specifies how the virtual machine should be
        /// created.&amp;lt;br&amp;gt;&amp;lt;br&amp;gt; Possible values
        /// are:&amp;lt;br&amp;gt;&amp;lt;br&amp;gt; **Attach** \u2013 This
        /// value is used when you are using a specialized disk to create the
        /// virtual machine.&amp;lt;br&amp;gt;&amp;lt;br&amp;gt; **FromImage**
        /// \u2013 This value is used when you are using an image to create the
        /// virtual machine. If you are using a platform image, you also use
        /// the imageReference element described above. If you are using a
        /// marketplace image, you  also use the plan element previously
        /// described. Possible values include: 'FromImage', 'Empty', 'Attach'
        /// </summary>
        [JsonProperty(PropertyName = "createOption")]
        public DiskCreateOptionTypes CreateOption { get; set; }

        /// <summary>
        /// Gets or sets specifies the size of an empty data disk in gigabytes.
        /// This element can be used to overwrite the name of the disk in a
        /// virtual machine image. &amp;lt;br&amp;gt;&amp;lt;br&amp;gt; This
        /// value cannot be larger than 1023 GB
        /// </summary>
        [JsonProperty(PropertyName = "diskSizeGB")]
        public int? DiskSizeGB { get; set; }

        /// <summary>
        /// Gets or sets the managed disk parameters.
        /// </summary>
        [JsonProperty(PropertyName = "managedDisk")]
        public ManagedDiskParameters ManagedDisk { get; set; }

        /// <summary>
        /// Validate the object.
        /// </summary>
        /// <exception cref="Rest.ValidationException">
        /// Thrown if validation fails
        /// </exception>
        public virtual void Validate()
        {
            if (EncryptionSettings != null)
            {
                EncryptionSettings.Validate();
            }
        }
    }
}
