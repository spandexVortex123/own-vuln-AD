# Password Policy of domain
**Get password policy of domain**
```Get-ADDefaultDomainPasswordPolicy```

**Update password policy**
```Set-ADDefaultDomainPasswordPolicy -Identity <domain name> -ComplexityEnabled $false```
------------------------------------------------------------------------------------------------

# AD Computers
**Get all AD computers**
```Get-AdComputer -Filter *```
------------------------------------------------------------------------------------------------

# AD Groups
**Add new AD group**
```New-AdGroup -Name "Employees" -SamAccountName "Employees" -GroupScope Global -Description "Employees of ASDF Domain"```

**Get All AD groups**
```Get-AdGroup -filter *```

**Remove AD group**
```Remove-AdGroup -Identity Employees```

**Add a user to group**
```Add-ADGroupMember -Identity Employees -Members j.hammond, i.sec```

**Get all users in a group**
```Get-AdGroupMember -Identity <group name>```

**Remove user from AD group**
```Remove-ADGroupMember -Identity "remote management users" -Members cerberus```
------------------------------------------------------------------------------------------------

# AD Users
**Get All AD users**
```Get-AdUser -Filter *```

**Get all users in a group**
```Get-AdGroupMember -Identity <group name>```

**Add new AD user**
```New-ADUser -Name "John Hammond" -GivenName "John" -Surname "Hammond" -SamAccountName "j.hammond" -UserPrincipalName "j.hammond@asdf.com" -AccountPassword (ConvertTo-SecureString "jhammond123" -AsPlainText -Force)```

**Enable User**
```Enable-ADAccount -Identity "j.hammond(this is samAccountName)"```