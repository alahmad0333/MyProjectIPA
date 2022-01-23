<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginAdmin.aspx.cs" Inherits="MyProjectIPA.LoginAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous"/>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <link href="StyleSheet1.css" rel="stylesheet" />

    <title></title>
    <style>
                .auto-style1 {
            text-align: center;
            font-size: xx-large;
        }

        p {
            color:black;
        }

        .div-link- account {

        }

        .plink {
            position: relative;
            top: 7px;
            display: inline-block;
            left: -141px;
        }

        .auto-style8 {
            padding: 9px 25px;
            background-color: rgba(0,136,169,1);
            border: none;
            border-radius: 50px;
            cursor: pointer;
            transition: all 0.3s ease 0s;

        }

        .auto-style9 {
            font-size: large;
        }

        .btn-primary {
            color: #fff;
            background-color: #0d6efd;
            border-color: #0d6efd;
            position: relative;
            right: -462px;
        }

        .auto-style10 {
            color: #dc3545;
            font-size: xx-large;
        }

        a.close {
    color: black;
    background-color: #f8d7da;
    text-decoration: none;
    font-size: 20px;
}

        .d-flex {
    display: flex!important;
    padding-top: 10%;
}

        span#lblcart {
    position: absolute;
    top: 1px;
    background: #ff0000;
    /* vertical-align: top; */
    padding: 0 5px;
    font-size: 9px;
    margin-left: 0px;
    border-radius: 62%;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">

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
                                <asp:Label CssClass="nav-link" Visible="false" ID="Label1" runat="server" Text="Label"></asp:Label>
                            </li>


                        </ul>
                        <asp:Button ID="Butlong10" runat="server" Text="Login" CssClass="auto-style8" OnClick="Butlong_Click1" />
                    </div>
                </div>
            </nav>


                               <section class="vh-100">
            <div class="container-fluid h-custom">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-md-9 col-lg-6 col-xl-5">
                        <img src="imgs/draw2.png" class="img-fluid"
                            alt="Sample image"/>
                    </div>
                    <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1" style="color: #000000">
                        <div class="auto-style1">Login Admin</div>
                        <div class="text-center">
                            <asp:Label ID="Label3" runat="server" Text="Label" Visible="false" CssClass="auto-style10"></asp:Label>
                        </div>

                        <!-- Email input -->
                        <div class="form-outline mb-4">
                            <asp:Label ID="Label2" CssClass="form-label" Style="color: black" runat="server" Text="Email address"></asp:Label>
                            <asp:TextBox ID="emaillong1" placeholder="Enter your email address" CssClass="form-control form-control-lg" runat="server"></asp:TextBox>
                        </div>

                        <!-- Password input -->
                        <div class="form-outline mb-3">
                            <asp:Label ID="Label4" Style="color: black" CssClass="form-label" runat="server" Text="Password"></asp:Label>

                            <asp:TextBox ID="passlogn1" placeholder="Enter your password" CssClass="form-control form-control-lg" runat="server"></asp:TextBox>

                        </div>

                        <div class="text-center text-lg-start mt-4 pt-2">
                            <asp:Button ID="Buttonlogin" CssClass="btn btn-primary btn-lg"
                                Style="padding-left: 2.5rem; padding-right: 2.5rem;" runat="server" Text="Login" OnClick="Buttonlogin_Click" />


                            <p class="small fw-bold mt-2 pt-1 mb-0">&nbsp;</p>


                        </div>

                    </div>
                </div>
            </div>

        </section>
    </form>
</body>
</html>

