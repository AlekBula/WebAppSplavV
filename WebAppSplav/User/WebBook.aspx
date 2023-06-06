<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="WebBook.aspx.cs" Inherits="WebAppSplav.User.WebBook" %>
<%@ Import Namespace="WebAppSplav" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <script type="text/javascript">
        function openInNewTab() {
            window.document.forms[0].target = '_blank';
            setTimeout(function () { window.document.forms[0].target = ''; }, 0);
        }
      </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">



      <section class="offer_section layout_padding-bottom">
          <div>
    <div class="offer_container">
      <div class="container ">
        <div class="row">
            <div class="col-md-6  ">
            <div class="box ">
              <div class="img-box">
                <img src="../TemplateFiles/images/4566.jpg" alt="">
              </div>
              <div class="detail-box">
                <h5>
                Руководство по тех.обслуживанию
                </h5>
                    <hr />
                  <hr />
             
               <asp:Button ID="btnpdfM" runat="server"  Font-Bold="true" OnClick="btnpdfM_Click"   Text="Читать"/> 
                  
              </div>
            </div>
          </div>
            
     
      
          <div class="col-md-6  ">
            <div class="box ">
              <div class="img-box">
                <img src="../TemplateFiles/images/4566.jpg" alt="">
              </div>
              <div class="detail-box">
                <h5>
                  Руководство пользователя
                </h5>
                    <hr />
                  <hr />
             
               <asp:Button ID="btnpdf" runat="server"  Font-Bold="true" OnClick="btnpdf_Click"   Text="Читать"/> 
                  
              </div>
            </div>
          </div>
        </div>    
       </div>
        </div></div> </section>
            <section class="offer_section layout_padding-bottom">
          <div>
           <div class="offer_container">
          <div class="container ">
           <div class="row">
              <div class="col-md-6  ">
            <div class="box ">
              <div class="img-box">
                <img src="../TemplateFiles/images/4566.jpg" alt="">
              </div>
              <div class="detail-box">
                <h5>
                  Руководство администратора
                </h5>
                    <hr />
                  <hr />
             
               <asp:Button ID="btnpdfA" runat="server"  Font-Bold="true"  OnClick="btnpdfA_Click"  Text="Читать"/> 
               </div>
            </div>
          </div>
            
       
            
              <div class="col-md-6  ">
            <div class="box ">
              <div class="img-box">
                <img src="../TemplateFiles/images/4566.jpg" alt="">
              </div>
              <div class="detail-box">
                <h5>
                  Справочник Нового Сотрудника
                </h5>
                    <hr />
                  <hr />
             
               <asp:Button ID="btnpdfCPR" runat="server"  Font-Bold="true" OnClick="btnpdfCPR_Click"  Text="Читать"/> 
                  
              </div>
            </div>
          </div>
          </div>
        </div>
     </div>
        </div>
         
  </section>



  


</asp:Content>
