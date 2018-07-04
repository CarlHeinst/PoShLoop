$serverlist = Import-Csv -path ./servers.csv

foreach ($server in $serverlist){
    ##new-vm -name $server.ServerName
    ### Remove the hash characters to create the VM
    $linuxscript = "
    set ipconfig {0}
    set ipgateway {1}
    set server domain {2}
    " -f $server.IP, $server.gw, $server.ServerDomain
    ##invoke-vmscript -scriptname $linuxscript -ScriptType Bash
    ### Remove the hash characters to make it run the script
    Write-Output $linuxscript

}