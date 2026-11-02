<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Admin/AdminPanel.Master" AutoEventWireup="true" CodeBehind="Dept_Course.aspx.cs" Inherits="System1.Pages.Admin.Dept_Course" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
        <h4 class="Text-center">Set Relation to Department with Course</h4>

        <div class="row m-3 mr-lg-5 ml-lg-5 mt-md-5">
            <div class="col-md-6">
                <label for="textDeptx">Department</label>
                <asp:DropDownList ID="textDeptx" runat="server" CssClass="form-control" />
                
                <asp:RequiredFieldValidator runat="server" ErrorMessage="Department is required" 
                    ControlToValidate="textDeptx" Display="Dynamic" 
                    ForeColor="Red" InitialValue="Select Dept" 
                    SetFocusOnError="True">
                </asp:RequiredFieldValidator>

            

                  <lable for="textCoursex">Course<lable>   
                    <asp:DropDownList ID="textCoursex" runat="server" CssClass="form-control" />

                        <asp:RequiredFieldValidator runat="server" ErrorMessage="Course is required" 
                            ControlToValidate="textCoursex" Display="Dynamic" 
                            ForeColor="Red" InitialValue="Select Course" 
                            SetFocusOnError="True">

                        </asp:RequiredFieldValidator>

            </div>
        </div>

        <div class="row m-3 mr-lg-5 ml-lg-5">
            <div class="col-md-3 col-md-offset-2 mb-3">
                <asp:Button ID="btnAdd" runat="server" Text="Set Relation" CssClass="btn btn-primary btn-block" 
                    BackColor="#5558C9" OnClick="btnAdd_Click" />
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>
        </div>

        <div class="row m-3 mr-lg-5 ml-lg-5">
            <div class="col-md-6">
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered"
                    AutoGenerateColumns="False" EmptyDataText="No Record Found!" 
                    OnRowDataBound="GridView1_RowDataBound" AllowPaging="True" PageSize="6" OnPageIndexChanging="GridView1_PageIndexChanging">
                  
                    <Columns>
                          <asp:TemplateField HeaderText="Sr.No">
                            <ItemTemplate>
                               
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="DeptName" HeaderText="Department" SortExpression="DeptName" />
                        <asp:BoundField DataField="CourseName" HeaderText="Course" SortExpression="CourseName" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </main>
   
</asp:Content>
