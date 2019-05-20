Write-Host DU 1.0 - 统计目录大小的脚本，作用和linux的du类似。`n
$args = "D:/SOFT"
if (!$args)
{write-host "du 绝对目录名，如：`ndu.ps1 d:/mp3"}
elseif (!(Test-Path $args))
{write-host "错误：找不到目标目录名！"}
else
{
$b=Get-ChildItem $args -Recurse | Measure-Object -property length -sum
write-host "----【$args -- ",("{0:N2}" -f ($b.sum / 1MB)),"MB】----"
$a=Get-ChildItem $args | Where-Object {$_.PsIsContainer -eq $true}
foreach ($i in $a)
{
$subFolderItems = (Get-ChildItem $i.FullName -Recurse  | Measure-Object -property length -sum)
$i.FullName + " -- " + "{0:N2}" -f ($subFolderItems.sum / 1MB) + " MB"
}
}
pause
