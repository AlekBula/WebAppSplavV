<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="WebAppSplav.Admin.Registration" %>
<%@ Import Namespace="WebAppSplav" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script>
        /*For disappearing alert message*/
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID %>").style.display = "none";
            }, seconds * 1000);
        };
    </script>
    <script>
        function ImagePreview(input)
        {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=imgUser.ClientID%>').prop('src', e.target.result)
                        .width(200)
                        .height(200);
                };
                reader.readAsDataURL(input.files[0]);
            }
            
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <div class="pcoded-inner-content pt-0">
        <div class="align-align-self-end">
            <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
        </div>

        <div class="main-body">
            <div class="page-wrapper">
                <div class="page-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-header">
                                </div>
                                <div class="card-block">
                                    <div class="row">

                                        <div class="col-12 mobile-inputs">
                                            <h4 class="sub-title">Регистрация сотрудников</h4>
                                            <div class="card-block table-border-style">
                                                <div class="table-responsive">
                                                    <div class="form_container">

                                                        <div class="form_container">
                                                             <label></label>
                                                            <label>Имя</label>
                                                            <div>
                                                                <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Name is required" ControlToValidate="txtName"
                                                                    ForeColor="Red" Display="Dynamic" SetFocusOnError="true"> </asp:RequiredFieldValidator>
                                                                <%--    <asp:RegularExpressionValidator ID="revName" runat="server" ErrorMessage="Name must be in characrers only"
                                                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true"
                                                                ControlToValidate="txtName"></asp:RegularExpressionValidator>--%>
                                                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control"
                                                                    ToolTip="Full Name"> </asp:TextBox>
                                                            </div>
                                                             <label></label>
                                                             <label>Фамилия</label>
                                                            <div>
                                                                <asp:RequiredFieldValidator ID="rfvSurname" runat="server" ErrorMessage="Name is required" ControlToValidate="txtSurname"
                                                                    ForeColor="Red" Display="Dynamic" SetFocusOnError="true"> </asp:RequiredFieldValidator>
                                                                <%--  <asp:RegularExpressionValidator ID="revSurname" runat="server" ErrorMessage="Name must be in characrers only"
                                                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true" 
                                                                ControlToValidate="txtSurname"></asp:RegularExpressionValidator>--%>
                                                                <asp:TextBox ID="txtSurname" runat="server" CssClass="form-control" 
                                                                    ToolTip="Full Name"> </asp:TextBox>
                                                            </div>
                                                             <label></label>
                                                             <label>Отчество</label>
                                                            <div>
                                                                <asp:RequiredFieldValidator ID="rfvPatronymic" runat="server" ErrorMessage="Name is required" ControlToValidate="txtPatronymic"
                                                                    ForeColor="Red" Display="Dynamic" SetFocusOnError="true"> </asp:RequiredFieldValidator>
                                                                <%-- <asp:RegularExpressionValidator ID="revPatronymic" runat="server" ErrorMessage="Name must be in characrers only"
                                                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true" 
                                                                ControlToValidate="txtPatronymic"></asp:RegularExpressionValidator>--%>
                                                                <asp:TextBox ID="txtPatronymic" runat="server" CssClass="form-control" 
                                                                    ToolTip="Full Name"> </asp:TextBox>
                                                            </div>
                                                             <label></label>
                                                             <label>Логин</label>
                                                            <div>
                                                                <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ErrorMessage="Username is required" ControlToValidate="txtUsername"
                                                                    ForeColor="Red" Display="Dynamic" SetFocusOnError="true"> </asp:RequiredFieldValidator>
                                                                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" 
                                                                    ToolTip="Username"> </asp:TextBox>
                                                            </div>
                                                             <label></label>
                                                             <label>Пароль</label>
                                                            <div>
                                                                <asp:RequiredFieldValidator ID="tfvPassword" runat="server" ErrorMessage="Password is required" ControlToValidate="txtPassword"
                                                                    ForeColor="Red" Display="Dynamic" SetFocusOnError="true"> </asp:RequiredFieldValidator>


                                                                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" 
                                                                    ToolTip="Password" TextMode="Password"></asp:TextBox>
                                                            </div>
                                                             <label></label>
                                                             
                                                            <div>
                                                                <asp:FileUpload ID="fuUserImage" runat="server" CssClass="form-control" ToolTip="Добавить фото"
                                                                    onchange="ImagePreview(this);" />
                                                            </div>

                                                        </div>
                                                    </div>
                                                     <label></label>
                                                     <label></label>
                                                     <label></label>
                                                    <div class="row pl-4">
                                                        <div class="btn_box">
                                                            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white"
                                                                OnClick="btnRegister_Click" />

                                                        </div>
                                                    </div>

                                                    <div class="row p-5">
                                                        <div style="align-items: center">
                                                            <asp:Image ID="imgUser" runat="server" CssClass="img-thumbnail" />
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



</asp:Content>
