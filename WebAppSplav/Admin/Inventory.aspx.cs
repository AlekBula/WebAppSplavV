using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppSplav.Admin
{
    public partial class Inventory : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["breadCrum"] = "Product";
                if (Session["admin"] == null)
                {
                    Response.Redirect("../Log/Loggin.aspx");
                }
                else
                {
                    getProducts();
                }
                lblMsg.Visible = false;
            }
        }

        protected void btnAddOrUpdate_Click(object sender, EventArgs e)
        {
            string actoinName = string.Empty, imagePath = string.Empty,  fileExtension = string.Empty;
            bool isValidToExecute = false;
            int productId = Convert.ToInt32(hdnId.Value);
            con = new SqlConnection(Connetion.GetConnectionString());
            cmd = new SqlCommand("Product_Crud", con);
            cmd.Parameters.AddWithValue("@Action", productId == 0 ? "INSERT" : "UPDATE");
            cmd.Parameters.AddWithValue("@ProductId", productId);
           
            cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
            cmd.Parameters.AddWithValue("@Number", txtNumber.Text.Trim());
            cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
            cmd.Parameters.AddWithValue("@CategoryId", ddlCategories.SelectedValue);
            cmd.Parameters.AddWithValue("@IsActiveStatusSost", cbIsActiveStatus.Checked);
            cmd.Parameters.AddWithValue("@IsActiveStatus", cbIsActiveStatusSost.Checked);
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
            if (string.IsNullOrWhiteSpace(txtName.Text))
            {
                
                isValidToExecute = true;
            }
            else {
                isValidToExecute = true;
            }

            if (isValidToExecute)
            {
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    actoinName = productId == 0 ? "inserted" : "updated";
                    lblMsg.Visible = true;
                    lblMsg.Text = "Product" + actoinName + " successful!";
                    lblMsg.CssClass = "alert alert-success";
                    getProducts();
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
       


        private void getProducts()
        {
            con = new SqlConnection(Connetion.GetConnectionString());
            cmd = new SqlCommand("Product_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "SELECT");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rProduct.DataSource = dt;
            rProduct.DataBind();
        }

        private void clear()
        {
            txtNumber.Text = string.Empty;
            txtName.Text = string.Empty;
            txtDescription.Text = string.Empty;
            ddlCategories.ClearSelection();
            cbIsActiveStatus.Checked = false;
            cbIsActiveStatusSost.Checked = false;
            hdnId.Value = "0";
            btnAddOrUpdate.Text = "Add";
           
        }


        protected void btnClear_Click(object sender, EventArgs e)
        {
            clear();
        }

        protected void rProduct_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            lblMsg.Visible = false;
            con = new SqlConnection(Connetion.GetConnectionString());
            if (e.CommandName == "edit")
            {

                cmd = new SqlCommand("Product_Crud", con);
                cmd.Parameters.AddWithValue("@Action", "@GETBYID");
                cmd.Parameters.AddWithValue("@ProductId", e.CommandArgument);
                cmd.CommandType = CommandType.StoredProcedure;
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                txtNumber.Text = dt.Rows[0]["Number"].ToString();
                txtName.Text = dt.Rows[0]["Name"].ToString();
                
                txtDescription.Text = dt.Rows[0]["Description"].ToString();
               
                ddlCategories.SelectedValue = dt.Rows[0]["CategoryId"].ToString();
                cbIsActiveStatus.Checked = Convert.ToBoolean(dt.Rows[0]["IsActiveStatus"]);
                cbIsActiveStatusSost.Checked = Convert.ToBoolean(dt.Rows[0]["IsActiveStatusSost"]);

                hdnId.Value = dt.Rows[0]["ProductId"].ToString();
                btnAddOrUpdate.Text = "Update";
                LinkButton btn = e.Item.FindControl("lnkEdit") as LinkButton;
                btn.CssClass = "badge badge_warning";
            }
            else if (e.CommandName == "delete")
            {
                //con = new SqlConnection(Connetion.GetConnectionString());
                cmd = new SqlCommand("Product_Crud", con);
                cmd.Parameters.AddWithValue("@Action", "DELETE");
                cmd.Parameters.AddWithValue("@ProductId", e.CommandArgument);
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    lblMsg.Visible = true;
                    lblMsg.Text = "Product deleted successfully!";
                    lblMsg.CssClass = "alert alert-success";
                    getProducts();
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

        protected void rProduct_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lblIsActiveStatus = e.Item.FindControl("lblIsActiveStatus") as Label;
                Label lblIsActiveStatusSost = e.Item.FindControl("lblIsActiveStatusSost") as Label;
                //Label lblQuantity = e.Item.FindControl("lblQuantity") as Label;


                if (lblIsActiveStatus.Text == "True")
                {
                    lblIsActiveStatus.Text = "Занят";
                    lblIsActiveStatus.CssClass = "badge badge-seccess";
                    lblIsActiveStatusSost.Text = "В работе";
                    lblIsActiveStatus.CssClass = "badge badge-seccess";
                }
                else
                {

                    lblIsActiveStatus.Text = "Свободен";
                    lblIsActiveStatus.CssClass = "badge badge-danger";
                    lblIsActiveStatusSost.Text = "Готов к работе";
                    lblIsActiveStatusSost.CssClass = "badge badge-seccess";
                }
                //if (Convert.ToInt32(lblQuantity.Text) <= 5)
                //{
                //    lblQuantity.CssClass = "badge badge-danger";
                //    lblQuantity.ToolTip = "Item about to be 'Out of stock'!";
                //}
            }
        }

     
    }

     
    }
