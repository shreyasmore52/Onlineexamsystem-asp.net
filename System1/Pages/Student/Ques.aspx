<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Student/ExamView.Master" AutoEventWireup="true" CodeBehind="Ques.aspx.cs" Inherits="System1.Pages.Student.Ques" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
         <style>
 body{
       
    background-color: #8ec5fc;
    background-image: linear-gradient(62deg,#8ec5fc 0%,#e0c3fc 100%);
 }
.quiz-section {
    width: 850px;
    height: 47rem;
    display:grid;
    place-items:left;
    background-color: #fff;
    border-radius: .5rem;
    -webkit-border-radius: .5rem;
    -moz-border-radius: .5rem;
    -ms-border-radius: .5rem;
    -o-border-radius: .5rem;
    box-shadow: rgba(99,99,99,.2) 0px 2px 8px 0px;
}

.navigation-sec1{
     width: 27rem;
    height: 15rem;
 
    
    background-color: #fff;
    border-radius: .5rem;
    -webkit-border-radius: .5rem;
    -moz-border-radius: .5rem;
    -ms-border-radius: .5rem;
    -o-border-radius: .5rem;
    box-shadow: rgba(99,99,99,.2) 0px 2px 8px 0px;

}

#question {
    font-size: 1.8rem;
    padding: 2rem 3rem;
}

ul {
    display: flex;
    justify-content: center;
    align-items: flex-start;
    flex-direction: column;
    gap: 1rem;
    padding: 2rem 5rem;
   
}

li {
    list-style: none;
    min-width: 43rem;
    min-height: 5rem;
    border-radius: 1rem;
    border: .2rem solid #e0e0e0;
    padding: 0 4rem 0 3rem;
    -webkit-border-radius: 1rem;
    -moz-border-radius: 1rem;
    -ms-border-radius: 5rem;
    -o-border-radius: 5rem;
    -webkit-border-radius: 1rem;
    font-size: 1.8rem;
    font-weight: 700;
    display: flex;
    justify-content: flex-start;
    align-items: center;
}

label {
    padding-left: 1rem;
    font-size:1.5rem;
    font-weight:300;
}

input[type=radio]{width:20px;height:20px}
input[type=radio]:checked{background-color:#8ec5fc;border-color:#8ec5fc}

#quiz> .btn{
    height:30rem;
    width:20rem;
    
    padding: 0 5rem;
    height: 5rem;
    border-radius: 1rem;
    -webkit-border-radius: 1rem;
    -moz-border-radius: 1rem;
    -ms-border-radius: 1rem;
    -o-border-radius: 1rem;
    
    border: none;
    color: #fff;
    font-size: 1.6rem;
    
}


.result {
    width: 100%;
    height: auto;
    padding: 5rem;
    background-color: #fff;
    border-radius: .5rem;
    -webkit-border-radius: .5rem;
    -moz-border-radius: .5rem;
    -ms-border-radius: .5rem;
    -o-border-radius: .5rem;
    box-shadow: rgba(99,99,99,.2) 0px 2px 8px 0px;
    display: flex;
    flex-direction: column;
    gap: 2.4rem;
    align-items: center;
}

    .result h2 {
        font-size: 3.4rem;
    }

    .result p {
        font-size: 2rem;
    }

    .flex{
        display:flex;
        justify-content:center;
       align-content:space-evenly;
    }

    .navi_box{
        display:flex;
        justify-content:center;
        align-content:center;
    }

    .box{
        width:40px;
        height:40px;
        border:2px solid  #e0e0e0;
        margin-right:10px;
        text-align:center;
        font-size:1.3rem;
          display:flex;
        justify-content:center;
        align-content:center;
    }


          </style>

     <div class="row m-3 mr-lg-5 ml-lg-5" >
            <div class="col-md-3 col-md-offset-2 mb-3 ">
                <h4>Attend the exam</h4>
            </div>
         <br><br>
         <div>
        </div>
         <hr><br><br>
      </div>
        <div class="flex">
         <div class="row m-3 mr-lg-5 ml-lg-5" >
            <div class="col-md-3 col-md-offset-2 mb-3 ">
                
      <div class="quiz-section">
      <div id="quiz">
        <h2 class="question" id="question">quiz Question</h2>
        <hr />
        <ul>
          <li>
          <asp:RadioButton ID="txtr1" runat="server"  GroupName="Answer"/>
          <label for="txtr1" id="option_1">Option 1</label>
          </li>
          <li>
              <asp:RadioButton ID="txtr2" runat="server"  GroupName="Answer"/>
            <label for="txtr2" id="option_2">Option 2</label>
          </li>
          <li>
              <asp:RadioButton ID="txtr3" runat="server"  GroupName="Answer"/>
            <label for="txtr3" id="option_3">Option 3</label>
          </li>
          <li>
              <asp:RadioButton ID="txtr4" runat="server" GroupName="Answer"/>
            <label for="txtr4" id="option_4">Option 4</label>
          </li>
        </ul>
        <div class="btn">
         <asp:Button ID="Button1" runat="server" Text="Next" CssClass="btn btn-primary " Height="49px" Width="122px"/>
          
        </div>
      </div>
    </div>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                    </div>
    </div>
            <div class="row m-3 mr-lg-5 ml-lg-5" >
                <div class="col-md-3 col-md-offset-2 mb-3 ">
                     <div class="navigation-sec1">
                         <br>
                         <div class="navi_box">
                                 <div class="box">1</div>
                                 <div class="box">2</div>
                                 <div class="box">3</div>
                                 <div class="box">4</div>
                                 <div class="box">5</div>
                                 <div class="box">7</div>
                                 <div class="box">8</div>
                                 <div class="box">9</div>
                         </div>
                         <br>
                         <div class="navi_box">
                                 <div class="box">10</div>
                                 <div class="box">11</div>
                                 <div class="box">12</div>
                                 <div class="box">13</div>
                                 <div class="box">14</div>
                                 <div class="box">15</div>
                                 <div class="box">16</div>
                                 <div class="box">17</div>
                         </div>
                         <br>
                           <div class="navi_box">
                                 <div class="box">18</div>
                                 <div class="box">19</div>
                                 <div class="box">20</div>
                                 <div class="box">21</div>
                                 <div class="box">22</div>
                                 <div class="box">23</div>
                                 <div class="box">24</div>
                                 <div class="box">25</div>
                         </div>
                         <br>
                         <div class="navi_box">
                             <asp:Button ID="Button2" runat="server" Text="Back" CssClass="btn btn-warning btn-sm"/>
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             <asp:Button ID="Button3" runat="server" Text="Next" CssClass="btn btn-success btn-sm"/>
                          </div>
                     </div>
                </div>
           </div>
    </div>
     
    </main>
 
</asp:Content>
