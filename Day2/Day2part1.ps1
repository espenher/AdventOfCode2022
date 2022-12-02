$file = Get-Content "C:\Users\eppi_\Documents\AdventOfCode2022\Day2\input.txt"

$points = @()
$sum = 0
foreach($line in $file){
    $split = $line.Split(' ')
    if($split[0] -eq 'A'){ #rock
        switch($split[1]){
            "Y" { $sum += 4; break } #draw
            "X" { $sum += 3; break } #lose
            "Z" { $sum += 8; break } #win
        }
        $points += $sum
        $sum = 0
    }
    if($split[0] -eq 'B'){ #paper
        switch($split[1]){
            "Y" { $sum += 5; break } #draw
            "X" { $sum += 1; break } #lose
            "Z" { $sum += 9; break } #win
        }
        $points += $sum
        $sum = 0
    }
    if($split[0] -eq 'C'){ #scissor
        switch($split[1]){
            "Y" { $sum += 6; break } #draw
            "X" { $sum += 2; break } #lose
            "Z" { $sum += 7; break } #win
        }
        $points += $sum
        $sum = 0
    }
}

$result = $points | Measure-Object -Sum
echo $result.Sum