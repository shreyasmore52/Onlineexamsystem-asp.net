<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Admin/AdminPanel.Master" AutoEventWireup="true" CodeBehind="AdminIndex.aspx.cs" Inherits="System1.Pages.Admin.AdminIndex" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
        <style>
            .info{
                display:flex
            }
            .box{
                background-color:black;
                border:2px solid black;
                width:250px;
                height:160px;
                margin-left:30px;
            }
        </style>
        
        <div class="container p-md-4 p-sm-4 align-content-between">
            <div>
            <h2>Home page</h2>
            <p>Application Data</p>
                <div >
                <pre> Home> HomePage> Application Data</pre>
            </div>
            </div>
            
        </div>
        <div class="info">
            <div class="box"></div>
            <div class="box"></div>
            <div class="box"></div>
            <div class="box"></div>
           
        </div>
        <br>
          <div class="info">
            <div class="box"></div>
            <div class="box"></div>
            <div class="box"></div>
              <div class="box"></div>
        </div>
    </main>
</asp:Content>
