<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditLinks.aspx.cs" Inherits="MyProjectIPA.Admin.EditLinks" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>



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
        img {

            width:100px;
            height:50px;
        }

        h1,
        h3 {
            text-align: center;
        }
 
        table {
            border-spacing: 0px;
            table-layout: fixed;
            margin-left: auto;
            margin-right: auto;
            width: 97%;
        }
 

        td {
            border: 1px solid black;
            word-wrap: break-word;
        }





        </style>
</head>
<body >
    <form id="form1" runat="server">




<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="AddProudect.aspx">Employe</a>
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


<div class="table-responsive">


            <asp:GridView ID="GridView1"  runat="server" AutoGenerateColumns="False" ShowFooter="True" DataKeyNames="ProductID" CssClass="table" AlternatingRowStyle-CssClass="col" AllowPaging="true" AlternatingRowStyle-Width="50px"
                ShowHeaderWhenEmpty="True"

                OnRowCommand="GridView1_RowCommand"


                BackColor="White" BorderStyle="None" BorderWidth="1px" CellPadding="0"  Width="97%" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating"  HorizontalAlign="Center">
                <%-- Theme Properties --%>

                
                <Columns>

                     <asp:TemplateField HeaderText="ProductID">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("ProductID") %>' runat="server" ItemStyle-Width="30px" HeaderStyle-Width="100px" />
                        </ItemTemplate>
                           <EditItemTemplate>
                            <asp:TextBox ID="txtID" Text='<%# Eval("ProductID") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtIDFooter"   runat="server" />
                        </FooterTemplate>

                         <ItemStyle Height="3%" Width="3%" />

                    </asp:TemplateField>



                        <asp:TemplateField HeaderText="linkebay">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("linkebay") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtlinkebay" Text='<%# Eval("linkebay") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtlinkebayFooter" runat="server" />
                        </FooterTemplate>
                            <ItemStyle Height="50px" Width="10px" />
                    </asp:TemplateField>


                        <asp:TemplateField HeaderText="linknoon">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("linknoon") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtlinknoon" Text='<%# Eval("linknoon") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtlinknoonFooter" runat="server" />
                        </FooterTemplate>
                                                        <ItemStyle Height="5%" Width="5%" />

                    </asp:TemplateField>

                                                <asp:TemplateField HeaderText="linkamazon">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("linkamazon") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtlinkamazon" Text='<%# Eval("linkamazon") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtlinkamazonFooter" runat="server" />
                        </FooterTemplate>
                                                    <ItemStyle Height="5%" Width="5%" />
                    </asp:TemplateField>

                                                <asp:TemplateField HeaderText="linkNewegg">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("linkNewegg") %>' runat="server" />

                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtlinkNewegg" Text='<%# Eval("linkNewegg") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtlinkNeweggFooter" runat="server" />
                        </FooterTemplate>
                                                    <ItemStyle Height="5%" Width="5%" />
                    </asp:TemplateField>




                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ImageUrl="~/Images/edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px"/>
                            <asp:ImageButton ImageUrl="~/Images/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px"/>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton ImageUrl="~/Images/save.png" runat="server" CommandName="Update" ToolTip="Update" Width="20px" Height="20px"/>
                            <asp:ImageButton ImageUrl="~/Images/cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px"/>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:ImageButton ImageUrl="~/Images/addnew.png" runat="server" CommandName="AddNew" ToolTip="Add New" Width="20px" Height="20px"/>
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
            </DIV>
    </form>





    
</body>
</html>
