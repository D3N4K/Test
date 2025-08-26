using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WindowsFormsTestApp.Classes
{
    internal class Status
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public Status() { }

        public Status(int id, string name)
        {
            Id = id;
            Name = name;
        }
    }
}
