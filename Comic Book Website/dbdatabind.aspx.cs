using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class dbdatabind : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        con.Open();
        string query=("select * from users where username = '" + DropDownList1.SelectedValue + "'");
        SqlCommand cmd = new SqlCommand(query,con);
        //SqlDataAdapter Adpt = new SqlDataAdapter(cmd);
        //DataTable dt = new DataTable();
        //Adpt.Fill(dt);
        //GridView1.DataSource = dt;

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "users");
        GridView1.DataSource = ds;
        GridView1.DataBind(); 
        Label1.Text = "record found";
        con.Close();
    }
}