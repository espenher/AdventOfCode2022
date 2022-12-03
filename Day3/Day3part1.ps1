$file = Get-Content "C:\Users\eppi_\Documents\AdventOfCode2022\Day3\input.txt"
$lowerASCIIFirst = @{}
$lowerLtrFirst = @{}

$upperASCIIFirst = @{}
$upperLtrFirst = @{}

97..122 | ForEach-Object { $lowerASCIIFirst.Add($_,([char]$_).ToString())}
65..90 | ForEach-Object { $upperASCIIFirst.Add($_,([char]$_).ToString())}

foreach($k in $lowerASCIIFirst.Keys){
    $lowerLtrFirst.add($lowerASCIIFirst[$k],$k)
}
foreach($k in $upperASCIIFirst.Keys){
    $upperLtrFirst.add($upperASCIIFirst[$k],$k)
}

$chararray = @()


[bool]$next = $true
foreach($line in $file){
    $half = $line.length / 2
    $firstCompart = $line.Substring(0,$half).ToCharArray()
    $secondCompart = $line.Substring($half).ToCharArray()
    foreach($a in $firstCompart){
        $next = $true
        if($next -eq $true){
            foreach($b in $secondCompart){
                if($a -ceq $b){
                    # echo $b
                    $chararray += $b
                    $next = $false
                    break
                }
            }
        }
        if($next -eq $false){
            break
        }
    }
}






$upperLtrNumbers = @()
$lowerLtrNumbers = @()
foreach($char in $chararray){
    if($char -cmatch "[A-Z]"){
        $strNumber = $char | % {$upperLtrFirst["$_"]}
        $intNumber = [int]$strNumber -38
        $upperLtrNumbers += $intNumber
    }
    if($char -cmatch "[a-z]"){
        $strNumber = $char | % {$lowerLtrFirst["$_"]}
        $intNumber = [int]$strNumber -96
        $lowerLtrNumbers += $intNumber
    }
}


# echo $upperLtrNumbers
# echo $lowerLtrNumbers

$sumUpper = $upperLtrNumbers | Measure-Object -Sum
$sumLower = $lowerLtrNumbers | Measure-Object -Sum

$sum = $sumUpper.Sum + $sumLower.Sum

echo $sum
