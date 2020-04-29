<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BoundData.aspx.cs" Inherits="BoundData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <br />
    <asp:TextBox ID="Username" placeholder="UserName" runat="server" Width="210px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName" ErrorMessage="Required!" Font-Bold="True" Font-Italic="True" Font-Names="Brush Script MT" Font-Size="X-Large" ForeColor="Black"></asp:RequiredFieldValidator>
   
    <br />
        <asp:Button ID="Show" runat="server" Text="SHOW" Width="244px" onclick="show"/>
    <br />
     </p>

    <p>
        <asp:TextBox ID="Name"  runat="server" Width="211px"></asp:TextBox>
    
        <br />
    <asp:TextBox ID="Email"  runat="server" Width="211px"></asp:TextBox>
        &nbsp;
        <br />
    
   
    <br />
        <br />
    <asp:TextBox ID="Password" runat="server" Width="210px" ></asp:TextBox>
    
    </p>
    <p>
        <asp:Button ID="Update" runat="server" Text="Update" Width="244px" onclick="update"/>
    
        <br />
    </p>

    <p>
      
        
    </p>
</asp:Content>

