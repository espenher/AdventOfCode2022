$file = Get-Content "C:\Users\eppi_\Documents\AdventOfCode2022\Day1\input.txt"

$array = @()
$summarized = @()
foreach($line in $file){
    if($line -eq ""){
        $sum = $array | Measure-Object -Sum
        $summarized += $sum.Sum
        $array = @()
    }
$array += $line
}

$highest = $summarized | Sort-Object -Descending | Select-Object -First 3

$result = $highest | Measure-Object -Sum

echo $result.Sum