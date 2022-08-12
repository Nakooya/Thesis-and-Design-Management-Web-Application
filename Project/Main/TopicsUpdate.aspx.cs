using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Project.Classes;

namespace Project.Main
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            

            if(!IsPostBack)
            {
                FirstAd.DataBind();
                SecondAd.DataBind();
                SecondAdCB.Checked = true;
                TitleTB.Text = Session["ResTitle"].ToString();
                if(Session["ResDesc"].ToString() == "&nbsp;")
                {
                    Session["ResDesc"] = string.Empty;
                }
                else
                {
                    DescTB.Text = Session["ResDesc"].ToString();
                }
                FirstAd.SelectedValue = Session["FirstAd"].ToString();
                SecondAd.SelectedValue = Session["SecondAd"].ToString();
                ResStat.SelectedValue = Session["ResearchStatus"].ToString();
                //Radio Button List
                if (Session["ResCateg"].ToString().ToLower() == "thesis")
                    Category.SelectedIndex = 0;
                else if (Session["ResCateg"].ToString().ToLower() == "design")
                    Category.SelectedIndex = 1;

                //if (Session["SecondAd"].ToString() == null)
                //{
                //    SecondAdCB.Checked = false;
                //}
            }
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            updateTopic();
        }

        private void updateTopic()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ThesisDesignStudentsManagementConnectionString"]?.ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand command = new SqlCommand("UpdateTopic", con))
            {
                con.Open();
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("ID", SqlDbType.Int).Value = Convert.ToInt32(Session["ResID"]);
                command.Parameters.Add("TITLE", SqlDbType.VarChar, 50).Value = TitleTB.Text;
                command.Parameters.Add("DESC", SqlDbType.VarChar, 50).Value = DescTB.Text;
                command.Parameters.Add("FIRSTAD", SqlDbType.VarChar, 50).Value = FirstAd.SelectedItem.Value;
                command.Parameters.Add("SECONDAD", SqlDbType.VarChar, 50).Value = SecondAd.SelectedItem.Value;
                command.Parameters.Add("STATUS", SqlDbType.VarChar, 50).Value = ResStat.SelectedItem.Value;
                command.Parameters.Add("CATEG", SqlDbType.VarChar, 50).Value = Category.SelectedItem.Value;
                command.ExecuteNonQuery();
               
                //Label8.Text = command.ExecuteNonQuery().ToString();
            }
            Response.Redirect("../Main/TopicsView.aspx");

            //Label8.Text = Session["ResID"].ToString();
            //Label9.Text = TitleTB.Text;
            //Label10.Text = DescTB.Text;
            //Label11.Text = FirstAd.SelectedItem.Value;
            //Label12.Text = SecondAd.SelectedItem.Value;
            //Label13.Text = ResStat.SelectedItem.Value;
            //Label14.Text = Category.SelectedItem.Value;

        }

        public void MyListDataBoundFirstAd(object sender, EventArgs e)
        {
            FirstAd.Items.Insert(0, new ListItem("-Choose First Adviser-", " "));
        }
        public void MyListDataBoundSecondAd(object sender, EventArgs e)
        {
            SecondAd.Items.Insert(0, new ListItem("-Choose Second Adviser-", " "));
        }
        public void MyListDataBoundStatus(object sender, EventArgs e)
        {
            ResStat.Items.Insert(0, new ListItem("-Select Research Status-", " "));
        }
        protected void SecondAdCB_CheckedChanged(object sender, EventArgs e)
        {
            if (SecondAdCB.Checked)
            {
                SecondAd.Enabled = true;
            }
            else
            {
                SecondAd.Enabled = false;
            }
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Main/TopicsView.aspx");
        }

      
    }
}