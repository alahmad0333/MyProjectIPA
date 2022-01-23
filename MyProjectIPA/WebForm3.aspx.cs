using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.UI.HtmlControls;
using System.Text.RegularExpressions;
using System.Net.Mail;
using System.Net;

namespace MyProjectIPA
{
    public partial class WebForm3 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {



            string conn = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
            SqlConnection con = new SqlConnection(conn);

            SqlCommand cmd = new SqlCommand("select FristName , LastName from Customer where Email =@em", con);
            cmd.Parameters.AddWithValue("@em", Session["Email"]);

            SqlDataReader red;
            cmd.Connection = con;


            con.Open();

            if (Session["Email"] != null)
            {
                red = cmd.ExecuteReader();

                red.Read();
                but.Visible = true;
                but.Text = "Welcome" + " " + red["FristName"].ToString() + " " + red["LastName"].ToString();
                Butlong10.Text = "Logout";
                con.Close();

                SqlCommand cmd1 = new SqlCommand("SELECT COUNT(Email) from wishlist WHERE Email='" + Session["Email"].ToString() + "'", con);
                //cmd1.Parameters.AddWithValue("email", Session["Email"].ToString());
                con.Open();
                int count = Convert.ToInt32(cmd1.ExecuteScalar());
                cmd1.Dispose();
                con.Close();
                lblcart.Text = count.ToString();

            }
            else
            {

                con.Close();

            }
        }

