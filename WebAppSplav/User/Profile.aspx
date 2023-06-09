﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="WebAppSplav.User.Profile" %>
<%@ Import Namespace="WebAppSplav" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

 <%
        string imageUrl = Session["imageUrl"].ToString();
    %>

    <section class="book_section layout_padding">
        <div class="container">
           <%-- <div class="heading_container">
                <h2>User Information</h2>
            </div>--%>
              

            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="card-title md-4">
                                <div class="d-flex justify-content-start">
                                    <div class="image-container">
                                        <img src="<%= Utils.GetImageUrl(imageUrl) %>" id="imgProfile" style="width:150px; height:150px"
                                            class="img-thumbnail"/>
                                      
                                    </div>

                                    <div class="userData ml-3">
                                        
                                        <h6 class="d-block">
                                            <a href="javascript:void()">
                                                <asp:Label ID="lblUsername" runat="server" ToolTip="Unique Username"> 
                                                    @<%Response.Write(Session["username"]); %>
                                                </asp:Label>
                                            </a>
                                        </h6>
                                       

                                        <h6 class="d-block">
                                             <label>Дата регистрации: </label>
                                            <a href="javascript:void(0);">
                                               
                                                <asp:Label ID="lblCreateDate" runat="server" ToolTip="Account Created On"> 
                                                    <%Response.Write(Session["createdDate"]); %>
                                                </asp:Label>
                                            </a>
                                        </h6>

                                    </div>

                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12">
                                    <ul class="nav nav-tabs md-4" id="myTab" role="tablist">
                                        <li class="nav-item"> 
                                            <a class="nav-link active text-info" id="basicInfo-tab" data-toggle="tab" href="#basicInfo" role="tab"
                                                aria-controls="basicInfo" aria-selected="true"><i class="fa fa-id-badge mr-2"></i>Информация</a>
                                        </li>
                                      <%--  <li class="nav-item">
                                            <a class="nav-link text-info" id="connectedServices-tab" data-toggle="tab" href="#connectedServices" role="tab"
                                                aria-controls="connectedServices" aria-selected="false"><i class="fa fa-clock-o mr-2"></i>Purchased History</a>
                                        </li>--%>
                                    </ul>

                                    <div class="tab-content ml-1" id="myTabContent">
                                        <%--Basic User Info Starts--%>
                                        <div class="tab-pane fade show active" id="basicInfo" role="tabpanel" aria-labelledby="dasicInfo-tab">
                                            <asp:Repeater ID="rUserProfile" runat="server">
                                                <ItemTemplate>
 <hr />
                                                    <div class="row">
                                                        <div class="col-sm-3 col-md-2 col-5">
                                                            <label style="font-weight:bold;"> Full Name</label>
                                                        </div>
                                                        <div class="col-md-8 col-6">
                                                            <%# Eval("Name") %>
                                                        </div>
                                                    </div>
                                                     <hr />
                                                    <div class="row">
                                                        <div class="col-sm-3 col-md-2 col-5">
                                                            <label style="font-weight:bold;"> Full Name</label>
                                                        </div>
                                                        <div class="col-md-8 col-6">
                                                            <%# Eval("Surname") %>
                                                        </div>
                                                    </div>
                                                     <hr />
                                                    <div class="row">
                                                        <div class="col-sm-3 col-md-2 col-5">
                                                            <label style="font-weight:bold;"> Full Name</label>
                                                        </div>
                                                        <div class="col-md-8 col-6">
                                                            <%# Eval("Patronymic") %>
                                                        </div>
                                                    </div>
                                                   
                                                     <hr />
                                                    <div class="row">
                                                        <div class="col-sm-3 col-md-2 col-5">
                                                            <label style="font-weight:bold;"> Username</label>
                                                        </div>
                                                        <div class="col-md-8 col-6">
                                                            @<%# Eval("Username") %>
                                                        </div>
                                                    </div>
                                                   
                                                    <hr />


                                                     <div class="middle pt-2">
                                            <a href="EditP.aspx?id=<% Response.Write(Session["userId"]);    %>" class="btn btn-warning">
                                                <i class="fa fa-pencil"></i>Редактировать
                                            </a>
                                        </div>

                                                </ItemTemplate>
                                            </asp:Repeater>
                                          </div>
                                        <%--Basic User Info Ends--%>

                                       <%-- Order History Starts--%>
                                        <div class="tab-pane fade" id="connectedServices" role="tabpanel" aria-labelledby="ConnectedServices-tab">
                                            <h3>Order History</h3>
                                        </div>
                                          <%--  Order History Ends--%>

                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            </div>
        </section>

</asp:Content>
