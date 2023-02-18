# Vuln AD


## Setup
1. User `sconfig` to update:
    - Computer Name
    - Set static IP Address
    - Set DNS servers

## Installing Active Directory (Windows 2016 core server)
1. Install-WindowsFeatures AD-Domain-Services -IncludeManagementTools
2. Import-ADDSDeployment
3. Install-ADDSForest
    - Provide Domain address
    - Enter SafeModeAdministratorPassword