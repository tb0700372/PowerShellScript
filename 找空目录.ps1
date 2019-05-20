function AA ($path)
{
$a=Get-ChildItem $path | Where-Object {$_.PsIsContainer -eq $True}
    foreach($i in $a){
    $Count=Get-ChildItem $i.fullname | Measure-Object | Select-Object -ExpandProperty Count
    if($Count -eq 0){
        Write-Host $i.FullName
    }
    AA($i.fullname)
    }
}
AA("E:\Project\CSDN_Python\Week02\")


