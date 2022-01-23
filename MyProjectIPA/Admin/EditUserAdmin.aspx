<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditUserAdmin.aspx.cs" Inherits="MyProjectIPA.EditUserAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"/>
    <style>
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






        <div class="container">
            <div class="jumbotron text-center">
            <asp:GridView ID="GridView1" Cssclass="table" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Email" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="FristName" HeaderText="FristName" SortExpression="FristName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                    <asp:BoundField DataField="Email" HeaderText="Email" ReadOnly="True" SortExpression="Email" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                    <asp:CommandField InsertImageUrl="~/heart.png" ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Data %>" DeleteCommand="DELETE FROM [Customer] WHERE [Email] = @original_Email AND (([FristName] = @original_FristName) OR ([FristName] IS NULL AND @original_FristName IS NULL)) AND (([LastName] = @original_LastName) OR ([LastName] IS NULL AND @original_LastName IS NULL)) AND (([Phone] = @original_Phone) OR ([Phone] IS NULL AND @original_Phone IS NULL)) AND (([Password] = @original_Password) OR ([Password] IS NULL AND @original_Password IS NULL))" InsertCommand="INSERT INTO [Customer] ([FristName], [LastName], [Email], [Phone], [Password]) VALUES (@FristName, @LastName, @Email, @Phone, @Password)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Customer]" UpdateCommand="UPDATE [Customer] SET [FristName] = @FristName, [LastName] = @LastName, [Phone] = @Phone, [Password] = @Password WHERE [Email] = @original_Email AND (([FristName] = @original_FristName) OR ([FristName] IS NULL AND @original_FristName IS NULL)) AND (([LastName] = @original_LastName) OR ([LastName] IS NULL AND @original_LastName IS NULL)) AND (([Phone] = @original_Phone) OR ([Phone] IS NULL AND @original_Phone IS NULL)) AND (([Password] = @original_Password) OR ([Password] IS NULL AND @original_Password IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_Email" Type="String" />
                        <asp:Parameter Name="original_FristName" Type="String" />
                        <asp:Parameter Name="original_LastName" Type="String" />
                        <asp:Parameter Name="original_Phone" Type="String" />
                        <asp:Parameter Name="original_Password" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="FristName" Type="String" />
                        <asp:Parameter Name="LastName" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="Phone" Type="String" />
                        <asp:Parameter Name="Password" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="FristName" Type="String" />
                        <asp:Parameter Name="LastName" Type="String" />
                        <asp:Parameter Name="Phone" Type="String" />
                        <asp:Parameter Name="Password" Type="String" />
                        <asp:Parameter Name="original_Email" Type="String" />
                        <asp:Parameter Name="original_FristName" Type="String" />
                        <asp:Parameter Name="original_LastName" Type="String" />
                        <asp:Parameter Name="original_Phone" Type="String" />
                        <asp:Parameter Name="original_Password" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                </div>
            </div>
    </form>
</body>
</html>
