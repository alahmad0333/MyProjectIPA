<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="MyProjectIPA.WebForm1"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>--%>

    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link href="Fotter.css" rel="stylesheet" />

    <style>
        .auto-style1 {
            padding-left: 15%;
        }

        .auto-style3 {
            font-size: small;
            margin-right: 42px;
        }

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


        .auto-style9 {
            width: 100%;
            position: relative;
            margin: 15px;
            border-bottom: 1px solid #000;
            left: 0px;
            top: 0px;
        }

        .auto-style10 {
            font-size: large;
        }

        .auto-style11 {
            width: 100%;
            height: 122px;
        }

        .auto-style12 {
            width: 225px;
        }

        .auto-style13 {
            width: 202px;
        }

        .auto-style14 {
            width: 205px;
        }

        .auto-style15 {
            width: 195px;
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
        </style>
</head>
<body>
    <form id="form1" runat="server" class="auto-style10">
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
<%--                                <asp:ImageButton ID="ImageButton4" runat="server" Height="30px" ImageUrl="~/heart2.png" Width="40px" CausesValidation="false" OnClick="ImageButton4_Click1" />--%>
                                                                <a class="nav-link" runat="server" id="aw1" href="wishlist.aspx">Wishlist</a>

                                <span>
                                    <asp:Label ID="lblcart" runat="server" Text="0" ForeColor="White"></asp:Label>
                                </span>
                            </li>

                            <li class="nav-item">
                                <asp:LinkButton Visible="false" ID="Label1" class="nav-link" runat="server" CommandArgument='<%# Eval("Email") %>' CommandName="Email" OnClick="Label1_Click">LinkButton</asp:LinkButton>
                            </li>


                        </ul>
                        <asp:Button ID="Butlong10" runat="server" Text="Login" CssClass="auto-style8" OnClick="Butlong_Click1"/>
                    </div>
                </div>
            </nav>









            <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="imgStore/iPhone 13 Pro Max_ (1903 x 661 px) (1).png" class="d-block w-100" alt="..." />
                    </div>
                    <div class="carousel-item">
                        <img src="imgs/Newegg.png" class="d-block w-100" alt="..." />
                    </div>
                    <div class="carousel-item">
                        <img src="imgs/ebay.png" class="d-block w-100" alt="..." />
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>







            <div class="d-flex2">
                <asp:TextBox ID="TextBox1" CssClass="form-control me-2" placeholder="Search" runat="server"></asp:TextBox>
<%--                <asp:Button ID="Button2e" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="Button99_Click" />--%>
                <button type="button" class="btn btn-primary"  id="Button2" onclick="Search()" > Search</button>
            </div>


            <div class="hr-theme-slash-2">
                <div class="auto-style9"></div>
                <div class="hr-icon"><i class="material-icons">Category</i></div>
                <div class="hr-line"></div>
                </div>

            <div class="text-center">


                <table class="auto-style11">
                    <tr>
                        <td class="auto-style12"><strong>PC</strong><br />
                            <asp:ImageButton ID="ImageButton1" runat="server" Height="141px" ImageUrl="~/imgStore/pc.png" Width="207px" OnClick="ImageButton1_Click1" />
                        </td>
                        <td class="auto-style13" ><strong>Video Game</strong><br />
                            <asp:ImageButton ID="ImageButton2" runat="server" Height="97px" ImageUrl="~/imgStore/game-control.png" Width="207px" OnClick="ImageButton2_Click" />
                        </td>
                        <td class="auto-style14" ><strong>TV</strong><br />
                            <asp:ImageButton ID="ImageButton3" runat="server" Height="97px" ImageUrl="~/imgStore/tv.png" Width="207px" OnClick="ImageButton3_Click" />
                        </td>
                        <td class="auto-style15" ><strong>Mobile</strong><br />
                            <asp:ImageButton ID="ImageButton5" runat="server" Height="97px" ImageUrl="~/imgStore/smartphone.png" Width="207px" OnClick="ImageButton5_Click" />
                        </td>
                    </tr>
                </table>


            </div>

            <div class="hr-theme-slash-2">
                <div class="auto-style9"></div>
                <div class="hr-icon"><i class="material-icons">Proudct</i></div>
                <div class="hr-line"></div>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Data %>" SelectCommand="SELECT * FROM [Product] WHERE ([CategoryID] = @CategoryID)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="CategoryID" QueryStringField="cat" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>


            <div class="auto-style1">

                <asp:DataList ID="DataList1" runat="server" DataKeyField="ProductID" DataSourceID="SqlDataSource2" RepeatColumns="3" RepeatDirection="Horizontal" CssClass="auto-style3" Width="231px" Height="291px" OnItemCommand="DataList1_ItemCommand" OnItemDataBound="DataList1_ItemDataBound">
                    <ItemTemplate>





                        <div class="d-flex justify-content-center container mt-5">
                            <div class="card p-3 bg-white">
                                <i class="fa fa-apple"></i>
                                <div class="about-product text-center mt-2">
                                    <asp:ImageButton ID="ImageButton4" CommandArgument='<%# Eval("ProductID") %>' CommandName="View" runat="server" ImageUrl='<%# Eval("ImgFile") %>' Height="191px" Width="233px" />
                                    <div>
                                        <h4><%# Eval("Name") %></h4>
                                        <asp:ImageButton ID="imgwishlist" CommandArgument='<%# Eval("ProductID")%>' runat="server" Height="30px"  ImageUrl="~/icon Store/heart.png" Width="28px" CommandName="AddtoWish"  />
                                         <asp:ImageButton ID="ImageButton6" CommandArgument='<%# Eval("ProductID")%>' Visible="false" runat="server" Height="30px"  ImageUrl="~/icon Store/heart2.png" Width="28px" CommandName="Reomve"  />

                                        <br />
                                        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>

                                    </div>

                                </div>
                                <div class="text-center">
                                    <asp:Button ID="Button3" CssClass="btn btn-outline-primary" runat="server" Text="Looking Best Price" Width="227px" CommandArgument='<%# Eval("ProductID")%>' CommandName="View" />
                                    &nbsp;<asp:Label ID="lpid" Visible="false" runat="server" Text='<%# Eval("ProductID") %>'></asp:Label>
                                </div>
                            </div>
                        </div>

                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Data %>" SelectCommand="SELECT * FROM [Product] WHERE ([Name] LIKE '%' + @Name + '%')">
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="[a-zA-Z]" Name="Name" QueryStringField="Search" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>

        </div>

        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Data %>" SelectCommand="SELECT * FROM [Categories] WHERE ([CategoryID] LIKE '%' + @CategoryID + '%')">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="CategoryID" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <script>

            function Search()
            {
                window.location = "WebForm1.aspx?Search=" + document.getElementById("TextBox1").value;
            }

        </script>

    <footer class="footer">
<div class="l-footer">
<h1>Best Price</h1>
<p>
    Best Price is your one-stop price comparison site in the Middle East where you will find thousands of products from hundreds of online shops, all in one place. On Best Price you can search for products in a wide variety of categories including but not limited to electronics, home appliances, apparel and many more, and compare prices to find the best deal available in the market and save money. You can also be sure that you&#39;re buying at the right time with our price trends feature which allows you to set price alerts for the products that you&#39;re interested in, saving you even more money.</p>
</div>
<ul class="r-footer">
<li>
  <h2>
Social</h2>
<ul class="box">
<li><a href="#">Facebook</a></li>
<li><a href="#">Twitter</a></li>
<li><a href="#">Pinterest</a></li>
<li><a href="#">Dribbble</a></li>
</ul>
</li>
<li class="features">
  <h2>
Information</h2>
<ul class="box h-box">
<li><a href="#">Blog</a></li>
<li><a href="#">Pricing</a></li>
<li><a href="#">Sales</a></li>
<li><a href="#">Tickets</a></li>
<li><a href="#">Certifications</a></li>
<li><a href="#">Customer Service</a></li>
</ul>
</li>
<li>
  <h2>
Legal</h2>
<ul class="box">
<li><a href="#">Privacy Policy</a></li>
<li><a href="#">Terms of Use</a></li>
<li><a href="#">Contract</a></li>
</ul>
</li>
</ul>
<div class="b-footer">
<p>
All rights reserved by ©Best Price 2021 </p>
</div>
</footer>

    </form>
</body>
</html>
