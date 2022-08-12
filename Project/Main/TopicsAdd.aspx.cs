using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Project.Classes;

namespace Project.Main
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SecondAd.Enabled = false;
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            if (SecondAdCB.Checked == true)
            {
                Topic top = new Topic();
                top.ResearchTitle = TitleTB.Text;
                top.ResearchDesc = DescTB.Text;
                top.FirstAdviser = Convert.ToInt32(FirstAd.SelectedValue);
                top.SecondAdviser = Convert.ToInt32(SecondAd.SelectedValue);
                top.ResearchStatus = ResStat.Text;
                IdentifyCateg(top);
                AddTopicDB(top);
            }
            else if (SecondAdCB.Checked == false)
            {
                Topic top = new Topic();
                top.ResearchTitle = TitleTB.Text;
                top.ResearchDesc = DescTB.Text;
                top.FirstAdviser = Convert.ToInt32(FirstAd.SelectedValue);
                top.SecondAdviser = 0;
                top.ResearchStatus = ResStat.Text;
                IdentifyCateg(top);
                AddTopicDB(top);
            }

            ClearForm();
            Response.Redirect("../Main/TopicsView.aspx");
        }

        public void AddTopicDB(Topic top)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ThesisDesignStudentsManagementConnectionString"]?.ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand command = new SqlCommand("AddTopic", con))
            {
                con.Open();
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("TITLE", SqlDbType.VarChar, 256).Value = top.ResearchTitle;
                command.Parameters.Add("DESC", SqlDbType.VarChar, 256).Value = top.ResearchDesc;
                command.Parameters.Add("FIRSTAD", SqlDbType.Int).Value = top.FirstAdviser;
                command.Parameters.Add("SECONDAD", SqlDbType.Int).Value = top.SecondAdviser.ToDbParameter();
                command.Parameters.Add("STATUS", SqlDbType.VarChar, 50).Value = top.ResearchStatus;
                command.Parameters.Add("CATEGORY", SqlDbType.VarChar, 256).Value = top.ResearchCateg;
                command.ExecuteNonQuery();
            }
        }

        public Topic IdentifyCateg(Topic top)
        {
            //if(ThesisRB.Checked == true && DesignRB.Checked == false)
            if (Category.SelectedValue == "Thesis")
            {
                top.ResearchCateg = "Thesis";
            }
            //else if(ThesisRB.Checked == false && DesignRB.Checked == true)
            else if (Category.SelectedValue == "Design")
            {
                top.ResearchCateg = "Design";
            }
            else
            {
                throw new Exception("Please Choose a Category");
            }
            return top;
        }

        public void ClearForm()
        {
            FirstAd.Items.Clear();
            SecondAd.Items.Clear();
            ResStat.Items.Clear();
            refreshDropDown();
            TitleTB.Text = DescTB.Text = ResStat.Text = null;
            Category.ClearSelection();
            SecondAdCB.Checked = false;


        }


        public void refreshDropDown()
        {
            FirstAd.DataBind();
            SecondAd.DataBind();
            ResStat.DataBind();
        }

        protected void ClearThisForm_Click(object sender, EventArgs e)
        {
            ClearForm();
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
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Main/TopicsView.aspx");
        }
    }
}