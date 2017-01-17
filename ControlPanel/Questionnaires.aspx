<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/MainPage.Master" AutoEventWireup="true" CodeBehind="Questionnaires.aspx.cs" Inherits="StudentServices.ControlPanel.Questionnaires" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:HiddenField ID="hfKeyValue" runat="server" Value="0" />
    <asp:HiddenField ID="hfEventStatus" runat="server" Value="1" />

    <div class="row">
        <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-lg-offset-2 col-md-offset-2 col-sm-offset-0 col-xs-offset-0  topUp">
            <div class="mj_mainheading mj_bottompadder50">
                <h1>q<span>uestionnaires</span></h1>
                <p id="ContentAlert" runat="server" class="content_error"></p>
            </div>
        </div>
    </div>

    <div class="row" style="margin-top: 30px">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="mj_postdiv mj_shadow_yellow mj_postpage mj_toppadder50 mj_bottompadder50">
                <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 col-lg-offset-1 col-md-offset-1">
                    <div class="form-group">
                        <label>Questionnaire</label>
                        <asp:TextBox ID="txtQuestionnairesTitleEn" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvQuestionnairesTitleEn" runat="server" ErrorMessage="Please Enter Questionnaires Title" CssClass="validator" ValidationGroup="Questionnaires" ControlToValidate="txtQuestionnairesTitleEn"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label>Questionnaire Arabic</label>
                        <asp:TextBox ID="txtQuestionnairesTitleAr" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvQuestionnairesTitleAr" runat="server" ErrorMessage="Please Enter Questionnaires Title Arabic" CssClass="validator" ValidationGroup="Questionnaires" ControlToValidate="txtQuestionnairesTitleAr"></asp:RequiredFieldValidator>

                    </div>

                    <div class="form-group">
                        <div class="mj_checkbox">
                            <asp:CheckBox ID="chkQuestionnairesStatus" runat="server" Checked="true" />
                            <%--<input type="checkbox" value="1" id="check1" name="checkbox">--%>
                            <label for="check1"></label>
                        </div>
                        <span>Status</span>
                    </div>

                    <div class="form-group">
                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="mj_yellowbtn button_cancel" BorderStyle="None" ValidationGroup="Questionnaires" OnClick="btnSave_Click" />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="mj_yellowbtn button_cancel" BorderStyle="None" OnClick="btnCancel_Click" />
                    </div>
                </div>
            </div>

        </div>
        <div class="clearfix"></div>
        <div class="form-grid form-group">
            <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" DataKeyNames="QuestionnairesId" DataSourceID="SqlGetQuestionnaire" CssClass="mGrid">
                <Columns>
                    <asp:BoundField DataField="QuestionnairesId" HeaderText="QuestionnairesId" ReadOnly="True" SortExpression="QuestionnairesId" InsertVisible="False" />
                    <asp:BoundField DataField="QuestionnairesTitleAr" HeaderText="QuestionnairesTitleAr" SortExpression="QuestionnairesTitleAr" />
                    <asp:BoundField DataField="QuestionnairesTitleEn" HeaderText="QuestionnairesTitleEn" SortExpression="QuestionnairesTitleEn" />
                    <asp:BoundField DataField="QuestionnairesDate" HeaderText="QuestionnairesDate" SortExpression="QuestionnairesDate" />
                    <asp:CheckBoxField DataField="QuestionnairesStatus" HeaderText="QuestionnairesStatus" SortExpression="QuestionnairesStatus" />
                    <asp:TemplateField HeaderText="Setting">
                        <ItemTemplate>
                            <asp:ImageButton CssClass="iconBtn" ID="btnEdit" runat="server" CommandArgument='<%# bind("QuestionnairesId") %>' ImageUrl="~/images/Edit.png" OnClick="btnEdit_Click" />
                            <asp:ImageButton CssClass="iconBtn" ID="btnDelete" runat="server" CommandArgument='<%# bind("QuestionnairesId") %>' ImageUrl="~/images/Delete.png" OnClientClick="return confirm('Are you sure you want to delete this?')" OnClick="btnDelete_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlGetQuestionnaire" runat="server" ConnectionString="<%$ ConnectionStrings:StudentHubConnectionString %>" SelectCommand="SELECT [QuestionnairesId], [QuestionnairesTitleAr], [QuestionnairesTitleEn], [QuestionnairesDate], [QuestionnairesStatus] FROM [Questionnaires]"></asp:SqlDataSource>
    </div>
</asp:Content>

