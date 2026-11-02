using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Web.UI.WebControls;

namespace System1.Pages.Admin
{
    public partial class Add_Ques_Bank : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\Shreyas\\Desktop\\Final\\System1\\System1\\App_Data\\ExamSystem.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDowns();
                GenerateToken();
                // Automatically generate the token
            }

            // Automatically handle Date and Time validation
          
        }

        private void DropDowns()
        {
            // Fill Course CheckBoxList
            string courseQuery = "SELECT CourseId, CourseName FROM Course";
            SqlDataAdapter courseAdapter = new SqlDataAdapter(courseQuery, con);
            DataTable courseTable = new DataTable();
            courseAdapter.Fill(courseTable);

            txtCourse.DataSource = courseTable;
            txtCourse.DataTextField = "CourseName";
            txtCourse.DataValueField = "CourseId";
            txtCourse.DataBind();
            txtCourse.Items.Insert(0, new ListItem("Select Course", "0"));

            // Fill Class DropDownList
            string classQuery = "SELECT ClassId, ClassName FROM Class";
            SqlDataAdapter classAdapter = new SqlDataAdapter(classQuery, con);
            DataTable classTable = new DataTable();
            classAdapter.Fill(classTable);

            txtClass.DataSource = classTable;
            txtClass.DataTextField = "ClassName";
            txtClass.DataValueField = "ClassId";
            txtClass.DataBind();
            txtClass.Items.Insert(0, new ListItem("Select Class", "0"));
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Page.Validate();

            // Check if the page is valid and that required fields are filled out
            if (Page.IsValid)
            {
                int classId = Convert.ToInt32(txtClass.SelectedValue);  // Selected ClassId
                List<int> selectedCourses = new List<int>();

                // Get selected courses from CheckBoxList
                foreach (ListItem item in txtCourse.Items)
                {
                    if (item.Selected)
                    {
                        selectedCourses.Add(Convert.ToInt32(item.Value));  // Add selected course Id
                    }
                }

                // Check if the Class is selected
                if (classId == 0)
                {
                    Response.Write("<script>alert('Please Select a class');</script>");
                    return;
                }

                // Check if at least one course is selected
                if (selectedCourses.Count == 0)
                {
                    Response.Write("<script>alert('Please Select at least one course');</script>");
                    return;
                }

                // Insert Exam details
                string examName = txtName.Text;
                string examInfo = txtInfo.Text;
                string startDate = txtDateTime.Text;
                string duration = txtDuTime.Text;
                string eachQueMark = txtMark.Text;
                string token = lblToken.Text;

                // Date and Duration validation
               if (!IsValidDateTime(startDate))
              {
                    Response.Write("<script>alert('Invalid Date/Time. Ensure the date is not in the past and the format is correct.');</script>");
                   return;
               }

                if (!IsValidDuration(duration))
                {
                    Response.Write("<script>alert('Invalid Duration. Please provide the duration in correct format (HH:MM:SS).');</script>");
                    return;
                }

                // Insert query with parameters
                string insertExamQuery = "INSERT INTO Exam (ExamName, ExamInfo, StartDate, Duration, EachQueMark, Token, ClassId, CourseId) " +
                                         "VALUES (@ExamName, @ExamInfo, @StartDate, @Duration, @EachQueMark, @Token, @ClassId, @CourseId); " +
                                         "SELECT SCOPE_IDENTITY();";

                try
                {
                    con.Open();
                    foreach (int courseId in selectedCourses)
                    {
                        using (SqlCommand cmd = new SqlCommand(insertExamQuery, con))
                        {
                            cmd.Parameters.AddWithValue("@ExamName", examName);
                            cmd.Parameters.AddWithValue("@ExamInfo", examInfo);
                            cmd.Parameters.AddWithValue("@StartDate", startDate);
                            cmd.Parameters.AddWithValue("@Duration", duration);
                            cmd.Parameters.AddWithValue("@EachQueMark", Convert.ToInt32(eachQueMark));
                            cmd.Parameters.AddWithValue("@Token", token);
                            cmd.Parameters.AddWithValue("@ClassId", classId);
                            cmd.Parameters.AddWithValue("@CourseId", courseId);
                            cmd.ExecuteNonQuery();
                        }
                    }

                    Response.Write("<script>alert('Data inserted successfully!');</script>");
                    DropDowns();  // Refresh dropdown lists after insert
                    Response.Redirect("Add_Ques_Paper.aspx");
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

           private bool IsValidDateTime(string inputDateTime)
           {
               string[] dateTimeParts = inputDateTime.Split(' ');
               if (dateTimeParts.Length == 2)
               {
                   string inputDate = dateTimeParts[0];
                   string inputTime = dateTimeParts[1];

                   // Validate date and time formats
                   if (IsValidDateFormat(inputDate) && IsValidTimeFormat(inputTime))
                   {
                       DateTime parsedDate;
                       if (DateTime.TryParse(inputDate, out parsedDate) && parsedDate >= DateTime.Today)
                       {
                           return true;
                       }
                   }
               }
               return false;
           }
   
      /*  public bool ValidateInputs(string inputDate, string inputTime)
        {
            if (IsValidDateFormat(inputDate) && IsValidTimeFormat(inputTime))
            {
                DateTime parsedDate;
                if (DateTime.TryParse(inputDate, out parsedDate) && parsedDate >= DateTime.Today)
                {
                    // Continue with other logic
                    return true;
                }
            }
            return false; // Invalid date or time format
      }
     */  


        // Duration validation method (should be in HH:MM:SS format)
        private bool IsValidDuration(string inputDuration)
        {
            return IsValidTimeFormat(inputDuration);
        }

        // Helper method to validate date format (MM/DD/YYYY)
        private bool IsValidDateFormat(string inputDate)
        {
            Regex datePattern = new Regex(@"^(0[1-9]|1[0-2])\/([0-2][0-9]|3[01])\/\d{4}$");

            //Regex datePattern = new Regex("^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/\\d{4}$");
            return datePattern.IsMatch(inputDate);
        }

        // Helper method to validate time format (HH:MM:SS)
        private bool IsValidTimeFormat(string inputTime)
        {
            Regex timePattern = new Regex(@"^([0-1][0-9]|2[0-3]):([0-5][0-9]):([0-5][0-9])$");
            return timePattern.IsMatch(inputTime);
        }

        private void GenerateToken()
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            Random rand = new Random();
            char[] token = new char[8];

            for (int i = 0; i < token.Length; i++)
            {
                token[i] = chars[rand.Next(chars.Length)];
            }

            lblToken.Text = new string(token);  // Automatically generate the token on page load
        }
       
    }
}


