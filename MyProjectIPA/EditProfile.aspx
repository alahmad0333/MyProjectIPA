<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="MyProjectIPA.EditProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title></title>

        <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link href="Fotter.css" rel="stylesheet" /> 
    <style>
        
        .d-flex2 {
            display: flex;
            MARGIN-LEFT: 27%;
            margin-top: 1%;
            margin-bottom: 2%;
        }

        #TextBox1 {
            width: 55%;
        }

        .auto-style8 {
            padding: 9px 25px;
            background-color: rgba(0,136,169,1);
            border: none;
            border-radius: 50px;
            cursor: pointer;
            transition: all 0.3s ease 0s;
        }


        .card {
            width: 430px;
            max-width: 430px;
            max-height: 349px;
            border-radius: 6.25rem;
        }



        body {
            background: #eee
        }

        img, #ImageButton4  {
            width: 233px;
            height: 191px;
        }

        h4 {
            font-size: 14px;
        }

        .hr-theme-slash-2 {
            display: flex;
        }

        .hr-line {
            width: 100%;
            position: relative;
            margin: 15px;
            border-bottom: 1px solid #000;
        }

        .hr-icon {
            position: relative;
            top: 3px;
        }

        img.d-block.w-100 {
            height: 661px;
        }



        i.material-icons {
            font-size: 35px;
        }


        /*        li.nav-item {
            padding-left: 168px;
        }*/

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
        table {
               margin-left: auto;
               margin-right: auto;
               margin-top:10%;
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
<%--                                <asp:ImageButton ID="ImageButton4" runat="server" Height="30px" ImageUrl="~/heart2.png" Width="40px" CausesValidation="false" OnClick="ImageButton4_Click1" />--%>
                                                                <a class="nav-link" runat="server" id="aw1" href="wishlist.aspx">Wishlist</a>

                                <span>
                                    <asp:Label ID="lblcart" runat="server" Text="0" ForeColor="White"></asp:Label>
                                </span>
                            </li>

                            <li class="nav-item">
                                <asp:Label CssClass="nav-link" Visible="false" ID="Label1" runat="server" Text="Label"></asp:Label>
                            </li>


                        </ul>
                        <asp:Button ID="Butlong10" runat="server" Text="Login" CssClass="auto-style8" OnClick="Butlong_Click1"/>
                    </div>
                </div>
            </nav>

            <div class="text-center">

                 <asp:GridView ID="GridView1" CssClass="table table-bordered"  runat="server" AutoGenerateColumns="False" ShowFooter="True" 
                ShowHeaderWhenEmpty="True"

                BackColor="White" BorderStyle="None" BorderWidth="1px" CellPadding="3" Height="150px" Width="794px" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
                
                <Columns>




            <asp:TemplateField HeaderText="Frist Name">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("FristName") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtfname" Text='<%# Eval("FristName") %>' runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>


                                <asp:TemplateField HeaderText="Last Name">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("LastName") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtlname" Text='<%# Eval("LastName") %>' runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>




                           <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Email") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEmail" Text='<%# Eval("Email") %>' runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>




                        <asp:TemplateField HeaderText="Password">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Password") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPass" Text='<%# Eval("Password") %>' runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>




                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ImageUrl="~/Images/edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px"/>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton ImageUrl="~/Images/save.png" runat="server" CommandName="Update" ToolTip="Update" Width="20px" Height="20px"/>
                            <asp:ImageButton ImageUrl="~/Images/cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px"/>
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            </div>

    </form>
</body>
</html>
