using System;


namespace Day4{
    public static class Program {
        public static void Main(string[] args){
            string text = File.ReadAllText(@"C:\Users\eshers\OneDrive - NorgesGruppen\Skrivebord\aoc\Day4\input.txt");
            IEnumerable<int> test = Enumerable.Range(1, 10);

            

            foreach(string line in text.Split("\n")){
                int firstNumFirstPair = Int32.Parse(line.Split(",")[0].Split("-")[0]);
                int secondNumFirstPair = Int32.Parse(line.Split(",")[0].Split("-")[1]);
                int firstNumSecondPair = Int32.Parse(line.Split(",")[1].Split("-")[0]);
                int secondNumSecondPair = Int32.Parse(line.Split(",")[1].Split("-")[1]);
                // Console.WriteLine(firstNumFirstPair + "-" + secondNumFirstPair + "," + firstNumSecondPair + "-" + secondNumSecondPair);

                IEnumerable<int> firstPair = Enumerable.Range(firstNumFirstPair, secondNumFirstPair);
                IEnumerable<int> secondPair = Enumerable.Range(firstNumSecondPair, secondNumSecondPair);

                string result = string.Join(",",secondPair);

                Console.WriteLine(result);

                foreach(int num in firstPair){
                    // Console.WriteLine(num);
                    // Console.WriteLine("________");
                }

            }

            foreach(int num in test){
                // Console.WriteLine(num);
            }
        }
    }
}