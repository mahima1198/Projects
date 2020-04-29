using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Wolverine : System.Web.UI.Page
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

    protected void writecomment_Click(object sender, EventArgs e)
    {
        Response.Redirect("Commentw.aspx");
    }
}