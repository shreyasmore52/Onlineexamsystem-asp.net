using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System1.Pages.FunctionModule;

namespace System1.Pages.Lecturer
{
    public partial class AddQuestions : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\Shreyas\\Desktop\\Final\\System1\\System1\\App_Data\\ExamSystem.mdf;Integrated Security=True");

        // Initialize the CRUD class
        CRUD fn = new CRUD();
        string query;
        DataSet ds;
        Int64 questionNo = 1;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateDropDowns();
            }
        }

        private void PopulateDropDowns()
        {
            string examQuery = "SELECT ExamId, ExamName FROM Exam";
            DataTable examTable = fn.getData1(examQuery);

            txtExamId.DataSource = examTable;
            txtExamId.DataTextField = "ExamName";
            txtExamId.DataValueField = "ExamId";
            txtExamId.DataBind();

            txtExamId.Items.Insert(0, new ListItem("Select Exam", "0"));
        }

        

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
           
                try
                {
                    if (txtExamId.SelectedValue != "0")
                    {
                        int examId = Convert.ToInt32(txtExamId.SelectedValue);
                     
                        Response.Write($"<script>alert('Question Paper for Exam {examId} Will be Submitted!');</script>");
                    }
                    else
                    {
                        lblall.Text = "Please select a valid exam to submit!";
                        lblall.CssClass = "alert alert-warning";
                        return;
                    }

                    Response.Redirect("ShowQues.aspx");
                }
                catch (Exception ex)
                {
                    lblall.Text = "Error occurred during submission!";
                    lblall.CssClass = "alert alert-danger";
                    Response.Write($"<script>alert('An error occurred: {ex.Message}');</script>");
                }
            

        }

        protected void txtExamId_SelectedIndexChanged(object sender, EventArgs e)
        {

            query = "Select Max(QueNo) ";
         /*   if (txtExamId.SelectedValue != "0")
            {
                query = "SELECT MAX(QueNo) FROM QuestionPaper WHERE ExamId = @ExamId";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                   // cmd.Parameters.AddWithValue("@ExamId", txtExamId.SelectedValue);
                   
                    con.Open();
                    object result = cmd.ExecuteScalar();
                    con.Close();

                    if (result != DBNull.Value && result != null)
                    {
                        questionNo = Convert.ToInt64(result) + 1;
                    }
                    else
                    {
                        questionNo = 1;
                    }

                    lblExamno.Text = questionNo.ToString();
                }
            }
            else
            {
                lblExamno.Text = "1";
                questionNo = 1;
            } */
        }

        protected void btnAdd_Click1(object sender, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid)
            {
                int examId = Convert.ToInt32(txtExamId.SelectedValue);

                if (examId == 0)
                {
                    lblall.Text = "Please Select an Exam!";
                    lblall.CssClass = "alert alert-danger";
                    return;
                }

                string qno = questionNo.ToString();
                string question = txtname.Text;
                string option1 = txtOp1.Text;
                string option2 = txtOp2.Text;
                string option3 = txtOp3.Text;
                string option4 = txtOp4.Text;
                string answer = txtAns.Text;

                query = "INSERT INTO QuestionPaper (ExamId, QueNo, QueName, QueOp1, QueOp2, QueOp3, QueOp4, CorrectAns) " +
                        "VALUES (@ExamId, @QueNo, @QueName, @QueOp1, @QueOp2, @QueOp3, @QueOp4, @CorrectAns)";

                try
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@ExamId", examId);
                        cmd.Parameters.AddWithValue("@QueNo", qno);
                        cmd.Parameters.AddWithValue("@QueName", question);
                        cmd.Parameters.AddWithValue("@QueOp1", option1);
                        cmd.Parameters.AddWithValue("@QueOp2", option2);
                        cmd.Parameters.AddWithValue("@QueOp3", option3);
                        cmd.Parameters.AddWithValue("@QueOp4", option4);
                        cmd.Parameters.AddWithValue("@CorrectAns", answer);

                        cmd.ExecuteNonQuery();
                    }
                    con.Close();
                    questionNo++;
                    lblExamno.Text = questionNo.ToString();

                    lblall.Text = "Data inserted successfully!";
                    lblall.CssClass = "alert alert-success";
                }
                catch (Exception ex)
                {
                    lblall.Text = "Data insertion failed!";
                    lblall.CssClass = "alert alert-danger";

                    Response.Write($"<script>alert('An error occurred: {ex.Message}');</script>");
                }
            }

        }
    }
}
