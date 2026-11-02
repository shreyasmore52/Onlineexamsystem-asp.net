
<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Admin/AdminPanel.Master" AutoEventWireup="true" CodeBehind="Lecturer.aspx.cs" Inherits="System1.Pages.Admin.Lecturer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
        <h1>This is Teacher code</h1>

            <div class="row m-3 mr-lg-5 ml-lg-5 mt-md-5" >
            <div class="col-md-6 ">
                <lable for="txtName">Lecturer Name<lable>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Lecturer Name" required="true" ></asp:TextBox>
                <lable for="txtDOB">Lecturer Birth Date<lable>
                    <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control"  required="true" TextMode="Date" ></asp:TextBox>
                <lable for="txtGender">Lecturer Gender<lable> 
                    <asp:TextBox ID="txtGender" runat="server" CssClass="form-control" placeholder="Enter Lecturer Gender" required="true" ></asp:TextBox>
               
                <lable for="txtAddress">Lecturer Address<lable>   
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter Lecturer Address" required="true" ></asp:TextBox>
                 <lable for="txtEmail">Lecturer Email<lable>   
                     <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="abc12@gmail.com" required="true" TextMode="Email" ></asp:TextBox>
                 <lable for="txtPassword">Lecturer Password<lable> 
                     <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Enter Lecturer Password" required="true" TextMode="Password" ></asp:TextBox>
            </div>
        </div>
        <div class="row m-3 mr-lg-5 ml-lg-5" >
            <div class="col-md-3 col-md-offset-2 mb-3 ">
                <asp:Button ID="btnAdd" runat="server" Text="Add Lecturer" CssClass="btn btn-primary btn-block" BackColor="#5558C9"  OnClick="btnAdd_Click" /> 
            </div>
        </div>

         <div class="row m-3 mr-lg-5 ml-lg-5" >
            <div class="col-md-6 ">
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" 
                     AutoGenerateColumns="False" 
                    EmptyDataText="No Record Found !" >
                       <Columns>
        <asp:BoundField DataField="SR.No" HeaderText="SR. No" SortExpression="SR.No" />
        <asp:BoundField DataField="LecturerId" HeaderText="Lecturer Id" SortExpression="LecturerId" />
        <asp:BoundField DataField="LecturerName" HeaderText="Lecturer Name" SortExpression="LecturerName" />
        <asp:BoundField DataField="LecturerDOB" HeaderText="DOB" SortExpression="LecturerDOB" />
        <asp:BoundField DataField="LecturerGender" HeaderText="Gender" SortExpression="LecturerGender" />
        <asp:BoundField DataField="LecturerAddress" HeaderText="Address" SortExpression="LecturerAddress" />
        <asp:BoundField DataField="LecturerEmail" HeaderText="Email" SortExpression="LecturerEmail" />
        <asp:BoundField DataField="LecturerPassword" HeaderText="Password" SortExpression="LecturerPassword" />
    </Columns>

                </asp:GridView>
            </div>
        </div> 
    </main>
</asp:Content>
