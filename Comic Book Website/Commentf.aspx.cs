using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class Commentf : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      
        string uname = (string)Session["mail"];
        if (!IsPostBack)
        {
            if (Session["mail"] == null && Session["pass"] == null)
            {

                Response.Redirect("Login.aspx");

            }
            else
            {

            }

        }

    }
    protected void Submit_Click(object sender, EventArgs e)
    {
        try
        {

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            con.Open();
            string insertQuery = "insert into commentf(UserName,Comments) values(@username,@commentb)";
            SqlCommand cmd = new SqlCommand(insertQuery, con);
            cmd.Parameters.AddWithValue("@username", UserName.Text);
            cmd.Parameters.AddWithValue("@commentb", commentf.Text);

            string checkname = (string)(UserName.Text);
            string chkname = (string)(Session["mail"]);
            if (checkname == chkname)
            {
                cmd.ExecuteNonQuery();
                //Response.Redirect("login.aspx");
                con.Close();

                string message = "Comment has been written sucessfully ! ";
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append("<script type = 'text/javascript'>");
                sb.Append("window.onload=function(){");
                sb.Append("alert('");
                sb.Append(message);
                sb.Append("')};");
                sb.Append("</script>");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());

            }
            else
            {
                string message = "Sorry,Username not Valid ! ";
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
        catch (Exception ex)
        {
            Response.Write("ERROR!!" + ex.ToString());
        }
    }
}