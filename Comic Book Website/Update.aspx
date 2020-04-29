<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Update.aspx.cs" Inherits="Update" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br><br><br>
   
    <div>
  
    <br />
        <center>
   &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;   <asp:TextBox ID="UserName" placeholder="UserName" runat="server" Width="210px"></asp:TextBox>
       
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName" ErrorMessage="Required!" Font-Bold="True" Font-Italic="True" Font-Names="Brush Script MT" Font-Size="X-Large" ForeColor="Black"></asp:RequiredFieldValidator>
   <br><br>
    &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;          <asp:TextBox ID="Password" placeholder="Password" runat="server" Width="210px" TextMode="Password"></asp:TextBox>
      
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Password" ErrorMessage="Required!" Font-Bold="True" Font-Italic="True" Font-Names="Brush Script MT" Font-Size="X-Large" ForeColor="Black"></asp:RequiredFieldValidator>
        <br />
    <asp:Button ID="Sbm" runat="server" Text="Update" Width="244px" OnClick="update" />
    <br />
            </center>
    </div>
  
</asp:Content>

