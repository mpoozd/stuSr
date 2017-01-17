<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="StudentServices.Checkout" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="mj_lightgraytbg mj_checkout mj_toppadder80 mj_bottompadder80">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-lg-offset-3 col-md-offset-3 col-sm-offset-3">
                    <div class="mj_mainheading mj_toppadder20 mj_bottompadder50">
                        <h1>c<span>heckout</span></h1>
                    </div>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="mj_postdiv mj_shadow_blue mj_toppadder50 mj_bottompadder50">
                        <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 col-lg-offset-1 col-md-offset-1">
                            <div class="row">
                                <form class="checkout woocommerce-checkout">
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mj_bottompadder20">
                                        <div class="form-group">
                                            <label>
                                                first name <sup>*</sup>
                                            </label>
                                            <asp:TextBox ID="txtFristName" runat="server" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvFristName" runat="server" ErrorMessage="Please Enter Frist Name" CssClass="validator" ValidationGroup="Checkout" ControlToValidate="txtFristName"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mj_bottompadder20">
                                        <div class="form-group">
                                            <label>
                                                last name <sup>*</sup>
                                            </label>
                                            <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ErrorMessage="Please Enter Last Name" CssClass="validator" ValidationGroup="Checkout" ControlToValidate="txtLastName"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mj_bottompadder20">
                                        <div class="form-group">
                                            <label>
                                                Email Address <sup>*</sup>
                                            </label>
                                            <asp:TextBox ID="txtEmailAddress" runat="server" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvEmailAddress" runat="server" ErrorMessage="Please Enter Email Address" CssClass="validator" ValidationGroup="Checkout" ControlToValidate="txtEmailAddress"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mj_bottompadder20">
                                        <div class="form-group">
                                            <label>
                                                Phone Number <sup>*</sup>
                                            </label>
                                            <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ErrorMessage="Please Enter Mobile" CssClass="validator" ValidationGroup="Checkout" ControlToValidate="txtMobile"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mj_bottompadder20">
                                        <div class="form-group">
                                            <label>
                                                country <sup>*</sup>
                                            </label>
                                            <asp:DropDownList ID="ddlCountry" runat="server" CssClass="custom-select">
                                                <asp:ListItem Value="682">Saudi Arabia</asp:ListItem>
                                                <asp:ListItem Value="4">Afghanistan</asp:ListItem>
                                                <asp:ListItem Value="248">Åland Islands</asp:ListItem>
                                                <asp:ListItem Value="8">Albania</asp:ListItem>
                                                <asp:ListItem Value="12">Algeria</asp:ListItem>
                                                <asp:ListItem Value="16">American Samoa</asp:ListItem>
                                                <asp:ListItem Value="20">Andorra</asp:ListItem>
                                                <asp:ListItem Value="24">Angola</asp:ListItem>
                                                <asp:ListItem Value="660">Anguilla</asp:ListItem>
                                                <asp:ListItem Value="10">Antarctica</asp:ListItem>
                                                <asp:ListItem Value="28">Antigua and Barbuda</asp:ListItem>
                                                <asp:ListItem Value="32">Argentina</asp:ListItem>
                                                <asp:ListItem Value="51">Armenia</asp:ListItem>
                                                <asp:ListItem Value="533">Aruba</asp:ListItem>
                                                <asp:ListItem Value="36">Australia</asp:ListItem>
                                                <asp:ListItem Value="40">Austria</asp:ListItem>
                                                <asp:ListItem Value="31">Azerbaijan</asp:ListItem>
                                                <asp:ListItem Value="44">Bahamas</asp:ListItem>
                                                <asp:ListItem Value="48">Bahrain</asp:ListItem>
                                                <asp:ListItem Value="50">Bangladesh</asp:ListItem>
                                                <asp:ListItem Value="52">Barbados</asp:ListItem>
                                                <asp:ListItem Value="112">Belarus</asp:ListItem>
                                                <asp:ListItem Value="56">Belgium</asp:ListItem>
                                                <asp:ListItem Value="84">Belize</asp:ListItem>
                                                <asp:ListItem Value="204">Benin</asp:ListItem>
                                                <asp:ListItem Value="60">Bermuda</asp:ListItem>
                                                <asp:ListItem Value="64">Bhutan</asp:ListItem>
                                                <asp:ListItem Value="68">Bolivia, Plurinational State of</asp:ListItem>
                                                <asp:ListItem Value="535">Bonaire, Sint Eustatius and Saba</asp:ListItem>
                                                <asp:ListItem Value="70">Bosnia and Herzegovina</asp:ListItem>
                                                <asp:ListItem Value="72">Botswana</asp:ListItem>
                                                <asp:ListItem Value="74">Bouvet Island</asp:ListItem>
                                                <asp:ListItem Value="76">Brazil</asp:ListItem>
                                                <asp:ListItem Value="86">British Indian Ocean Territory</asp:ListItem>
                                                <asp:ListItem Value="96">Brunei Darussalam</asp:ListItem>
                                                <asp:ListItem Value="100">Bulgaria</asp:ListItem>
                                                <asp:ListItem Value="854">Burkina Faso</asp:ListItem>
                                                <asp:ListItem Value="108">Burundi</asp:ListItem>
                                                <asp:ListItem Value="116">Cambodia</asp:ListItem>
                                                <asp:ListItem Value="120">Cameroon</asp:ListItem>
                                                <asp:ListItem Value="124">Canada</asp:ListItem>
                                                <asp:ListItem Value="132">Cape Verde</asp:ListItem>
                                                <asp:ListItem Value="136">Cayman Islands</asp:ListItem>
                                                <asp:ListItem Value="140">Central African Republic</asp:ListItem>
                                                <asp:ListItem Value="148">Chad</asp:ListItem>
                                                <asp:ListItem Value="152">Chile</asp:ListItem>
                                                <asp:ListItem Value="156">China</asp:ListItem>
                                                <asp:ListItem Value="162">Christmas Island</asp:ListItem>
                                                <asp:ListItem Value="166">Cocos (Keeling) Islands</asp:ListItem>
                                                <asp:ListItem Value="170">Colombia</asp:ListItem>
                                                <asp:ListItem Value="174">Comoros</asp:ListItem>
                                                <asp:ListItem Value="178">Congo</asp:ListItem>
                                                <asp:ListItem Value="180">Congo, the Democratic Republic of the</asp:ListItem>
                                                <asp:ListItem Value="184">Cook Islands</asp:ListItem>
                                                <asp:ListItem Value="188">Costa Rica</asp:ListItem>
                                                <asp:ListItem Value="384">Côte d'Ivoire</asp:ListItem>
                                                <asp:ListItem Value="191">Croatia</asp:ListItem>
                                                <asp:ListItem Value="192">Cuba</asp:ListItem>
                                                <asp:ListItem Value="531">Curaçao</asp:ListItem>
                                                <asp:ListItem Value="196">Cyprus</asp:ListItem>
                                                <asp:ListItem Value="203">Czech Republic</asp:ListItem>
                                                <asp:ListItem Value="208">Denmark</asp:ListItem>
                                                <asp:ListItem Value="262">Djibouti</asp:ListItem>
                                                <asp:ListItem Value="212">Dominica</asp:ListItem>
                                                <asp:ListItem Value="214">Dominican Republic</asp:ListItem>
                                                <asp:ListItem Value="218">Ecuador</asp:ListItem>
                                                <asp:ListItem Value="818">Egypt</asp:ListItem>
                                                <asp:ListItem Value="222">El Salvador</asp:ListItem>
                                                <asp:ListItem Value="226">Equatorial Guinea</asp:ListItem>
                                                <asp:ListItem Value="232">Eritrea</asp:ListItem>
                                                <asp:ListItem Value="233">Estonia</asp:ListItem>
                                                <asp:ListItem Value="231">Ethiopia</asp:ListItem>
                                                <asp:ListItem Value="238">Falkland Islands (Malvinas)</asp:ListItem>
                                                <asp:ListItem Value="234">Faroe Islands</asp:ListItem>
                                                <asp:ListItem Value="242">Fiji</asp:ListItem>
                                                <asp:ListItem Value="246">Finland</asp:ListItem>
                                                <asp:ListItem Value="250">France</asp:ListItem>
                                                <asp:ListItem Value="254">French Guiana</asp:ListItem>
                                                <asp:ListItem Value="258">French Polynesia</asp:ListItem>
                                                <asp:ListItem Value="260">French Southern Territories</asp:ListItem>
                                                <asp:ListItem Value="266">Gabon</asp:ListItem>
                                                <asp:ListItem Value="270">Gambia</asp:ListItem>
                                                <asp:ListItem Value="268">Georgia</asp:ListItem>
                                                <asp:ListItem Value="276">Germany</asp:ListItem>
                                                <asp:ListItem Value="288">Ghana</asp:ListItem>
                                                <asp:ListItem Value="292">Gibraltar</asp:ListItem>
                                                <asp:ListItem Value="300">Greece</asp:ListItem>
                                                <asp:ListItem Value="304">Greenland</asp:ListItem>
                                                <asp:ListItem Value="308">Grenada</asp:ListItem>
                                                <asp:ListItem Value="312">Guadeloupe</asp:ListItem>
                                                <asp:ListItem Value="316">Guam</asp:ListItem>
                                                <asp:ListItem Value="320">Guatemala</asp:ListItem>
                                                <asp:ListItem Value="831">Guernsey</asp:ListItem>
                                                <asp:ListItem Value="324">Guinea</asp:ListItem>
                                                <asp:ListItem Value="624">Guinea-Bissau</asp:ListItem>
                                                <asp:ListItem Value="328">Guyana</asp:ListItem>
                                                <asp:ListItem Value="332">Haiti</asp:ListItem>
                                                <asp:ListItem Value="334">Heard Island and McDonald Islands</asp:ListItem>
                                                <asp:ListItem Value="336">Holy See (Vatican City State)</asp:ListItem>
                                                <asp:ListItem Value="340">Honduras</asp:ListItem>
                                                <asp:ListItem Value="344">Hong Kong</asp:ListItem>
                                                <asp:ListItem Value="348">Hungary</asp:ListItem>
                                                <asp:ListItem Value="352">Iceland</asp:ListItem>
                                                <asp:ListItem Value="356">India</asp:ListItem>
                                                <asp:ListItem Value="360">Indonesia</asp:ListItem>
                                                <asp:ListItem Value="364">Iran, Islamic Republic of</asp:ListItem>
                                                <asp:ListItem Value="368">Iraq</asp:ListItem>
                                                <asp:ListItem Value="372">Ireland</asp:ListItem>
                                                <asp:ListItem Value="833">Isle of Man</asp:ListItem>
                                                <asp:ListItem Value="376">Israel</asp:ListItem>
                                                <asp:ListItem Value="380">Italy</asp:ListItem>
                                                <asp:ListItem Value="388">Jamaica</asp:ListItem>
                                                <asp:ListItem Value="392">Japan</asp:ListItem>
                                                <asp:ListItem Value="832">Jersey</asp:ListItem>
                                                <asp:ListItem Value="400">Jordan</asp:ListItem>
                                                <asp:ListItem Value="398">Kazakhstan</asp:ListItem>
                                                <asp:ListItem Value="404">Kenya</asp:ListItem>
                                                <asp:ListItem Value="296">Kiribati</asp:ListItem>
                                                <asp:ListItem Value="408">Korea, Democratic People's Republic of</asp:ListItem>
                                                <asp:ListItem Value="410">Korea, Republic of</asp:ListItem>
                                                <asp:ListItem Value="414">Kuwait</asp:ListItem>
                                                <asp:ListItem Value="417">Kyrgyzstan</asp:ListItem>
                                                <asp:ListItem Value="418">Lao People's Democratic Republic</asp:ListItem>
                                                <asp:ListItem Value="428">Latvia</asp:ListItem>
                                                <asp:ListItem Value="422">Lebanon</asp:ListItem>
                                                <asp:ListItem Value="426">Lesotho</asp:ListItem>
                                                <asp:ListItem Value="430">Liberia</asp:ListItem>
                                                <asp:ListItem Value="434">Libya</asp:ListItem>
                                                <asp:ListItem Value="438">Liechtenstein</asp:ListItem>
                                                <asp:ListItem Value="440">Lithuania</asp:ListItem>
                                                <asp:ListItem Value="442">Luxembourg</asp:ListItem>
                                                <asp:ListItem Value="446">Macao</asp:ListItem>
                                                <asp:ListItem Value="807">Macedonia, the former Yugoslav Republic of</asp:ListItem>
                                                <asp:ListItem Value="450">Madagascar</asp:ListItem>
                                                <asp:ListItem Value="454">Malawi</asp:ListItem>
                                                <asp:ListItem Value="458">Malaysia</asp:ListItem>
                                                <asp:ListItem Value="462">Maldives</asp:ListItem>
                                                <asp:ListItem Value="466">Mali</asp:ListItem>
                                                <asp:ListItem Value="470">Malta</asp:ListItem>
                                                <asp:ListItem Value="584">Marshall Islands</asp:ListItem>
                                                <asp:ListItem Value="474">Martinique</asp:ListItem>
                                                <asp:ListItem Value="478">Mauritania</asp:ListItem>
                                                <asp:ListItem Value="480">Mauritius</asp:ListItem>
                                                <asp:ListItem Value="175">Mayotte</asp:ListItem>
                                                <asp:ListItem Value="484">Mexico</asp:ListItem>
                                                <asp:ListItem Value="583">Micronesia, Federated States of</asp:ListItem>
                                                <asp:ListItem Value="498">Moldova, Republic of</asp:ListItem>
                                                <asp:ListItem Value="492">Monaco</asp:ListItem>
                                                <asp:ListItem Value="496">Mongolia</asp:ListItem>
                                                <asp:ListItem Value="499">Montenegro</asp:ListItem>
                                                <asp:ListItem Value="500">Montserrat</asp:ListItem>
                                                <asp:ListItem Value="504">Morocco</asp:ListItem>
                                                <asp:ListItem Value="508">Mozambique</asp:ListItem>
                                                <asp:ListItem Value="104">Myanmar</asp:ListItem>
                                                <asp:ListItem Value="516">Namibia</asp:ListItem>
                                                <asp:ListItem Value="520">Nauru</asp:ListItem>
                                                <asp:ListItem Value="524">Nepal</asp:ListItem>
                                                <asp:ListItem Value="528">Netherlands</asp:ListItem>
                                                <asp:ListItem Value="540">New Caledonia</asp:ListItem>
                                                <asp:ListItem Value="554">New Zealand</asp:ListItem>
                                                <asp:ListItem Value="558">Nicaragua</asp:ListItem>
                                                <asp:ListItem Value="562">Niger</asp:ListItem>
                                                <asp:ListItem Value="566">Nigeria</asp:ListItem>
                                                <asp:ListItem Value="570">Niue</asp:ListItem>
                                                <asp:ListItem Value="574">Norfolk Island</asp:ListItem>
                                                <asp:ListItem Value="580">Northern Mariana Islands</asp:ListItem>
                                                <asp:ListItem Value="578">Norway</asp:ListItem>
                                                <asp:ListItem Value="512">Oman</asp:ListItem>
                                                <asp:ListItem Value="586">Pakistan</asp:ListItem>
                                                <asp:ListItem Value="585">Palau</asp:ListItem>
                                                <asp:ListItem Value="275">Palestinian Territory, Occupied</asp:ListItem>
                                                <asp:ListItem Value="591">Panama</asp:ListItem>
                                                <asp:ListItem Value="598">Papua New Guinea</asp:ListItem>
                                                <asp:ListItem Value="600">Paraguay</asp:ListItem>
                                                <asp:ListItem Value="604">Peru</asp:ListItem>
                                                <asp:ListItem Value="608">Philippines</asp:ListItem>
                                                <asp:ListItem Value="612">Pitcairn</asp:ListItem>
                                                <asp:ListItem Value="616">Poland</asp:ListItem>
                                                <asp:ListItem Value="620">Portugal</asp:ListItem>
                                                <asp:ListItem Value="630">Puerto Rico</asp:ListItem>
                                                <asp:ListItem Value="634">Qatar</asp:ListItem>
                                                <asp:ListItem Value="638">Réunion</asp:ListItem>
                                                <asp:ListItem Value="642">Romania</asp:ListItem>
                                                <asp:ListItem Value="643">Russian Federation</asp:ListItem>
                                                <asp:ListItem Value="646">Rwanda</asp:ListItem>
                                                <asp:ListItem Value="652">Saint Barthélemy</asp:ListItem>
                                                <asp:ListItem Value="654">Saint Helena, Ascension and Tristan da Cunha</asp:ListItem>
                                                <asp:ListItem Value="659">Saint Kitts and Nevis</asp:ListItem>
                                                <asp:ListItem Value="662">Saint Lucia</asp:ListItem>
                                                <asp:ListItem Value="663">Saint Martin (French part)</asp:ListItem>
                                                <asp:ListItem Value="666">Saint Pierre and Miquelon</asp:ListItem>
                                                <asp:ListItem Value="670">Saint Vincent and the Grenadines</asp:ListItem>
                                                <asp:ListItem Value="882">Samoa</asp:ListItem>
                                                <asp:ListItem Value="674">San Marino</asp:ListItem>
                                                <asp:ListItem Value="678">Sao Tome and Principe</asp:ListItem>

                                                <asp:ListItem Value="686">Senegal</asp:ListItem>
                                                <asp:ListItem Value="688">Serbia</asp:ListItem>
                                                <asp:ListItem Value="690">Seychelles</asp:ListItem>
                                                <asp:ListItem Value="694">Sierra Leone</asp:ListItem>
                                                <asp:ListItem Value="702">Singapore</asp:ListItem>
                                                <asp:ListItem Value="534">Sint Maarten (Dutch part)</asp:ListItem>
                                                <asp:ListItem Value="703">Slovakia</asp:ListItem>
                                                <asp:ListItem Value="705">Slovenia</asp:ListItem>
                                                <asp:ListItem Value="90">Solomon Islands</asp:ListItem>
                                                <asp:ListItem Value="706">Somalia</asp:ListItem>
                                                <asp:ListItem Value="710">South Africa</asp:ListItem>
                                                <asp:ListItem Value="239">South Georgia and the South Sandwich Islands</asp:ListItem>
                                                <asp:ListItem Value="728">South Sudan</asp:ListItem>
                                                <asp:ListItem Value="724">Spain</asp:ListItem>
                                                <asp:ListItem Value="144">Sri Lanka</asp:ListItem>
                                                <asp:ListItem Value="729">Sudan</asp:ListItem>
                                                <asp:ListItem Value="740">Suriname</asp:ListItem>
                                                <asp:ListItem Value="744">Svalbard and Jan Mayen</asp:ListItem>
                                                <asp:ListItem Value="748">Swaziland</asp:ListItem>
                                                <asp:ListItem Value="752">Sweden</asp:ListItem>
                                                <asp:ListItem Value="756">Switzerland</asp:ListItem>
                                                <asp:ListItem Value="760">Syrian Arab Republic</asp:ListItem>
                                                <asp:ListItem Value="158">Taiwan, Province of China</asp:ListItem>
                                                <asp:ListItem Value="762">Tajikistan</asp:ListItem>
                                                <asp:ListItem Value="834">Tanzania, United Republic of</asp:ListItem>
                                                <asp:ListItem Value="764">Thailand</asp:ListItem>
                                                <asp:ListItem Value="626">Timor-Leste</asp:ListItem>
                                                <asp:ListItem Value="768">Togo</asp:ListItem>
                                                <asp:ListItem Value="772">Tokelau</asp:ListItem>
                                                <asp:ListItem Value="776">Tonga</asp:ListItem>
                                                <asp:ListItem Value="780">Trinidad and Tobago</asp:ListItem>
                                                <asp:ListItem Value="788">Tunisia</asp:ListItem>
                                                <asp:ListItem Value="792">Turkey</asp:ListItem>
                                                <asp:ListItem Value="795">Turkmenistan</asp:ListItem>
                                                <asp:ListItem Value="796">Turks and Caicos Islands</asp:ListItem>
                                                <asp:ListItem Value="798">Tuvalu</asp:ListItem>
                                                <asp:ListItem Value="800">Uganda</asp:ListItem>
                                                <asp:ListItem Value="804">Ukraine</asp:ListItem>
                                                <asp:ListItem Value="784">United Arab Emirates</asp:ListItem>
                                                <asp:ListItem Value="826">United Kingdom</asp:ListItem>
                                                <asp:ListItem Value="840">United States</asp:ListItem>
                                                <asp:ListItem Value="581">United States Minor Outlying Islands</asp:ListItem>
                                                <asp:ListItem Value="858">Uruguay</asp:ListItem>
                                                <asp:ListItem Value="860">Uzbekistan</asp:ListItem>
                                                <asp:ListItem Value="548">Vanuatu</asp:ListItem>
                                                <asp:ListItem Value="862">Venezuela, Bolivarian Republic of</asp:ListItem>
                                                <asp:ListItem Value="704">Viet Nam</asp:ListItem>
                                                <asp:ListItem Value="92">Virgin Islands, British</asp:ListItem>
                                                <asp:ListItem Value="850">Virgin Islands, U.S.</asp:ListItem>
                                                <asp:ListItem Value="876">Wallis and Futuna</asp:ListItem>
                                                <asp:ListItem Value="732">Western Sahara</asp:ListItem>
                                                <asp:ListItem Value="887">Yemen</asp:ListItem>
                                                <asp:ListItem Value="894">Zambia</asp:ListItem>
                                                <asp:ListItem Value="716">Zimbabwe</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mj_bottompadder20">
                                        <div class="form-group">
                                            <label>
                                                City <sup>*</sup>
                                            </label>
                                            <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mj_bottompadder20">
                                        <div class="form-group">
                                            <label>
                                                Address <sup>*</sup>
                                            </label>
                                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="Street Address"></asp:TextBox>
                                        </div>
                                    </div>


                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="mj_about_section mj_toppadder80 mj_bottompadder80">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-lg-offset-3 col-md-offset-3 col-sm-offset-3">
                                <div class="mj_mainheading mj_toppadder20 mj_bottompadder50">
                                    <h1>y<span>our </span>o<span>rder</span></h1>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 col-lg-offset-1 col-md-offset-1">
                                <div class="woo-cart-table">
                                    <table class="table">
                                        <tr>
                                            <th></th>
                                            <th>Packages</th>
                                            <th>Price</th>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <h6 id="PackageTitleEn" runat="server"></h6>

                                            </td>
                                            <td id="Price" runat="server"></td>
                                        </tr>
                                        
                                        <tr>
                                            <td></td>
                                            <td>
                                                <label class="text-uppercase">total:</label>
                                            </td>
                                            <td><span class="mj_blue_text" id="TotalPrice" runat="server"></span>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="woocommerce-checkout-payment mj_toppadder50 mj_bottompadder50">
                        <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 col-lg-offset-1 col-md-offset-1">
                            <div class="row">
                                <ul class="payment_methods methods">
                                    <li>
                                        <div class="mj_radiobox">
                                            <input type="radio" value="credit_card" id="radio3" name="checkout">
                                            <label for="radio3"></label>
                                        </div>
                                        Credit Card
                                        <div class="payment_box" data-period="credit_card" style="font-weight: normal">
                                            <p></p>
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mj_bottompadder20">
                                                <div class="form-group">
                                                    <label>
                                                        Credit card <sup>*</sup>
                                                    </label>
                                                    <asp:DropDownList ID="ddlCreditCardType" runat="server" CssClass="custom-select">
                                                        <asp:ListItem Value="0">Selet Credit Card Type</asp:ListItem>
                                                        <asp:ListItem Value="1">Visa Card</asp:ListItem>
                                                        <asp:ListItem Value="2">Master Card</asp:ListItem>
                                                        <asp:ListItem Value="3">American Express</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="rfrvCreditCardType" runat="server" ErrorMessage="Please Enter Credit card Type" CssClass="validator" ValidationGroup="Checkout" ControlToValidate="ddlCreditCardType" InitialValue="0"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mj_bottompadder20">
                                                <div class="form-group">
                                                    <label>
                                                        Credit card number available <sup>*</sup>
                                                    </label>
                                                    <asp:TextBox ID="txtCreditCardID" runat="server" CssClass="form-control"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvCreditCardID" runat="server" ErrorMessage="Please Enter Credit card number available" CssClass="validator" ValidationGroup="Checkout" ControlToValidate="txtCreditCardID"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mj_bottompadder20">
                                                <div class="form-group">
                                                    <label>
                                                        Name as it appears on the card <sup>*</sup>
                                                    </label>
                                                    <asp:TextBox ID="txtCreditCardName" runat="server" CssClass="form-control"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvCreditCardName" runat="server" ErrorMessage="Please Enter Name as it appears on the card" CssClass="validator" ValidationGroup="Checkout" ControlToValidate="txtCreditCardName"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mj_bottompadder20">
                                                <div class="form-group">
                                                    <label>
                                                        Expiration date <sup>*</sup>
                                                    </label>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mj_bottompadder20">
                                                    <asp:TextBox ID="txtCreditCardDateExpirationMonth" runat="server" CssClass="form-control" placeholder="Month"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvCreditCardDateExpirationMonth" runat="server" ErrorMessage="Please Enter Expiration Month" CssClass="validator" ValidationGroup="Checkout" ControlToValidate="txtCreditCardDateExpirationMonth"></asp:RequiredFieldValidator>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mj_bottompadder20">
                                                    <asp:TextBox ID="txtCreditCardDateExpirationYear" runat="server" CssClass="form-control" placeholder="Year"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvCreditCardDateExpirationYear" runat="server" ErrorMessage="Please Enter Expiration Year" CssClass="validator" ValidationGroup="Checkout" ControlToValidate="txtCreditCardDateExpirationYear"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mj_bottompadder20">
                                                <div class="form-group">
                                                    <label>
                                                        Verification No <sup>*</sup>
                                                    </label>
                                                    <asp:TextBox ID="txtCreditCardVerification" runat="server" CssClass="form-control"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvCreditCardVerification" runat="server" ErrorMessage="Please Enter Verification No" CssClass="validator" ValidationGroup="Checkout" ControlToValidate="txtCreditCardVerification"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                    </li>

                                    <li>
                                        <div class="mj_radiobox">
                                            <input type="radio" value="dbt" id="radio1" name="checkout">
                                            <label for="radio1"></label>
                                        </div>
                                        Sadad
                                        <div class="payment_box" data-period="dbt">
                                            <p>Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order won’t be shipped until the funds have cleared in our account.</p>

                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mj_bottompadder20" style="font-weight: normal">
                                                <div class="form-group">
                                                    <label>
                                                        Sadad User Name <sup>*</sup>
                                                    </label>
                                                    <asp:TextBox ID="txtSadadUserName" runat="server" CssClass="form-control"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvSadadUserName" runat="server" ErrorMessage="Please Enter Sadad User Name" CssClass="validator" ValidationGroup="Checkout" ControlToValidate="txtSadadUserName"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                    </li>

                                     <li>
                                        <div class="mj_radiobox">
                                            <<input type="radio" value="cheque_payment" id="radio2" name="checkout">
                                            <label for="radio2"></label>
                                        </div>
                                        Direct Bank Transfer
                                        <div class="payment_box" data-period="cheque_payment" style="font-weight: normal">
                                            <p>Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order won’t be shipped until the funds have cleared in our account.</p>

                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mj_bottompadder20">
                                                <div class="form-group">
                                                    <label>
                                                        Number Bank Transfer  <sup>*</sup>
                                                    </label>
                                                    <asp:TextBox ID="txtNumberBankTransfer" runat="server" CssClass="form-control"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvNumberBankTransfer" runat="server" ErrorMessage="Please Enter Number Bank Transfer" CssClass="validator" ValidationGroup="Checkout" ControlToValidate="txtNumberBankTransfer"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                    </li>

                                </ul>
                                <div class="mj_login_form">
                                    <div class="form-group  pull-left">
                                        <div class="mj_checkbox">
                                            <input type="checkbox" value="1" id="check1" name="checkbox">
                                            <label for="check1"></label>
                                        </div>
                                        <span>I've read and accept the <a href="#">Terms & Conditions</a></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="mj_showmore">
                        <asp:LinkButton ID="btnSave" runat="server" OnClick="btnSave_Click" CssClass="mj_showmorebtn mj_blackbtn" ValidationGroup="Checkout">Pay</asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
