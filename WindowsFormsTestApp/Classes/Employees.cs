using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WindowsFormsTestApp.Classes
{
    internal class Employees
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Status { get; set; }
        public string Department { get; set; }
        public string Post { get; set; }
        public DateTime DateEmploy { get; set; }
        public DateTime DateUneploy { get; set; }

        public Employees(int id, string name, string status, string department, string post, DateTime dateEmploy, DateTime dateUneploy)
        {
            Id = id;
            Name = name;
            Status = status;
            Department = department;
            Post = post;
            DateEmploy = dateEmploy;
            DateUneploy = dateUneploy;
        }

        public Employees()
        {
        }
    }
}
