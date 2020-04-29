using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
public partial class _Default : System.Web.UI.Page
{
    SqlConnection con=new SqlConnection("Data Source=(LocalDB)\v11.0;AttachDbFilename=G:\\Sem4\\WT\\WT-Lab\\Experiments\\Ploginform\\App_Data\\Database.mdf;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void signup(object sender, EventArgs e)
    {
        SqlDataSource1.InsertParameters["username"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("Username")).Text;
        SqlDataSource1.InsertParameters["name"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("Name")).Text;
        SqlDataSource1.InsertParameters["email"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("Email")).Text;
        SqlDataSource1.InsertParameters["password"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("Password")).Text;
        SqlDataSource1.Insert();
    }

}