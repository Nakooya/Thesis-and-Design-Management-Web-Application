using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Project.Classes;

namespace Project
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            getUser();

        }

        public void getUser()
        {
            
            User user1 = new User();
            user1.Username = loginUsername.Text;
            user1.Password = loginPassword.Text;
            verifyUser(user1);
          
        }

        public void verifyUser(User user1)
        {
            
                string connectionString = ConfigurationManager.ConnectionStrings["ThesisDesignStudentsManagementConnectionString"]?.ConnectionString;
                using (SqlConnection con = new SqlConnection(connectionString))
                using (SqlCommand command = new SqlCommand("Verify", con))
                {
                    con.Open();
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.Add("USER", System.Data.SqlDbType.VarChar, 50).Value = user1.Username;
                    command.Parameters.Add("PASS", System.Data.SqlDbType.VarChar, 50).Value = user1.Password;
                //Label1.Text = command.ExecuteScalar().ToString();
                if (command.ExecuteScalar().ToString() == 1.ToString())
                {
                    Response.Redirect("../Main/Dashboard.aspx");
                }
            }
        }

       
    }
}