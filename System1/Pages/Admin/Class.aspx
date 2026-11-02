<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Admin/AdminPanel.Master" AutoEventWireup="true" CodeBehind="Class.aspx.cs" Inherits="System1.Pages.Admin.Class" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
        <pre>this is class content</pre>

        <div class="row m-3 mr-lg-5 ml-lg-5 mt-md-5" >
            <div class="col-md-6 ">
                <lable for="txtClass">Class Name<lable>
                    <asp:TextBox ID="txtClass" runat="server" CssClass="form-control" placeholder="Enter Class Name" required="" ></asp:TextBox>
            </div>
        </div>
        <div class="row m-3 mr-lg-5 ml-lg-5" >
            <div class="col-md-3 col-md-offset-2 mb-3 ">
                <asp:Button ID="btnAdd" runat="server" Text="Add Class" CssClass="btn btn-primary btn-block" BackColor="#5558C9" OnClick="btnAdd_Click" />
                <asp:Label ID="lblMsg" runat="server"></asp:Label>

            </div>
        </div>

            <div class="row m-3 mr-lg-5 ml-lg-5" >
            <div class="col-md-6 ">
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" 
                    DataKeyNames="ClassId" 
                    AutoGenerateColumns="False" 
                    EmptyDataText="No Record Found !" 
                    OnPageIndexChanging="GridView1_PageIndexChanging" 
                    OnRowCancelingEdit="GridView1_RowCancelingEdit" 
                    OnRowEditing="GridView1_RowEditing" 
                    onRowDeleting="GridView1_RowDeleting"
                    OnRowUpdating="GridView1_RowUpdating" AllowPaging="True" PageSize="4" >
                   
                    <Columns>
                        <asp:BoundField DataField="ClassId" HeaderText="Sr.No" ReadOnly="True">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Class">
                            <EditItemTemplate>
                                <asp:TextBox ID="TxtClassEdit" runat="server" Text='<%# Eval("ClassName") %>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>

                            <ItemTemplate>
                                <asp:Label ID="lblClassName" runat="server" Text='<%# Eval("ClassName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:CommandField CausesValidation="False" HeaderText="Op" ShowEditButton="True" ShowDeleteButton="True" />
                    </Columns>

                    <HeaderStyle BackColor="#5558C9" ForeColor="White"/>
                </asp:GridView>
            </div>
            </div>
        
    </main>
</asp:Content>
