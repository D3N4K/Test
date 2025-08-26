using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WindowsFormsTestApp.Classes
{
    internal class Post
    {
        public int Id { get; set; }
        public string Name { get; set; }

        public Post()
        {
        }

        public Post(int id, string name)
        {
            Id = id;
            Name = name;
        }
    }
}
