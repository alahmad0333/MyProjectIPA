using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyProjectIPA
{
    public partial class PageAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string conn = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            TextBox8.ReadOnly = true;
            SqlCommand com2 = new SqlCommand("select max(ProductID) from Product", con);
            SqlDataReader dr = com2.ExecuteReader();
            dr.Read();
            int Pid = Convert.ToInt32(dr[0]);
            Pid++;
            TextBox8.Text = Pid.ToString();

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



        protected void Button4_Click(object sender, EventArgs e)
        {

            try
            {

                string path = $@"imgs/{TextBox1.Text}";
                string newpath = path;

                Directory.CreateDirectory(path);
                newpath = $@"{newpath}\{FileUpload1.FileName.ToString()}";
                FileUpload1.PostedFile.SaveAs(newpath);



                string conn = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
                SqlConnection con = new SqlConnection(conn);
                var ProductID = TextBox8.Text;
                var Nname = TextBox1.Text;
                var CategoryID = DropDownList1.Text;
                var ImgFile = "imgs/" + TextBox1.Text + "/" + FileUpload1.FileName.ToString();
                var linkebay = TextBox3.Text;
                var linkamazon = TextBox2.Text;
                var linknewegg = TextBox4.Text;
                var linknoon = TextBox5.Text;
                var Review = TextBox9.Text;
                var rating = TextBox10.Text;


                SqlCommand com1 = new SqlCommand("insert into Product (ProductID , Name , CategoryID  , linkebay,linkamazon,linkNewegg,linknoon,ImgFile,Review,rating)" +
                    " values(@ProductID , @Name , @CategoryID , @linkebay ,@linkamazon ,@linkNewegg,@linknoon ,@ImgFile,@Review,@rating )", con);
                com1.Parameters.AddWithValue("@ProductID", ProductID);
                com1.Parameters.AddWithValue("@Name", Nname);
                com1.Parameters.AddWithValue("@CategoryID", CategoryID);
                com1.Parameters.AddWithValue("@ImgFile", ImgFile);
                com1.Parameters.AddWithValue("@linkebay", linkebay);
                com1.Parameters.AddWithValue("@linkamazon", linkamazon);
                com1.Parameters.AddWithValue("@linkNewegg", linknewegg);
                com1.Parameters.AddWithValue("@linknoon", linknoon);
                com1.Parameters.AddWithValue("@Review", Review);
                com1.Parameters.AddWithValue("@rating", rating);




                con.Open();

                con.Close();

                con.Open();
                com1.ExecuteNonQuery();

                con.Close();

                ClientScript.RegisterClientScriptBlock(this.GetType(), "k",
                    "swal('Product Added!' ,'' , 'success')", true);
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }

        }


    }
}