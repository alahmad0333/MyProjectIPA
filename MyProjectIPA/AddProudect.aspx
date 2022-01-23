<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProudect.aspx.cs"  ValidateRequest="false" Inherits="MyProjectIPA.Employe.AddProudect" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


    <style type="text/css">
        .auto-style13 {
            height: 32px;
            text-align: center;
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
    <form id="form1" runat="server" >



<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Employe</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="AddProudect.aspx">Add Product</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="EditProudect.aspx">Edit Product</a>
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




        <div class="container mt-3">
                        <table runat="server" id="TableProduct" class="table table-bordered"  align="center" >
                            <tr>
                                <td colspan="2" class="text-center"><strong style="font-size:30px" >Page Employee </strong></td>
                            </tr>
                            <tr>
                                <td class="text-center">Proudect ID</td>
                                <td class="text-center">
                                    <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-center"><strong>Name:</td>
                                <td class="text-center">
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-center">Category:</td>
                                <td class="text-center">
                                    <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="CategoryID" DataValueField="CategoryID">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style13">Image:</td>
                                <td class="auto-style13">
                                    <asp:FileUpload ID="FileUpload1" CssClass="input-group"  runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td class="text-center">Link Amazone:</td>
                                <td class="text-center">
                                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-center">Link Ebay:</td>
                                <td class="text-center">
                                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-center">Link Newegg:</td>
                                <td class="text-center">
                                    <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-center">Link Noon:</td>
                                <td class="text-center">
                                    <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                            </tr>


                             <tr>
                                <td>Review:</td>
                                <td>
                                    <asp:TextBox ID="TextBox9" runat="server" CssClass="form-control" Height="249px" TextMode="MultiLine" Width="333px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>rating:</td>
                                <td>
                                    <asp:TextBox ID="TextBox10" CssClass="form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td colspan="2" class="text-center">
                                    <asp:Button ID="Button4" runat="server" CssClass="btn btn-outline-primary" Text="Add" Width="126px" OnClick="Button4_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="text-center">
                                    &nbsp;</td>
                            </tr>
                        </table>
        </div>
    </form>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Data %>" SelectCommand="SELECT * FROM [Categories]"></asp:SqlDataSource>

</body>
</html>
