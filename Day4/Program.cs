using System;


namespace Day4{
    public static class Program {
        public static void Main(string[] args){
            string text = File.ReadAllText(@"C:\Users\hersdesp\source\repos\AdventOfCode2022\Day4\input.txt");
            IEnumerable<int> test = Enumerable.Range(1, 10);

            
            int fullOverlapCounter = 0;
            int partialOverlapCounter = 0;
            foreach(string line in text.Split("\n")){
                int firstNumFirstPair = Int32.Parse(line.Split(",")[0].Split("-")[0]);
                int secondNumFirstPair = Int32.Parse(line.Split(",")[0].Split("-")[1]);
                int firstNumSecondPair = Int32.Parse(line.Split(",")[1].Split("-")[0]);
                int secondNumSecondPair = Int32.Parse(line.Split(",")[1].Split("-")[1]);

                // part 1
                if(firstNumFirstPair <= firstNumSecondPair && secondNumFirstPair >= secondNumSecondPair){
                    // Console.WriteLine(
                    //     firstNumFirstPair + "-" + 
                    //     secondNumFirstPair + "," + 
                    //     secondNumFirstPair + "-" + 
                    //     secondNumSecondPair
                    // );
                    fullOverlapCounter++;
                } else if (firstNumFirstPair >= firstNumSecondPair && secondNumFirstPair <= secondNumSecondPair){
                    // Console.WriteLine(
                    //     firstNumFirstPair + "-" + 
                    //     secondNumFirstPair + "," + 
                    //     secondNumFirstPair + "-" + 
                    //     secondNumSecondPair
                    //     );
                    fullOverlapCounter++;
                }
                // part 2 
                if((firstNumFirstPair >= firstNumSecondPair && firstNumFirstPair <= secondNumSecondPair) || 
                    (firstNumSecondPair >= firstNumFirstPair && firstNumSecondPair <= secondNumFirstPair)){
                    Console.WriteLine(
                        firstNumFirstPair + "-" + 
                        secondNumFirstPair + "," + 
                        firstNumSecondPair + "-" + 
                        secondNumSecondPair
                    );
                    partialOverlapCounter++;
                }
            }

            Console.WriteLine(partialOverlapCounter);
        }
    }
}