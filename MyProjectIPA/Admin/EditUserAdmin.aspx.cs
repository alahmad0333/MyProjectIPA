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
    public partial class EditUserAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string conn = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
            SqlConnection con = new SqlConnection(conn);

            Butlong10.Visible = false;
            form1.Visible = false;
            con.Close();




            SqlCommand cmd = new SqlCommand("select Name from Admin where Email =@em", con);
            cmd.Parameters.AddWithValue("@em", Session["Email"]);

            SqlDataReader red;
            cmd.Connection = con;

            con.Open();


            if (Session["Email"] != null)
            {
                red = cmd.ExecuteReader();

                red.Read();
                Label2.Text = "Welcome" + " " + red["Name"].ToString();
                Butlong10.Text = "Logout";
                Butlong10.Visible = true;

                form1.Visible = true;
                con.Close();

                con.Close();

            }
            else
            {

                con.Close();
            }



        }

        protected void Butlong10_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }
    }
}