<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Lecturer/LecturerPanel.Master" AutoEventWireup="true" CodeBehind="AddQuestions.aspx.cs" Inherits="System1.Pages.Lecturer.AddQuestions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            margin-left:80%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
         <br><br>
    <asp:Label ID="lblall" runat="server" CssClass="text-center"/>
        <br>
          <div class="row m-3 mr-lg-5 ml-lg-5 mt-md-5" >
            <div class="col-md-6 ">
                 <h4 class="text-left">ADD New Question</h4>
                </div>
              </div>
    <br>
   
                <div class="auto-style2">
               <lable for="lblExamno">Que.No <lable> <br>
                 <asp:Label ID="lblExamno" runat="server" ></asp:Label>
                     </div>
               
     <div class="row m-3 mr-lg-5 ml-lg-5 mt-md-5" >
            <div class="col-md-6 ">
                
                 <label for="txtExamId">Exam Id</label>
                <asp:DropDownList ID="txtExamId" runat="server" CssClass="form-control" OnSelectedIndexChanged="txtExamId_SelectedIndexChanged" />
                
                <asp:RequiredFieldValidator runat="server" ErrorMessage="Department is required" 
                    ControlToValidate="txtExamId" Display="Dynamic" 
                    ForeColor="Red" InitialValue="Select Exam" 
                    SetFocusOnError="True">
                </asp:RequiredFieldValidator>
              
                 <br />
                
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
                <asp:Button ID="btnAdd" runat="server" Text="Add Next Que " CssClass="btn btn-primary btn-block" BackColor="#5558C9"  Font-Size="18px" OnClick="btnAdd_Click1" /> 
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnSubmit" runat="server" Text="Submit Paper" CssClass="btn btn-primary btn-success" BackColor="#5558C9"  Font-Size="18px" OnClick="btnSubmit_Click" /> 
        
                </div>
        </div>

    </main>
</asp:Content>
