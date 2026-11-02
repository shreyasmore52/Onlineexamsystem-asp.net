<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Admin/AdminPanel.Master" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="System1.Pages.Admin.Settings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
        <style>
            #txtarea1{
                width:450px;
                height:450px;
                border:1px solid black;
            }

        </style>
        <div class="row m-3 mr-lg-5 ml-lg-5" >
            <div class="col-md-3 col-md-offset-2 mb-3 ">
                 <h4>Setting</h4>
                <br><br><br>
                <div id="txtarea1">
                    <div>
                        <lable for="txtName">Name<lable>&nbsp;&nbsp;<p>Demo Admin</p>
                        <br>
                        <lable for="txtName">Email<lable>&nbsp;&nbsp;<p>DemoAdmin@gmail.com</p>
                        <br>
                        <%--<lable for="txtName">Password<lable>&nbsp;&nbsp;<p></p>--%>
                    </div>

                </div>
            </div>
        </div>

    </main>
</asp:Content>
