using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


public partial class Update : System.Web.UI.Page
{
    string uuname;
    protected void Page_Load(object sender, EventArgs e)
    {

        // string uname = (string)Session["mail"];
        //uuname = uname;
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

    protected void update(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ToString());
        con.Open();
        string checkname = (string)(UserName.Text);
        string chkname = (string)(Session["mail"]);


        {
            if (checkname == chkname)
            {
                SqlCommand cmd = new SqlCommand("update users Set password=@pass where username='" + UserName.Text + "'", con);
                // cmd.Parameters.AddWithValue("@uname", Username.Text);
                cmd.Parameters.Add("@pass", Password.Text);
                cmd.ExecuteNonQuery();
                Response.Redirect("Login.aspx");
                con.Close();
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
    }
}


  