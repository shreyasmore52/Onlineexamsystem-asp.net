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
    public partial class Lecturer : System.Web.UI.Page
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
            string query = "SELECT ROW_NUMBER() OVER (ORDER BY LecturerId) AS [SR.No],LecturerId,LecturerName,LecturerDOB,LecturerGender,LecturerAddress,LecturerEmail,LecturerPassword From Lecturer";

            SqlDataAdapter da = new SqlDataAdapter(query, con);

            DataTable dt = new DataTable();

            da.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }


        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string LecturerName = txtName.Text;
            string LecturerDOB = txtDOB.Text;
            string LecturerGender = txtGender.Text;
            string LecturerAddress = txtAddress.Text;
            string LecturerEmail = txtEmail.Text;
            string LecturerPassword = txtPassword.Text;

           

            string query = "Insert into  Lecturer (LecturerName,LecturerDOB,LecturerGender,LecturerAddress," +
                "LecturerEmail,LecturerPassword) values (@LecturerName,@LecturerDOB,@LecturerGender,@LecturerAddress,@LecturerEmail,@LecturerPassword)";

            try
            {
                con.Open();
                using (SqlCommand command = new SqlCommand(query, con))
                {
                    command.Parameters.AddWithValue("@LecturerName", LecturerName);
                    command.Parameters.AddWithValue("@LecturerDOB", Convert.ToDateTime(LecturerDOB));
                    command.Parameters.AddWithValue("@LecturerGender", LecturerGender);
                    command.Parameters.AddWithValue("@LecturerAddress", LecturerAddress);
                    command.Parameters.AddWithValue("@LecturerEmail", Convert.ToString(LecturerEmail));
                    command.Parameters.AddWithValue("@LecturerPassword", LecturerPassword);

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

    }
}




