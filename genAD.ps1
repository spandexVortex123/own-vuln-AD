# Create groups
$groupData = @('Engineer', 'Doctor', 'Accountant', 'Management', 'IT', 'Hostel');

function Create-Groups($groups) {
    foreach($group in $groups) {
        New-AdGroup -Name $group -SamAccountName $group -GroupScope Global -Description "$group of ASDF Domain"
        Write-Host "[+] Created Group: $group"
    }
}

function Remove-Groups($groups) {
    foreach($group in $groups) {
        Remove-AdGroup -Identity $group -Confirm:$false
    }
}

# Create users
$userData = ConvertFrom-Json $(Get-Content output.json)

# creates single user and add to group
function Create-UserAndAddToGroup($user) {
    # create user
    $name = $user.firstName + " " + $lastName
    $userPrincipalName = $user.username + "@asdf.com"

    New-AdUser -Name $name -GivenName $user.firstName -Surname $user.lastName -SamAccountName $user.username -UserPrincipalName $userPrincipalName -AccountPassword (ConvertTo-SecureString $user.password -AsPlainText -Force)

    # Enable user
    Enable-ADAccount -Identity $user.username

    # Add user to group
    Add-ADGroupMember -Identity $user.group -Members $user.username
    Write-Host "[+] Created user: $user.username and added to group: $user.group"
}

function Remove-UserAndFromGroup($user) {
    # Remove user from group
    Remove-ADGroupMember -Identity $user.group -Members $user.username -Confirm:$false

    # Delete user
    Remove-ADUser -Identity $user.username -Confirm:$false
}

# test poc
function testPoc() {
    for ($i = 0;$i -lt 5;$i++) {
        $user = $userData[$i]
        # Create-UserAndAddToGroup($user)
        Create-UserAndAddToGroup($user)
    }
}

# create groups
Create-Groups($groupData)
# Remove-Groups($groupData)
testPoc