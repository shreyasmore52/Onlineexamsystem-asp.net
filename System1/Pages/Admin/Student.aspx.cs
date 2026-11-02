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
   
    public partial class Student : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\Shreyas\\Desktop\\Final\\System1\\System1\\App_Data\\ExamSystem.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetGridView();
            }
        }

        private void GetGridView()
        {
            string query = "SELECT ROW_NUMBER() OVER (ORDER BY StudentId) AS [SR.No],StudentId,StudentName,StudentDOB,StudentGender,StudentAddress,StudentEmail,StudentPassword From Student";

            SqlDataAdapter da = new SqlDataAdapter(query, con);

            DataTable dt = new DataTable();

            da.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string StudentName = txtName.Text;
            string StudentDOB = txtDOB.Text;
            string StudentGender = textGender.Text;
            string StudentAddress = txtAddress.Text;
            string StudentEmail = txtEmail.Text;
            string StudentPassword = txtPassword.Text;


            string query = "Insert into  Student (StudentName,StudentDOB,StudentGender,StudentAddress," +
                "StudentEmail,StudentPassword) values (@StudentName,@StudentDOB,@StudentGender,@StudentAddress,@StudentEmail,@StudentPassword)";

            try
            {
                con.Open();
                using (SqlCommand command = new SqlCommand(query, con))
                {
                    command.Parameters.AddWithValue("@StudentName", StudentName);
                    command.Parameters.AddWithValue("@StudentDOB", Convert.ToDateTime(StudentDOB));
                    command.Parameters.AddWithValue("@StudentGender", StudentGender);
                    command.Parameters.AddWithValue("@StudentAddress", StudentAddress);
                    command.Parameters.AddWithValue("@StudentEmail", Convert.ToString(StudentEmail));
                    command.Parameters.AddWithValue("@StudentPassword", StudentPassword);

                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {

                        Response.Write("<script>alert('Data inserted successfully!');</script>");
                        GetGridView();
                    }
                    else
                    {
                        Response.Write("<script>alert('Data insertion failed!');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('An error occurred: {ex.Message}');</script>");
            }
            finally
            {
                con.Close();
            }

        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {

        }
    }
}