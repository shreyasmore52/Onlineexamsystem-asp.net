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
    public partial class Department : System.Web.UI.Page
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
            string query = "SELECT ROW_NUMBER() OVER (ORDER BY DeptId) AS [SR.No],DeptId,DeptName From Department";

            SqlDataAdapter da = new SqlDataAdapter(query, con);

            DataTable dt = new DataTable();

            da.Fill(dt);

            GridView2.DataSource = dt;
            GridView2.DataBind();
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string deptName = txtDept.Text;

            if (string.IsNullOrEmpty(deptName))
            {
                Response.Write("<script>alert ('Please fill Department Name');</script>");
                return;
            }

            string query = "Insert into  Department (DeptName) values (@DeptName)";

            try
            {
                con.Open();
                using (SqlCommand command = new SqlCommand(query, con))
                {
                    command.Parameters.AddWithValue("@DeptName", deptName);

                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        deptName = string.Empty;
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

            protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
            {
                GridView2.PageIndex = e.NewPageIndex;
                GetGridView();
            }

            protected void GridView2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
            {
                GridView2.EditIndex = -1;
                GetGridView();
            }

            protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
            {
                GridView2.EditIndex = e.NewEditIndex;
                GetGridView();
            }

            protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
            {
                GridViewRow row = GridView2.Rows[e.RowIndex];
                string query = "UPDATE Department SET DeptName = @DeptName WHERE DeptId = @DeptId";
                string deptName = (row.FindControl("TxtDeptEdit") as TextBox).Text;
                int dId = Convert.ToInt32(GridView2.DataKeys[e.RowIndex].Values[0]);

                try
                {
                    con.Open();
                    using (SqlCommand command = new SqlCommand(query, con))
                    {
                        command.Parameters.AddWithValue("@DeptName", deptName);
                        command.Parameters.AddWithValue("@DeptId", dId);

                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            Response.Write("<script>alert('Data updated successfully!');</script>");
                            GridView2.EditIndex = -1;
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

            protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
            {
                int dId = Convert.ToInt32(GridView2.DataKeys[e.RowIndex].Values[0]);
                string query = "DELETE FROM Department WHERE DeptId = @DeptId";

                try
                {
                    con.Open();
                    using (SqlCommand command = new SqlCommand(query, con))
                    {
                        command.Parameters.AddWithValue("@DeptId", dId);
                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            Response.Write("<script>alert('Data deleted successfully!');</script>");
                            GetGridView();
                        }
                        else
                        {
                            Response.Write("<script>alert('No data deleted, possibly invalid DeartmentID!');</script>");
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

       
    
