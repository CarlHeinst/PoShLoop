

function Send-RemoteFileCopy() {
  Param(
    [Parameter(Mandatory=$true,ValueFromPipeline=$true)][String[]]$backupDestination="\\Default\UnC\Path$",
    [Parameter(Mandatory=$true)][String[]]$DirectoryList
  )
    begin {
      try {
        if (-Not (Test-Path $valueTest)) {
          Throw "Path $backupDestination not found"
        }
      }
      catch {
        write-host $DirectoryList
      }
    }
    process {
      foreach ($path in $directoryList){
        $items = Get-Childitem $path -Recurse -Directory $false
        foreach ($item in $items){
          $newname = $env:COMPUTERNAME+"-"+$item.FullName -replace "\\","-"
          write-host $newname
          #Copy-Item -Path $item.FullName -Destination $backupDestination\
        }
      }
    }
}
Send-RemoteFileCopy -backupDestination "c:\temp\" -directoryList "C:\Users\chein\Documents\"