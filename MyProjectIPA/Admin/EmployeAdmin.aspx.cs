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
    public partial class EmployeAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string conn = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            TextBox8.ReadOnly = true;
            SqlCommand com2 = new SqlCommand("select max(id) from Employe", con);
            SqlDataReader dr = com2.ExecuteReader();
            dr.Read();
            int Pid = Convert.ToInt32(dr[0]);
            Pid++;
            TextBox8.Text = Pid.ToString();

            con.Close();

            form1.Visible = false;

            if (DropDownList1.SelectedIndex == 1)
            {
                GridView1.Visible = true;
                Table.Visible = false;
            }

            else if (DropDownList1.SelectedIndex == 2)
            {
                GridView1.Visible = false;
                Table.Visible = true;
            }
            else
            {
                GridView1.Visible = false;
                Table.Visible = false;
            }



            try
            {


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
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(),
                "alert",
                "swal('" + ex.Message + "','','info').then((value) => { window.location ='WebForm1.aspx'; });",
                true);

            }




        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            try
            {

                string conn = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
                SqlConnection con = new SqlConnection(conn);
                var id = TextBox8.Text;
                var Nname = TextBox1.Text;
                var Password = TextBox4.Text;
                var Email = TextBox5.Text;


                SqlCommand com1 = new SqlCommand("insert into Employe ( Name , Password  , Email)" +
                    " values( @Name , @Password , @Email)", con);
                com1.Parameters.AddWithValue("@Name", Nname);
                com1.Parameters.AddWithValue("@Password", Password);
                com1.Parameters.AddWithValue("@Email", Email);

                con.Open();

                con.Close();

                con.Open();
                com1.ExecuteNonQuery();
                Label1.Text = "Done !";
                Label1.ForeColor = System.Drawing.Color.Blue;
                con.Close();


                ScriptManager.RegisterStartupScript(this, this.GetType(),
                "alert",
                "swal('Employee Added','','success').then((value) => { window.location ='EmployeAdmin.aspx'; });",
                true);

            }
            catch (Exception ex)
            {
                Response.Write(ex);
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