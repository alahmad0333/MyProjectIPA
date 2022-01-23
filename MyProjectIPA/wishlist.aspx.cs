using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyProjectIPA
{
    public partial class wishlist : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {

            string conn = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
            SqlConnection con1 = new SqlConnection(conn);


            SqlCommand cmd = new SqlCommand("select FristName , LastName from Customer where Email =@em", con1);
            cmd.Parameters.AddWithValue("@em", Session["Email"]);





            SqlDataReader reed;
            cmd.Connection = con1;


            con1.Open();

            if (Session["Email"] != null)
            {
                reed = cmd.ExecuteReader();

                reed.Read();
                but.Visible = true;
                but.Text = "Welcome" + " " + reed["FristName"].ToString() + " " + reed["LastName"].ToString();
                Butlong10.Text = "Logout";
                con1.Close();

                SqlCommand cmd1 = new SqlCommand("SELECT COUNT(Email) from wishlist WHERE Email='" + Session["Email"].ToString() + "'", con1);
                con1.Open();
                int count = Convert.ToInt32(cmd1.ExecuteScalar());
                cmd1.Dispose();
                con1.Close();
                lblcart.Text = count.ToString();
                con1.Close();


            }
            else
            {

                con1.Close();
            }



            SqlConnection con = new SqlConnection(conn);
            try
            {


                SqlCommand cmd2 = new SqlCommand("select * from Product where ProductID in (select ProductID from wishlist where Email='" + Session["Email"].ToString() + "')", con);
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd2;
                DataSet ds = new DataSet();
                da.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                con.Close();
            }
            catch (Exception ex)
            {
               
             ScriptManager.RegisterStartupScript(this, this.GetType(),
             "alert",
             "swal('Login Frist','','info').then((value) => { window.location ='WebForm1.aspx'; });",
             true);

            }
        }


            

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string conn = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
            SqlConnection con = new SqlConnection(conn);
            var prid = GridView1.Rows[e.RowIndex].Cells[0];
            con.Open();
            SqlCommand cmd = new SqlCommand("DELETE FROM wishlist WHERE ProductID='" + prid.Text + "'and Email ='" + Session["Email"].ToString() + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("~/wishlist.aspx");
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

        protected void but_Click(object sender, EventArgs e)
        {
            if (but.CommandName == "Email")
            {

                string conn2 = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
                SqlConnection con = new SqlConnection(conn2);

                SqlCommand cmd1 = new SqlCommand("SELECT id from Customer WHERE Email='" + Session["Email"].ToString() + "'", con);
                //cmd1.Parameters.AddWithValue("email", Session["Email"].ToString());
                con.Open();
                int id = Convert.ToInt32(cmd1.ExecuteScalar());
                cmd1.Dispose();
                con.Close();
                id.ToString();

                Response.Redirect("EditProfile.aspx?id=" + id.ToString());

            }
        }
    }
}