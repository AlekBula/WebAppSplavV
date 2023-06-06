using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace WebAppSplav.Admin
{
    public partial class Peremesto : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                Session["breadCrum"] = "Mesto";
                if (Session["admin"] == null)
                {
                    Response.Redirect("../Log/Loggin.aspx");
                }
                else
                {
                    getMestos();
                }
                lblMsg.Visible = false;
            }
        }
        protected void btnAddOrUpdate_Click(object sender, EventArgs e)
        {
            string actoinName = string.Empty,  fileExtension = string.Empty;
            bool isValidToExecute = false;
            int mestoId = Convert.ToInt32(hdnId.Value);
            con = new SqlConnection(Connetion.GetConnectionString());
            cmd = new SqlCommand("Mesto_Crud", con);
            cmd.Parameters.AddWithValue("@Action", mestoId == 0 ? "INSERT" : "UPDATE");
            cmd.Parameters.AddWithValue("@MestoId", mestoId);
            cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
            cmd.Parameters.AddWithValue("@ProductId", ddlProducts.SelectedValue);
          
            //if (fuProductImage.HasFile)
            //{
            //    if (Utils.IsValidExtension(fuProductImage.FileName))
            //    {
            //        Guid obj = Guid.NewGuid();
            //        fileExtension = Path.GetExtension(fuProductImage.FileName);
            //        imagePath = "Images/Product/" + obj.ToString() + fileExtension;
            //        fuProductImage.PostedFile.SaveAs(Server.MapPath("~/Images/Product/") + obj.ToString() + fileExtension);
            //        cmd.Parameters.AddWithValue("@ImageUrl", imagePath);
            //        isValidToExecute = true;
            //    }
            //    else
            //    {
            //        lblMsg.Visible = true;
            //        lblMsg.Text = "Please select .jpg, .jpeg or .png image";
            //        lblMsg.CssClass = "alert alert-danger";
            //        isValidToExecute = false;
            //    }
            //}
            //else
            //{
            //    isValidToExecute = true;
            //}
            if (string.IsNullOrWhiteSpace(txtDescription.Text))
            {

                isValidToExecute = true;
            }
            else
            {
                isValidToExecute = true;
            }

            if (isValidToExecute)
            {
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    actoinName = mestoId == 0 ? "inserted" : "updated";
                    lblMsg.Visible = true;
                    lblMsg.Text = "Mesto" + actoinName + " successful!";
                    lblMsg.CssClass = "alert alert-success";
                    getMestos();
                    clear();
                }
                catch (Exception ex)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Error-" + ex.Message;
                    lblMsg.CssClass = "alert alert-danger";
                }
                finally
                {
                    con.Close();
                }
            }
        }



        private void getMestos()
        {
            con = new SqlConnection(Connetion.GetConnectionString());
            cmd = new SqlCommand("Mesto_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "SELECT");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rMesto.DataSource = dt;
            rMesto.DataBind();
        }

        private void clear()
        {
            
           
            txtDescription.Text = string.Empty;
            ddlProducts.ClearSelection();
          
            hdnId.Value = "0";
            btnAddOrUpdate.Text = "Add";

        }


        protected void btnClear_Click(object sender, EventArgs e)
        {
            clear();
        }

        protected void rMesto_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            lblMsg.Visible = false;
            con = new SqlConnection(Connetion.GetConnectionString());
            if (e.CommandName == "edit")
            {

                cmd = new SqlCommand("Mesto_Crud", con);
                cmd.Parameters.AddWithValue("@Action", "@GETBYID");
                cmd.Parameters.AddWithValue("@MestoId", e.CommandArgument);
                cmd.CommandType = CommandType.StoredProcedure;
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
              
              

                txtDescription.Text = dt.Rows[0]["Description"].ToString();

                ddlProducts.SelectedValue = dt.Rows[0]["ProductId"].ToString();
              

                hdnId.Value = dt.Rows[0]["MestoId"].ToString();
                btnAddOrUpdate.Text = "Update";
                LinkButton btn = e.Item.FindControl("lnkEdit") as LinkButton;
                btn.CssClass = "badge badge_warning";
            }
            else if (e.CommandName == "delete")
            {
                //con = new SqlConnection(Connetion.GetConnectionString());
                cmd = new SqlCommand("Mesto_Crud", con);
                cmd.Parameters.AddWithValue("@Action", "DELETE");
                cmd.Parameters.AddWithValue("@MestoId", e.CommandArgument);
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    lblMsg.Visible = true;
                    lblMsg.Text = "Product deleted successfully!";
                    lblMsg.CssClass = "alert alert-success";
                    getMestos();
                }
                catch (Exception ex)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Error-" + ex.Message;
                    lblMsg.CssClass = "alert alert-danger";
                }
                finally
                {
                    con.Close();
                }
            }
        }

       
    }


}
