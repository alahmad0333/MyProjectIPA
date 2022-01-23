<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckPathAdmin.aspx.cs" Inherits="MyProjectIPA.CheckPathAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <style type="text/css">
        .auto-style1 {
            width: 1170px;
            text-align: center;
            margin-left: auto;
            margin-right: auto;
            padding-left: 15px;
            padding-right: 15px;
        }
        .auto-style2 {
            font-size: large;
        }

 .auto-style8 {
            padding: 9px 25px;
            background-color: rgba(0,136,169,1);
            border: none;
            border-radius: 50px;
            cursor: pointer;
            transition: all 0.3s ease 0s;
                position: relative;
                left: 1242%;
                }

        </style>
</head>
<body>
    <form id="form1" runat="server">



<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Admin</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" href="admin-addproudect.aspx">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="EditUserAdmin.aspx">User</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="AdminEditProduct.aspx">Product</a>
        </li>

                  <li class="nav-item">
          <a class="nav-link" href="EmployeAdmin.aspx">Employe</a>
        </li>

                              <li class="nav-item">
          <a class="nav-link" href="CheckPathAdmin.aspx">Check Path</a>
        </li>
                                        <li class="nav-item">
          <asp:Label ID="Label2"  CssClass="nav-link" runat="server" Text="Label"></asp:Label>
        </li>

             <li class="nav-item">
               <asp:Button ID="Butlong10" runat="server" Text="Login" CssClass="auto-style8" OnClick="Butlong10_Click"/>
            </li>
      </ul>
    </div>
  </div>
</nav>


        <div class="auto-style1">

        <hr />
            <h3 class="text-center">Admin Check Link And Path</h3>
            <div class="text-center">
                <br />
                        Url :<br />
            <asp:TextBox ID="TextBox1" runat="server" class="form-control" ></asp:TextBox> 
            <br />
            Path:<br />
            <asp:TextBox ID="TextBox2" runat="server" class="form-control" ></asp:TextBox> 
            <br />
            <br />
            <asp:Button ID="Button9" runat="server" Text="Check" class="btn btn-primary mb-2"  Height="32px" OnClick="Button10_Click" Width="342px" />
            <br />
                <strong>
            <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
                </strong>
            <br />
            </div>
        </div>





        
        <div class="auto-style1">

        <hr />
            <h3 class="text-center">Admin Check Link And Path</h3>
            <div class="text-center">
                <br />
                        Url :<br />
            <asp:TextBox ID="TextBox31" runat="server" class="form-control" ></asp:TextBox> 
            <br />
            Path:<br />
            <asp:TextBox ID="TextBox41" runat="server" class="form-control" ></asp:TextBox> 
            <br />
            <br />
            <asp:Button ID="Button11" runat="server" Text="Check" class="btn btn-primary mb-2"  Height="32px"  Width="342px" OnClick="Button11_Click" />
            <br />
                <strong>
            <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label>
                </strong>
            <br />
            </div>
        </div>
    </form>
</body>
</html>
