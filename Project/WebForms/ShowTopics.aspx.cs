using System;
using System.Data;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class ShowTopics : System.Web.UI.Page
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
                    deletelabel.Text = selectedResID;
                }
            }
            catch (Exception E)
            {
                deletelabel.Text = E.Message;
            }
        }

        protected void updateButton_Click(object sender, EventArgs e)
        {

        }
    }
}