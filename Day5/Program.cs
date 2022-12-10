namespace Day5{
    public static class Day5 {
        public static void Main(string[] args){
            string text = File.ReadAllText(@"C:\Users\hersdesp\source\repos\AdventOfCode2022\Day5\input.txt");

            // Console.WriteLine((text.Split("\r\n")[0].Length + 1) / 4);

            List<List<string>> list = new List<List<string>>();
            for(int i = 0; i < 9; i++){
                list.Add(new List<string>());
            }

            for(int i = 0; i < 9; i++){
                // list[i].Add();
            }
        }
    }
}