using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using WindowsFormsTestApp.Classes;
using WindowsFormsTestApp.Model;

namespace WindowsFormsTestApp
{
    public partial class Form1 : Form
    {
        List<Employees> employees = new List<Employees>();
        EmployeesFromDB employeesFromDB = new EmployeesFromDB();
        List<Status> status = new List<Status>();
        StatusFromDB statusFromDB = new StatusFromDB();
        List<Department> departments = new List<Department>();
        DepartmentFromDB departmentFromDB = new DepartmentFromDB();
        List<Post> posts = new List<Post>();
        PostFromDB postFromDB = new PostFromDB();
        string SQLOne = " where ";
        string SQLMore = " where ";
        const string SQLPost = "post.[id] = @post";
        const string SQLDep = "d.[id] = @dep";
        const string SQLStatus= "s.[id] = @status";
        bool cbPostChecked = false;
        bool cbDepChecked = false;
        bool cbStatusChecked = false;
        int countMore = 0;
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            ViewEmployees();
            ViewDep();
            ViewStatus();
            ViewPost();
        }
        void ViewEmployees()
        {
            employees = employeesFromDB.LoadEmployees();
            dgvEmployees.ClearSelection();
            dgvEmployees.Columns[0].DataPropertyName = "Id";
            dgvEmployees.Columns[1].DataPropertyName = "Name";
            dgvEmployees.Columns[2].DataPropertyName = "Status";
            dgvEmployees.Columns[3].DataPropertyName = "Department";
            dgvEmployees.Columns[4].DataPropertyName = "Post";
            dgvEmployees.Columns[5].DataPropertyName = "DateEmploy";
            dgvEmployees.Columns[6].DataPropertyName = "DateUneploy";
            dgvEmployees.Columns[0].Visible = false;
            if (cbPostChecked || cbDepChecked || cbStatusChecked)
            {
                SQLWriter(cbPostChecked, cbDepChecked, cbStatusChecked);
                employees = employeesFromDB.LoadEmployees(SQLOne, cbStatus.SelectedIndex, cbDep.SelectedIndex, cbPost.SelectedIndex);
            }
            else
            {
                employees = employeesFromDB.LoadEmployees();

            }
            dgvEmployees.DataSource = employees;
        }
        void ViewPost()
        {
            posts = postFromDB.LoadPost();
            cbPost.Items.Insert(0, "Выберите");
            for (int i = 0; i < posts.Count; i++)
            {
                cbPost.Items.Insert(posts[i].Id, posts[i].Name);
            }
            cbPost.SelectedIndex = 0;
        }
        void ViewDep()
        {
            departments = departmentFromDB.LoadDepartment();
            cbDep.Items.Insert(0, "Выберите");
            for (int i = 0; i < departments.Count; i++)
            {
                cbDep.Items.Insert(departments[i].Id, departments[i].Name);
            }
            cbDep.SelectedIndex = 0;
        }
        void ViewStatus()
        {
            status = statusFromDB.LoadStatus();
            cbStatus.Items.Insert(0, "Выберите");
            for (int i = 0; i < status.Count; i++)
            {
                cbStatus.Items.Insert(status[i].Id, status[i].Name);
            }
            cbStatus.SelectedIndex = 0;
        }
        private void tbSearch_TextChanged(object sender, EventArgs e)
        {
            dgvEmployees.DataSource = SearchEmployee(tbSearch.Text);
        }
        private List<Employees> SearchEmployee(string text)
        {
            List<Employees> result = new List<Employees>();
            for (int i = 0; i < employees.Count(); i++)
            {
                if (employees[i].Name.ToLower().Contains(text.ToLower()))
                {
                    result.Add(employees[i]);
                }
            }
            return result;
        }
        void SQLWriter(bool cbP, bool cbD, bool cbS)
        {
            countMore = 0;
            SQLOne = SQLMore;
            if (cbP)
            {
                if (countMore > 0)
                {
                    SQLOne += " AND ";
                }
                SQLOne += SQLPost;
                countMore++;
            }
            if (cbD)
            {
                if (countMore > 0)
                {
                    SQLOne += " AND ";
                }
                SQLOne += SQLDep;
                countMore++;
            }
            if (cbS)
            {
                if (countMore > 0)
                {
                    SQLOne += " AND ";
                }
                SQLOne += SQLStatus;
                countMore++;
            }
        }

        private void cbStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbStatus.SelectedIndex != 0)
            {
                cbStatusChecked = true;
            }
            else
            {
                cbStatusChecked = false;
            }
            ViewEmployees();
        }

        private void cbDep_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbDep.SelectedIndex != 0)
            {
                cbDepChecked = true;
            }
            else
            {
                cbDepChecked = false;
            }
            ViewEmployees();
        }

        private void cbPost_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbStatus.SelectedIndex != 0)
            {
                cbStatusChecked = true;
            }
            else
            {
                cbStatusChecked = false;
            }
            ViewEmployees();
        }
    }
}
