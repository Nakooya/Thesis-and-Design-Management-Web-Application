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

namespace Project.UserControls
{
    public partial class AddStudent : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        public void MyListDataBoundProg(object sender, EventArgs e)
        {
            Prog.Items.Insert(0, new ListItem("-Select a Program-", "0"));
        }

        public void MyListDataBoundCateg(object sender, EventArgs e)
        {
            ResCateg.Items.Insert(0, new ListItem("-Select a Category-", "0"));
        }

        public void MylListDataBoundTopic(object sender, EventArgs e)
        {
            ResTopic.Items.Insert(0, new ListItem("-Select a Topic-", "0"));
        }

        protected void addButton_Click(object sender, EventArgs e)
        {
            getStudents();
            ClearForm();
            Response.Redirect("../Main/StudentsView.aspx");
        }


        public void getStudents()
        {
            Student stud = new Student();
            stud.StudentNum = Convert.ToInt32(StudentNum.Text);
            stud.FirstName = FN.Text;
            stud.MiddleName = MN.Text;
            stud.LastName = LN.Text;
            stud.Program = Prog.Text;
            stud.YearLevel = Convert.ToInt32(YearLevel.Text);
            stud.Gender = GenderRBL.SelectedValue;
            //IdentifyGender(stud);
            stud.ResearchCateg = ResCateg.Text;
            stud.Topic = ResTopic.Text;

            if (stud.ResearchCateg == "Thesis")
            {
                AddNewThesisStudent(stud);
            }
            else if (stud.ResearchCateg == "Design")
            {
                AddNewDesignStudent(stud);
            }

        }

    
        public void AddNewThesisStudent(Student stud)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ThesisDesignStudentsManagementConnectionString"]?.ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand command = new SqlCommand("AddNewThesisStudent", con))
            {
                con.Open();
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.Add("Studnum", SqlDbType.Int).Value = stud.StudentNum;
                command.Parameters.Add("StudFN", SqlDbType.VarChar, 50).Value = stud.FirstName;
                command.Parameters.Add("StudMN", SqlDbType.VarChar, 50).Value = stud.MiddleName.ToDbParameter();
                command.Parameters.Add("StudLN", SqlDbType.VarChar, 50).Value = stud.LastName;
                command.Parameters.Add("StudProg", SqlDbType.VarChar, 10).Value = stud.Program;
                command.Parameters.Add("StudYL", SqlDbType.Int).Value = stud.YearLevel;
                command.Parameters.Add("StudGen", SqlDbType.VarChar, 50).Value = stud.Gender;
                command.Parameters.Add("Thesis", SqlDbType.VarChar, 50).Value = stud.Topic;
                command.ExecuteNonQuery();
            }
        }

        public void AddNewDesignStudent(Student stud)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ThesisDesignStudentsManagementConnectionString"]?.ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand command = new SqlCommand("AddNewDesignStudent", con))
            {
                con.Open();
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.Add("Studnum", SqlDbType.Int).Value = stud.StudentNum;
                command.Parameters.Add("StudFN", SqlDbType.VarChar, 50).Value = stud.FirstName;
                command.Parameters.Add("StudMN", SqlDbType.VarChar, 50).Value = stud.MiddleName.ToDbParameter();
                command.Parameters.Add("StudLN", SqlDbType.VarChar, 50).Value = stud.LastName;
                command.Parameters.Add("StudProg", SqlDbType.VarChar, 10).Value = stud.Program;
                command.Parameters.Add("StudYL", SqlDbType.Int).Value = stud.YearLevel;
                command.Parameters.Add("StudGen", SqlDbType.VarChar, 50).Value = stud.Gender;
                command.Parameters.Add("Design", SqlDbType.VarChar, 50).Value = stud.Topic;
                command.ExecuteNonQuery();
            }
        }

        protected void clearForm_Click(object sender, EventArgs e)
        {
            ClearForm();
        }

        public void ClearForm()
        {
            StudentNum.Text = FN.Text = MN.Text = LN.Text = YearLevel.Text = null;
            Prog.Items.Clear();
            Prog.DataBind();
            ResCateg.Items.Clear();
            ResCateg.DataBind();
            ResTopic.Items.Clear();
            ResTopic.DataBind();
            GenderRBL.ClearSelection();
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Main/StudentsView.aspx");
        }

      
    }
}