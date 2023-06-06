<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="EditP.aspx.cs" Inherits="WebAppSplav.User.EditP" %>
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
    
    <section class="book_section layout_padding">
        <div class="container">
              <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label ID="Label1" runat="server" Visible="false" ></asp:Label>
                </div>
                <asp:Label ID="lblHeaderMsg" runat="server" Text="<h2>User Registration</h2>" ></asp:Label>
            </div>
            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label ID="lblMsg" runat="server" Visible="false" ></asp:Label>
                </div>
              
            </div>

            <div class="row">
               
                
                <div class="col-md-6">
                    <div class="form_container">

                       
                        <div>
                            <label> Добавить фото: </label>
                            <asp:FileUpload ID="fuUserImage" runat="server" CssClass="form-control" ToolTip="User Image"
                                onchange="ImagePreview(this);"/>
                        </div>
                        
                        <div>
                            <label> Изменить пароль:</label>
                             <asp:RequiredFieldValidator ID="tfvPassword" runat="server" ErrorMessage="Password is required" ControlToValidate="txtPassword"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true" > </asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" 
                                ToolTip="Password" TextMode="Password"></asp:TextBox>
                        </div>

                          <div class="row pl-4">
                    <div class="btn_box">
                        <asp:Button ID="btnUpdate" runat="server" Text="Register" CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white"
                            OnClick="btnRegister_Click"/>
                      
                    </div>
                </div>
                    </div>
                </div>

                <div class="row p-5">
                    <div style="align-items:center">
                        <asp:Image ID="imgUser" runat="server" CssClass="img-thumbnail" />
                    </div>
                </div>

            </div>
        </div>
    </section>
</asp:Content>
