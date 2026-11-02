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
    public partial class Course : System.Web.UI.Page
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
            string query = "SELECT ROW_NUMBER() OVER (ORDER BY CourseId) AS [SR.No],CourseId,CourseName From Course";

            SqlDataAdapter da = new SqlDataAdapter(query, con);

            DataTable dt = new DataTable();

            da.Fill(dt);

            GridView3.DataSource = dt;
            GridView3.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string CourseName = txtCourse.Text;

            if (string.IsNullOrEmpty(CourseName))
            {
                Response.Write("<script>alert ('Please fill Course Name');</script>");
                return;
            }

            string query = "Insert into  Course (CourseName) values (@CourseName)";

            try
            {
                con.Open();
                using (SqlCommand command = new SqlCommand(query, con))
                {
                    command.Parameters.AddWithValue("@CourseName", CourseName);

                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        CourseName = string.Empty;
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

        protected void GridView3_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView3.PageIndex = e.NewPageIndex;
            GetGridView();
        }

        protected void GridView3_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView3.EditIndex = -1;
            GetGridView();
        }

        protected void GridView3_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView3.EditIndex = e.NewEditIndex;
            GetGridView();
        }

        protected void GridView3_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView3.Rows[e.RowIndex];
            string query = "UPDATE Course SET CourseName = @CourseName WHERE CourseId = @CourseId";
            string CourseName = (row.FindControl("TxtCourseEdit") as TextBox).Text;
            int cId = Convert.ToInt32(GridView3.DataKeys[e.RowIndex].Values[0]);

            try
            {
                con.Open();
                using (SqlCommand command = new SqlCommand(query, con))
                {
                    command.Parameters.AddWithValue("@CourseName", CourseName);
                    command.Parameters.AddWithValue("@CourseId", cId);

                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        Response.Write("<script>alert('Data updated successfully!');</script>");
                        GridView3.EditIndex = -1;
                        GetGridView();
                    }
                    else
                    {
                        Response.Write("<script>alert('Error: Data not updated!');</script>");
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

        protected void GridView3_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int cId = Convert.ToInt32(GridView3.DataKeys[e.RowIndex].Values[0]);
            string query = "DELETE FROM Course WHERE CourseId = @CourseId";

            try
            {
                con.Open();
                using (SqlCommand command = new SqlCommand(query, con))
                {
                    command.Parameters.AddWithValue("@CourseId", cId);
                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        Response.Write("<script>alert('Data deleted successfully!');</script>");
                        GetGridView();
                    }
                    else
                    {
                        Response.Write("<script>alert('No data deleted, possibly invalid CourseID!');</script>");
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