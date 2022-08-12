using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project.Main
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void deleteButton_Click(object sender, EventArgs e)
        {
            deleteRow();
            refreshTable();
            
        }

        private void refreshTable()
        {
            TopicsList.DataBind();
        }

        public void deleteRow()
        {
            try
            {
                string selectedResID = TopicsList.SelectedRow.Cells[1].Text;
                string connectionString = ConfigurationManager.ConnectionStrings["ThesisDesignStudentsManagementConnectionString"]?.ConnectionString;
                using (SqlConnection connection = new SqlConnection(connectionString))
                using (SqlCommand command = new SqlCommand("DeleteTopic", connection))
                {
                    connection.Open();
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add("ID", SqlDbType.Int).Value = selectedResID;
                    command.ExecuteNonQuery();
                }
            }
            catch (Exception E)
            {
                Status.Text = "Please select a topic!";
            }
        }

        protected void updateButton_Click(object sender, EventArgs e)
        {

            try
            {

          
            Session.Clear();
            Session["ResID"] = TopicsList.SelectedRow.Cells[1].Text;
            Session["ResTitle"] = TopicsList.SelectedRow.Cells[2].Text;
            Session["ResDesc"] = TopicsList.SelectedRow.Cells[3].Text;
            Session["FirstAd"] = TopicsList.SelectedRow.Cells[4].Text;
            Session["SecondAd"] = TopicsList.SelectedRow.Cells[5].Text;
            Session["ResearchStatus"] = TopicsList.SelectedRow.Cells[6].Text;
            Session["ResCateg"] = TopicsList.SelectedRow.Cells[7].Text;
            Response.Redirect("../Main/TopicsUpdate.aspx");
            }
            catch(Exception E)
            {
                Status.Text = "Please select a topic!";
            }
        }

        protected void addButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Main/TopicsAdd.aspx");
        }
    }
}