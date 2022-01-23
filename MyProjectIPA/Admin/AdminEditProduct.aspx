<%@ Page Language="C#" AutoEventWireup="true"  CodeBehind="AdminEditProduct.aspx.cs" Inherits="MyProjectIPA.AdminEditProduct" ValidateRequest="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link href="https://fonts.googleapis.com/css2?family=Capriola&display=swap" rel="stylesheet"/>


    <style>
        body
        {
            font-family: Arial;
            font-size: 10pt;
        }
        table
        {
            border: 1px solid #ccc;
            border-collapse: collapse;
        }
        table th
        {
            font-weight: bold;
        }
        table th, table td
        {
            padding: 5px;
            border: 1px solid #ccc;
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
        img {

            width:100px;
            height:50px;
        }
                                .auto-style8 {
            padding: 9px 25px;
            background-color: rgba(0,136,169,1);
            border: none;
            border-radius: 50px;
            cursor: pointer;
            transition: all 0.3s ease 0s;
    margin-left: 124px;
                }




        </style>
</head>
<body >
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
  


            <div class="text-center">


            <asp:GridView ID="GridView1" CssClass="table"  runat="server" AutoGenerateColumns="False" ShowFooter="True" DataKeyNames="ProductID"
                ShowHeaderWhenEmpty="True"

                OnRowCommand="GridView1_RowCommand"

                BackColor="White" BorderStyle="None" BorderWidth="1px" CellPadding="3" Height="150px" Width="16px" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
                <%-- Theme Properties --%>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
                
                <Columns>

                     <asp:TemplateField HeaderText="ProductID">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("ProductID") %>' runat="server" />
                        </ItemTemplate>
                           <EditItemTemplate>
                            <asp:TextBox ID="txtID" Text='<%# Eval("ProductID") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtIDFooter"   runat="server" />
                        </FooterTemplate>

                    </asp:TemplateField>



            <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Name") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtName" Text='<%# Eval("Name") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtNameFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>



                   <asp:TemplateField HeaderText="CategoryID">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("CategoryID") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="drlCategoryID" runat="server" DataSourceID="SqlDataSource1" DataTextField="CategoryID" DataValueField="CategoryID"></asp:DropDownList>

                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Data %>" SelectCommand="SELECT DISTINCT [CategoryID] FROM [Product]"></asp:SqlDataSource>

                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="drlCategoryIDFooter" runat="server" DataSourceID="SqlDataSource1" DataTextField="CategoryID" DataValueField="CategoryID"></asp:DropDownList>

                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Data %>" SelectCommand="SELECT DISTINCT [CategoryID] FROM [Product]"></asp:SqlDataSource>

                        </FooterTemplate>
                    </asp:TemplateField>


                       <asp:TemplateField HeaderText="ImgFile">
                        <ItemTemplate>
                            <asp:Image ID="Image1" src='<%# string.Format("../{0}",Eval("ImgFile"))%>'  runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtImgFile" Text='<%# Eval("ImgFile") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtImgFileFooter" runat="server" />
                        </FooterTemplate>
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
                    </asp:TemplateField>




                        <asp:TemplateField HeaderText="Review">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Review") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtReview" Text='<%# Eval("Review") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtReviewFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>


                            <asp:TemplateField HeaderText="rating">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("rating") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtrating" Text='<%# Eval("rating") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtratingFooter" runat="server" />
                        </FooterTemplate>
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
    </form>





    
</body>
</html>
