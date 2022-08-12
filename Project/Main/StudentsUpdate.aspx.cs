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
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
             InitializeData();

        }

        public void InitializeData()
        {
            Prog.DataBind();
            ThesisTopicDL.DataBind();
            DesignTopicDL.DataBind();
            StudentNum.Text = Session["StudNum"].ToString();
            FN.Text = Session["StudFN"].ToString();
            if (Session["StudMN"].ToString() == "&nbsp;")
                Session["StudMN"] = string.Empty;
            else
            {
                MN.Text = Session["StudMN"].ToString();
            }

            LN.Text = Session["StudLN"].ToString();
            if(string.IsNullOrEmpty(Session["StudThesis"].ToString()) || Session["StudThesis"].ToString() == "0")
                ThesisTopicDL.SelectedIndex = 0;
            else
                ThesisTopicDL.SelectedValue = Session["StudThesis"].ToString();

            if (string.IsNullOrEmpty(Session["StudDesign"].ToString()) || Session["StudDesign"].ToString() == "0")
                DesignTopicDL.SelectedIndex = 0;
            else
                DesignTopicDL.SelectedValue = Session["StudDesign"].ToString();

            if (Session["StudProg"].ToString().ToLower() == "cpe")
            {
                Prog.Items[1].Selected = true;
            }
            else if (Session["StudProg"].ToString().ToLower() == "ece")
            {
                Prog.Items[2].Selected = true;
            }
            else if (Session["StudProg"].ToString().ToLower() == "ee")
            {
                Prog.Items[3].Selected = true;
            }
            if (Session["StudGender"].ToString() == "M")
            {
                GenderRBL.SelectedIndex = 0;
            }
            else if (Session["StudGender"].ToString() == "F")
            {
                GenderRBL.SelectedIndex = 1;
            }
            YearLevel.Text = Session["StudYL"].ToString();

        }

        public void MyListDataBoundProg(object sender, EventArgs e)
        {
            Prog.Items.Insert(0, new ListItem("-Select a Program-", " "));
        }

        protected void cancelBtn_Click(object sender, EventArgs e)
        {
            //Session.Clear();
            Response.Redirect("../Main/StudentsView.aspx");
        }


        public void MyListDataBoundThesis(object sender, EventArgs e)
        {

            ThesisTopicDL.Items.Insert(0, new ListItem("-Select a Topic-", "0"));

        }
        public void MyListDataBoundDesign(object sender, EventArgs e)
        {


            DesignTopicDL.Items.Insert(0, new ListItem("-Select a Topic-", "0"));
        }

        public void updateStudent(StudentUpdate toUpdate)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ThesisDesignStudentsManagementConnectionString"]?.ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand command = new SqlCommand("UpdateStudent", con))
            {
                con.Open();
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("SN", SqlDbType.Int).Value = toUpdate.StudentNum;
                command.Parameters.Add("FN", SqlDbType.VarChar, 50).Value = toUpdate.FirstName;
                command.Parameters.Add("MN", SqlDbType.VarChar, 50).Value = toUpdate.MiddleName.ToDbParameter();
                command.Parameters.Add("LN", SqlDbType.VarChar, 50).Value = toUpdate.LastName;
                command.Parameters.Add("PROG", SqlDbType.VarChar, 10).Value = toUpdate.Program;
                command.Parameters.Add("YL", SqlDbType.Int).Value = toUpdate.YearLevel;
                command.Parameters.Add("GEN", SqlDbType.VarChar, 50).Value = toUpdate.Gender;
                command.Parameters.Add("THESIS", SqlDbType.Int).Value = toUpdate.Thesis.ToDbParameter();
                command.Parameters.Add("DESIGN", SqlDbType.Int).Value = toUpdate.Design.ToDbParameter();
                command.ExecuteNonQuery();

            }
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            StudentUpdate toUpdate = new StudentUpdate();
            toUpdate.StudentNum = Convert.ToInt32(StudentNum.Text);
            toUpdate.FirstName = FN.Text.ToString();
            toUpdate.MiddleName = MN.Text.ToString();
            toUpdate.LastName = LN.Text.ToString();
            toUpdate.Program = Prog.SelectedItem.Text.ToString();
            toUpdate.YearLevel = Convert.ToInt32(YearLevel.Text);
            toUpdate.Gender = GenderRBL.SelectedValue.ToString();
            object thesis = ThesisTopicDL.SelectedItem.Value;
            toUpdate.Thesis = Convert.ToInt32(thesis.ToString());
            object design = DesignTopicDL.SelectedItem.Value;
            toUpdate.Design = Convert.ToInt32(design.ToString());
            updateStudent(toUpdate);
            Response.Redirect("../Main/StudentsView.aspx");
        }
    }
}