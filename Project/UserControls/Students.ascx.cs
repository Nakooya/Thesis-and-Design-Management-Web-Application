using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class Students : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void deleteStudent_Click(object sender, EventArgs e)
        {
            if(StudentsGridView.SelectedValue != null)
            {
                deleteStud();
                refreshTable();
            }
            else
            {
                Status.Text = "Please select a student!";
            }

           
        }

        private void refreshTable()
        {
            StudentsGridView.DataBind();
        }

        private void deleteStud()
        {
            string selectedStudNum = StudentsGridView.SelectedRow.Cells[1].Text;
            string connectionString = ConfigurationManager.ConnectionStrings["ThesisDesignStudentsManagementConnectionString"]?.ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            using (SqlCommand command = new SqlCommand("DeleteStudent", connection))
            {
                connection.Open();
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("SN", SqlDbType.Int).Value = selectedStudNum;
                command.ExecuteNonQuery();

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Main/StudentsAdd.aspx");

        }

        protected void updateStudent_Click(object sender, EventArgs e)
        {

            if (StudentsGridView.SelectedValue != null)
            {
                Session.Clear();
                Session["StudNum"] = StudentsGridView.SelectedRow.Cells[1].Text;
                Session["StudFN"] = StudentsGridView.SelectedRow.Cells[2].Text;
                Session["StudMN"] = StudentsGridView.SelectedRow.Cells[3].Text;
                Session["StudLN"] = StudentsGridView.SelectedRow.Cells[4].Text;
                Session["StudProg"] = StudentsGridView.SelectedRow.Cells[5].Text;
                Session["StudYL"] = StudentsGridView.SelectedRow.Cells[6].Text;
                Session["StudGender"] = StudentsGridView.SelectedRow.Cells[7].Text;
                Session["StudThesis"] = StudentsGridView.SelectedRow.Cells[8].Text;
                Session["StudDesign"] = StudentsGridView.SelectedRow.Cells[9].Text;
                Response.Redirect("~/Main/StudentsUpdate.aspx");
            }
            else
            {
                Status.Text = "Please select a student!";
            }

      

        }
    }
}