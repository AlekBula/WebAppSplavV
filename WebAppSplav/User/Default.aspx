<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebAppSplav.User.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <script type="text/javascript">
        function openInNewTab() {
            window.document.forms[0].target = '_blank';
            setTimeout(function () { window.document.forms[0].target = ''; }, 0);
        }
    </script>

    

 <%-- <section class="offer_section layout_padding-bottom">
  
<h3 style="color: #0000FF">Open PDF files using ASP.NET</h3>
<div>
<asp:Button ID="btnpdf" runat="server"  Font-Bold="true" OnClick="btnpdf_Click" />
</div>

  </section>--%>

  <!-- end offer section -->


</asp:Content>
