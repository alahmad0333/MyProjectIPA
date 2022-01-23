<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeAdmin.aspx.cs" Inherits="MyProjectIPA.EmployeAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


    <style type="text/css">
    <style>
        .display-6 {
    font-size: 14px;
}
        img {
            width:50px;
            height:50px
        }


        .auto-style1 {
            font-size: 14px;
            font-weight: 300;
            line-height: 1.2;
            text-align: center;
            width: 558px;
        }

.table table  tbody  tr  td a ,
.table table  tbody  tr  td  span {
position: relative;
float: left;
padding: 6px 12px;
margin-left: -1px;
line-height: 1.42857143;
color: #337ab7;
text-decoration: none;
background-color: #fff;
border: 1px solid #ddd;
}

.table table > tbody > tr > td > span {
z-index: 3;
color: #fff;
cursor: default;
background-color: #337ab7;
border-color: #337ab7;
}

.table table > tbody > tr > td:first-child > a,
.table table > tbody > tr > td:first-child > span {
margin-left: 0;
border-top-left-radius: 4px;
border-bottom-left-radius: 4px;
}

.table table > tbody > tr > td:last-child > a,
.table table > tbody > tr > td:last-child > span {
border-top-right-radius: 4px;
border-bottom-right-radius: 4px;
}

.table table > tbody > tr > td > a:hover,
.table   table > tbody > tr > td > span:hover,
.table table > tbody > tr > td > a:focus,
.table table > tbody > tr > td > span:focus {
z-index: 2;
color: #23527c;
background-color: #eee;
border-color: #ddd;
}

        body {
             font-family: 'Capriola', sans-serif;
        }

        .auto-style2 {
            width: 276px;
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

                    <div class="jumbotron" style="width:35%; margin: 0 auto;">


        <div class="text-center">
            <asp:DropDownList ID="DropDownList1" runat="server" Width="462px" AutoPostBack="True">
                <asp:ListItem Selected="True">Select</asp:ListItem>
                <asp:ListItem>Edit</asp:ListItem>
                <asp:ListItem>Add New Employee</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="text-center">
            <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-hover"  Visible = "False" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" Width="679px">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
            </asp:GridView>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Data %>" DeleteCommand="DELETE FROM [Employe] WHERE [id] = @original_id AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL)) AND (([Password] = @original_Password) OR ([Password] IS NULL AND @original_Password IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL))" InsertCommand="INSERT INTO [Employe] ([Name], [Password], [Email]) VALUES (@Name, @Password, @Email)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Employe]" UpdateCommand="UPDATE [Employe] SET [Name] = @Name, [Password] = @Password, [Email] = @Email WHERE [id] = @original_id AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL)) AND (([Password] = @original_Password) OR ([Password] IS NULL AND @original_Password IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Password" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Password" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>




                <div class="container" >
            <table class="auto-style1" id="Table" Visible = "false"  runat="server"  align="center">
                <tr>
                    <td class="auto-style2" style="border: 2px solid #C0C0C0">
                        <h1 class="auto-style3">Add New Employee</h1>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" style="border: 2px solid #C0C0C0">
                        <table runat="server" id="TableProduct"   align="center" class="auto-style12">
                            <tr>
                                <td>ID</td>
                                <td>
                                    <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td><strong>Name:</td>
                                <td>
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Password:</td>
                                <td>
                                    <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Email:</td>
                                <td>
                                    <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control"></asp:TextBox>
                                    </strong></td>
                            </tr>
                            <tr>
                                <td colspan="2" class="text-center">
                                    <asp:Button ID="Button4" runat="server" Text="Add" Width="126px" OnClick="Button4_Click" CssClass="btn btn-primary" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="text-center">
                                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                        </table>
                      
                    </td>
                </tr>
            </table>
        </div>

</div>


    </form>
</body>
</html>
