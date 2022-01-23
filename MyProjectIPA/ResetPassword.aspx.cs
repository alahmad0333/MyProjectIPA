using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;

namespace MyProjectIPA
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SendPassword_Click(object sender, EventArgs e)
        {
            string connect = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
            SqlConnection con = new SqlConnection(connect);
            SqlCommand com1 = new SqlCommand("select Email,Password from Customer where Email=@em", con);
            com1.Parameters.AddWithValue("@em", Emailtext.Text);
            con.Open();
            SqlDataReader read = com1.ExecuteReader();
            if (read.Read())
            {
                string email = read["Email"].ToString();
                string password = read["Password"].ToString();

                //MailMessage mm = new MailMessage("bestpriceipa@gmail.com", Emailtext.Text);
                //mm.Subject = "Your password!";
                //mm.Body = string.Format("Hello : <h1>{0}</h1> <br/> Your password is <h1>{1}</h1>", email, password);
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



                MailMessage m = new MailMessage();
                SmtpClient sc = new SmtpClient();
                m.From = new MailAddress(Emailtext.Text);
                m.Subject = "Alert BestPrice";
                m.Body = string.Format("Hello : <h1>{0}</h1> <br/> Your password is <h1>{1}</h1>", email, password);
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










                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Your password has been sent to','"+Emailtext.Text+"','success')", true);


                con.Close();
            }
            else
            {
                con.Close();

                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('This Email is not exists in the database !','','error')", true);


            }

        }
    }
}