<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Admin/AdminPanel.Master" AutoEventWireup="true" CodeBehind="Add_Ques_Paper.aspx.cs" Inherits="System1.Pages.Admin.Add_Ques_Paper" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            margin-left: 80%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br><br>
    <asp:Label ID="lblall" runat="server" CssClass="text-center"/>
    <br>
   
     <div class="row m-3 mr-lg-5 ml-lg-5 mt-md-5" >
            <div class="col-md-6 ">
                 <h4 class="text-left">ADD New Question</h4>
                 <br><asp:Button ID="Back" runat="server" Text="Back" CssClass="btn btn-primary btn-denger" BackColor="#5558C9" OnClick="Back_Click"  /> 
          
               <div class="auto-style2"> <lable for="txtQueno">Que.No <lable>
                 <asp:Label ID="txtQueno" runat="server" ></asp:Label></div>
                     
                     <br>
                <lable for="txtName">Question Name<lable> &nbsp;&nbsp;
                     <asp:TextBox Id="txtname" runat="server" CssClass="form-control" placeholder="Enter Question Name " required="true"/>
                     <br>
                <lable for="txtOp1">Option 1 <lable>
                    <asp:TextBox Id="txtOp1" runat="server" CssClass="form-control" placeholder="Enter Option 1" required="true"/>
                    <br>
               <lable for="txtOp2">Option 2 <lable>
                    <asp:TextBox Id="txtOp2" runat="server" CssClass="form-control" placeholder="Enter Option 2" required="true"/>
                    <br>
                <lable for="txtOp3">Option 3 <lable>
                    <asp:TextBox Id="txtOp3" runat="server" CssClass="form-control" placeholder="Enter Option 3" required="true"/>
                    <br>
                <lable for="txtOp4">Option 4 <lable>
                    <asp:TextBox Id="txtOp4" runat="server" CssClass="form-control" placeholder="Enter Option 4" required="true"/>
                    <br>
                <lable for="txtAns">Correct Answer <lable>
                    <asp:TextBox Id="txtAns" runat="server" CssClass="form-control" placeholder="Enter Answer Key" required="true"/>
                    <br>
            </div>
         </div>

         <div class="row m-3 mr-lg-5 ml-lg-5" >
            <div class="col-md-3 col-md-offset-2 mb-3 ">
                <asp:Button ID="btnAdd" runat="server" Text="Submit" CssClass="btn btn-primary btn-block" BackColor="#5558C9" OnClick="btnAdd_Click" /> 
            </div>
        </div>
</asp:Content>
