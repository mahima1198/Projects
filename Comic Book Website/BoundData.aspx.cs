using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


public partial class BoundData : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void show(object sender, EventArgs e)
    {
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
    con.Open();
    string query = "select * from users where username='"+Username.Text+"'";
    SqlDataAdapter da = new SqlDataAdapter(query, con);
    DataSet ds = new DataSet();
    da.Fill(ds, "users");
    

    con.Close();
    Name.Text = ds.Tables[0].Rows[0]["name"].ToString();
    Email.Text = ds.Tables[0].Rows[0]["email"].ToString();
    Password.Text = ds.Tables[0].Rows[0]["password"].ToString();

    }


    protected void update(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ToString());
        con.Open();
      

        try
            {
                SqlCommand cmd = new SqlCommand("update users Set password=@pass where username='" + Username.Text + "'", con);
                // cmd.Parameters.AddWithValue("@uname", Username.Text);
                cmd.Parameters.Add("@pass", Password.Text);
                cmd.ExecuteNonQuery();
                Response.Redirect("BoundData.aspx");
                con.Close();
            }
            catch(Exception ex)
             {
                 Response.Write("ERROR!!" + ex.ToString());
            }

        }
    }
