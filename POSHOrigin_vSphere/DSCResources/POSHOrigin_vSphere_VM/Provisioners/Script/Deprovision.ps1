[cmdletbinding()]
param(
    [parameter(mandatory)]
    $Options
)

begin {
    Write-Debug -Message 'Script deprovisioner: beginning'
}

process {
    $scriptPath = $Options.ProvOptions.Path
    
    if (Test-Path -Path $scriptPath) {
        & $scriptPath -Options $Options -Mode 'Deprovision'
    } else {
        Write-Error -Message "Unable to find provisioner script [$scriptPath]"
    }
}

end {
    Write-Debug -Message 'Script deprovisioner: ending'
}