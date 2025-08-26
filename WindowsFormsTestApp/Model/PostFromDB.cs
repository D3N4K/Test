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
    internal class PostFromDB
    {
        public List<Post> LoadPost()
        {
            List<Post> posts = new List<Post>();
            SqlConnection connection = new SqlConnection(Connection.connString);
            try
            {
                connection.Open();
                string query = "LoadPost";
                SqlCommand command = new SqlCommand(query, connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        posts.Add(new Post(Convert.ToInt32(reader[0]), Convert.ToString(reader[1])));
                    }
                }
                reader.Close();
                return posts;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return posts;
            }
            finally
            {
                connection.Close();
            }
        }
    }
}
