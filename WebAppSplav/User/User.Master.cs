using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppSplav.User
{
    public partial class User : System.Web.UI.MasterPage
    {
        
            protected void Page_Load(object sender, EventArgs e) 
            {

            if (!Request.Url.AbsoluteUri.ToString().Contains("Default.aspx"))
            {
                form1.Attributes.Add("class", "sub_page");
            }
            else
            {
                form1.Attributes.Remove("class");
                //Local the control
                Control sliderUrerControl = (Control)Page.LoadControl("SliderUserControl.ascx");

                //pnlSliderUC.Controls.Add(sliderUrerControl);
            }
            if (Session["userId"] != null)
            {
                lblLoginOrLogout.Text = "Выйти";

            }
            else
            {
                lblLoginOrLogout.Text = "Войти";
            }
        }

        protected void lblLoginOrLogout_Click(object sender, EventArgs e)
        {
            if (Session["userId"] == null)
            {
                Response.Redirect("../Log/Loggin.aspx");
            }
            else
            {
                Session.Abandon();
                Response.Redirect("../Log/Loggin.aspx");
            }
        }
    }
    }
