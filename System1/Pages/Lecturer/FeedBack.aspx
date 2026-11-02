<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Lecturer/LecturerPanel.Master" AutoEventWireup="true" CodeBehind="FeedBack.aspx.cs" Inherits="System1.Pages.Lecturer.FeedBack" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
     <div class="row m-3 mr-lg-5 ml-lg-5" >
            <div class="col-md-3 col-md-offset-2 mb-3 ">
                <h4>Send Feedback</h4>
                <br><br>
                <textarea id="txtarea" cols="50" rows="5" ></textarea>
                <br><br><br>
                <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn btn-primary btn-sm" BackColor="#5558C9" />
              
            </div>
            </div>
        </main>
</asp:Content>
