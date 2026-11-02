using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace System1.Pages.Comman
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;
            string confirmPassword = txtConfirmPassword.Text;

            if (password != confirmPassword)
            {
                Response.Write("<script>alert('Passwords do not match');</script>");
                return;
            }

            if (CreateUser(username, password))
            {
                // Redirect to the login page
                Response.Redirect("Login.aspx");
            }
            else
            {
                // Handle error (for example: show error message)
                Response.Write("<script>alert('User already exists');</script>");
            }
        }

        private bool CreateUser(string username, string password)
        {
            string connectionString = ""; 
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(1) FROM Users WHERE Username = @Username";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Username", username);

                con.Open();
                int userExists = Convert.ToInt32(cmd.ExecuteScalar());

                if (userExists > 0)
                {
                    return false; // User already exists
                }

                query = "INSERT INTO Users (Username, Password) VALUES (@Username, @Password)";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Password", password); 

                cmd.ExecuteNonQuery();
                return true;
            }
        }
    }
    
}