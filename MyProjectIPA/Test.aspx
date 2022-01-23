<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="MyProjectIPA.Test" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>  
    <style>
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
    </style>
    </head>

<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        
                <asp:ImageButton ID="ImageButton1" ImageUrl="~/Bellimg/bellF.png" runat="server" Width="36px" />


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
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="text-center" colspan="2">
                        <asp:Button ID="butSEnd" CommandArgument='<%# Eval("ProductID") %>' CommandName="Send Alert" runat="server" Text="Send" />
                    </td>
                </tr>
            </table>


        </asp:Panel>

        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" TargetControlID="ImageButton1" PopupControlID="Panel1"  runat="server" BackgroundCssClass="modalBackground"></ajaxToolkit:ModalPopupExtender>

    </form>
    </body>
</html>




<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                <asp:ImageButton ID="ImageButton2" ImageUrl="~/Bellimg/bellF.png"  CommandArgument='<%# Eval("ProductID") %>' CommandName="Send Alert" runat="server" Width="33px" />
                <asp:ImageButton ID="ImageButton3" Visible="false" ImageUrl="~/Bellimg/bellE.png" runat="server" Width="33px" CommandArgument='<%# Eval("ProductID") %>' CommandName="Cancel Alert"  />
