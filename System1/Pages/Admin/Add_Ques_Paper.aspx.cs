using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace System1.Pages.Admin
{
    public partial class Add_Ques_Paper : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\Shreyas\\Desktop\\Final\\System1\\System1\\App_Data\\ExamSystem.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Add_Ques_Bank.aspx");
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string QuestionName = txtname.Text;
            string Option1 = txtOp1.Text;
            string Option2 = txtOp2.Text;
            string Option3 = txtOp3.Text;
            string Option4 = txtOp4.Text;
            string Answer = txtAns.Text;

            string query = "Insert into QuestionPaper(QueName,QueOp1,QueOp2,QueOp3,QueOp4,CorrectAns) values (@QueName,@QueOp1,@QueOp2,@QueOp3,@QueOp4,@CorrectAns) ";
            try
            {
                con.Open();
               using(SqlCommand cmd = new SqlCommand (query ,con))
                {
                    cmd.Parameters.AddWithValue("@QueName", QuestionName);
                    cmd.Parameters.AddWithValue("@QueOp1", Option1);
                    cmd.Parameters.AddWithValue("@QueOp2", Option2);
                    cmd.Parameters.AddWithValue("@QueOp3", Option3);
                    cmd.Parameters.AddWithValue("@QueOp4", Option4);
                    cmd.Parameters.AddWithValue("@CorrectAns", Answer);

                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        lblall.Text = "Data inserted successfully!";
                        lblall.CssClass = "alert alert-success";
                        
                        //Response.Redirect("Show_Ques_Bank.aspx");
                    }
                    else
                    {
                        lblall.Text = "Data insertion failed!";
                        lblall.CssClass = "alert alert-danger";
                        
                    }
                }
            }
            catch(Exception ex)
            {
                Response.Write($"<script>alert('An error occurred: {ex.Message}');</script>");
            }
            finally
            {
                con.Close();
            }
           
        }


    }
}