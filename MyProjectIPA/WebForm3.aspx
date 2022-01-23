<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="MyProjectIPA.WebForm3" %>
<%@ Register
    Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="ajaxToolkit"%> 

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                    <script src="bootstrap.js"></script>
    <script src="bootstrap.min.js"></script>
        <link href="StyleSheet4.css" rel="stylesheet" />


    <link href="../Content/bootstrap.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>


    <title></title>
            <style type="text/css">

        .auto-style8 {
            padding: 9px 25px;
            background-color: rgba(0,136,169,1);
            border: none;
            border-radius: 50px;
            cursor: pointer;
            transition: all 0.3s ease 0s;
            width:89px;
        }

 .col2 {
    position: absolute;
    bottom: 13%;
    left: 35%;
    width: 23%;
}


       #Name,#Price3,#Price1,#Price2,#imgf,#Linkam,#Price4 ,#linknoon ,#linknewegg,#linkebay,#Reating {
            display:none;
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
.cooment {
    padding-left: 24%;
    margin-top:15%;
   margin-right: -61%;
    margin-left: 45%;
}



        .auto-style1 {
            width: 179px;
            height: 91px;
        }
        .auto-style2 {
            width: 100%;
            height: 319px;
        }
        .auto-style3 {
            width: 179px;
            height: 38px;
        }
        

        .modalBackground
        {
            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }
        .modalPopup
        {
            background-color: #fff;
            border: 3px solid #ccc;
            padding: 10px;
            width: 300px;
        }
        .auto-style4 {
            background-color: #fff;
            border: 3px solid #ccc;
            padding: 10px;
        }
        .auto-style5 {
            height: 91px;
        }

         #enlarged {
    height: 55%;
    width: 75%; 
    margin-top: 15%;
}
     

            </style>


