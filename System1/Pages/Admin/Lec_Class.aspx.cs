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
    public partial class Lec_Class : System.Web.UI.Page
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
            // Lecturer Dropdown
            string lecturerQuery = "SELECT LecturerId, LecturerName FROM Lecturer";
            SqlDataAdapter lecAdapter = new SqlDataAdapter(lecturerQuery, con);
            DataTable lecTable = new DataTable();
            lecAdapter.Fill(lecTable);

            textlec.DataSource = lecTable;
            textlec.DataTextField = "LecturerName";
            textlec.DataValueField = "LecturerId";
            textlec.DataBind();
            textlec.Items.Insert(0, new ListItem("Select Lecturer", "0"));

            // Class DropdownList 
            string classQuery = "SELECT ClassId, ClassName FROM Class";
            SqlDataAdapter ClassAdapter = new SqlDataAdapter(classQuery, con);
            DataTable ClassTable = new DataTable();
            ClassAdapter.Fill(ClassTable);

            txtClass.DataSource = ClassTable;
            txtClass.DataTextField = "ClassName";
            txtClass.DataValueField = "ClassId";
            txtClass.DataBind();
            txtClass.Items.Insert(0, new ListItem("Select Class", "0"));
        }

        private void GetGridView()
        {

           
            string query = "SELECT L.LecturerName, C.ClassName FROM Lecturer_Class LC " +
                           "JOIN Lecturer L ON LC.LecturerId = L.LecturerId " +
                           "JOIN Class C ON LC.ClassId = C.ClassId";

            SqlDataAdapter da = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Page.Validate();


            if (Page.IsValid)
            {
                int deptId = Convert.ToInt32(textlec.SelectedValue);
                List<int> selectedClass = new List<int>();

                //  courses from CheckBoxList
                foreach (ListItem item in txtClass.Items)
                {
                    if (item.Selected)
                    {
                        selectedClass.Add(Convert.ToInt32(item.Value));
                    }
                }

                // Validation for department
                if (deptId == 0)
                {
                    Response.Write("<script>alert('Please Select a Lecturer');</script>");
                    return;
                }

                //  department-course relations
                try
                {
                    con.Open();
                    foreach (int classId in selectedClass)
                    {
                        string insertQuery = "INSERT INTO Lecturer_Class (LecturerId, ClassId) VALUES (@LecturerId, @ClassId)";
                        using (SqlCommand command = new SqlCommand(insertQuery, con))
                        {
                            command.Parameters.AddWithValue("@LecturerId", deptId);
                            command.Parameters.AddWithValue("@ClassId", classId);
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

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetGridView();
        }
    }
}