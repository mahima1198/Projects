using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Flash : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void writecomment_Click(object sender, EventArgs e)
    {
        Response.Redirect("Commentf.aspx");
    }
}