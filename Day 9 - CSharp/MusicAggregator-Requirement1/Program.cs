using System;
using System.Collections.Generic;

namespace MusicAggregator_Requirement1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            List<Songs> listSongs = new List<Songs>();

            for(int i = 1; i <= 2; i++)
            {
                Console.WriteLine($"Enter song {i} details : ");
                string[] song=Console.ReadLine().Split(',');
                Songs sng = new Songs(song[0], song[1], DateTime.Parse(song[2]), double.Parse(song[3]));
                listSongs.Add(sng);
            }
            foreach(var item in listSongs)
            {
                Console.WriteLine($"Title: {item.Title}\nGenre:{item.Genre}\n" +
                    $"Duration:{item.Duration.ToString("HH:mm")}\n" +
                    $"Rating:{string.Format("{0:0.0}", item.Rating)}\n");
            }
            if (listSongs[0].Title == listSongs[1].Title &&
                listSongs[0].Genre == listSongs[1].Genre &&
                listSongs[0].Duration == listSongs[1].Duration &&
                listSongs[0].Rating == listSongs[1].Rating )
            {
                Console.WriteLine("Both songs are same");
            }
            else
            {
                Console.WriteLine("Both songs are different");
            }
        }
    }
}
