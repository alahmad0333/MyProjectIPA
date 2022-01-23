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
    public partial class SingUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string conn = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
            SqlConnection con = new SqlConnection(conn);
            var fname = TextBox1.Text.Replace(" ", "");
            var lname = TextBox2.Text.Replace(" ", "");
            var Email = TextBox3.Text.Replace(" ", "");
            var Password =TextBox5.Text.Replace(" ", "");

            SqlCommand com1 = new SqlCommand("insert into Customer (FristName , LastName , Email , Password)" +
                " values(@fname , @lname , @Email , @Password)", con);
            com1.Parameters.AddWithValue("@fname", fname);
            com1.Parameters.AddWithValue("@lname", lname);
            com1.Parameters.AddWithValue("@Email", Email);
            com1.Parameters.AddWithValue("@Password", Password);

            SqlCommand com2 = new SqlCommand("select * from Customer where Email = @em", con);
            com2.Parameters.AddWithValue("@em", Email);

            con.Open();

            if (com2.ExecuteReader().HasRows)
            {
                Label7.Text = "Email Exist !";
                Label7.Visible = true;

                con.Close();
            }

            else
            {
                con.Close();
                con.Open();
                com1.ExecuteNonQuery();
                Label7.Text = "Done !";
                Label7.Visible = true;
                Label7.ForeColor = System.Drawing.Color.Blue;
                con.Close();

                Response.Redirect("~/Login.aspx");

            }




        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox1.Checked == true)
            {
                TextBox5.TextMode = TextBoxMode.SingleLine;
                TextBox6.TextMode = TextBoxMode.SingleLine;

            }
            else
            {
                TextBox5.TextMode = TextBoxMode.Password;
                TextBox6.TextMode = TextBoxMode.Password;

            }
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

        protected void Butlong_Click1(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }
    }
}