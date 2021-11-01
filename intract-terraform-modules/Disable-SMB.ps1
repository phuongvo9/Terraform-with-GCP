#j.vo@linkbynet.com ad-hoc script
$path = "C:\Users\adm-JVO\Downloads\Disable-SMBv1\"
#mkdir $path

#New-Item -Path $path -ItemType File -Value import.txt

$logpath = $path + "results.csv"
$servers = Get-Content  ($path+"import.txt")
$count = 0

# KR G-GRES-SEO-Servers-SMBv1_disabled
# HK G-GRES-HKG-Servers-SMBv1_disabled
$HKgroup = "G-GRES-HKG-Servers-SMBv1_disabled"

foreach ($server in $servers)
{
    $ErrorOccured=$false
    try
    {
      ADD-ADGroupMember $HKgroup –members "$server$"
      #Roll back
      # REMOVE-ADGroupMember $KRGroup –members "$server$" -Confirm:$False
        
    }
    catch
    {
        Write-Warning "Error occured on $server"
        $server >> "error_server.txt"

    }
    $count = $count + 1
}
Write-Host $count " servers are checked"

Write-Host ("Result: ") -ForegroundColor Green

GET-ADGroupMember $HKgroup | select name


