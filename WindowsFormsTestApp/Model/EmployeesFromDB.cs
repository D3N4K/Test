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
    internal class EmployeesFromDB
    {
        public List<Employees> LoadEmployees()
        {
            List<Employees> employees= new List<Employees>();
            SqlConnection connection = new SqlConnection(Connection.connString);
            try
            {
                connection.Open();
                string query = "LoadAllEmployees";
                SqlCommand command = new SqlCommand(query, connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while(reader.Read())
                    {
                        employees.Add(new Employees
                        {
                            Id = Convert.ToInt32(reader[0]),
                            Name = Convert.ToString(reader[1]),
                            Status = Convert.ToString(reader[2]),
                            Department = Convert.ToString(reader[3]),
                            Post = Convert.ToString(reader[4]),
                            DateEmploy = Convert.ToDateTime(reader[5]),
                            DateUneploy = Convert.ToDateTime(reader[6])
                        });
                    }
                }
                reader.Close();
                return employees;
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
                return employees;
            }
            finally
            {
                connection.Close();
            }
        }
        public List<Employees> LoadEmployees(string SQLMore, int status, int dep, int post)
        {
            List<Employees> employees = new List<Employees>();
            SqlConnection connection = new SqlConnection(Connection.connString);
            try
            {
                connection.Open();
                string query = "select per.[id],[last_name] + ' ' + left([first_name], 1) + '.' + left([second_name], 1) + '.',s.[name],d.[name],post.[name],format([date_employ], 'dd/MM/yyyy'),format([date_uneploy], 'dd/MM/yyyy') from [dbo].[persons] per join [dbo].[status] s on per.[status] = s.[id] join [dbo].[deps] d on per.[id_dep] = d.[id] join [dbo].[posts] post on per.[id_post] = post.[id]" + SQLMore;
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@dep", dep);
                command.Parameters.AddWithValue("@post", post);
                command.Parameters.AddWithValue("@status", status);
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        employees.Add(new Employees
                        {
                            Id = Convert.ToInt32(reader[0]),
                            Name = Convert.ToString(reader[1]),
                            Status = Convert.ToString(reader[2]),
                            Department = Convert.ToString(reader[3]),
                            Post = Convert.ToString(reader[4]),
                            DateEmploy = Convert.ToDateTime(reader[5]),
                            DateUneploy = Convert.ToDateTime(reader[6])
                        });
                    }
                }
                reader.Close();
                return employees;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return employees;
            }
            finally
            {
                connection.Close();
            }
        }
    }
}
