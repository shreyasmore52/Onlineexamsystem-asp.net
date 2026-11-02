<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Admin/AdminPanel.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="System1.Pages.Admin.Student" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main><h1>This is student code</h1>
          <div class="row m-3 mr-lg-5 ml-lg-5 mt-md-5" >
            <div class="col-md-6 ">
                <lable for="txtName">Student Name<lable>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Name" required="true" ></asp:TextBox>
                <lable for="txtDOB">Student Birth Date<lable>
                    <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control"  required="true" TextMode="Date" ></asp:TextBox>
                
                 <!--   <lable for="txtGender">Gender<lable> 
                    <asp:DropDownList ID="textGender" runat="server" CssClass="form-control">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>
                </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ErrorMessage="Gender is required" 
                            ControlToValidate="textGender" Display="Dynamic" 
                            ForeColor="Red" InitialValue="Select Gender" 
                            SetFocusOnError="True">

                        </asp:RequiredFieldValidator> -->
                   

                <lable for="txtAddress">Student Address<lable>   
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter  Address" required="true" ></asp:TextBox>
                 <lable for="txtEmail">Student Email<lable>   
                     <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="abc12@gmail.com" required="true" TextMode="Email" ></asp:TextBox>
                 <lable for="txtPassword">Student Password<lable> 
                     <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Enter Password" required="true" TextMode="Password" ></asp:TextBox>
                   
              </div>
        </div>
        <div class="row m-3 mr-lg-5 ml-lg-5" >
            <div class="col-md-3 col-md-offset-2 mb-3 ">
                <asp:Button ID="btnAdd" runat="server" Text="Add Student" CssClass="btn btn-primary btn-block" BackColor="#5558C9" OnClick="btnAdd_Click"   /> 
                <asp:Label ID="lblMsg" runat="server"></asp:Label>

            </div>
        </div>

          <div class="row m-3 mr-lg-5 ml-lg-5" >
            <div class="col-md-6 ">
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" 
                     AutoGenerateColumns="False" 
                    EmptyDataText="No Record Found !" >

                     <Columns>
        <asp:BoundField DataField="SR.No" HeaderText="SR. No" SortExpression="SR.No" />
        <asp:BoundField DataField="StudentId" HeaderText="Student Id" SortExpression="StudentId" />
        <asp:BoundField DataField="StudentName" HeaderText="Student Name" SortExpression="StudentName" />
        <asp:BoundField DataField="StudentDOB" HeaderText="DOB" SortExpression="StudentDOB" />
        <asp:BoundField DataField="StudentGender" HeaderText="Gender" SortExpression="StudentGender" />
        <asp:BoundField DataField="StudentAddress" HeaderText="Address" SortExpression="StudentAddress" />
        <asp:BoundField DataField="StudentEmail" HeaderText="Email" SortExpression="StudentEmail" />
        <asp:BoundField DataField="StudentPassword" HeaderText="Password" SortExpression="StudentPassword" />
    </Columns>
                </asp:GridView>
            </div>
          </div> 
    </main>
</asp:Content>
