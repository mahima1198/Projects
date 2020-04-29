<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Flash.aspx.cs" Inherits="Flash" MasterPageFile="~/MasterPage.master" %>
<%@ MasterType VirtualPath="~/MasterPage.master" %>

<script runat="server">

</script>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       
    <table style="width:100%; margin-top:50px; " cellspacing="25" >
    
        <tr>
            <td><a href="cm.aspx"> <img src="flashcomic1.jpg" alt="Mountain View" style="height:240px; width:180px;  "></a></td>
            <td><a href="cm.aspx"> <img src="flashcomic2.jpg" alt="Mountain View" style="height:240px; width:180px;  "></a></td>
            <td><a href="cm.aspx"> <img src="flashcomic3.jpg" alt="Mountain View" style="height:240px; width:180px;  "></a></td>
            <td><a href="cm.aspx"> <img src="flashcomic4.jpg" alt="Mountain View" style="height:240px; width:180px;  "></a></td>
         
        </tr>
        <tr>
            <td><a href="cm.aspx"> <img src="flashcomic5.jpg" alt="Mountain View" style="height:240px; width:180px;  "></a></td>
            <td><a href="cm.aspx"> <img src="flashcomic6.jpg" alt="Mountain View" style="height:240px; width:180px;  "></a></td>
            <td><a href="cm.aspx"> <img src="flashcomic7.jpg" alt="Mountain View" style="height:240px; width:180px;  "></a></td>
            <td><a href="cm.aspx"> <img src="flashcomic8.jpg" alt="Mountain View" style="height:240px; width:180px;  "></a></td>
         
        </tr>
        <tr>
            <td><a href="cm.aspx"> <img src="flashcomic9.jpg" alt="Mountain View" style="height:240px; width:180px;  "></a></td>
            <td><a href="cm.aspx"> <img src="flashcomic10.jpg" alt="Mountain View" style="height:240px; width:180px;  "></a></td>
            <td><a href="cm.aspx"> <img src="flashcomic11.jpg" alt="Mountain View" style="height:240px; width:180px;  "></a></td>
            <td><a href="cm.aspx"> <img src="flashcomic12.jpg" alt="Mountain View" style="height:240px; width:180px;  "></a></td>
        </tr>

    </table>
    
          <table style="width:100%; margin-top:50px; " cellspacing="25" >  
        <tr>
            <td><asp:Button ID="writecomment" runat="server" Text="WRITE A COMMENT" Width="244px" OnClick="writecomment_Click"  /></td>
              <td><asp:Button ID="viewcomment" runat="server" Text="VIEW ALL COMMENTS" Width="244px" PostBackUrl="~/ViewCommentf.aspx" /></td>
        </tr>

    </table>
</asp:Content>

