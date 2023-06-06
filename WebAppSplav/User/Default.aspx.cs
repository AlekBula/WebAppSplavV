using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using static System.Net.Mime.MediaTypeNames;
using System.Runtime.Remoting.Contexts;
using System.Net.Mime;
using System.Data.SqlClient;
using System.Data;

namespace WebAppSplav.User
{
    public partial class Default : System.Web.UI.Page
    {
        //SqlConnection con;
        //SqlCommand cmd;
        //SqlDataAdapter sda;
        //DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Session["userId"] == null)
                {

                    Response.Redirect("../Log/Loggin.aspx");
                }
                else
                {

                }
            }
        }
        //protected void btnpdf_Click(object sender, EventArgs e)
        //{
            
        //    string FilePath = Server.MapPath("Отчёт.pdf");
        //    WebClient User = new WebClient();
        //    Byte[] FileBuffer = User.DownloadData(FilePath);
        //    if (FileBuffer != null)
        //    {
        //        Response.ContentType = "application/pdf";
               
        //        Response.AddHeader("content - length", FileBuffer.Length.ToString());
        //        Response.BinaryWrite(FileBuffer);
        //    }
        //}
    }
}