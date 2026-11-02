<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Admin/AdminPanel.Master" AutoEventWireup="true" CodeBehind="Department.aspx.cs" Inherits="System1.Pages.Admin.Department" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
        <div>
            <p>This is a main content on DEPT </p>

        </div>
         <div class="row m-3 mr-lg-5 ml-lg-5 mt-md-5" >
            <div class="col-md-6 ">
                <lable for="txtDept">Department Name<lable>
                    <asp:TextBox ID="txtDept" runat="server" CssClass="form-control" placeholder="Enter Department Name" required="true" ></asp:TextBox>
            </div>
        </div>
        <div class="row m-3 mr-lg-5 ml-lg-5" >
            <div class="col-md-3 col-md-offset-2 mb-3 ">
                <asp:Button ID="btnAdd" runat="server" Text="Add Department" CssClass="btn btn-primary btn-block" BackColor="#5558C9"   OnClick="btnAdd_Click"/> <!--OnClick="btnAdd_Click-->
                <asp:Label ID="lblMsg" runat="server"></asp:Label>

            </div>
        </div>

          <div class="row m-3 mr-lg-5 ml-lg-5" >
            <div class="col-md-6 ">
                <asp:GridView ID="GridView2" runat="server"  CssClass="table table-hover table-bordered"
                    DataKeyNames="DeptId" 
                    AutoGenerateColumns="False" 
                    EmptyDataText="No Record Found !" 
                    OnPageIndexChanging="GridView2_PageIndexChanging" 
                    OnRowCancelingEdit="GridView2_RowCancelingEdit" 
                    OnRowEditing="GridView2_RowEditing" 
                    onRowDeleting="GridView2_RowDeleting"
                    OnRowUpdating="GridView2_RowUpdating" AllowPaging="True" PageSize="4" >
                   
                    <Columns>
                        <asp:BoundField DataField="DeptId" HeaderText="Sr.No" ReadOnly="True">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="DepartMent">
                            <EditItemTemplate>
                                <asp:TextBox ID="TxtDeptEdit" runat="server" Text='<%# Eval("DeptName") %>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>

                            <ItemTemplate>
                                <asp:Label ID="lblDeptName" runat="server" Text='<%# Eval("DeptName") %>'></asp:Label>
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
