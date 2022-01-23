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
    public partial class test2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnTest_Click(object sender, EventArgs e)
        {

            //    if (Session["Email"] != null)
            //    {



            //        SqlDataReader red;
            //        cmd.Connection = con;
            //        con.Open();
            //        red = cmd.ExecuteReader();
            //        red.Read();



            //        SqlCommand com1 = new SqlCommand("insert into Comment (Name , comment,Pid,Email)" +
            //        " values(@name , @comment,@Pid,@Email)", con);
            //        com1.Parameters.AddWithValue("@comment", textbox);
            //        com1.Parameters.AddWithValue("@name", red["FristName"].ToString() + " " + red["LastName"].ToString());
            //        com1.Parameters.AddWithValue("@Pid", Request.QueryString["id"]);
            //        com1.Parameters.AddWithValue("@Email", Session["Email"].ToString());

            //        con.Close();


            //        con.Open();
            //        com1.ExecuteNonQuery();
            //        con.Close();


            //        if ((Session["Email"] == null))
            //        {
            //            ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Login to your account frist')", true);

            //        }
            //        else if (textbox == "")
            //        {
            //            ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Empty Comment')", true);
            //        }

            //    }
            //}
        }
    }
}