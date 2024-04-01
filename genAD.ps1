# Create groups
$groupData = @('Engineer', 'Doctor', 'Accountant', 'Management', 'IT', 'Hostel');

function Create-Groups($groups) {
    foreach($group in $groups) {
        New-AdGroup -Name $group -SamAccountName $group -GroupScope Global -Description "$group of ASDF Domain"
    }
}

function Remove-Groups($groups) {
    foreach($group in $groups) {
        Remove-AdGroup -Identity $group
    }
}

Create-Groups($groupData)