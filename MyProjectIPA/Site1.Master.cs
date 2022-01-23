using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyProjectIPA
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string conn = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
            SqlConnection con = new SqlConnection(conn);

            SqlCommand cmd = new SqlCommand("select FristName from Customer where Email =@em", con);
            cmd.Parameters.AddWithValue("@em", Session["Email"]);





            SqlDataReader red;
            cmd.Connection = con;


            con.Open();

            if (Session["Email"] != null)
            {
                red = cmd.ExecuteReader();

                red.Read();
                Label1.Visible = true;
                Label1.Text = "Welcome" + " " + red["FristName"].ToString();
                Butlong.Text = "Logout";
                con.Close();


                //lblcart.Text = ds.Tables[0].Rows[0]["totalRow"].ToString();
                con.Close();


            }
            else
            {

                con.Close();
            }
        }
    }
}