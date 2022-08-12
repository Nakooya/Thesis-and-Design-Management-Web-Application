using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project.UserControls
{
    public partial class AddTopics : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            StudentNum.Text = Session["StudNum"].ToString();
            //FN.Text = Session["StudFN"].ToString();
            //MN.Text = Session["StudMN"].ToString();
            //LN.Text = Session["StudLN"].ToString();
            //if(Session["StudProg"].ToString() == "CPE")
            //{
            //    Prog.Items[0].Selected = true;
            //}
            //else if(Session["StudProg"].ToString() == "ECE")
            //{
            //    Prog.Items[1].Selected = true;
            //}
            //else if (Session["StudProg"].ToString() == "EE")
            //{
            //    Prog.Items[2].Selected = true;
            //}

            //if (Session["StudGender"].ToString() == "M")
            //{
            //    GenderRBL.SelectedIndex = 0;
            //}
            //else if (Session["StudGender"].ToString() == "F")
            //{
            //    GenderRBL.SelectedIndex = 1;
            //}
            //YearLevel.Text = Session["StudYL"].ToString();
        }

        public void MyListDataBoundProg(object sender, EventArgs e)
        {
            Prog.Items.Insert(0, new ListItem("-Select a Program-", " "));
        }

        public void MyListDataBoundCateg(object sender, EventArgs e)
        {
            ResCateg.Items.Insert(0, new ListItem("-Select a Category-", " "));
        }

        public void MylListDataBoundTopic(object sender, EventArgs e)
        {
            ResTopic.Items.Insert(0, new ListItem("-Select a Topic-", " "));
        }

        protected void updateBtn_Click(object sender, EventArgs e)
        {

        }
    }
}