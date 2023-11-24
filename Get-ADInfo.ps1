function Get-ADInfo {
    param (
        [string]$SAMAccName
    )
    Clear-Host
    Get-ADUser $SAMAccName -Properties * |
    Select-Object @{Name="Full Name";Expression={$_.DisplayName}},
    Enabled,
    title,
    MobilePhone,
    @{Name="Manager";Expression={$_.manager -replace "(CN=)(.*?),.*",'$2'}},
    language,
    @{Name="Office Country Location";Expression={$_.co}},
    @{Name="Office City Location";Expression={$_.city}},
    Company,
    Department,
    EmployeeType,
    employmentCategory,
    employmentStatus,
    WageType,
    HomeDirectory,
    HomeDrive,
    PasswordExpired,
    PasswordNeverExpires,
    PasswordNotRequired,
    WhenCreated,
    WhenChanged,
    PasswordLastSet,
    LastBadPasswordAttempt,
    LastLogonDate,
    Modified,
    LockedOut,
    @{Name="All Email Addresses";Expression={ (($_.proxyaddresses -match "^smtp:").replace("smtp:","")).replace("SMTP:","") -join "`n" } } | more
}




