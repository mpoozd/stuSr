<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PostResume.aspx.cs" Inherits="StudentServices.PostResume" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="mj_lightgraytbg mj_toppadder80 mj_bottompadder80">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-lg-offset-2 col-md-offset-2 col-sm-offset-0 col-xs-offset-0">
                    <div class="mj_mainheading mj_toppadder50 mj_bottompadder50">
                        <h1>P<span>ost</span> <span>a</span> R<span>esume</span></h1>
                        <asp:Panel ID="pnlSignIn" runat="server" Visible="false">
                            <p class="mj_bottompadder20">
                                You are currently signed in as <strong class="mj_black_text" id="StudentName" runat="server"></strong>
                            </p>
                            <a href="Default.aspx?typ=clear" class="mj_mainbtn mj_btnblue" data-text="sign out"><span>sign out</span></a>
                        </asp:Panel>
                        <asp:Panel ID="pnlSignOut" runat="server">
                            <p class="mj_bottompadder20">
                                For A Post a Resume Please Sign in
                            </p>
                            <a href="#" class="mj_mainbtn mj_btnblue" data-text="Sign In" data-toggle="modal" data-target="#myModal2"><span>sign In</span></a>
                            <a href="Signup.aspx" class="mj_mainbtn mj_btnyellow" data-text="New Registration"><span>New Registration</span></a>
                        </asp:Panel>
                    </div>
                </div>
            </div>

            <asp:Panel ID="PanelContent" runat="server">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="mj_postdiv mj_shadow_blue mj_postpage mj_toppadder50 mj_bottompadder50">
                            <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 col-lg-offset-1 col-md-offset-1">

                                <div class="form-group">
                                    <label>Gender</label>
                                    <asp:DropDownList ID="ddlStudentGender" runat="server" CssClass="custom-select">
                                        <asp:ListItem>Select</asp:ListItem>
                                        <asp:ListItem Value="1">Male</asp:ListItem>
                                        <asp:ListItem Value="2">Female</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label>Your Full Name</label>
                                    <asp:TextBox ID="txtStudentName" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Personal Email</label>
                                    <asp:TextBox ID="txtStudentEmail" runat="server" CssClass="form-control" placeholder="Personal Email"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Nationlaty</label>
                                    <asp:DropDownList ID="ddlStudentNationlaty" runat="server" CssClass="custom-select" DataSourceID="SDSNationlaty" DataTextField="NationlatyNameEn" DataValueField="NationlatyId" AppendDataBoundItems="True">
                                        <asp:ListItem Value="0">Select Nationlaty</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SDSNationlaty" runat="server" ConnectionString='<%$ ConnectionStrings:StudentHubConnectionString %>' SelectCommand="SELECT [NationlatyId], [NationlatyNameEn], [NationlatyNameAr] FROM [Nationlaty]"></asp:SqlDataSource>
                                </div>
                                <div class="form-group">
                                    <label>University</label>
                                    <asp:DropDownList ID="ddlUniversity" runat="server" CssClass="custom-select" DataSourceID="SDSUniversity" DataTextField="UniversitiesNameEn" DataValueField="UniversitiesId" AppendDataBoundItems="True" AutoPostBack="false">
                                        <asp:ListItem Value="0">Select University</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SDSUniversity" runat="server" ConnectionString='<%$ ConnectionStrings:StudentHubConnectionString %>' SelectCommand="SELECT [UniversitiesId], [UniversitiesNameAr], [UniversitiesNameEn] FROM [Universities]"></asp:SqlDataSource>
                                </div>
                                <div class="form-group">
                                    <label>University ID</label>
                                    <asp:TextBox ID="txtUniversityID" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>College</label>
                                    <asp:DropDownList ID="ddlCollege" runat="server" CssClass="custom-select" AppendDataBoundItems="True" DataSourceID="SDSCollege" DataTextField="CollegesNameEn" DataValueField="CollegesId">
                                        <asp:ListItem Value="0">Select College</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SDSCollege" runat="server" ConnectionString='<%$ ConnectionStrings:StudentHubConnectionString %>' SelectCommand="SELECT [UniversitiesId], [CollegesId], [CollegesNameAr], [CollegesNameEn] FROM [Colleges]"></asp:SqlDataSource>
                                </div>
                                <div class="form-group">
                                    <label>Specialty</label>
                                    <asp:DropDownList ID="ddlSpecialty" runat="server" CssClass="custom-select" AppendDataBoundItems="True" DataSourceID="SDSSpecialty" DataTextField="SpecialtiesNameEn" DataValueField="SpecialtiesId">
                                        <asp:ListItem Value="0">Select Specialty</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SDSSpecialty" runat="server" ConnectionString='<%$ ConnectionStrings:StudentHubConnectionString %>' SelectCommand="SELECT [SpecialtiesId], [CollegesId], [SpecialtiesNameAr], [SpecialtiesNameEn] FROM [Specialties]"></asp:SqlDataSource>
                                </div>
                                <div class="form-group">
                                    <label>Graduation Year</label>
                                    <asp:TextBox ID="txtGraduationYear" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Overview</label>
                                    <asp:TextBox ID="txtStudentOverview" runat="server" CssClass="form-control" TextMode="MultiLine" Height="150px"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>
                                        Photo University ID<span>(optionnal)</span>
                                    </label>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="row">
                                            <asp:FileUpload ID="fuUniversityCardFacility" runat="server" />
                                        </div>
                                    </div>
                                </div>

                                 
                                <div class="form-group">
                                    <label>
                                        Profile Image
                                    </label>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="row">
                                            <asp:FileUpload ID="fuStudentImage" runat="server" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>City</label>
                                    <asp:DropDownList ID="ddlCity" runat="server" CssClass="custom-select" DataSourceID="SDSCity" DataTextField="CityNameEn" DataValueField="CityId" AppendDataBoundItems="True">
                                        <asp:ListItem Value="0">Select </asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SDSCity" runat="server" ConnectionString='<%$ ConnectionStrings:StudentHubConnectionString %>' SelectCommand="SELECT [CityId], [CityNameAr], [CityNameEn] FROM [Cities]"></asp:SqlDataSource>
                                </div>
                                <div class="form-group">
                                    <label>Address</label>
                                    <asp:TextBox ID="txtStudentAddress" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>

                                </div>
                                <div class="form-group">
                                    <label>University Email</label>
                                    <asp:TextBox ID="txtUniversityEmail" runat="server" CssClass="form-control" placeholder="University Email. “name@edu.sa”"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Mobile</label>
                                    <asp:TextBox ID="txtStudentMobile" runat="server" CssClass="form-control" placeholder="05XXXXXXXX”"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>
                                        Social Media<span>(optionnal)</span>
                                    </label>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="row">
                                            <div class="mj_education">
                                                <asp:TextBox ID="txtStudentSocialMedia1" runat="server" CssClass="form-control" placeholder="LinkedIn"></asp:TextBox>
                                                <asp:TextBox ID="txtStudentSocialMedia2" runat="server" CssClass="form-control" placeholder="bayt"></asp:TextBox>
                                                <asp:TextBox ID="txtStudentSocialMedia3" runat="server" CssClass="form-control" placeholder="GulfTalent"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>
                                        Job Experience
                                    </label>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="row">
                                            <div class="mj_education">
                                                <asp:DropDownList ID="ddlStudentExperiencesType" runat="server" CssClass="custom-select">
                                                    <asp:ListItem Value="1">Job</asp:ListItem>
                                                    <asp:ListItem Value="2">Volunteer</asp:ListItem>
                                                </asp:DropDownList>
                                                <br />
                                                <br />
                                                <div class="clearfix" style="margin-top: 10px"></div>
                                                <asp:TextBox ID="txtCompanyName" runat="server" CssClass="form-control" placeholder="Company Name"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfv1" runat="server" ErrorMessage="Please Enter Company Name" CssClass="validator" ValidationGroup="JobExperience" ControlToValidate="txtCompanyName"></asp:RequiredFieldValidator>
                                                <asp:TextBox ID="txtStudentExperiencesTitle" runat="server" CssClass="form-control" placeholder="Job Title"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfv2" runat="server" ErrorMessage="Please Enter Job Title" CssClass="validator" ValidationGroup="JobExperience" ControlToValidate="txtStudentExperiencesTitle"></asp:RequiredFieldValidator>
                                                <div class="clearfix"></div>
                                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                                    <div class="row">
                                                        <div class="form-group">
                                                            <div class="mj_datepicker">
                                                                <input type="text" class="form-control" id="datepicker" placeholder="Satrt Date">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12" style="margin-left: 20px">
                                                    <div class="row">
                                                        <div class="form-group">
                                                            <div class="mj_datepicker">
                                                                <input type="text" class="form-control" id="datepicker2" placeholder="End Date">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <asp:TextBox ID="txtStudentExperiencesTasks" runat="server" CssClass="form-control" placeholder="Taskes" TextMode="MultiLine"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfv3" runat="server" ErrorMessage="Please Enter Job Tasks" CssClass="validator" ValidationGroup="JobExperience" ControlToValidate="txtStudentExperiencesTasks"></asp:RequiredFieldValidator>
                                                <asp:LinkButton ID="btnAddExperience" runat="server" CssClass="mj_addurl" OnClick="btnAddExperience_Click" ValidationGroup="JobExperience">+ Add</asp:LinkButton>
                                                <div class="clearfix"></div>
                                                <div class="form-grid form-group">
                                                    <asp:GridView ID="gvExp" runat="server" AutoGenerateColumns="False" CssClass="mGrid">
                                                        <Columns>
                                                            <asp:BoundField DataField="StudentExperiencesId" HeaderText="StudentId" Visible="False"></asp:BoundField>
                                                            <asp:BoundField DataField="StudentId" HeaderText="StudentId" Visible="False"></asp:BoundField>
                                                            <asp:BoundField DataField="StudentExperiencesTitle" HeaderText="Title"></asp:BoundField>
                                                            <asp:BoundField DataField="StudentExperiencesJob" HeaderText="StudentExperiencesJob" Visible="False"></asp:BoundField>
                                                            <asp:BoundField DataField="StudentExperiencesTasks" HeaderText="Tasks"></asp:BoundField>
                                                            <asp:BoundField DataField="CompanyName" HeaderText="Company"></asp:BoundField>
                                                            <asp:BoundField DataField="StudentExperiencesStartDate" HeaderText="Start Date"></asp:BoundField>
                                                            <asp:BoundField DataField="StudentExperiencesEndDate" HeaderText="End Date"></asp:BoundField>
                                                            <asp:TemplateField HeaderText="Setting">
                                                                <ItemTemplate>
                                                                    <asp:ImageButton CssClass="iconBtn" ID="btnDeleteExp" runat="server" CommandArgument='<%# bind("StudentExperiencesId") %>' OnClick="btnDeleteExp_Click" ImageUrl="~/images/Delete.png" OnClientClick="return confirm('Are you sure you want to delete this ?')" />

                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>Skills</label>
                                    <asp:CheckBoxList ID="cblSkills" runat="server" RepeatDirection="Horizontal"></asp:CheckBoxList>
                                </div>
                                <div class="form-group">
                                    <label>Interests</label>
                                    <asp:CheckBoxList CssClass="cbl" ID="cblInterests" runat="server" RepeatDirection="Horizontal"></asp:CheckBoxList>
                                </div>
                                <div class="form-group">
                                    <label>
                                        Attachments<span>(optionnal)</span>
                                    </label>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-19">
                                        <div class="row">
                                            <div class="mj_education">
                                                <div class="col-lg-6" style="width: 80%">
                                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-25">
                                                        <div class="row">
                                                            <div class="form-group">
                                                                <asp:TextBox ID="txtStudentAttachmentsDesc" runat="server" CssClass="form-control" placeholder="Description File"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12" style="margin-left: 20px; margin-top: 5px;">
                                                        <div class="row">
                                                            <div class="form-group">
                                                                <asp:FileUpload ID="fuStudentAttachmentsFile" runat="server" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6" style="width: 20%">
                                                    <asp:Button ID="btnUplod" runat="server" Text="Upload" CssClass="mj_add" OnClick="btnUplod_Click" />
                                                </div>


                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-grid form-group">
                                        <asp:GridView ID="gvAttachment" runat="server" AutoGenerateColumns="False" CssClass="mGrid">
                                            <Columns>
                                                <asp:BoundField DataField="StudentAttachmentsId" HeaderText="StudentAttachmentsId" Visible="False"></asp:BoundField>
                                                <asp:BoundField DataField="StudentId" HeaderText="StudentId" Visible="False"></asp:BoundField>
                                                <asp:BoundField DataField="StudentAttachmentsDesc" HeaderText="Description"></asp:BoundField>
                                                <asp:BoundField DataField="StudentAttachmentsFile" HeaderText="StudentAttachmentsFile" Visible="False"></asp:BoundField>
                                                <asp:TemplateField HeaderText="Setting">
                                                    <ItemTemplate>
                                                        <asp:ImageButton CssClass="iconBtn" ID="btnDeleteAttachment" runat="server" OnClick="btnDeleteAttachment_Click" CommandArgument='<%# bind("StudentAttachmentsId") %>' ImageUrl="~/images/Delete.png" OnClientClick="return confirm('Are you sure you want to delete this ?')" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>

                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>
                                        Private information<span>(optionnal)</span>
                                    </label>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="row">
                                            <div class="mj_education">
                                                <asp:DropDownList ID="ddlWorkEnvironment" runat="server" CssClass="custom-select">
                                                    <asp:ListItem Value="0">Select Work Environment</asp:ListItem>
                                                    <asp:ListItem Value="1">Women</asp:ListItem>
                                                    <asp:ListItem Value="2">Mixed</asp:ListItem>
                                                </asp:DropDownList>
                                                <br />
                                                <br />
                                                <asp:TextBox ID="txtSpecialNeedsDescription" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="Special needs"></asp:TextBox>
                                                <asp:DropDownList ID="ddlWorkingHours" runat="server" CssClass="custom-select">
                                                    <asp:ListItem Value="-1">Select Working hours</asp:ListItem>
                                                    <asp:ListItem Value="0">All</asp:ListItem>
                                                    <asp:ListItem Value="1">Morning</asp:ListItem>
                                                    <asp:ListItem Value="2">Evening</asp:ListItem>
                                                </asp:DropDownList>
                                                <br />
                                                <br />
                                                <div class="form-group">
                                                    <label>Types Jobs</label>
                                                    <asp:CheckBoxList ID="cblTypesJobs" runat="server" RepeatDirection="Horizontal"></asp:CheckBoxList>
                                                    
                                                </div>
                                                <div class="form-group">
                                                    <label>Work Place</label>
                                                    <asp:CheckBoxList ID="cblWorkPlace" runat="server" RepeatDirection="Horizontal"></asp:CheckBoxList>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="mj_showmore">
                            <asp:LinkButton ID="btnSave" runat="server" CssClass="mj_showmorebtn mj_bigbtn mj_bluebtn" OnClick="btnSave_Click">Save</asp:LinkButton>
                        </div>
                    </div>
                </div>

            </asp:Panel>


        </div>
    </div>

</asp:Content>
