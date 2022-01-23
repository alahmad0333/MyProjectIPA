using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyProjectIPA
{
    public partial class CheckPathAdmin : System.Web.UI.Page
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



        protected void Button10_Click(object sender, EventArgs e)
        {


            try
            {


                HtmlAgilityPack.HtmlWeb web = new HtmlAgilityPack.HtmlWeb();
                HtmlAgilityPack.HtmlDocument doc = web.Load(TextBox1.Text);



                var item = doc.DocumentNode.SelectSingleNode(TextBox2.Text);


                if (item == null || TextBox2.Text == null || TextBox2.Text == "")
                {

                    Label9.Text = "Oops! Document is null... must find out why!";
                }
                else
                {
                    string inputData = item.InnerText;

                    var data = Regex.Match(inputData, @"-?[0-9]+(\,[0-9]+)?").Value;
                    Label9.Text = data;



                    //string priceNumeric = "";


                    //for (int i = 0; i < data.Length; i++)
                    //{
                    //    string ch = data[i] + "";
                    //    bool isTrue = System.Text.RegularExpressions.Regex.IsMatch(ch, @"\d");

                    //    if (isTrue)
                    //    {
                    //        priceNumeric = priceNumeric + ch;
                    //    }
                    //}

                    //int priceInt = System.Convert.ToInt32(priceNumeric);

                    //Response.Write("Sum == " + priceInt);
                }





            }

            catch (Exception ex)
            {
                Label9.Text = ex.Message;
            }

        }

        protected void Butlong10_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            try
            {


                HtmlAgilityPack.HtmlWeb web = new HtmlAgilityPack.HtmlWeb();
                HtmlAgilityPack.HtmlDocument doc = web.Load(TextBox31.Text);



                var item = doc.DocumentNode.SelectSingleNode(TextBox41.Text).Attributes["href"];


                if (item == null || TextBox41.Text == null || TextBox41.Text == "")
                {

                    Label11.Text = "Oops! Document is null... must find out why!";
                }
                else
                {
                    string inputData = item.Value;

                    Label11.Text = inputData;

                }





            }

            catch (Exception ex)
            {
                Label9.Text = ex.ToString();
            }
        }
    }
  
}