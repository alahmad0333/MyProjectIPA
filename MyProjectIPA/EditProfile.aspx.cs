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
    public partial class EditProfile : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                PopulateGridview();
            }

            string conn = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;
            SqlConnection con = new SqlConnection(conn);

            SqlCommand cmd = new SqlCommand("select FristName , LastName from Customer where Email =@em", con);
            cmd.Parameters.AddWithValue("@em", Session["Email"]);


            GridView1.Visible = false;



            SqlDataReader red;
            cmd.Connection = con;


            con.Open();

            if (Session["Email"] != null)
            {
                red = cmd.ExecuteReader();

                //admin.Visible = false;
                red.Read();
                Label1.Visible = true;
                Label1.Text = "Welcome" + " " + red["FristName"].ToString() + " " + red["LastName"].ToString();
                Butlong10.Text = "Logout";
                con.Close();

                SqlCommand cmd1 = new SqlCommand("SELECT COUNT(Email) from wishlist WHERE Email='" + Session["Email"].ToString() + "'", con);
                //cmd1.Parameters.AddWithValue("email", Session["Email"].ToString());
                con.Open();
                int count = Convert.ToInt32(cmd1.ExecuteScalar());
                cmd1.Dispose();
                con.Close();
                lblcart.Text = count.ToString();


                //lblcart.Text = ds.Tables[0].Rows[0]["totalRow"].ToString();
                con.Close();

                GridView1.Visible = true;


            }
            else
            {

                con.Close();
            }



        }

        protected void Butlong_Click1(object sender, EventArgs e)
        {

            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Login.aspx");

        }



        void PopulateGridview()
        {
            try
            {
                DataTable dtbl = new DataTable();

                SqlConnection con1 = new SqlConnection(conn);

                con1.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Customer where id =" + Request.QueryString["id"].ToString(), con1);
                sqlDa.Fill(dtbl);

                if (dtbl.Rows.Count > 0)
                {
                    GridView1.DataSource = dtbl;
                    GridView1.DataBind();
                }
                else
                {
                    dtbl.Rows.Add(dtbl.NewRow());
                    GridView1.DataSource = dtbl;
                    GridView1.DataBind();
                    GridView1.Rows[0].Cells.Clear();
                    GridView1.Rows[0].Cells.Add(new TableCell());
                    GridView1.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                    GridView1.Rows[0].Cells[0].Text = "No Data Found ..!";
                    GridView1.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                }
            }
            catch
            {

            }

        }


        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            PopulateGridview();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            PopulateGridview();
        }



        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(conn);
                string query = "UPDATE Customer SET FristName=@FristName , LastName=@LastName, Email=@Email, Password =@Password where id =" + Request.QueryString["id"].ToString();
                con.Open();
                SqlCommand sqlCmd = new SqlCommand(query, con);
                sqlCmd.Parameters.AddWithValue("@FristName", (GridView1.Rows[e.RowIndex].FindControl("txtfname") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@LastName", (GridView1.Rows[e.RowIndex].FindControl("txtlname") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@Email", (GridView1.Rows[e.RowIndex].FindControl("txtEmail") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@Password", (GridView1.Rows[e.RowIndex].FindControl("txtPass") as TextBox).Text.Trim());
                GridView1.EditIndex = -1;
                sqlCmd.ExecuteNonQuery();
                PopulateGridview();
                Session.Clear();
                Session.Abandon();
                Response.Redirect("~/Login.aspx");
            }
            catch
            { 
            }
        }


    }
}