        protected void Butlong_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }



        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            try
            {

                Label lableid3 = e.Item.FindControl("Label1") as Label;
                TextBox TexTPrice = e.Item.FindControl("TextBox1") as TextBox;

                string conn = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
                SqlConnection con = new SqlConnection(conn);

                SqlCommand cmd1 = new SqlCommand("SELECT Price from Product  WHERE ProductID=" + Request.QueryString["id"].ToString(), con);
                con.Open();
                decimal count = Convert.ToDecimal(cmd1.ExecuteScalar());
                cmd1.Dispose();
                con.Close();


                SqlCommand cmd2 = new SqlCommand("SELECT Price2 from Product  WHERE ProductID=" + Request.QueryString["id"].ToString(), con);
                con.Open();
                decimal count2 = Convert.ToDecimal(cmd2.ExecuteScalar());
                cmd2.Dispose();
                con.Close();


                SqlCommand cmd3 = new SqlCommand("SELECT Price3 from Product  WHERE ProductID=" + Request.QueryString["id"].ToString(), con);
                con.Open();
                decimal count3 = Convert.ToDecimal(cmd3.ExecuteScalar());
                cmd3.Dispose();
                con.Close();


                SqlCommand cmd4 = new SqlCommand("SELECT Price4 from Product  WHERE ProductID=" + Request.QueryString["id"].ToString(), con);
                con.Open();
                decimal count4 = Convert.ToDecimal(cmd2.ExecuteScalar());
                cmd4.Dispose();
                con.Close();



                decimal[] Prices = { count, count2, count3, count4 };


                int len = 0;
                for (int i = 0; i < Prices.Length; i++)
                {
                    if (Prices[i] != 0)
                        len++;
                }


                decimal[] newArray = new decimal[len];
                for (int i = 0, j = 0; i < Prices.Length; i++)
                {
                    if (Prices[i] != 0)
                    {
                        newArray[j] = Prices[i];
                        j++;
                    }
                }


                var minPrice = Convert.ToString(newArray.Min());

                lableid3.Text = minPrice + "$"; // Add in Lable Price in Pop Massage Alert



            }
            catch (Exception ex)
            {
                
            }



            if (Session["Email"] != null)
            {
                string conn2 = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
                SqlConnection con2 = new SqlConnection(conn2);

                TextBox textPrice = e.Item.FindControl("TextBox1") as TextBox;
                Button butSendAlert = e.Item.FindControl("butSEnd") as Button;
                Button ButAjax = e.Item.FindControl("Button1") as Button;
                ImageButton butSendCancel = e.Item.FindControl("ImageButton2") as ImageButton;
                Panel panal2 = e.Item.FindControl("Panel1") as Panel;



                SqlCommand cmd6 = new SqlCommand("Select * from Alert where ProductID=" + Request.QueryString["id"].ToString() + "and Email ='" + Session["Email"] + "'", con2);
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd6;
                DataSet ds = new DataSet();
                da.Fill(ds);
                con2.Close();


                if (ds.Tables[0].Rows.Count > 0)
                {
                    butSendAlert.Visible = false;
                    butSendCancel.Visible = true;
                    ButAjax.Visible = false;
                    panal2.Visible = false;


                }
                else
                {
                    butSendAlert.Visible = true;
                    ButAjax.Visible = true;
                    panal2.Visible = true;

                    butSendCancel.Visible = false;

                }
            }





        }

        protected void btnTest_Click(object sender, EventArgs e)
        {


            var textbox = textcom.Text;


            if (Session["Email"] != null)
            {
                string conn = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
                SqlConnection con = new SqlConnection(conn);

                SqlCommand cmd = new SqlCommand("select FristName , LastName from Customer where Email =@em", con);
                cmd.Parameters.AddWithValue("@em", Session["Email"]);

                SqlDataReader red;
                cmd.Connection = con;
                con.Open();
                red = cmd.ExecuteReader();
                red.Read();



                SqlCommand com1 = new SqlCommand("insert into Comment (Name , comment,Pid,Email,Date)" +
                " values(@name , @comment,@Pid,@Email,@Date)", con);
                com1.Parameters.AddWithValue("@comment", textbox);
                com1.Parameters.AddWithValue("@name", red["FristName"].ToString() + " " + red["LastName"].ToString());
                com1.Parameters.AddWithValue("@Pid", Request.QueryString["id"]);
                com1.Parameters.AddWithValue("@Email", Session["Email"].ToString());
                com1.Parameters.AddWithValue("@Date", DateTime.Now);


                con.Close();


                con.Open();
                com1.ExecuteNonQuery();
                con.Close();
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Comment Added','','success').then((value) => { window.location ='WebForm3.aspx?id=" + Request.QueryString["id"].ToString() + "'; });", true);

            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Login Your Account')", true);

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



        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {



            try
            {
                if (e.CommandName == "Send Alert" && Session["Email"] != null) // if Click To Button Alert
                {
                    string conn2 = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
                    SqlConnection con2 = new SqlConnection(conn2);
                    TextBox textPrice = e.Item.FindControl("TextBox1") as TextBox;
                    Button butSendAlert = e.Item.FindControl("butSEnd") as Button;
                    Button ButAjax = e.Item.FindControl("Button1") as Button;
                    ImageButton butSendCancel = e.Item.FindControl("ImageButton2") as ImageButton;
                    Panel panal2 = e.Item.FindControl("Panel1") as Panel;
                    Label lableid1 = e.Item.FindControl("Staa") as Label;



                  
                    SqlCommand cmd5 = new SqlCommand("insert into Alert (Email ,ProductID,AlertSet)VALUES (@Email,@ProductID,@AlertSet)", con2);
                    cmd5.Parameters.AddWithValue("@Email", Session["Email"].ToString());
                    cmd5.Parameters.AddWithValue("@ProductID", e.CommandArgument.ToString());
                    cmd5.Parameters.AddWithValue("@AlertSet", textPrice.Text);

                    // Add Alert Price in Databese

                    decimal textprice = Convert.ToDecimal(textPrice.Text);




                    SqlConnection con = new SqlConnection(conn2);

                    SqlCommand cmd1 = new SqlCommand("SELECT Price from Product  WHERE ProductID=" + e.CommandArgument.ToString(), con);
                    con.Open();
                    decimal count = Convert.ToDecimal(cmd1.ExecuteScalar());
                    cmd1.Dispose();
                    con.Close();


                    SqlCommand cmd2 = new SqlCommand("SELECT Price2 from Product  WHERE ProductID=" + e.CommandArgument.ToString(), con);
                    con.Open();
                    decimal count2 = Convert.ToDecimal(cmd2.ExecuteScalar());
                    cmd2.Dispose();
                    con.Close();


                    SqlCommand cmd3 = new SqlCommand("SELECT Price3 from Product  WHERE ProductID=" + e.CommandArgument.ToString(), con);
                    con.Open();
                    decimal count3 = Convert.ToDecimal(cmd3.ExecuteScalar());
                    cmd3.Dispose();
                    con.Close();


                    SqlCommand cmd4 = new SqlCommand("SELECT Price4 from Product  WHERE ProductID=" + e.CommandArgument.ToString(), con);
                    con.Open();
                    decimal count4 = Convert.ToDecimal(cmd2.ExecuteScalar());
                    cmd4.Dispose();
                    con.Close();



                    decimal[] Prices = { count, count2, count3, count4 };


                    int len = 0;
                    for (int i = 0; i < Prices.Length; i++)
                    {
                        if (Prices[i] != 0)
                            len++;
                    }


                    decimal[] newArray = new decimal[len];
                    for (int i = 0, j = 0; i < Prices.Length; i++)
                    {
                        if (Prices[i] != 0)
                        {
                            newArray[j] = Prices[i];
                            j++;
                        }
                    }


                    if (textprice > newArray.Min() || textprice == ' ') // if SetAlert > current price
                    {
                     
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Alert price cannot be higher than current price')", true);

                    }
                    else // Set Alert True
                    {

                        con2.Open();
                        cmd5.ExecuteNonQuery();
                        con2.Close();

                        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Set Alert True','','success').then((value) => { window.location ='WebForm3.aspx?id=" + e.CommandArgument.ToString() + "'; });", true);

                    }




                }
                else if(Session["Email"] == null) // if Email = null Show Error (SetAlert)
                {
                    Button butSendAlert = e.Item.FindControl("butSEnd") as Button;
                    Button ButAjax = e.Item.FindControl("Button1") as Button;
                    Panel panal2 = e.Item.FindControl("Panel1") as Panel;

                    butSendAlert.Visible = false;
                    panal2.Visible = false;




                    ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Login Your Account For Set Alert')", true);
                }

            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('"+ ex.Message + "')", true);

            }



            if (e.CommandName == "Cancel Alert") // if Click Cancel Alert
            {
                string conn2 = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
                SqlConnection con2 = new SqlConnection(conn2);
                TextBox textPrice = e.Item.FindControl("TextBox1") as TextBox;
                Button butSendAlert = e.Item.FindControl("butSEnd") as Button;
                Button ButAjax = e.Item.FindControl("Button1") as Button;
                ImageButton butSendCancel = e.Item.FindControl("ImageButton2") as ImageButton;



                SqlCommand cmd6 = new SqlCommand("Delete From Alert Where ProductID=" + e.CommandArgument.ToString() + "and Email ='" + Session["Email"] + "'", con2);

                con2.Open();
                SqlDataAdapter da1 = new SqlDataAdapter();
                da1.SelectCommand = cmd6;
                DataSet ds1 = new DataSet();
                da1.Fill(ds1);
                con2.Close();

                butSendAlert.Visible = true;
                butSendCancel.Visible = false;
                textPrice.Visible = true;
                ButAjax.Visible = true;

                con2.Close();
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Remove Alert True','','success').then((value) => { window.location ='WebForm3.aspx?id=" + e.CommandArgument.ToString() + "'; });", true);

            }






        }

        protected void but_Click(object sender, EventArgs e)
        {
            if (but.CommandName == "Email") // Edit Profile
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