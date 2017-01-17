<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/MainPage.Master" AutoEventWireup="true" CodeBehind="QuestionnaireOptions.aspx.cs" Inherits="StudentServices.ControlPanel.QuestionnaireOptions" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


     <asp:HiddenField ID="hfKeyValue" runat="server" Value="0" />
    <asp:HiddenField ID="hfEventStatus" runat="server" Value="1" />

      <div class="row">
        <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-lg-offset-2 col-md-offset-2 col-sm-offset-0 col-xs-offset-0  topUp">
            <div class="mj_mainheading mj_bottompadder50">
                <h1>q<span>uestionnaire Options</span></h1>
                <p id="ContentAlert" runat="server" class="content_error"></p>
            </div>
        </div>
    </div>


    <div class="row" style="margin-top: 30px">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="mj_postdiv mj_shadow_yellow mj_postpage mj_toppadder50 mj_bottompadder50">
                <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 col-lg-offset-1 col-md-offset-1">
                    <div class="form-group">
                        <label>Questionnaires</label>
                        <asp:DropDownList ID="ddlQuestionnaireOptions" runat="server" CssClass="custom-select" AppendDataBoundItems="True" DataSourceID="SqlGetQuestionnaire" DataTextField="QuestionnairesTitleEn" DataValueField="QuestionnairesId">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                        </asp:DropDownList>
                        <div class="clearfix"></div>
                        <asp:RequiredFieldValidator ID="rfvQuestionnaireOptions" runat="server" InitialValue="0" ErrorMessage="Please Select Questionnaire" CssClass="validator" ValidationGroup="QuestionnaireOptions" ControlToValidate="ddlQuestionnaireOptions"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label>Questionnaire Options Title</label>
                        <asp:TextBox ID="txtQuestionnaireOptionsTitleEn" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvQuestionnaireOptionsTitleAr" runat="server" ErrorMessage="Please Enter Questionnaire Options Title " CssClass="validator" ValidationGroup="QuestionnaireOptions" ControlToValidate="txtQuestionnaireOptionsTitleAr"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label>Questionnaire Options Title Arabic</label>
                        <asp:TextBox ID="txtQuestionnaireOptionsTitleAr" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvQuestionnaireOptionsTitleEn" runat="server" ErrorMessage="Please Enter Questionnaire Options Title Arabic" CssClass="validator" ValidationGroup="QuestionnaireOptions" ControlToValidate="txtQuestionnaireOptionsTitleEn"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="mj_yellowbtn button_cancel" BorderStyle="None" ValidationGroup="QuestionnaireOptions" OnClick="btnSave_Click" />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="mj_yellowbtn button_cancel" BorderStyle="None" OnClick="btnCancel_Click" />
                    </div>
                    
                </div>
            </div>
          
        </div>
        <div class="clearfix"></div>
        <div class="form-grid form-group">
            <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" DataKeyNames="QuestionnaireOptionsId" DataSourceID="SqlGetQuestionnaireOptions" CssClass="mGrid">
                <Columns>
                    <asp:BoundField DataField="QuestionnairesTitleEn" HeaderText="QuestionnairesTitleEn" SortExpression="QuestionnairesTitleEn" />
                    <asp:BoundField DataField="QuestionnaireOptionsId" HeaderText="QuestionnaireOptionsId" SortExpression="QuestionnaireOptionsId" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="QuestionnaireOptionsTitleAr" HeaderText="QuestionnaireOptionsTitleAr" SortExpression="QuestionnaireOptionsTitleAr" />
                    <asp:BoundField DataField="QuestionnaireOptionsTitleEn" HeaderText="QuestionnaireOptionsTitleEn" SortExpression="QuestionnaireOptionsTitleEn" />
                    <asp:TemplateField HeaderText="Setting">
                        <ItemTemplate>
                            <asp:ImageButton CssClass="iconBtn" ID="btnEdit" runat="server" CommandArgument='<%# bind("QuestionnaireOptionsId") %>' ImageUrl="~/images/Edit.png" OnClick="btnEdit_Click" />
                            <asp:ImageButton CssClass="iconBtn" ID="btnDelete" runat="server" CommandArgument='<%# bind("QuestionnaireOptionsId") %>' ImageUrl="~/images/Delete.png" OnClientClick="return confirm('Are you sure you want to delete this?')" OnClick="btnDelete_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlGetQuestionnaireOptions" runat="server" ConnectionString="<%$ ConnectionStrings:StudentHubConnectionString %>" SelectCommand="SELECT Questionnaires.QuestionnairesTitleEn, QuestionnaireOptions.QuestionnaireOptionsId, QuestionnaireOptions.QuestionnaireOptionsTitleAr, QuestionnaireOptions.QuestionnaireOptionsTitleEn FROM QuestionnaireOptions INNER JOIN Questionnaires ON QuestionnaireOptions.QuestionnairesId = Questionnaires.QuestionnairesId"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlGetQuestionnaire" runat="server" ConnectionString="<%$ ConnectionStrings:StudentHubConnectionString %>" SelectCommand="SELECT [QuestionnairesId], [QuestionnairesTitleAr], [QuestionnairesTitleEn], [QuestionnairesDate], [QuestionnairesStatus] FROM [Questionnaires] WHERE ([QuestionnairesStatus] = @QuestionnairesStatus)">
            <SelectParameters>
                <asp:Parameter DefaultValue="True" Name="QuestionnairesStatus" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

