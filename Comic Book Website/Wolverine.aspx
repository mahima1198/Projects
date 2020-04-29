<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Wolverine.aspx.cs" Inherits="Wolverine" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <table style="width:100%; margin-top:50px; " cellspacing="25" >
    
        <tr>
            <td><a href="cm.aspx"> <img src="wolvcomic1.jpg" alt="Mountain View" style="height:240px; width:180px;  "></a></td>
            <td><a href="cm.aspx"> <img src="wolvcomic2.jpg" alt="Mountain View" style="height:240px; width:180px;  "></a></td>
            <td><a href="cm.aspx"> <img src="wolvcomic3.jpg" alt="Mountain View" style="height:240px; width:180px;  "></a></td>
            <td><a href="cm.aspx"> <img src="wolvcomic4.jpg" alt="Mountain View" style="height:240px; width:180px;  "></a></td>
         
        </tr>
        <tr>
            <td><a href="cm.aspx"> <img src="wolvcomic5.jpg" alt="Mountain View" style="height:240px; width:180px;  "></a></td>
            <td><a href="cm.aspx"> <img src="wolvcomic6.jpg" alt="Mountain View" style="height:240px; width:180px;  "></a></td>
            <td><a href="cm.aspx"> <img src="wolvcomic7.jpg" alt="Mountain View" style="height:240px; width:180px;  "></a></td>
            <td><a href="cm.aspx"> <img src="wolvcomic8.jpg" alt="Mountain View" style="height:240px; width:180px;  "></a></td>
         
        </tr>
        <tr>
            <td><a href="cm.aspx"> <img src="wolvcomic9.jpg" alt="Mountain View" style="height:240px; width:180px;  "></a></td>
            <td><a href="cm.aspx"> <img src="wolvcomic10.jpg" alt="Mountain View" style="height:240px; width:180px;  "></a></td>
            <td><a href="cm.aspx"> <img src="wolvcomic11.jpg" alt="Mountain View" style="height:240px; width:180px;  "></a></td>
            <td><a href="cm.aspx"> <img src="wolvcomic12.jpg" alt="Mountain View" style="height:240px; width:180px;  "></a></td>
         
        </tr>
          
    </table>

        <table style="width:100%; margin-top:50px; " cellspacing="25" >  
        <tr>
            <td><asp:Button ID="writecomment" runat="server" Text="WRITE A COMMENT" Width="244px" OnClick="writecomment_Click"  /></td>
              <td><asp:Button ID="viewcomment" runat="server" Text="VIEW ALL COMMENTS" Width="244px" PostBackUrl="~/ViewCommentw.aspx" /></td>
        </tr>

    </table>
</asp:Content>

