$file = Get-Content "C:\Users\eppi_\Documents\AdventOfCode2022\Day2\input.txt"

$points = @()
$sum = 0
foreach($line in $file){
    $split = $line.Split(' ')
    if($split[1] -eq 'Y'){ #paper | 
        $sum += 2
        switch($split[0]){
            "A" { $sum += 6; break } #rock
            "B" { $sum += 3; break } #paper
            "C" { $sum += 0; break } #scissor
        }
        $points += $sum
        $sum = 0
    }
    if($split[1] -eq 'X'){ #rock
        $sum += 1
        switch($split[0]){
            "A" { $sum += 3; break } #rock
            "B" { $sum += 0; break } #paper
            "C" { $sum += 6; break } #scissor
        }
        $points += $sum
        $sum = 0
    }
    if($split[1] -eq 'Z'){ #scissor
        $sum += 3
        switch($split[0]){
            "A" { $sum += 0; break } #rock
            "B" { $sum += 6; break } #paper
            "C" { $sum += 3; break } #scissor
        }
        $points += $sum
        $sum = 0
    }
}

$result = $points | Measure-Object -Sum

echo $result.Sum