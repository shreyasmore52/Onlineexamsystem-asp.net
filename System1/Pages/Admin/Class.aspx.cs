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
    public partial class Class : System.Web.UI.Page
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
           
            string query = "SELECT ROW_NUMBER() OVER (ORDER BY ClassID) AS [Sr.No], ClassID, ClassName FROM Class";

            SqlDataAdapter da = new SqlDataAdapter(query, con);

            DataTable dt = new DataTable();

            da.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }


        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string className = txtClass.Text;

            if (string.IsNullOrEmpty(className))
            {
                Response.Write("<script>alert('Please fill Class Name');</script>");
                return;
            }

            string query1 = "INSERT INTO Class (ClassName) VALUES (@ClassName)";

            try
            {
                con.Open();
                using (SqlCommand command = new SqlCommand(query1, con))
                {
                    command.Parameters.AddWithValue("@ClassName", className);

                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        className = string.Empty;
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

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetGridView();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetGridView();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GetGridView();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            string query = "UPDATE Class SET ClassName = @ClassName WHERE ClassID = @ClassID";
            string className = (row.FindControl("TxtClassEdit") as TextBox).Text;
            int cId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);

            try
            {
                con.Open();
                using (SqlCommand command = new SqlCommand(query, con))
                {
                    command.Parameters.AddWithValue("@ClassName", className);
                    command.Parameters.AddWithValue("@ClassID", cId);

                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        Response.Write("<script>alert('Data updated successfully!');</script>");
                        GridView1.EditIndex = -1;
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

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int cId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string query = "DELETE FROM Class WHERE ClassID = @ClassID";

            try
            {
                con.Open();
                using (SqlCommand command = new SqlCommand(query, con))
                {
                    command.Parameters.AddWithValue("@ClassID", cId);
                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        Response.Write("<script>alert('Data deleted successfully!');</script>");
                        GetGridView();
                    }
                    else
                    {
                        Response.Write("<script>alert('No data deleted, possibly invalid ClassID!');</script>");
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
