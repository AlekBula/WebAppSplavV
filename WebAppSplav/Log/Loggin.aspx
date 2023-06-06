<%@ Page Title="" Language="C#" MasterPageFile="~/Log/Site1.Master" AutoEventWireup="true" CodeBehind="Loggin.aspx.cs" Inherits="WebAppSplav.Log.Loggin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <br> 
    <br> 
    <br> 
    <br> 
    <br> 
     <%--<section class="login p-fixed d-flex text-center bg-primary common-img-bg">--%>
        <!-- Container-fluid starts -->
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <!-- Authentication card start -->
                    <div class="login-card card-block auth-body mr-auto ml-auto">
                        <form1 class="md-float-material">
                            <div class="text-center">
                                <img src="../assets/images/auth/logo.png" alt="logo.png">
                            </div>
                            <div class="auth-box">
                                <div class="row m-b-20">
                                    <div class="col-md-12">
                                        <h3 class="text-left txt-primary">Вход в систему</h3>
                                    </div>
                                </div>
                                <hr/>
                                <div class="input-group">
                                       <asp:RequiredFieldValidator ID="rfv" runat="server" ErrorMessage="Username is required"
                                ControlToValidate="txtUsername" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" Font-Size="Small"> </asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Логин"  class="form-control"></asp:TextBox>
                                    
                                </div>
                                <div class="input-group">
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Password is required"
                                ControlToValidate="txtPassword" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"  Font-Size="Small"> </asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Пароль" TextMode="Password" type="password" class="form-control" ></asp:TextBox>
                                    
                                </div>
                             
                                <div class="row m-t-30">
                                    <div class="col-md-12">
                              <asp:Button ID="btnLogin" runat="server" Text="Войти" type="button" CssClass="btn btn-primary" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20"
                                OnClick="btnLogin_Click" />
                                       
                                    </div>
                                </div>
                                <hr/>
                              
                               

                           
                            </div>
                        </form1>
                        <!-- end of form -->
                    </div>
                    <!-- Authentication card end -->
                </div>
                <!-- end of col-sm-12 -->
            </div>
            <!-- end of row -->
        </div>
        <!-- end of container-fluid -->
    <%--</section>--%>
</asp:Content>
