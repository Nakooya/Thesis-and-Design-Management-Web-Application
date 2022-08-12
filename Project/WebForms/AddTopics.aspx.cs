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

namespace Project
{
    public partial class AddTopics : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //InitializeFirstAdviserDD();
            //InitializeSecondAdviserDD();
            //InitializeStatus();
            SecondAd.Enabled = false;
           
        }


        //private void InitializeSecondAdviserDD()
        //{
        //    string connectionString = ConfigurationManager.ConnectionStrings["ThesisDesignStudentsManagementConnectionString"]?.ConnectionString;
        //    using (SqlConnection con = new SqlConnection(connectionString))
        //    using (SqlCommand command = new SqlCommand("GetAdviser", con))
        //    {
        //        con.Open();
        //        command.CommandType = CommandType.StoredProcedure;
        //        SecondAd.DataSource = command.ExecuteReader();
        //        SecondAd.DataBind();

        //    }
        //}

        //private void InitializeFirstAdviserDD()
        //{
        //    string connectionString = ConfigurationManager.ConnectionStrings["ThesisDesignStudentsManagementConnectionString"]?.ConnectionString;
        //    using (SqlConnection con = new SqlConnection(connectionString))
        //    using (SqlCommand command = new SqlCommand("GetAdviser", con))
        //    {
        //        con.Open();
        //        command.CommandType = CommandType.StoredProcedure;
        //        FirstAd.DataSource = command.ExecuteReader();
        //        FirstAd.DataBind();
        //    }
        //}

        //private void InitializeStatus()
        //{
        //    string connectionString = ConfigurationManager.ConnectionStrings["ThesisDesignStudentsManagementConnectionString"]?.ConnectionString;
        //    using (SqlConnection con = new SqlConnection(connectionString))
        //    using (SqlCommand command = new SqlCommand("GetStatus", con))
        //    {
        //        con.Open();
        //        command.CommandType = CommandType.StoredProcedure;
        //        ResStat.DataSource = command.ExecuteReader();
        //        ResStat.DataBind();
        //    }
        //}

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
            else if(SecondAdCB.Checked == false)
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
        }

        public void AddTopicDB(Topic top)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ThesisDesignStudentsManagementConnectionString"]?.ConnectionString;
            using(SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand command = new SqlCommand("AddTopic",con))
            {
                con.Open();
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("TITLE",SqlDbType.VarChar,256).Value = top.ResearchTitle;
                command.Parameters.Add("DESC",SqlDbType.VarChar,256).Value = top.ResearchDesc;
                command.Parameters.Add("FIRSTAD", SqlDbType.Int).Value = top.FirstAdviser;
                command.Parameters.Add("SECONDAD", SqlDbType.Int).Value = top.SecondAdviser.ToDbParameter();
                command.Parameters.Add("STATUS", SqlDbType.VarChar, 50).Value = top.ResearchStatus;
                command.Parameters.Add("CATEGORY", SqlDbType.VarChar, 256).Value = top.ResearchCateg;
                command.ExecuteNonQuery();
            }
        }
        //public void postIt(Topic top)
        //{
        //    Label8.Text = top.ResearchTitle;
        //    Label9.Text = top.ResearchDesc;
        //    Label10.Text = top.FirstAdviser.ToString();
        //    Label11.Text = top.SecondAdviser.ToString();
        //    Label12.Text = top.ResearchStatus;
        //    Label13.Text = top.ResearchCateg;
        //}
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
            //InitializeFirstAdviserDD();
            //InitializeSecondAdviserDD();
            //InitializeStatus();
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            Label8.Text = FirstAd.SelectedValue.ToString();
        }

        protected void SecondAdCB_CheckedChanged(object sender, EventArgs e)
        {
            if (SecondAdCB.Checked)
            {
                SecondAd.Enabled = true;
            }
        }
    }
}