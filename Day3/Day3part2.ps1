$file = Get-Content "C:\Users\eppi_\Documents\AdventOfCode2022\Day3\input.txt"

$chunks=for($i=0; $i -lt $file.length; $i+=3){ 
    ,($file[$i], $file[$i+1],$file[$i+2])
}

function find-letter {
    param (
        [string]$letter,
        [string]$row
    )
    echo "letter: " $letter
    echo "row: " $row
    foreach($char in $row){

        if($letter -eq $char){
            return $true
        }
    }

    return $false
}


$test = "abcdef"
if($test.Contains("c")){
    echo "hallo"
}



$list = @()
for($i=0;$i -lt $chunks[0].Length;$i++){

}

# find-letter($chunk[0][$i], $chunk[1]) -and find-letter($chunk[0][$i], $chunk[2])

foreach($chunk in $chunks){
    for($i=0;$i -lt $chunk[0].Length;$i++){
        $existsIn2ndRow = find-letter($chunk[0][$i], $chunk[1])
        $existsIn3rdRow = find-letter($chunk[0][$i], $chunk[2])

        if( $existsIn2ndRow -eq $true){
            # echo $chunk[0][$i]
            $list += $chunk[0][$i]
            break
        }
    }
}

# foreach($chunk in $chunks){
#     for($i=0;$i -lt $chunk[0].Length;$i++){
#         if($chunk[1].Contains($chunk[0][$i]) -and $chunk[2].Contains($chunk[0][$i])){
#             $list += $chunk[0][$i]
#             break
#         }
#     }
# }


$upperLtrNumbers = @()
$lowerLtrNumbers = @()
foreach($char in $list){
    if($char -cmatch "[A-Z]"){
        $strNumber = [byte][char]$char
        $intNumber = [int]$strNumber -38
        $upperLtrNumbers += $intNumber
    }
    if($char -cmatch "[a-z]"){
        $strNumber = [byte][char]$char
        $intNumber = [int]$strNumber -96
        $lowerLtrNumbers += $intNumber
    }
}

$sumUpper = $upperLtrNumbers | Measure-Object -Sum
$sumLower = $lowerLtrNumbers | Measure-Object -Sum

$sum = $sumUpper.Sum + $sumLower.Sum

echo $sum