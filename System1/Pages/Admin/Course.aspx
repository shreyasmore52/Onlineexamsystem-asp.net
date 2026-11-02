<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Admin/AdminPanel.Master" AutoEventWireup="true" CodeBehind="Course.aspx.cs" Inherits="System1.Pages.Admin.Course" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main><h1>This is Course Content</h1>

             <div class="row m-3 mr-lg-5 ml-lg-5 mt-md-5" >
            <div class="col-md-6 ">
                <lable for="txtClass">Course Name<lable>
                    <asp:TextBox ID="txtCourse" runat="server" CssClass="form-control" placeholder="Enter Course Name" required="true" ></asp:TextBox>
            </div>
        </div>
        <div class="row m-3 mr-lg-5 ml-lg-5" >
            <div class="col-md-3 col-md-offset-2 mb-3 ">
                <asp:Button ID="btnAdd" runat="server" Text="Add Course" CssClass="btn btn-primary btn-block" BackColor="#5558C9" OnClick="btnAdd_Click"  /> <!--OnClick="btnAdd_Click-->
                <asp:Label ID="lblMsg" runat="server"></asp:Label>

            </div>
        </div>

          <div class="row m-3 mr-lg-5 ml-lg-5" >
            <div class="col-md-6 ">
                <asp:GridView ID="GridView3" runat="server"  CssClass="table table-hover table-bordered"
                    DataKeyNames="CourseId" 
                    AutoGenerateColumns="False" 
                    EmptyDataText="No Record Found !" 
                    OnPageIndexChanging="GridView3_PageIndexChanging" 
                    OnRowCancelingEdit="GridView3_RowCancelingEdit" 
                    OnRowEditing="GridView3_RowEditing" 
                    onRowDeleting="GridView3_RowDeleting"
                    OnRowUpdating="GridView3_RowUpdating" AllowPaging="True" PageSize="4" >
                   
                    <Columns>
                        <asp:BoundField DataField="CourseId" HeaderText="Sr.No" ReadOnly="True">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Course">
                            <EditItemTemplate>
                                <asp:TextBox ID="TxtCourseEdit" runat="server" Text='<%# Eval("CourseName") %>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>

                            <ItemTemplate>
                                <asp:Label ID="lblCourseName" runat="server" Text='<%# Eval("CourseName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:CommandField CausesValidation="False" HeaderText="Operation" ShowEditButton="True" ShowDeleteButton="True" />
                    </Columns>

                    <HeaderStyle BackColor="#5558C9" ForeColor="White"/>
                </asp:GridView>
                
            </div>
          </div> 
    </main>
</asp:Content>
