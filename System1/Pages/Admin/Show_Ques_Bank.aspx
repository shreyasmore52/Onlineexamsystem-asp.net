<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Admin/AdminPanel.Master" AutoEventWireup="true" CodeBehind="Show_Ques_Bank.aspx.cs" Inherits="System1.Pages.Admin.Show_Ques_Bank" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
        <br><br>
        
        <br>
          <div class="row m-3 mr-lg-5 ml-lg-5" >
            <div class="col-md-3 col-md-offset-2 mb-3 ">
                <h4>List of question</h4>
                <br>
                <asp:Button ID="btnAdd" runat="server" Text="Add More Question" CssClass="btn btn-primary btn-sm" BackColor="#5558C9" OnClick="btnAdd_Click"  />
                <br><br>
                </div>

        </div>
          <div class="row m-3 mr-lg-5 ml-lg-5" >
            <div class="col-md-6 ">
               
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="QusId" DataSourceID="ExamQuestion"
                    CssClass="table table-hover table-bordered">
                    <Columns>
                       
                        <asp:BoundField DataField="ExamId" HeaderText="ExamId" SortExpression="ExamId" />
                        
                         <asp:BoundField DataField="QusId" HeaderText="QueNo" InsertVisible="False" ReadOnly="True" SortExpression="QusId" />
                        <asp:BoundField DataField="QueName" HeaderText="QueName" SortExpression="QueName" />
                        <asp:BoundField DataField="QueOp1" HeaderText="QueOp1" SortExpression="QueOp1" />
                        <asp:BoundField DataField="QueOp2" HeaderText="QueOp2" SortExpression="QueOp2" />
                        <asp:BoundField DataField="QueOp3" HeaderText="QueOp3" SortExpression="QueOp3" />
                        <asp:BoundField DataField="QueOp4" HeaderText="QueOp4" SortExpression="QueOp4" />
                        <asp:BoundField DataField="CorrectAns" HeaderText="CorrectAns" SortExpression="CorrectAns" />
                        <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                        <asp:BoundField DataField="LecturerId" HeaderText="LecturerId" SortExpression="LecturerId" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="ExamQuestion" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [QuestionPaper]"></asp:SqlDataSource>
            </div>

        </div>
                
    </main>
</asp:Content>


