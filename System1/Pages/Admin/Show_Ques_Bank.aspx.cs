using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace System1.Pages.Admin
{

    public partial class Show_Ques_Bank : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\Shreyas\\Desktop\\Final\\System1\\System1\\App_Data\\ExamSystem.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            
            
        }

       
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("Add_Ques_Paper.aspx");
        }

      
    }
}