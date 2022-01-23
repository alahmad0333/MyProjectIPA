<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SingUp.aspx.cs" Inherits="MyProjectIPA.SingUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <link href="StyleSheet1.css" rel="stylesheet" />
    <title></title>
    <style>
                .auto-style1 {
            text-align: center;
            font-size: xx-large;
        }


        .blogin {
    position: relative;
    right: 320px;
}

        .div-link- account {
            position:relative;
            top:-10px;
               
        }
        .plink {
position: relative;
    top: 7px;
    display: inline-block;
    left: -141px;
}
        
        .auto-style5 {
            font-weight: bold;
        }

        .btn-lg {
    padding: .5rem 1rem;
    font-size: 1.25rem;
    border-radius: .3rem;
    position: relative;
    left: 419px;
}
        .auto-style6 {
            font-size: large;
        }
        .btn-primary {
    color: #fff;
    background-color: rgba(0,136,169,1);
    border-color: rgba(0,136,169,1);
}
        
        #ValidationSummary1 {
            color:red;
        }

        .checkbox1 {
    position: relative;
    top: -104px;
    right: -15px;
    display: inline-block;
}

        .auto-style9 {
            position: relative;
            top: -104px;
            right: -15px;
            display: inline-block;
            font-size: large;


        }

        .form-check-label {
    position: relative;
    top: -105px;
    right: -16px;
}
                .auto-style8 {
            padding: 9px 25px;
            background-color: rgba(0,136,169,1);
            border: none;
            border-radius: 50px;
            cursor: pointer;
            transition: all 0.3s ease 0s;

        }

 .d-flex {
    display: flex!important;
    padding-top: 10%;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
                       

    <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
                <div class="container-fluid">
                    <a class="navbar-brand" href="WebForm1.aspx">Best Price</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="mynavbar">
                        <ul class="navbar-nav me-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="WebForm1.aspx">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#DataList1">Proudct</a>
                            </li>


                            <li class="nav-item">
                                <a class="nav-link" href="LoginAdmin.aspx">Admin Page</a>
                            </li>

                               <li class="nav-item">
                                <a class="nav-link" href="LoginEmploye.aspx">Employe Page</a>
                            </li>

                            <li class="nav-item">
                                <asp:Label CssClass="nav-link" Visible="false" ID="Label9" runat="server" Text="Label"></asp:Label>
                            </li>


                        </ul>
                        <asp:Button ID="Butlong10" runat="server" Text="Login" CssClass="auto-style8" OnClick="Butlong_Click1" />
                    </div>
                </div>
            </nav>

        </div>














                   <section class="vh-100">
  <div class="container-fluid h-custom">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-md-9 col-lg-6 col-xl-5">
               <img src="imgs/draw2.png" class="img-fluid"
                class="img-fluid"
          alt="Sample image">
      </div>
      <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
    

              <asp:ValidationSummary ID="ValidationSummary1" CssClass="lival"  runat="server" BorderColor="Red" ForeColor="Red" />

         
                <div class="auto-style1"><span style="color:black">Sign U<span class="auto-style5">p</span></div>
          <div class="text-center">

                  <asp:Label ID="Label7" Cssclass="auto-style8" runat="server" Text="" Visible="false" ></asp:Label>
              <span id="demo"></span>

          </div>

  

               



          <div class="form-outline mb-4">
                            <asp:Label ID="Label1"  Cssclass="form-label" style="color:black" runat="server" Text="Frist Name"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Enter Your Frist Name  " ForeColor="Red">*</asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter only Character in Frist Name "  ForeColor="Red" ControlToValidate="TextBox1" ValidationExpression="^[a-zA-Z]*$" >*</asp:RegularExpressionValidator>
              <asp:TextBox ID="TextBox1"  placeholder="Enter Frist Name" Cssclass="form-control form-control-lg" runat="server" MaxLength="25"></asp:TextBox>
          </div>

               <div class="form-outline mb-4">
                            <asp:Label ID="Label3"  Cssclass="form-label" style="color:black" runat="server" Text="Last Name"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Enter Your Last Name "  ForeColor="Red">*</asp:RequiredFieldValidator>
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Enter only Character in Last Name "  ForeColor="Red" ControlToValidate="TextBox2" ValidationExpression="^[a-zA-Z]*$" >*</asp:RegularExpressionValidator>

              <asp:TextBox ID="TextBox2"  placeholder="Enter Last Name" Cssclass="form-control form-control-lg" runat="server" MaxLength="25"></asp:TextBox>
          </div>
           <div class="form-outline mb-4">
                            <asp:Label ID="Label5"  Cssclass="form-label" style="color:black" runat="server" Text="Email"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Enter Your Email"  ForeColor="Red">*</asp:RequiredFieldValidator>
                                                               <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Enter Correct Email"  ForeColor="Red" ControlToValidate="TextBox3" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" >*</asp:RegularExpressionValidator>

              <asp:TextBox ID="TextBox3"  placeholder="Enter your Email" Cssclass="form-control form-control-lg" runat="server" MaxLength="25" TextMode="Email"></asp:TextBox>

          </div>

          <div class="form-outline mb-3">
                                          <asp:Label ID="Label2" style="color:black" Cssclass="form-label" runat="server" Text="Password"></asp:Label>


                                          

              <asp:TextBox ID="TextBox5" placeholder="Enter your password" Cssclass="form-control form-control-lg"  runat="server" MaxLength="8" onkeyup="javascript:Valideate()" TextMode="Password"></asp:TextBox>

          </div>
               <div class="form-outline mb-4">
                            <asp:Label ID="Label4"  Cssclass="form-label" style="color:black" runat="server" Text="Re-Password"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox6" ErrorMessage="Enter Your Re-Password"  ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox5" ControlToValidate="TextBox6" ErrorMessage="Password does not match" ForeColor="Red">*</asp:CompareValidator>
              <asp:TextBox ID="TextBox6"  placeholder="Enter Re-password" Cssclass="form-control form-control-lg" runat="server" MaxLength="15" TextMode="Password"></asp:TextBox>
          </div>

          <div class="text-center text-lg-start mt-4 pt-2">
              <asp:Button ID="Button1" Cssclass="btn btn-primary btn-lg" 
                  style="padding-left: 2.5rem; padding-right: 2.5rem;" runat="server" Text="Sign Up" OnClick="Button1_Click" />
  <p class="plink" style="color:black"><span class="auto-style6">Do have an account? </span> <a href="Login.aspx"
                class="link-danger"><span class="auto-style6">Login</span></a></p>
              <p class="small fw-bold mt-2 pt-1 mb-0">
                  &nbsp;</p>
             
           
          </div>

          <div>

              <asp:CheckBox ID="CheckBox1" CssClass="auto-style9" runat="server" ForeColor="black" style="color:black;" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" />
              <asp:Label ID="Label8" Cssclass="form-check-label" runat="server" Text="Show Password" ForeColor="White"></asp:Label>
          </div>

      </div>
    </div>
  </div>
    
</section>

        <script type="text/javascript" >
            function Valideate() {
                var str = document.getElementById('<%=TextBox5.ClientID%>').value;
                var but = document.getElementById('<%=Button1.ClientID%>');
                if (str.length < 8) {
                    document.getElementById("demo").innerHTML = "Password Length Must Be 8 Char";
                    document.getElementById("demo").style.color = "Red";
                    but.style.display="none";
                    return ("Too Short");
                } else if (str.search(/[0-9]/) == -1) {
                    document.getElementById("demo").innerHTML = "Must Be Atleast 1 Number";
                    document.getElementById("demo").style.color = "Red";
                    but.style.display = "none";
                    return ("No Number");
                } else if (str.search(/[a-z]/) == -1) {
                    document.getElementById("demo").innerHTML = "Must Be Atleast 1 Small Letter";
                    document.getElementById("demo").style.color = "Red";
                    but.style.display = "none";
                    return ("No Letter");
                } else if (str.search(/[A-Z]/) == -1) {
                    document.getElementById("demo").innerHTML = "Must Be Atleast 1 Upper Letter";
                    document.getElementById("demo").style.color = "Red";
                    but.style.display = "none";
                    return ("No Upper");
                } else if (str.search(/[!\@\#\^\&\(\)\_\+\.\,\;\:\$\%]/) == -1) {
                    document.getElementById("demo").innerHTML = "Must Be Atleast 1 Special char - Not Allow (~,`,*)";
                    document.getElementById("demo").style.color = "Red";
                    return ("No Special");
                    but.style.display = "none";
                }
                document.getElementById("demo").innerHTML = "Strong Password";
                document.getElementById("demo").style.color = "Green";
                but.style.display = "";

                return ("OK");
                
            }



            


        </script>


    </form>
</body>
</html>
