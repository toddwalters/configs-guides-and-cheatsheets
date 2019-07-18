
# Quest PowerShell CheatSheet

## Get details about particular user

`Get-QADUser <user> | ft Name, Type, DN -autosize`
`Get-QADUser <user>| ft Name,Type,userPrincipalName,DN -autosize`
`Get-QADUser "Lanham Kevin" | Format-List`

## You can use the following command to list all cmdlets found in ActiveRoles Management Shell:

`get-command Quest.ActiveRoles.ADManagement\*`

## Example 1: Retrieve groups of which a particular user is a direct member:

`C:\PS> Get-QADMemberOf 'domainName\userName'`

## Example 2: Retrieve groups whose names begin with VC and where a particular user has membership whether directly or because of group nesting:

`C:\PS> Get-QADMemberOf 'domainName\userName' -Indirect -Name 'VC*'`

## List the values of all properties of the user account:

`C:\PS> Get-QADUser JSmith -IncludeAllProperties -SerializeValues | Format-List`

## Miscellaneous example commands:

`Get-QADGroupMember AM_srvadmP_GG`

```
PS C:\pub> Get-QADUser devnsxsvc -Credential $cred | select ntac*,*able*,*expir*,*lock*

		NTAccountName             : AM\DEVNSXSVC
		AccountIsDisabled         :
		EmailAddressPolicyEnabled : False
		AccountExpires            :
		PasswordExpires           :
		PasswordNeverExpires      :
		AccountIsExpired          : False
		PasswordIsExpired         :
		AccountExpirationStatus   : Never
		AccountIsLockedOut        :
```