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
    internal class StatusFromDB
    {
        public List<Status> LoadStatus()
        {
            List<Status> status = new List<Status>();
            SqlConnection connection = new SqlConnection(Connection.connString);
            try
            {
                connection.Open();
                string query = "LoadStatus";
                SqlCommand command = new SqlCommand(query, connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        status.Add(new Status(Convert.ToInt32(reader[0]), Convert.ToString(reader[1])));
                    }
                }
                reader.Close();
                return status;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return status;
            }
            finally
            {
                connection.Close();
            }
        }
    }
}
