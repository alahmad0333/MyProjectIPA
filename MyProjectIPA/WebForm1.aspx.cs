using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using HtmlAgilityPack;
using System.Text.RegularExpressions;
using System.Net.Mail;
using System.Net;
using System.Collections;


namespace MyProjectIPA
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                if (Request.QueryString["cat"] != null)
                {

                    DataList1.DataSourceID = null;
                    DataList1.DataSource = SqlDataSource1;
                    DataList1.DataBind();

                }

                //=============================== Alert =======================
                
                ArrayList listEmail = new ArrayList();
                ArrayList PriceAlert = new ArrayList();
                ArrayList Pid = new ArrayList();
                string conn4 = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
                SqlConnection conalert = new SqlConnection(conn4);

                conalert.Open();
                SqlCommand objCMD = new SqlCommand("SELECT Email,AlertSet,ProductID from Alert", conalert);
                SqlDataReader objDR;
                objDR = objCMD.ExecuteReader();
                if (objDR != null)
                    while (objDR.Read())
                    {
                        //fill arraylist
                        listEmail.Add(objDR["Email"]);
                        PriceAlert.Add(objDR["AlertSet"]);
                        Pid.Add(objDR["ProductID"]);
                        // Ruturn SqlCommand And Add in List

                    }


                for (int i = 0; i < listEmail.Count; i++)
                {
                    // Loop add to list id and email , Price Alert And Esnd To Method SendAlertAouto()
                    var pid = Convert.ToString(Pid[i]);
                    SendAlertAouto(pid, listEmail[i].ToString());
                }
                //============================================================




                //============================= insert into wishlist if Email != null ================= 
                if (Request.QueryString["AddtoWish"] != null && Session["Email"] != null)
                {
                    // insert in Wishlist if Session["Email"] != null And Request.QueryString["AddtoWish"]
                    string conn2 = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
                    SqlConnection con2 = new SqlConnection(conn2);
                    con2.Open();
                    SqlCommand cmd2 = new SqlCommand("insert into wishlist (Email,ProductID) values('" + Session["Email"].ToString() + "','" + Request.QueryString["AddtoWish"].ToString() + "')", con2);
                    cmd2.ExecuteNonQuery();

                    ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Proudct Added in Wishlist','','success')", true);



                }
                if (Session["Email"] == null)
                {
                    // if Session = null 
                    if (Request.QueryString["addtowish"] != null)
                    {
                        // Show Error Maseagg 
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Login to your account frist. no product added in whislist')", true);
                    }

                }



            }


            string conn = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
            SqlConnection con = new SqlConnection(conn);

            SqlCommand cmd = new SqlCommand("select FristName , LastName from Customer where Email =@em", con);
            cmd.Parameters.AddWithValue("@em", Session["Email"]);





            SqlDataReader red;
            cmd.Connection = con;


            con.Open();

            if (Session["Email"] != null)
            {

                // Count Wishlist  -  Login 
                red = cmd.ExecuteReader();

                red.Read();
                Label1.Visible = true;
                Label1.Text = "Welcome" + " " + red["FristName"].ToString() + " " + red["LastName"].ToString();
                Butlong10.Text = "Logout";
                con.Close();

                SqlCommand cmd1 = new SqlCommand("SELECT COUNT(Email) from wishlist WHERE Email='" + Session["Email"].ToString() + "'", con);
                con.Open();
                int count = Convert.ToInt32(cmd1.ExecuteScalar());
                cmd1.Dispose();
                con.Close();
                lblcart.Text = count.ToString();


                con.Close();


            }
            else
            {

                con.Close();
            }

            // Saerch 
            if (Request.QueryString["cat"] == null && Request.QueryString["Search"] != null)
            {
                SqlCommand cmd3 = new SqlCommand("select * from Product Where Name like ('%@name%')", con);
                cmd3.Parameters.AddWithValue("@name", Request.QueryString["Search"].ToString());
                con.Open();
                cmd3.ExecuteNonQuery();
                con.Close();
            }

        }


        // Logout Session To Null
        protected void Butlong_Click1(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }





        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {



            if (e.CommandName == "Reomve") //When Click Button hart Reomve
            {

                // Remove To Wishlist 

                    string conn2 = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
                    SqlConnection con2 = new SqlConnection(conn2);
                    ImageButton butwish = e.Item.FindControl("imgwishlist") as ImageButton;
                    ImageButton beteneble = e.Item.FindControl("ImageButton6") as ImageButton;
                    Label lb = e.Item.FindControl("Label2") as Label;

                    SqlCommand cmd3 = new SqlCommand("Delete from wishlist where ProductID=" + e.CommandArgument.ToString() + "and Email ='" + Session["Email"] + "'", con2);
                    con2.Open();
                    SqlDataAdapter da1 = new SqlDataAdapter();
                    da1.SelectCommand = cmd3;
                    DataSet ds1 = new DataSet();
                    da1.Fill(ds1);
                    con2.Close();


                    beteneble.Visible = false;
                    butwish.Visible = true;

                     ScriptManager.RegisterStartupScript(this, this.GetType(),"alert","swal('Proudct Reomve From Wishlist','','success').then((value) => { window.location ='WebForm1.aspx'; });", true);

                     lb.Text = "Click To Add in WishList";

                }


                // Redirect To WishList 
             if (e.CommandName == "AddtoWish") //When Click Button hart
             {
                 Response.Redirect("~/WebForm1.aspx?AddtoWish=" + e.CommandArgument.ToString());
             }





            if (e.CommandName == "View") // When Click Button Looking For Best Price
            {
                // 
                 string conn1 = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
                 SqlConnection con1 = new SqlConnection(conn1);
                 SqlCommand cmd1 = new SqlCommand("SELECT linkamazon FROM Product where ProductID = @id", con1);
                 cmd1.Parameters.AddWithValue("id", e.CommandArgument.ToString()); /* e.CommandArgument = ProudctID from DataList  */
                SqlDataReader red1;
                 con1.Open();
                 red1 = cmd1.ExecuteReader();
                 red1.Read();
                 red1["linkamazon"].ToString();
                 GetPricEAmazon(red1["linkamazon"].ToString(), e.CommandArgument.ToString()); /* Send To Method Amazoan  */
                    con1.Close();




                string conn2 = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
                SqlConnection con2 = new SqlConnection(conn2);
                SqlCommand cmd2 = new SqlCommand("SELECT linkebay FROM Product where ProductID = @id", con2);
                cmd2.Parameters.AddWithValue("id", e.CommandArgument.ToString()); /* e.CommandArgument = ProudctID from DataList  */
                SqlDataReader red2;
                con2.Open();
                red2 = cmd2.ExecuteReader();
                red2.Read();
                red2["linkebay"].ToString();
                GetPricEEbay(red2["linkebay"].ToString(), e.CommandArgument.ToString()); /* Send To Method Ebay  */
                con2.Close();



                string conn3 = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
                SqlConnection con3 = new SqlConnection(conn3);
                SqlCommand cmd3 = new SqlCommand("SELECT linkNewegg FROM Product where ProductID = @id", con3);
                cmd3.Parameters.AddWithValue("id", e.CommandArgument.ToString()); /* e.CommandArgument = ProudctID from DataList  */
                SqlDataReader red3;
                con3.Open();
                red3 = cmd3.ExecuteReader();
                red3.Read();
                red3["linkNewegg"].ToString();
                GetPricENewEgg(red3["linkNewegg"].ToString(), e.CommandArgument.ToString()); /* Send To Method NewEgg  */
                con3.Close();




                string conn4 = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
                SqlConnection con4 = new SqlConnection(conn4);
                SqlCommand cmd4 = new SqlCommand("SELECT linknoon FROM Product where ProductID = @id", con4);
                cmd4.Parameters.AddWithValue("id", e.CommandArgument.ToString()); /* e.CommandArgument = ProudctID from DataList  */
                SqlDataReader red4;
                con4.Open();
                red4 = cmd4.ExecuteReader();
                red4.Read();
                red4["linknoon"].ToString();
                GetPricENoon(red4["linknoon"].ToString(), e.CommandArgument.ToString()); /* Send To Method Noon  */
                con4.Close();




                Response.Redirect("~/WebForm3.aspx?id=" + e.CommandArgument.ToString()); /* Redirect To Page Prouduct By Id  */
            }
        }





        // Method SendAlertError For All Method
        public void SendAlertError(string ex , string CommandArgument , string NameMethod)
        {
            //MailMessage mm = new MailMessage("bestpriceipa@gmail.com", "az6741a@gmail.com");
            //mm.Subject = "GetPricENoon";
            //mm.Body = string.Format($" Error Page :<h1> " + NameMethod + " </h1>   <br/><br/>  <h3> ProductID: " + CommandArgument + " </h3>  <br/><br/> <h3> Massege Error:</h3> </br> <p>" + ex + "</p>");
            //mm.IsBodyHtml = true;
            //SmtpClient smtp = new SmtpClient();
            //smtp.Host = "smtp.gmail.com";
            //smtp.EnableSsl = true;
            //NetworkCredential nc = new NetworkCredential();
            //nc.UserName = "bestpriceipa@gmail.com";
            //nc.Password = "Aa1122334455";
            //smtp.UseDefaultCredentials = true;
            //smtp.Credentials = nc;
            //smtp.Port = 587;
            //smtp.Send(mm);
            //smtp.ServicePoint.ConnectionLeaseTimeout = 1;
            //smtp.ServicePoint.MaxIdleTime = 1;


            MailMessage m = new MailMessage();
            SmtpClient sc = new SmtpClient();
            m.From = new MailAddress("az6741a@gmail.com");
            m.Subject = "Alert BestPrice";
            m.Body = string.Format($" Error Page :<h1> " + NameMethod + " </h1>   <br/><br/>  <h3> ProductID: " + CommandArgument + " </h3>  <br/><br/> <h3> Massege Error:</h3> </br> <p>" + ex + "</p>"); sc.Host = "smtp.gmail.com";
            string str1 = "gmail.com";
            string str2 = m.Body.ToLower();
            if (str2.Contains(str1))
            {
                try
                {
                    sc.Port = 587;
                    sc.Credentials = new System.Net.NetworkCredential("bestpriceipa@gmail.com", "Aa1122334455");
                    sc.EnableSsl = true;
                    sc.Send(m);
                }
                catch (Exception)
                {
                }
            }










        }



        // Method Send Name Proudct And Price Drop And Email(Customer)
        public void SendAlert(string NameP, string Price, string Email)
        {
            //MailMessage mm = new MailMessage("bestpriceipa@gmail.com", Email);
            //mm.Subject = "Alert BestPrice";
            //mm.Body = string.Format($" Alert :<h1>" + "Price Drop To :" + Price + "$" + " </h1>   <br/><br/>  <h3> ProductName: " + NameP + " </h3>  <br/><br/> <h3></h3> </br> <p> </p>");
            //mm.IsBodyHtml = true;
            //SmtpClient smtp = new SmtpClient();
            //smtp.Host = "smtp.gmail.com";
            //smtp.EnableSsl = true;
            //NetworkCredential nc = new NetworkCredential();
            //nc.UserName = "bestpriceipa@gmail.com";
            //nc.Password = "Aa1122334455";
            //smtp.UseDefaultCredentials = true;
            //smtp.Credentials = nc;
            //smtp.Port = 587;
            //smtp.Send(mm);
            //smtp.ServicePoint.ConnectionLeaseTimeout = 1;
            //smtp.ServicePoint.MaxIdleTime = 1;








            MailMessage m = new MailMessage();
            SmtpClient sc = new SmtpClient();
            m.From = new MailAddress(Email);
            m.Subject = "Alert BestPrice";
            m.Body = string.Format($" Alert :<h1>" + "Price Drop To :" + Price + "$" + " </h1>   <br/><br/>  <h3> ProductName: " + NameP + " </h3>  <br/><br/> <h3></h3> </br> <p> </p>");
            sc.Host = "smtp.gmail.com";
            string str1 = "gmail.com";
            string str2 = m.Body.ToLower();
            if (str2.Contains(str1))
            {
                try
                {
                    sc.Port = 587;
                    sc.Credentials = new System.Net.NetworkCredential("bestpriceipa@gmail.com", "Aa1122334455");
                    sc.EnableSsl = true;
                    sc.Send(m);
                }
                catch (Exception)
                {
                }
            }




        }


        // Send Alert To User
        void SendAlertAouto(string id , string Email)
        {


                string conn = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
                SqlConnection con = new SqlConnection(conn);


                SqlCommand cmd1 = new SqlCommand("SELECT Price from Product  WHERE ProductID=" + id, con);
                con.Open();
                decimal count = Convert.ToDecimal(cmd1.ExecuteScalar());
                // Ressult Query  
                cmd1.Dispose();
                con.Close();

                
                SqlCommand cmd2 = new SqlCommand("SELECT Price2 from Product  WHERE ProductID=" + id, con);
                con.Open();
                 decimal count2 = Convert.ToDecimal(cmd2.ExecuteScalar());
                // Ressult Query  
                cmd2.Dispose();
                con.Close();


                 SqlCommand cmd3 = new SqlCommand("SELECT Price3 from Product  WHERE ProductID=" + id, con);
                 con.Open();
                 decimal count3 = Convert.ToDecimal(cmd3.ExecuteScalar());
                 cmd3.Dispose();
                 con.Close();


                SqlCommand cmd4 = new SqlCommand("SELECT Price4 from Product  WHERE ProductID=" + id, con);
                con.Open();
                decimal count4 = Convert.ToDecimal(cmd2.ExecuteScalar());
                cmd4.Dispose();
                con.Close();



                decimal[] Prices = { count, count2, count3, count4 }; // All Price For Proudct Add in Array decimal


                int len = 0;
                for (int i = 0; i < Prices.Length; i++) // Check Price if = 0 Reomve To Array 
                {
                    if (Prices[i] != 0)
                        len++;
                }


                decimal[] newArray = new decimal[len]; // Rutern New Array 
                for (int i = 0, j = 0; i < Prices.Length; i++)
                {
                    if (Prices[i] != 0)
                    {
                        newArray[j] = Prices[i];
                        j++;
                    }
                }



                // Rutrn Price Set Alert
                SqlCommand cmd6 = new SqlCommand("SELECT AlertSet from Alert  WHERE ProductID=" + id, con);
                con.Open();
                int alert = Convert.ToInt32(cmd6.ExecuteScalar());
                cmd6.Dispose();
                con.Close();


                SqlCommand cmd7 = new SqlCommand("SELECT Name from Product WHERE ProductID=" + id, con);
                con.Open();
                string NameProudct = Convert.ToString(cmd7.ExecuteScalar());
                cmd7.Dispose();
                con.Close();


                if (alert <= newArray.Min()) // if alert <=  newArray.Min() Send Alert To User 
                {
                    SendAlert(NameProudct, newArray.Min().ToString(), Email.ToString()); // Add NameProudct , newArray.Min() , To Email 
                }
            



        }















        //Method eEBAY
        public void GetPricEEbay(string URL, string idProduct)
        {
            try
            {

                HtmlAgilityPack.HtmlWeb web = new HtmlAgilityPack.HtmlWeb(); //HtmlAgilityPack
                HtmlAgilityPack.HtmlDocument doc = web.Load(URL); // Url WebSite


                var item = doc.DocumentNode.SelectSingleNode("//*[@class='notranslate']"); // Name Class Price in Website

                string conn = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
                SqlConnection con = new SqlConnection(conn);
                string str = "UPDATE Product SET  Price3=@Price WHERE ProductID=@id"; // Query String (UPDATE) Price


                SqlCommand cmd_Updat_Auth = new SqlCommand(str, con);

                cmd_Updat_Auth.Parameters.AddWithValue("id", idProduct);
                string inputdata = item.InnerText;
                var data = Regex.Match(inputdata, @"(?:\d{1,3}(?:,\d{3})*|\d+)(?:\.\d{1,2})?(?!\.?\d)").Value; // Ruturn only Number
                var x = Convert.ToDecimal(data); // Convert ToDecimal

                cmd_Updat_Auth.Parameters.AddWithValue("Price", x);
                con.Open();
                cmd_Updat_Auth.ExecuteNonQuery(); // Add Price To Databaes
                con.Close();
            }

            catch (Exception ex)
            {
                SendAlertError(ex.Message, idProduct, "PricEEbay"); // if Error in Method Send To Admin Email
            }

        }







        //Method Amazon


        public void GetPricEAmazon(string URL, string idProduct)
        {
            try
            {


                HtmlAgilityPack.HtmlWeb web = new HtmlAgilityPack.HtmlWeb();
                HtmlAgilityPack.HtmlDocument doc = web.Load(URL);

                var item = doc.DocumentNode.SelectSingleNode("//*[@class='a-price a-text-price a-size-medium apexPriceToPay']");

                string conn = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
                SqlConnection con = new SqlConnection(conn);
                string str = "UPDATE Product SET  Price=@Price/3.75 WHERE ProductID=@id";

                SqlCommand cmd_Updat_Auth = new SqlCommand(str, con);
                cmd_Updat_Auth.Parameters.AddWithValue("id", idProduct);

                string inputData = item.InnerText;
                var data = Regex.Match(inputData, @"(?:\d{1,3}(?:,\d{3})*|\d+)(?:\.\d{1,2})?(?!\.?\d)").Value;
                var x = Convert.ToDecimal(data);
                cmd_Updat_Auth.Parameters.AddWithValue("Price", x);
                con.Open();
                cmd_Updat_Auth.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {
                SendAlertError(ex.Message, idProduct, "PricEAmazon");

            }
        }












        //Method  NewEgg

        public void GetPricENewEgg(string URL, string idProduct)
        {
            try
            {

                HtmlAgilityPack.HtmlWeb web = new HtmlAgilityPack.HtmlWeb();
                HtmlAgilityPack.HtmlDocument doc = web.Load(URL);


                var item = doc.DocumentNode.SelectSingleNode("//*[@class='price-current']");

                string conn = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
                SqlConnection con = new SqlConnection(conn);
                string str = "UPDATE Product SET  Price2=@Price WHERE ProductID=@id";
                SqlCommand cmd_Updat_Auth = new SqlCommand(str, con);

                //cmd_Updat_Auth.Parameters.AddWithValue("iPhone 12 Pro Max", "3");

                cmd_Updat_Auth.Parameters.AddWithValue("id", idProduct);
                string inputData = item.InnerText;
                var data = Regex.Match(inputData, @"(?:\d{1,3}(?:,\d{3})*|\d+)(?:\.\d{1,2})?(?!\.?\d)").Value;

                cmd_Updat_Auth.Parameters.AddWithValue("Price", data);
                con.Open();
                cmd_Updat_Auth.ExecuteNonQuery();
                con.Close();
            }

            catch (Exception ex)
            {

                SendAlertError(ex.Message, idProduct, "PricENewEgg");



            }

        }









        public void GetPricENoon(string URL, string idProduct)
        {
            try
            {

                HtmlAgilityPack.HtmlWeb web = new HtmlAgilityPack.HtmlWeb();
                HtmlAgilityPack.HtmlDocument doc = web.Load(URL);


                var item = doc.DocumentNode.SelectSingleNode("//*[@class='priceNow']");

                string conn = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
                SqlConnection con = new SqlConnection(conn);
                string str = "UPDATE Product SET Price4 = @Price/3.75 FROM Product WHERE ProductID = @id";
                SqlCommand cmd_Updat_Auth = new SqlCommand(str, con);



                cmd_Updat_Auth.Parameters.AddWithValue("id", idProduct);
                string inputData = item.InnerText;


                var data = Regex.Match(inputData, @"(?:\d{1,3}(?:,\d{3})*|\d+)(?:\.\d{1,2})?(?!\.?\d)").Value;
                var x = Convert.ToDecimal(data);
                cmd_Updat_Auth.Parameters.AddWithValue("Price", x);
                con.Open();
                cmd_Updat_Auth.ExecuteNonQuery();
                con.Close();



            }

            catch (Exception ex)
            {

                SendAlertError(ex.Message, idProduct, "PricENoon");


            }

        }







        //============================ if click To imgButton Categories  ===================================


        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("WebForm1.aspx?cat=TV");
        }

        protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("WebForm1.aspx?cat=PC");
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("WebForm1.aspx?cat=TV");

        }

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("WebForm1.aspx?cat=Video game");
        }

        protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("WebForm1.aspx?cat=Mobile");
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("WebForm1.aspx?cat=Video game");

        }

        //==================================================================================================




        protected void Button99_Click(object sender, EventArgs e)
        {
            //string conn1 = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
            //SqlConnection con1 = new SqlConnection(conn1);
            //var x = TextBox1.Text;
            //SqlCommand cmd = new SqlCommand("select * from Product Where Name like'%@Name%') ",con1);
            //cmd.Parameters.AddWithValue("@Name",x);
            //DataList1.DataSourceID = null;
            //DataList1.DataSource = cmd;
            //DataList1.DataBind();
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (Session["Email"] != null)
            {
                string conn2 = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
                SqlConnection con2 = new SqlConnection(conn2);
                ImageButton butwish = e.Item.FindControl("imgwishlist") as ImageButton;
                ImageButton beteneble = e.Item.FindControl("ImageButton6") as ImageButton;

                Label lableid1 = e.Item.FindControl("lpid") as Label;
                Label lb = e.Item.FindControl("Label2") as Label;

                SqlCommand cmd2 = new SqlCommand("Select * from wishlist where ProductID=" + lableid1.Text + "and Email ='" + Session["Email"] + "'", con2); // if Check Wishlist Added
                con2.Open();
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd2;
                DataSet ds = new DataSet();
                da.Fill(ds);
                con2.Close();

                if (ds.Tables[0].Rows.Count > 0 ) // Yes Added To WishList
                {
                    lb.Text = "Already in WishList";
                    beteneble.Visible =true;
                    butwish.Visible = false;
                   
                }
                else // No 
                {

                    lb.Text = "Click To Add in WishList";
                    beteneble.Visible = false;
                    butwish.Visible = true;
                }
                con2.Close();


            }

            else // if Email Session = null
            {
                ImageButton butwish = e.Item.FindControl("imgwishlist") as ImageButton;
                Label lb = e.Item.FindControl("Label2") as Label;
                lb.Text = "Click To Add in WishList";
                butwish.ImageUrl = "~/icon Store/heart.png";

            }


        }

        protected void ImageButton4_Click1(object sender, ImageClickEventArgs e)
        {
            if (Session["Email"] != null) // if click To Button WishList
            {
                Response.Redirect("wishlist.aspx"); // Redirect To Page WishList
            }
            else
            {
                Response.Redirect("Login.aspx"); // if Email = Null Redirect To Page Login

            }
        }

        protected void Label1_Click(object sender, EventArgs e)
        {
            if (Label1.CommandName == "Email") // Edit Profile
            {

                string conn2 = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
                SqlConnection con = new SqlConnection(conn2);

                SqlCommand cmd1 = new SqlCommand("SELECT id from Customer WHERE Email='" + Session["Email"].ToString() + "'", con); // Send id Customer To Page Edit Profile

                con.Open();
                int id = Convert.ToInt32(cmd1.ExecuteScalar());
                cmd1.Dispose();
                con.Close();
                id.ToString();

                Response.Redirect("EditProfile.aspx?id=" + id.ToString()); // Add id To Page Edit Profile

            }
        }
    }
}