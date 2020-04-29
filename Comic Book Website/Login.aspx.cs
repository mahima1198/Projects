using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


    }
    protected void login(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        con.Open();
        string checkuser = "select count(*) from users where username='" +Username.Text + "'";
        SqlCommand cmd = new SqlCommand(checkuser, con);
        int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());
        con.Close();
        if (temp == 1)
        {
            con.Open();
            string passwordcheckQuery = "select password from users where username='" + Username.Text + "'";
            SqlCommand passcmd = new SqlCommand(passwordcheckQuery, con);
            string password = passcmd.ExecuteScalar().ToString().Replace(" ", "");
            if (password == Password.Text)
            {
              
                Session["mail"] = Username.Text;
                Session["pass"] = Password.Text;

                Response.Write("Password is correct!!");
                Response.Redirect("Home.aspx");
            }
            else
            {
                string message = "Sorry,Password not Valid ! ";
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append("<script type = 'text/javascript'>");
                sb.Append("window.onload=function(){");
                sb.Append("alert('");
                sb.Append(message);
                sb.Append("')};");
                sb.Append("</script>");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
  
            }
        }
        else
        {
            string message = "Sorry,Email not Valid ! ";
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("alert('");
            sb.Append(message);
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
            
        }

    }

    /*if (FormsAuthentication.Authenticate(string Username.Text, string Password.Text))
     { 
         FormsAuthentication.RedirectFromLoginPage(string Username.Text,false)
     }
     else
     {  
         Response.Write("Password is not correct!!");
     }
     */
}