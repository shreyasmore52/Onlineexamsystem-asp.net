using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace System1.Pages.Admin
{
    public partial class Dept_Course : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\Shreyas\\Desktop\\Final\\System1\\System1\\App_Data\\ExamSystem.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateDropDowns(); 
                GetGridView(); 
            }
        }

        private void PopulateDropDowns()
        {
            // Department Dropdown
            string departmentQuery = "SELECT DeptId, DeptName FROM Department";
            SqlDataAdapter deptAdapter = new SqlDataAdapter(departmentQuery, con);
            DataTable deptTable = new DataTable();
            deptAdapter.Fill(deptTable);

            textDeptx.DataSource = deptTable;
            textDeptx.DataTextField = "DeptName";
            textDeptx.DataValueField = "DeptId";
            textDeptx.DataBind();
            textDeptx.Items.Insert(0, new ListItem("Select Dept", "0")); 

            // Course CheckboxList 
            string courseQuery = "SELECT CourseId, CourseName FROM Course";
            SqlDataAdapter courseAdapter = new SqlDataAdapter(courseQuery, con);
            DataTable courseTable = new DataTable();
            courseAdapter.Fill(courseTable);
            
            textCoursex.DataSource = courseTable;
            textCoursex.DataTextField = "CourseName";
            textCoursex.DataValueField = "CourseId";
            textCoursex.DataBind();
            textCoursex.Items.Insert(0, new ListItem("Select Course", "0")); 
        }

        private void GetGridView()
        {
            
            string query = "SELECT D.DeptName, C.CourseName FROM Department_Course DC " +
                           "JOIN Department D ON DC.DeptId = D.DeptId " +
                           "JOIN Course C ON DC.CourseId = C.CourseId";

            SqlDataAdapter da = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Serial Number 
                e.Row.Cells[0].Text = (e.Row.RowIndex + 1).ToString();

                // hide duplicates Dept
                if (e.Row.RowIndex > 0)
                {
                   
                    string currentDept = e.Row.Cells[1].Text; 
                    string previousDept = GridView1.Rows[e.Row.RowIndex - 1].Cells[1].Text;

                    if (currentDept == previousDept)
                    {
                        e.Row.Cells[1].Text = string.Empty; 
                    }
                }
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            
            Page.Validate();

           
            if (Page.IsValid)
            {
                int deptId = Convert.ToInt32(textDeptx.SelectedValue);
                List<int> selectedCourses = new List<int>();

                //  courses from CheckBoxList
                foreach (ListItem item in textCoursex.Items)
                {
                    if (item.Selected)
                    {
                        selectedCourses.Add(Convert.ToInt32(item.Value));
                    }
                }

                // Validation for department
                if (deptId == 0)
                {
                    Response.Write("<script>alert('Please Select a Department');</script>");
                    return;
                }

                //  department-course relations
                try
                {
                    con.Open();
                    foreach (int courseId in selectedCourses)
                    {
                        string insertQuery = "INSERT INTO Department_Course (DeptId, CourseId) VALUES (@DeptId, @CourseId)";
                        using (SqlCommand command = new SqlCommand(insertQuery, con))
                        {
                            command.Parameters.AddWithValue("@DeptId", deptId);
                            command.Parameters.AddWithValue("@CourseId", courseId);
                            command.ExecuteNonQuery();
                        }
                    }

                    Response.Write("<script>alert('Data inserted successfully!');</script>");
                    GetGridView();
                    PopulateDropDowns();
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

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetGridView();
        }
    }
}
