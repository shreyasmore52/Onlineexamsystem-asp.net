<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Lecturer/LecturerPanel.Master" AutoEventWireup="true" CodeBehind="AddExam.aspx.cs" Inherits="System1.Pages.Lecturer.AddExam" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
       <div class="row m-3 mr-lg-5 ml-lg-5 mt-md-5">
            <div class="auto-style3">
                     <h2>Add Exam Details</h2>
              <br>  <br>
                <label for="txtName">Exam Name:</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Exam Name" class="form-control"></asp:TextBox>
            
  <br>
            
                <label for="txtInfo">Exam Info:</label>
                <asp:TextBox ID="txtInfo" runat="server" CssClass="form-control" placeholder="Enter Exam Info" class="form-control"></asp:TextBox>
             <br>
                <label for="txtCourse">Select Courses:</label>
                <asp:DropDownList ID="txtCourse" runat="server" CssClass="form-control" class="form-control">
                </asp:DropDownList>
             <br>
                <label for="txtClass">Select Class:</label>
                <asp:DropDownList ID="txtClass" runat="server" CssClass="form-control" class="form-control">
                </asp:DropDownList>
            
                <br>
         
                <label for="txtDateTime">Exam Date and Time:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lbldatetime" runat="server" CssClass="alert" Visible="true"></asp:Label>
                <asp:TextBox ID="txtDateTime" runat="server" CssClass="form-control" placeholder="MM/DD/YYYY HH:MM:SS"></asp:TextBox>
                
            <br>
               

                <label for="txtDuTime">Duration (HH:MM:SS):</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lbltime" runat="server" CssClass="alert" Visible="true"></asp:Label>
                <asp:TextBox ID="txtDuTime" runat="server" CssClass="form-control" placeholder="Enter Duration" class="form-control"></asp:TextBox>
                
          <br>

           
                <label for="txtMark">Mark per Question:</label>
                <asp:TextBox ID="txtMark" runat="server" CssClass="form-control" placeholder="Enter Mark per Question" class="form-control"></asp:TextBox>
  <br>
                
            
                <label for="lblToken">Token:</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblToken" runat="server" CssClass="form-control" Text="Auto-Generated Token" class="form-control"></asp:Label>
          

            <br>
                <asp:Button ID="btnAdd" runat="server" Text="Next" CssClass="btn btn-success" class="form-control"/>
            
        </div>
    </div>
        </main>
</asp:Content>
