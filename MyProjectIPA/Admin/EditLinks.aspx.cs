using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


namespace MyProjectIPA.Admin
{
    public partial class EditLinks : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["Data"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                PopulateGridview();
            }


            SqlConnection con = new SqlConnection(conn);

            Butlong10.Visible = false;
            //form1.Visible = true;
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




        void PopulateGridview()
        {
            DataTable dtbl = new DataTable();

            SqlConnection con1 = new SqlConnection(conn);

            con1.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Product", con1);
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

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("AddNew"))
                {

                    TextBox Id = GridView1.FooterRow.FindControl("txtIDFooter") as TextBox;
                    SqlConnection con = new SqlConnection(conn);
                    con.Open();
                    Id.ReadOnly = true;
                    SqlCommand com2 = new SqlCommand("select max(ProductID) from Product", con);
                    SqlDataReader dr = com2.ExecuteReader();
                    dr.Read();
                    int Pid = Convert.ToInt32(dr[0]);
                    Pid++;
                    Id.Text = Pid.ToString();
                    con.Close();

                    con.Open();
                    string query = "INSERT INTO Product (ProductID,Name,CategoryID,ImgFile,linkebay,linkamazon,linknoon,linkNewegg,Review,rating)" +
                    " VALUES (@ProductID,@Name,@CategoryID,@ImgFile,@linkebay,@linkamazon,@linkNewegg,@linknoon,@Review,@rating)";
                    SqlCommand sqlCmd = new SqlCommand(query, con);
                    sqlCmd.Parameters.AddWithValue("@ProductID", Id.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Name", (GridView1.FooterRow.FindControl("txtNameFooter") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@CategoryID", (GridView1.FooterRow.FindControl("drlCategoryIDFooter") as DropDownList).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@ImgFile", (GridView1.FooterRow.FindControl("txtImgFileFooter") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@linkebay", (GridView1.FooterRow.FindControl("txtlinkebayFooter") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@linkamazon", (GridView1.FooterRow.FindControl("txtlinkamazonFooter") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@linkNewegg", (GridView1.FooterRow.FindControl("txtlinkNeweggFooter") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@linknoon", (GridView1.FooterRow.FindControl("txtlinknoonFooter") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Review", (GridView1.FooterRow.FindControl("txtReviewFooter") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@rating", (GridView1.FooterRow.FindControl("txtratingFooter") as TextBox).Text.Trim());
                    sqlCmd.ExecuteNonQuery();
                    PopulateGridview();

                }
            }
            catch (Exception ex)
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
            SqlConnection con = new SqlConnection(conn);
            string query = "UPDATE Product SET Name=@Name,CategoryID=@CategoryID,ImgFile=@ImgFile,linkebay=@linkebay,linkamazon=@linkamazon,linknoon=@linknoon,linkNewegg=@linkNewegg,Review=@Review,rating=@rating Where ProductID=@id";
            con.Open();
            SqlCommand sqlCmd = new SqlCommand(query, con);
            sqlCmd.Parameters.AddWithValue("@Name", (GridView1.Rows[e.RowIndex].FindControl("txtName") as TextBox).Text.Trim());
            sqlCmd.Parameters.AddWithValue("@CategoryID", (GridView1.Rows[e.RowIndex].FindControl("drlCategoryID") as DropDownList).Text.Trim());
            sqlCmd.Parameters.AddWithValue("@ImgFile", (GridView1.Rows[e.RowIndex].FindControl("txtImgFile") as TextBox).Text.Trim());
            sqlCmd.Parameters.AddWithValue("@linkebay", (GridView1.Rows[e.RowIndex].FindControl("txtlinkebay") as TextBox).Text.Trim());
            sqlCmd.Parameters.AddWithValue("@linkamazon", (GridView1.Rows[e.RowIndex].FindControl("txtlinkamazon") as TextBox).Text.Trim());
            sqlCmd.Parameters.AddWithValue("@linkNewegg", (GridView1.Rows[e.RowIndex].FindControl("txtlinkNewegg") as TextBox).Text.Trim());
            sqlCmd.Parameters.AddWithValue("@linknoon", (GridView1.Rows[e.RowIndex].FindControl("txtlinknoon") as TextBox).Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Review", (GridView1.Rows[e.RowIndex].FindControl("txtReview") as TextBox).Text.Trim());
            sqlCmd.Parameters.AddWithValue("@rating", (GridView1.Rows[e.RowIndex].FindControl("txtrating") as TextBox).Text.Trim());
            sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()));
            GridView1.EditIndex = -1;

            sqlCmd.ExecuteNonQuery();
            PopulateGridview();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            SqlConnection con = new SqlConnection(conn);

            con.Open();
            string query = "DELETE FROM Product WHERE ProductID = @id";
            SqlCommand sqlCmd = new SqlCommand(query, con);
            sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()));
            sqlCmd.ExecuteNonQuery();
            PopulateGridview();

        }
    }
}