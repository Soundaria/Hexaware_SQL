using System;
using System.Collections.Generic;
using System.Text;

namespace MusicAggregator_Requirement1
{
    internal class Songs
    {
        private string _title, _genre;
        private DateTime _duration;
        private double _rating; 

        public Songs() { }
        public Songs(string _title,string _genre,DateTime _duration,double _rating)
        {
            this._title = _title;
            this._genre = _genre;
            this._duration = _duration;
            this._rating = _rating;
        }
        public string Title { get { return _title; } set { _title = value; } }
        public string Genre { get { return _genre; } set { _genre = value; } }
        public DateTime Duration { get { return _duration; } set { _duration = value; } }
        public double Rating { get { return _rating; } set { _rating = value; } }

    }
}
