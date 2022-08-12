using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project.Main
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        int topicCount = 0;
        int studentCount = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ThesisDesignStudentsManagementConnectionString"]?.ConnectionString;
            using(SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand command = new SqlCommand("CountTopicsStudents", con))
            {
                con.Open();
                using(SqlDataReader reader = command.ExecuteReader())
                {
                    while(reader.Read())
                    {
                        topicCount = reader.GetInt32(0);
              
                       
                    }
                    reader.NextResult();
                    while(reader.Read())
                    {
                        studentCount = reader.GetInt32(0);
                    }
                    TopicCounter.Text = topicCount.ToString();
                    StudentCounter.Text = studentCount.ToString();
                }
            }
        }
    }
}