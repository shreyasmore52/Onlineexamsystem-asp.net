<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Admin/AdminPanel.Master" AutoEventWireup="true" CodeBehind="Lec_Class.aspx.cs" Inherits="System1.Pages.Admin.Lec_Class" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
        <h4 class="Text-center">This is relation of class and Lecturer</h4>

           <div class="row m-3 mr-lg-5 ml-lg-5 mt-md-5">
            <div class="col-md-6">
                <label for="textlec">Lecturer</label>
                <asp:DropDownList ID="textlec" runat="server" CssClass="form-control" />
                
                <asp:RequiredFieldValidator runat="server" ErrorMessage="Lecturer is required" 
                    ControlToValidate="textlec" Display="Dynamic" 
                    ForeColor="Red" InitialValue="Select Lecturer" 
                    SetFocusOnError="True">
                </asp:RequiredFieldValidator>

            

                  <lable for="txtClass">Class<lable>   
                    <asp:DropDownList ID="txtClass" runat="server" CssClass="form-control" />

                        <asp:RequiredFieldValidator runat="server" ErrorMessage="Class is required" 
                            ControlToValidate="txtClass" Display="Dynamic" 
                            ForeColor="Red" InitialValue="Select Class" 
                            SetFocusOnError="True">

                        </asp:RequiredFieldValidator>

            </div>
        </div>

           <div class="row m-3 mr-lg-5 ml-lg-5">
            <div class="col-md-3 col-md-offset-2 mb-3">
                <asp:Button ID="btnAdd" runat="server" Text="Set Relation" CssClass="btn btn-primary btn-block" 
                    BackColor="#5558C9" OnClick="btnAdd_Click"  />
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>
        </div>

      <div class="row m-3 mr-lg-5 ml-lg-5">
            <div class="col-md-6">
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered"
                    AutoGenerateColumns="False" EmptyDataText="No Record Found!" 
                    AllowPaging="True" PageSize="6" OnRowDataBound="GridView1_RowDataBound" OnPageIndexChanging="GridView1_PageIndexChanging" >
                    <Columns>
                       <asp:TemplateField HeaderText="Sr.No">
                            <ItemTemplate>
                               
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="LecturerName" HeaderText="Lecturer" SortExpression="LecturerName" />
                        <asp:BoundField DataField="ClassName" HeaderText="Class" SortExpression="ClassName" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </main>
</asp:Content>