</head>
<body onload="setProducts(); setBestPrice();" >
    <form id="form1" runat="server">

        <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
                <div class="container-fluid">
                    <a class="navbar-brand" href="WebForm1.aspx">Best Pricee</a>
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

                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


        <asp:DataList ID="DataList1" runat="server" DataKeyField="ProductID" DataSourceID="SqlDataSource1" RepeatColumns="1" RepeatDirection="Horizontal" CssClass="auto-style22" style="left: 4%; bottom: -2147483648%; width: 1048px; height: 449px" OnItemDataBound="DataList1_ItemDataBound" OnItemCommand="DataList1_ItemCommand">
            <ItemTemplate>



                             <div class="col1">
        <img class="large_display" id="enlarged" src=' <%# Eval("ImgFile") %>'/>
        <div class="pics">
        </div>
    </div>
    <div class="col2">
        <h4><%# Eval("Name") %></h4>
         <div class="rating">
                <span>Rating:</span>
                 <i id="1"  class="bi bi-star"></i> 
                 <i id="2" class="bi bi-star"></i>
                 <i id="3" class="bi bi-star"></i> 
                 <i id="4" class="bi bi-star"></i>
                 <i id="5" class="bi bi-star"></i>

            </div>



        <div class="Classalert">
            <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Set Price Alert" />



        <asp:ImageButton ID="ImageButton2" Visible="false" ImageUrl="~/Bellimg/bellE.png" runat="server" Width="33px" CommandArgument='<%# Eval("ProductID") %>' CommandName="Cancel Alert"  />

              <asp:Panel CssClass="auto-style4" ID="Panel1" runat="server" Width="501px">
            <table class="auto-style2" align="center">
                <tr>
                    <td class="text-center" colspan="2">We&#39ll send you an email when the price drops below your specified price.</td>
                </tr>
                <tr>
                    <td class="auto-style1">When price drops below:</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="TextBox1" runat="server" Width="197px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Current price is:</td>
                    <td class="auto-style3">
                        <asp:Label Cssclass="price"  ID="Label1" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="text-center" colspan="2">
                        <asp:Button ID="butSEnd" Cssclass="btn btn-warning" CommandArgument='<%# Eval("ProductID") %>' CommandName="Send Alert" runat="server" Text="Send" />
                                    <asp:Button ID="Button2" Cssclass="btn btn-danger" runat="server" Text="Cancel" />

                    </td>
                </tr>
            </table>


        </asp:Panel>

        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" TargetControlID="Button1" PopupControlID="Panel1" CancelControlID="Button2"   runat="server" BackgroundCssClass="modalBackground"></ajaxToolkit:ModalPopupExtender>

                <asp:Label ID="Staa" Visible="false" runat="server"  Text='<%# Eval("ProductID") %>'></asp:Label>
        </div>


        <div class="best-price-container">
            <div class="best-price-note">
                <p><i>&#10003</i><span class="green">Best price<span> from (<span class="shops-count">5</span>) online shops</p>
                <p id="best-price">0</p>    
            </div>
            <div class="go-to-shop">
                <img class="store" id="best-shop-img" src="#" alt="store"/>
                <button><a id="best-shop-btn" target="_blank"  href="#">Go To Shop &#8250 </a></button>
            </div>    
        </div>
        <div class="online-shops-count">Online Shops (<span class="shops-count">5</span>)</div>

        <div id="products">  
        </div>

                <div style="width: 210%; position: absolute;">
            <div >
                <h3>Review For <%# Eval("Name") %> </h3>



                <div> <%# Eval("Review") %> </div>



             





        <input id="Name"  value='<%# Eval("Name") %>' type="text" />


       <input id="Linkam" value='<%# Eval("linkamazon") %>' type="text" />
       <input id="linkebay" value='<%# Eval("linkebay") %>' type="text" />  
       <input id="linknewegg" value='<%# Eval("linknewegg") %>' type="text" />
       <input id="linknoon" value='<%# Eval("linknoon") %>' type="text" />



       <input id="imgf"  value='<%# Eval("ImgFile") %>' type="text" />
      <input id="Price1"  value='<%# Eval("Price") %>' type="text" />
      <input id="Price2"  value='<%# Eval("Price2") %>' type="text" />   
      <input id="Price3"  value='<%# Eval("Price3") %>' type="text" />
      <input id="Price4"  value='<%# Eval("Price4") %>' type="text" />

       <input id="Reating"  value='<%# Eval("rating") %>' type="text" />





           <script>
               var Reating = document.getElementById("Reating").value;

               for (var i = 1; i <= Reating ; i++) {
                   var elements = document.getElementById(i.toString());
                   elements.className = "bi bi-star-fill";
               }







               var name = document.getElementById("Name").value;
               var linamazon = document.getElementById("Linkam").value;
               var linkebay = document.getElementById("linkebay").value;
               var linknewegg = document.getElementById("linknewegg").value;
               var linknoon = document.getElementById("linknoon").value;
               var imgf = document.getElementById("imgf").value;
               var price = document.getElementById("Price1").value;
               var price2 = document.getElementById("Price2").value;
               var price3 = document.getElementById("Price3").value;
               var price4 = document.getElementById("Price4").value;



               var number = Number(price.replace(/[^0-9.-]+/g, ""));
               var toprice1 = document.getElementById("Price1").value = number.toFixed(2);




               var number2 = Number(price2.replace(/[^0-9.-]+/g, ""));
               var toprice2 = document.getElementById("Price2").value = number2.toFixed(2);



               var number3 = Number(price3.replace(/[^0-9.-]+/g, ""));
               var toprice3 = document.getElementById("Price3").value = number3.toFixed(2);


               var number4 = Number(price3.replace(/[^0-9.-]+/g, ""));
               var toprice4 = document.getElementById("Price4").value = number4.toFixed(2);


                   //var tofolt = document.getElementById("Price"+[i]).value;
                   //var t = Number(tofolt.replace(/[^0-9.-]+/g, ""));
                   // t.toFixed(2);
                   //var  = document.getElementById("Price").value = t.toFixed(2);

             

               //for (i = 0; i < 3; i++)
               //{
               //    var tofolt = document.getElementById("Price"+[i]).value;
               //    var t = Number(tofolt.replace(/[^0-9.-]+/g, ""));
               //     t.toFixed(2);
               //    products[i].price = document.getElementById("Price"+[i]).value = t.toFixed(2);
               //}


               var products = [
                   {
                       specs: name,
                       shopLink: linamazon,
                       shopLogoUrl: "icon Store/Amazon22.png",
                       price: toprice1,
                       priceUpdate: "Amazon.com",
                       storeName: "Amazon"
                   },
                   {
                       specs: name,
                       shopLink: linknewegg,
                       shopLogoUrl: "icon Store/NewEgg.png",
                       price: toprice2,
                       priceUpdate: "NewEgg.com",
                       storeName: "NewEgg"
                   },
                   {
                       specs: name,
                       shopLink: linknoon,
                       shopLogoUrl: "icon Store/noon-logo2.png",
                       price: price4,
                       priceUpdate: "Noon.com",
                       storeName: "Noon"
                   },
                   {
                       specs: name,
                       shopLink: linkebay,
                       shopLogoUrl: "icon Store/ebay33.png",
                       price: toprice4,
                       priceUpdate: "Ebay.com",
                       storeName: "Ebay"
                   },



               ];






               function setBestPrice() {
                   var min_price = parseFloat(products[0].price)
                   var bp_id = 0;
                   products.forEach((p, i) => {
                       if (parseFloat(p.price) < min_price) {
                           min_price = parseFloat(p.price)
                           bp_id = i
                       }
                   })

                   document.getElementById("best-price").innerHTML = "USD " + min_price.toLocaleString()
                   document.getElementById("best-shop-btn").setAttribute("href", products[bp_id].shopLink);
                   document.getElementById("best-shop-btn").innerHTML = `Go to ${products[bp_id].storeName} &#8250`
                   document.getElementById("best-shop-img").src = `${products[bp_id].shopLogoUrl}`
               }





               function getProduct(shopLogoUrl, specs, price, shopLink, priceUpdate) {
                   return `<div class="product">
                <div class="product-col1">
                    <div class="description">${specs} | <span id="price-update">Price updated ${priceUpdate}</span></div>
                    <img class="store" src="${shopLogoUrl}" alt="store-image" />
                </div>
                <div class="product-col2">
                    <div class="price"><span id="currency">USD <span id="price" runat="server"  >${parseFloat(price).toLocaleString()}</span></div>
                    <button><a target="_blank" href="${shopLink}">Go To Shop &#8250 </a></button>
                </div>
                </div>`
               }



               function setProducts() {
                   var products_html = ""

                   for (var product of products) {
                       products_html += getProduct(product.shopLogoUrl, product.specs, product.price, product.shopLink, product.priceUpdate)
                   }
                   document.getElementById('products').innerHTML = products_html

                   for (var el of document.getElementsByClassName("shops-count")) {
                       el.innerHTML = products.length
                   };
               }






               for (i = 0; i < products.length; i++) {

                   if (products[i].price == 0) {
                       products.splice(i, 1)
                       i -= 1;
                   }

               }



           </script>

            </ItemTemplate>


            </asp:DataList>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Data %>" SelectCommand="SELECT * FROM [Product] WHERE ([ProductID] = @ProductID)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="ProductID" QueryStringField="id" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>



                                     <div id="products">

        
                               <div class="jumbotron" style="width: 50%; ">

        <div class="cooment" >
         <p>comments:</p>
            <div class="new-comment comment">
                <p style="font-weight: 600;"><%# Eval("Name") %> </p>
                 <asp:TextBox  class="form-control" ID="textcom" placeholder="write a comment..." rows="4" Columns="50"  runat="server" TextMode="MultiLine"></asp:TextBox>

                <br/>
                    <asp:Button ID="btnTest" OnClick="btnTest_Click" class="btn btn-info pull-right"  runat="server" Text="Post" />
            </div>
                    





            <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2">
                <ItemTemplate>
  <div class="container">

                    <ul class="media-list">
                        <li class="media">
                            <div class="media-body">
                                <span class="text-muted pull-right">
                                    <small class="text-muted"><asp:Label ID="Label2" runat="server" Text='<%# Eval("Date") %>'></asp:Label></small>
                                </span>
                                <strong class="text-success">@<%# Eval("Name") %></strong><p>
                                        <%# Eval("comment") %>
                                </p>
                            </div>
                        </li>
                    </ul> 
             
         </div>
           


                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Data %>" SelectCommand="SELECT comment, Name, Pid, Date FROM Comment WHERE (Pid = @Pid)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="Pid" QueryStringField="id" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            </div>
            </div>
                                                     </div>

           
           


        

 




        



                 
    </form>

 

    </body>
</html>
