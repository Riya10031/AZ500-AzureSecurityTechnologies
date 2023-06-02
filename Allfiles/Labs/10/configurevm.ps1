# Install Chocolatey Packager

Function InstallChocolatey
{   
    $env:chocolateyUseWindowsCompression = 'true'
    $env:chocolateyIgnoreRebootDetected = 'true'
    $env:chocolateyVersion = '1.4.0'
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    choco feature enable -n allowGlobalConfirmation
}
InstallChocolatey

# Silent Install Software Tools
# Install System Tools
# Install Microsoft Edge
Function InstallEdgeChromium
{
    #Download and Install edge
    $WebClient = New-Object System.Net.WebClient
    $WebClient.DownloadFile("http://go.microsoft.com/fwlink/?LinkID=2093437","C:\Packages\MicrosoftEdgeBetaEnterpriseX64.msi")
    sleep 5
    
    Start-Process msiexec.exe -Wait '/I C:\Packages\MicrosoftEdgeBetaEnterpriseX64.msi /qn' -Verbose 
    
}
InstallEdgeChromium
# Install .NET Core SDK
choco install dotnetcore-sdk -confirm:$false
# Install PowerShell Core 7
choco install powershell-core -confirm:$false
# Install SQL Server Management Studio
choco install sql-server-management-studio -confirm:$false


# Install Azure Tools
# Install Azure CLI
choco install azure-cli -confirm:$false
# Install Azure PowerShell
choco install azurepowershell -confirm:$false
# Install Google Chrome
choco install googlechrome -confirm:$false
