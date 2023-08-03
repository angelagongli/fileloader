using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace fileloader.models
{
    public class File
    {
        public int Id { get; set; }
        public string FileName { get; set; }
        public int FileLength { get; set; }
        public string Source { get; set; }
        public string Destination { get; set; }
        public int LoadType { get; set; }
        public DateTime LoadTime { get; set; }
        public int LoadedStatus { get; set; }
    }
}
