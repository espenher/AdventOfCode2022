namespace Day6{
    public static class Program{
        public static void Main(string[] args){
            string text = File.ReadAllText(@"C:\Users\hersdesp\source\repos\AdventOfCode2022\Day6\input.txt");


            int firstMarker = 0;    
            int index = 0;
            foreach(string chunk in WholeChunks(text, 14)) {
                index++;
                string uniqueOnly = new String(chunk.Distinct().ToArray());
                if(uniqueOnly.Split('\n')[0].Length == 14){
                    firstMarker = index+13;
                }
            }

            Console.WriteLine(firstMarker);
        }

        static IEnumerable<string> WholeChunks(string str, int chunkSize) {
            for (int i = 0; i < str.Length; i++) {
                if(i == str.Length - chunkSize){
                    yield break;
                }
            yield return str.Substring(i, chunkSize);
            }
        }
    }
}