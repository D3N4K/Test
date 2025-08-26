using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using WindowsFormsTestApp.Classes;

namespace WindowsFormsTestApp.Model
{
    internal class DepartmentFromDB
    {
        public List<Department> LoadDepartment()
        {
            List<Department> departments = new List<Department>();
            SqlConnection connection = new SqlConnection(Connection.connString);
            try
            {
                connection.Open();
                string query = "LoadDepartment";
                SqlCommand command = new SqlCommand(query, connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        departments.Add(new Department(Convert.ToInt32(reader[0]), Convert.ToString(reader[1])));
                    }
                }
                reader.Close();
                return departments;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return departments;
            }
            finally
            {
                connection.Close();
            }
        }
    }
}
