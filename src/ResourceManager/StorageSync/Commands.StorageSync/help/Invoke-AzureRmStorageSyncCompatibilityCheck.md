---
external help file: Microsoft.Azure.Commands.StorageSync.dll-Help.xml
Module Name: AzureRM.StorageSync
online version: https://docs.microsoft.com/en-us/powershell/module/azurerm.storagesync/invoke-azurermstoragesynccompatibilitycheck
schema: 2.0.0
---

# Invoke-AzureRmStorageSyncCompatibilityCheck

## SYNOPSIS
Checks for potential compatibility issues between your system and Azure File Sync.

## SYNTAX

### PathBased (Default)
```
Invoke-AzureRmStorageSyncCompatibilityCheck [-Path] <String> [-Credential <PSCredential>] [-SkipSystemChecks]
 [-SkipNamespaceChecks] [-Quiet] [<CommonParameters>]
```

### ComputerNameBased
```
<<<<<<< HEAD
Invoke-AzureRmStorageSyncCompatibilityCheck [-Credential <PSCredential>] -ComputerName <String>
 [-SkipSystemChecks] [-SkipNamespaceChecks] [-Quiet] [<CommonParameters>]
=======
Invoke-AzureRmStorageSyncCompatibilityCheck [-Credential <PSCredential>] [-ComputerName] <String>
 [-SkipSystemChecks] [-Quiet] [<CommonParameters>]
>>>>>>> upstream/preview
```

## DESCRIPTION
The **Invoke-AzureRmStorageSyncCompatibilityCheck** cmdlet checks for potential compatibility issues between your system and Azure File Sync. Given a local or remote path, it performs a set of validations on the system and file namespace, and then returns any compatibility issues it finds.
System checks:
- OS compatibility
File namespace checks:
- Unsupported characters
- Maximum file size
- Maximum path length
- Maximum file length
- Maximum dataset size
- Maximum directory depth

## EXAMPLES

### Example 1
```powershell
PS C:\> Invoke-AzureRmStorageSyncCompatibilityCheck C:\DATA
```

This command checks the compatibility of the system and also of files and folders in C:\DATA.

### Example 2
```powershell
PS C:\> Invoke-AzureRmStorageSyncCompatibilityCheck C:\DATA -SkipSystemChecks
```

This command checks the compatibility of files and folders in C:\DATA, but does not perform a system compatibility check.

### Example 3
```powershell
PS C:\> $errors = Invoke-AzureRmStorageSyncCompatibilityCheck C:\DATA
<<<<<<< HEAD
PS C:\> $errors | Select-Object -Property Type, Path, Level, Description, Result | Export-Csv -Path C:\results 
=======
PS C:\> $errors | Select-Object -Property Type, Path, Level, Description, Result | Export-Csv -Path C:\results
>>>>>>> upstream/preview
```

This command checks the compatibility of the system and also of files and folders in C:\DATA, and then exports the results as a CSV file to C:\results.

## PARAMETERS

### -ComputerName
The computer you are performing this check on.

```yaml
<<<<<<< HEAD
Type: String
=======
Type: System.String
>>>>>>> upstream/preview
Parameter Sets: ComputerNameBased
Aliases:

Required: True
<<<<<<< HEAD
Position: Named
=======
Position: 0
>>>>>>> upstream/preview
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Credential
Your credentials for the share you are validating.

```yaml
<<<<<<< HEAD
Type: PSCredential
=======
Type: System.Management.Automation.PSCredential
>>>>>>> upstream/preview
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Path
The UNC path of the share you are validating.

```yaml
<<<<<<< HEAD
Type: String
=======
Type: System.String
>>>>>>> upstream/preview
Parameter Sets: PathBased
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Quiet
Suppresses writing output report to console.

```yaml
<<<<<<< HEAD
Type: SwitchParameter
=======
Type: System.Management.Automation.SwitchParameter
>>>>>>> upstream/preview
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SkipNamespaceChecks
Set this flag to skip file namespace validations and only perform system validations.

```yaml
<<<<<<< HEAD
Type: SwitchParameter
=======
Type: System.Management.Automation.SwitchParameter
>>>>>>> upstream/preview
Parameter Sets: PathBased
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SkipSystemChecks
Set this flag to skip system validations and only perform file namespace validations.

```yaml
<<<<<<< HEAD
Type: SwitchParameter
=======
Type: System.Management.Automation.SwitchParameter
>>>>>>> upstream/preview
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None
<<<<<<< HEAD
This cmdlet does not accept any input.

## OUTPUTS

### PSValidationResult
=======

## OUTPUTS

### Microsoft.Azure.Commands.StorageSync.Evaluation.Models.PSValidationResult
>>>>>>> upstream/preview

## NOTES
* Keywords: azure, azurerm, arm, resource, management, storagesync, filesync

## RELATED LINKS
