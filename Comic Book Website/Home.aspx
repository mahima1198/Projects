<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <asp:SqlDataSource ID="SqlDataSourceRegistration" runat="server" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>"></asp:SqlDataSource>
  <marquee direction="right" runat="server" >
     
      <br>
   <img src="marqimg1.jpg" alt="Mountain View" style="height:500px; margin-top:5px; ">
   <img src="marqimg2.jpg" alt="Mountain View" style="height:500px; margin-top:5px; ">
   <img src="marqimg3.jpg" alt="Mountain View" style="height:500px; margin-top:5px; ">
   <img src="marqimg4.jpg" alt="Mountain View" style="height:500px; margin-top:5px; ">
   <img src="marqimg5.jpg" alt="Mountain View" style="height:500px; margin-top:5px; ">
   <img src="marqimg6.jpg" alt="Mountain View" style="height:500px; margin-top:5px; ">
   <img src="marqimg7.jpg" alt="Mountain View" style="height:500px; margin-top:5px; ">
  </marquee>
   
   <asp:Label ID="lblCount" runat="server" ForeColor="White" /></p>



</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            color: #FFFFFF;
        }
    </style>
</asp:Content>

