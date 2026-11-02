<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Comman/Comman.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="System1.Pages.Comman.Signup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <main>
        <style>
    #signupForm {
    font-family: Arial, sans-serif;
    background-color: #f0f4f8;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}

h2 {
    text-align: center;
    color: #333;
}

a {
    text-decoration: none;
    color: #3498db;
}

a:hover {
    text-decoration: underline;
}
.login-container, .signup-container {
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 4px 4px 4px 4px rgba(0, 0, 0, 0.1);
    padding: 40px;
    width: 100%;
    max-width: 400px;
}

input, .aspNetDisabled, .btn {
    width: 100%;
    padding: 12px;
    margin: 10px 0;
    border-radius: 4px;
    border: 1px solid #ddd;
    font-size: 16px;
}

input:focus {
    border-color: #3498db;
    outline: none;
}

label {
    font-size: 14px;
    color: #555;
    margin-bottom: 6px;
    display: block;
}

button {
    background-color: #3498db;
    color: #fff;
    border: none;
    font-size: 16px;
    cursor: pointer;
    border-radius: 4px;
    padding: 12px;
    margin-top: 20px;
    transition: background-color 0.3s ease;
}

button:hover {
    background-color: #2980b9;
}

.alert {
    color: red;
    font-size: 14px;
    margin-top: 10px;
    text-align: center;
}

        </style>
        <div id="signupForm">
    <div class="signup-container">
        <h2>Sign Up</h2>
        
            <div>
                <label for="username">Username</label>
                <asp:TextBox ID="txtUsername" runat="server" placeholder="Enter your username" Required="true"></asp:TextBox>
            </div>
            <div>
                <label for="password">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Enter your password" Required="true"></asp:TextBox>
            </div>
            <div>
                <label for="confirmPassword">Confirm Password</label>
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" placeholder="Confirm your password" Required="true"></asp:TextBox>
            </div>
            <div>
                <asp:Button ID="btnSignup" runat="server" Text="Sign Up" OnClick="btnSignup_Click" />
            </div>
        </div>
    </div>



    </main>
</asp:Content>
