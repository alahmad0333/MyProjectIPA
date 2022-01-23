<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wishlist.aspx.cs" Inherits="MyProjectIPA.wishlist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous"/>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>




    <style>
         .auto-style8 {
   padding: 9px 25px;
   background-color: rgba(0,136,169,1);
   border: none;
   border-radius: 50px;
   cursor: pointer;
   transition: all 0.3s ease 0s;
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

        .jumbotron{
    width: 60%;
    margin: 0 auto;
    margin-top: 4%;
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
                                <a class="nav-link" href="WebForm1.aspx#DataList1">Proudct</a>
                            </li>



                            <li class="nav-item">
<%--                                <asp:ImageButton ID="ImageButton4" runat="server" Height="30px" ImageUrl="~/heart2.png" Width="40px" CausesValidation="false" OnClick="ImageButton4_Click1" />--%>
                                                                <a class="nav-link" runat="server" id="aw1" href="wishlist.aspx">Wishlist</a>

                                <span>
                                    <asp:Label ID="lblcart" runat="server" Text="0" ForeColor="White"></asp:Label>
                                </span>
                            </li>

                            <li class="nav-item">
                                <asp:LinkButton Visible="false" ID="but" class="nav-link" runat="server" CommandArgument='<%# Eval("Email") %>' CommandName="Email" OnClick="but_Click">LinkButton</asp:LinkButton>
                            </li>


                        </ul>
                        <asp:Button ID="Butlong10" runat="server" Text="Login" CssClass="auto-style8" OnClick="Butlong_Click1"/>
                    </div>
                </div>
            </nav>
                    <div class="jumbotron" style="width:57%; margin: 0 auto;   margin-top:10%;">


                        <h1 class="text-center">WishList</h1>

            <asp:GridView ID="GridView1" runat="server"  CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" class="table table-bordered table-condensed table-responsive table-hover " Width="1102px" EmptyDataText="Your WishList is Empty..!" Font-Bold="True" Height="150px" ShowFooter="True" OnRowDeleting="GridView1_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="ProductID" HeaderText="Proudct ID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:ImageField DataImageUrlField="ImgFile" HeaderText="IMG">
                        <ControlStyle Height="150px" Width="150px" />
                        <HeaderStyle Height="50px" Width="150px" />
                    </asp:ImageField>
                    <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0}$" />
                    <asp:BoundField DataField="Price2" HeaderText="Price2" DataFormatString="{0}$" />
                    <asp:BoundField DataField="Price3" HeaderText="Price3" DataFormatString="{0}$" />
                    <asp:TemplateField HeaderText="Price4">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Price4") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Price4", "{0}$") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField DeleteText="Remove" ShowDeleteButton="True" />
                </Columns>
                <FooterStyle HorizontalAlign="Center" />
                <HeaderStyle HorizontalAlign="Center" />
                <RowStyle HorizontalAlign="Center" />
            </asp:GridView>
</div>
    </form>
</body>
</html>
