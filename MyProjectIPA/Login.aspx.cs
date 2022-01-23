using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


namespace MyProjectIPA
{
    public partial class Login : System.Web.UI.Page
    {     string conn = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Buttonlogin_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(conn);


            var email = emaillong1.Text;
            var pass = passlogn1.Text;

            SqlCommand com2 = new SqlCommand("select * from Customer where Email = @em and Password = @pass", con);
            com2.Parameters.AddWithValue("@em", email);
            com2.Parameters.AddWithValue("@pass", pass);

            //SqlCommand com3 = new SqlCommand("select * from Customer where Email = admin@admin.ocm and Password = admin", con);



            con.Open();

            if  (com2.ExecuteReader().HasRows)
            {
                Session["Email"] = emaillong1.Text;
                Response.Redirect("WebForm1.aspx");
                con.Close();
            }

            else 
            {
                con.Close();
                con.Open();

                //Response.Write("<div class='alert alert-danger alert-dismissible'> <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a> The Email or Password is incorrec </div>");

                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Error. The Email or Password is incorrec')", true);

                con.Close();
            }









        }

        protected void Butlong_Click1(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }

        protected void ImageButton4_Click1(object sender, ImageClickEventArgs e)
        {
            if (Session["Email"] != null)
            {
                Response.Redirect("wishlist.aspx");
            }
            else
            {
                Response.Redirect("Login.aspx");

            }
        }
    }
}