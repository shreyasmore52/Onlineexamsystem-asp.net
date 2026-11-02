<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Student/StudentIndex.Master" AutoEventWireup="true" CodeBehind="exampage.aspx.cs" Inherits="System1.Pages.Student.exampage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <main>
             <style>
                 .exam-rule{
                     height:11rem;
                     width:80rem;;
                     background-color:#08f0f0;
                     border-left:5px solid #3fb7b7;
                     color:azure;
                     text-align:left;
                     font-weight:600;
                     padding: 10px 0 0 10px;
                     border-radius:10px;
                 }

                
                 .item{
                     width:70rem;
                     height:25rem;
                     border-top:5px solid #3fb7b7;
                     border-left:3px solid #e0e0e0;
                     border-bottom:3px solid #e0e0e0;
                     border-right:3px solid #e0e0e0;
                      border-radius:5px;
                       display:flex;

                     
                 }

                 lable {
                     color: black;
                     font-size: 20px;
                     font-weight: 800;
                     margin: 20px 0 0 20px;
                    
                 }
                    .rule1{
                         height:3rem;
                     width:40rem;
                     background-color:#08f0f0;
                     border-left:5px solid #3fb7b7;
                     color:azure;
                     text-align:left;
                     font-weight:600;
                     padding: 10px 0 0 10px;
                     border-radius:3px;
                     margin-top:30px;
                    }
                btn1:hover{
                    background-color:darkgoldenrod;
                }
            </style>

     <div class="row m-3 mr-lg-5 ml-lg-5" >
            <div class="col-md-3 col-md-offset-2 mb-3 ">
                <h4>Verify Exam Token</h4>
            </div>
      </div>
         <div class="row m-3 mr-lg-5 ml-lg-5" >
            <div class="col-md-3 col-md-offset-2 mb-3 ">
    <div class="exam-rule">
        <h5>Examination Rule</h5>
        <p class="rule">
Lorem ipsum dolor, sit amet consectetur adipisicing elit. Reiciendis, tempore soluta sint nemo, distinctio, corporis numquam maiores vitae perferendis quos minus suscipit! Rem, voluptate laboriosam similique suscipit perspiciatis repudiandae voluptates!
Ipsa nostrum possimus dolor laborum placeat ab labore tempore, voluptates inventore ea ipsam qui asperiores officiis quisquam alias perspiciatis velit incidunt dignissimos unde tempora! Tenetur iste voluptatum incidunt architecto laudantium.
Optio animi similique harum beatae dignissimos earum eum explicabo et, veritatis aliquam rem, corporis ducimus voluptatibus rerum. Veritatis enim repellat amet ullam officiis. Cupiditate quam qui, vitae accusamus maxime voluptatum?
Quis officia maiores id minus exercitationem labore perferendis maxime eos, error adipisci consectetur vero? Cumque unde eius minus officia beatae dolores sit maiores, hic amet, ut deserunt eligendi, perferendis quibusdam!</p>
    </div>
        </div>
        </div>

         <div class="row m-3 mr-lg-5 ml-lg-5" >
            <div class="col-md-3 col-md-offset-2 mb-3 ">
           
                <div class="item">
                    <div>
                    <h3 style="margin:20px 0 0 20px;">Exam Data</h3>
                    <br>
                     <lable for="txtName">Student Name<lable>
                        <lable for="txtName"><lable>
                            <br>
                    <lable for="txtcourse">Course Name<lable>
                        <lable for="txtcourse"><lable>
                        <br>
                        <lable for="txtDept">Class/Department<lable>
                            <lable for="txtDept"><lable> 
                            <br>
                    
                   <lable for="txtExamName">Exam Name<lable> 
                       <lable for="txtExamName"><lable> 
                           <br>
                  <lable for="txtMark">Total Mark<lable> 
                      <lable for="txtMark"><lable> 
                          <br>
                   <lable for="txtTime">Exam Time<lable> 
                         <lable for="txtTime"><lable> 
                             <br>
                      <lable for="txtDate">Exam Date<lable> 
                            <lable for="txtTime"><lable> 
                                <br>

                 <lable for="txtToken">Exam Token<lable>   
                     <asp:TextBox ID="txtToken" runat="server"  placeholder="Exam Token" required="true" Height="38px" Width="250px"></asp:TextBox>
                 </div>
              
                <div class="sec2">
                    <div class="rule1">
                        <p>The Time to take the exam is when the "START" button is green<p>
                   </div>
                    <br>
                    <br><br>
                    <div class="btn1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:Button ID="Button1" runat="server" Text="Start Exam" CssClass="btn btn-success btn-sm" OnClick="Button1_Click" Height="49px" Width="117px" />
                        </div>
               
              </div>
                      </div>
                </div>
       
               </div>
     
      

    </main>
</asp:Content>
