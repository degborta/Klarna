﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ConfigurePayment.ascx.cs" Inherits="Klarna.Checkout.CommerceManager.Apps.Order.Payments.Plugins.KlarnaCheckout.ConfigurePayment" %>
<%@ Register TagPrefix="mc" Namespace="Mediachase.BusinessFoundation" Assembly="Mediachase.BusinessFoundation, Version=10.4.3.0, Culture=neutral, PublicKeyToken=41d2e7a615ba286c" %>


 <asp:UpdatePanel UpdateMode="Conditional" ID="ConfigureUpdatePanelContentPanel" runat="server" RenderMode="Inline" ChildrenAsTriggers="true">
                    <ContentTemplate>
<style>
    .karnapayment-parameters table.DataForm tbody tr td.FormLabelCell { width: 200px; }
    .karnapayment-parameters h2 { margin-top: 20px }
    .karnapayment-parameters-url { width: 500px; }
</style>

<div class="karnapayment-parameters">

<h2>Market</h2>

<table class="DataForm">
    <tbody>
         <tr>
            <td class="FormLabelCell">Select a market:</td>
            <td class="FormFieldCell">
                <asp:DropDownList runat="server" ID="marketDropDownList" OnSelectedIndexChanged="marketDropDownList_OnSelectedIndexChanged" AutoPostBack="True" />
            </td>
        </tr>
    </tbody>
</table>

<h2>Klarna connection settings</h2>


<table class="DataForm">
    <tbody>
         <tr>
            <td class="FormLabelCell">Username:</td>
            <td class="FormFieldCell">
                <asp:TextBox runat="server" ID="txtUsername" />
                <asp:RequiredFieldValidator ID="requiredUsername" runat="server" ControlToValidate="txtUsername" ErrorMessage="Username is required." />
            </td>
        </tr>
        <tr>
            <td class="FormLabelCell">Password:</td>
            <td class="FormFieldCell">
                <asp:TextBox runat="server" ID="txtPassword"  />
                <asp:RequiredFieldValidator ID="requiredPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required." />
            </td>
        </tr>
        <tr>
            <td class="FormLabelCell">ApiUrl:</td>
            <td class="FormFieldCell">
                <asp:TextBox runat="server" ID="txtApiUrl" CssClass="karnapayment-parameters-url" />
                <asp:RequiredFieldValidator ID="requiredApiUrl" runat="server" ControlToValidate="txtApiUrl" ErrorMessage="Api URL is required." />
            </td>
        </tr>
    </tbody>
</table>

<h2>Klarna widget settings</h2>

<table class="DataForm">
    <tbody>
        <tr>
            <td class="FormLabelCell">Color button:</td>
            <td class="FormFieldCell">
                <asp:TextBox runat="server" ID="txtColorButton" />
                <asp:RegularExpressionValidator  ControlToValidate="txtColorButton" ID="regexColorButton" ValidationExpression="^#([A-Fa-f0-9]{6})$" runat="server" ErrorMessage="Color button invalid color"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="FormLabelCell">Color button text:</td>
            <td class="FormFieldCell">
                <asp:TextBox runat="server" ID="txtColorButtonText" />
                <asp:RegularExpressionValidator  ControlToValidate="txtColorButtonText" ID="regexColorButtonText" ValidationExpression="^#([A-Fa-f0-9]{6})$" runat="server" ErrorMessage="Color button text invalid color"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="FormLabelCell">Color checkbox:</td>
            <td class="FormFieldCell">
                <asp:TextBox runat="server" ID="txtColorCheckbox" />
                <asp:RegularExpressionValidator  ControlToValidate="txtColorCheckbox" ID="regexColorCheckbox" ValidationExpression="^#([A-Fa-f0-9]{6})$" runat="server" ErrorMessage="Color checkbox invalid color"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="FormLabelCell">Color header:</td>
            <td class="FormFieldCell">
                <asp:TextBox runat="server" ID="txtColorHeader" />
                <asp:RegularExpressionValidator  ControlToValidate="txtColorHeader" ID="regexColorHeader" ValidationExpression="^#([A-Fa-f0-9]{6})$" runat="server" ErrorMessage="Color header invalid color"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="FormLabelCell">Color link:</td>
            <td class="FormFieldCell">
                <asp:TextBox runat="server" ID="txtColorLink" />
                <asp:RegularExpressionValidator  ControlToValidate="txtColorLink" ID="regexColorLink" ValidationExpression="^#([A-Fa-f0-9]{6})$" runat="server" ErrorMessage="Color link invalid color"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="FormLabelCell">Radius border:</td>
            <td class="FormFieldCell">
                <asp:TextBox runat="server" ID="txtRadiusBorder" />
            </td>
        </tr>
        <tr>
            <td class="FormLabelCell">Color checkbox checkmark:</td>
            <td class="FormFieldCell">
                <asp:TextBox runat="server" ID="txtColorCheckboxCheckmark" />
                <asp:RegularExpressionValidator  ControlToValidate="txtColorCheckboxCheckmark" ID="regexColorCheckboxCheckmark" ValidationExpression="^#([A-Fa-f0-9]{6})$" runat="server" ErrorMessage="Color checkbox checkmark invalid color"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="FormLabelCell">Shipping details:</td>
            <td class="FormFieldCell">
                <asp:TextBox runat="server" ID="txtShippingDetails" />
            </td>
        </tr>
        <tr>
         <td class="FormLabelCell">Select shipping option in Klarna Checkout iFrame:</td>
            <td class="FormFieldCell">
                <asp:CheckBox runat="server" ID="shippingOptionsInIFrameCheckBox" />
            </td>
        </tr>
        <tr>
            <td class="FormLabelCell">Allow separate shipping address:</td>
            <td class="FormFieldCell">
                <asp:CheckBox runat="server" ID="allowSeparateShippingAddressCheckBox" />
            </td>
        </tr>
        <tr>
            <td class="FormLabelCell">Date of birth mandatory:</td>
            <td class="FormFieldCell">
                <asp:CheckBox runat="server" ID="dateOfBirthMandatoryCheckBox" />
            </td>
        </tr>
         <tr>
            <td class="FormLabelCell">Title mandatory:</td>
            <td class="FormFieldCell">
                <asp:CheckBox runat="server" ID="titleMandatoryCheckBox" />
            </td>
        </tr>
        <tr>
            <td class="FormLabelCell">Show subtotal detail:</td>
            <td class="FormFieldCell">
                <asp:CheckBox runat="server" ID="showSubtotalDetailCheckBox" />
            </td>
        </tr>
        <tr>
            <td class="FormLabelCell">Send shipping countries:</td>
            <td class="FormFieldCell">
                <asp:CheckBox runat="server" ID="sendShippingCountriesCheckBox" />
            </td>
        </tr>
        <tr>
            <td class="FormLabelCell">Prefill addresses:</td>
            <td class="FormFieldCell">
                <asp:CheckBox runat="server" ID="prefillAddressCheckBox" />
            </td>
        </tr>
        <tr>
            <td class="FormLabelCell">Send shipping options prior to filling addresses:</td>
            <td class="FormFieldCell">
                <asp:CheckBox runat="server" ID="SendShippingOptionsPriorAddressesCheckBox" />
            </td>
        </tr>
         <tr>
            <td class="FormLabelCell">Send product and image URL:</td>
            <td class="FormFieldCell">
                <asp:CheckBox runat="server" ID="SendProductAndImageUrlCheckBox" />
            </td>
        </tr>
    </tbody>
</table>

<h2>Klarna Widget additional checkbox</h2>

<table class="DataForm">
    <tbody>
        <tr>
            <td class="FormLabelCell">Additional checkbox text:</td>
            <td class="FormFieldCell">
                <asp:TextBox runat="server" ID="additionalCheckboxTextTextBox" />
            </td>
        </tr>
        <tr>
            <td class="FormLabelCell">Additional checkbox default checked:</td>
            <td class="FormFieldCell">
                <asp:CheckBox runat="server" ID="additionalCheckboxDefaultCheckedCheckBox" />
            </td>
        </tr>
        <tr>
            <td class="FormLabelCell">Additional checkbox required:</td>
            <td class="FormFieldCell">
                <asp:CheckBox runat="server" ID="additionalCheckboxRequiredCheckBox" />
            </td>
        </tr>
    </tbody>
</table>

<h2>Merchant/callback URLs</h2>

<table class="DataForm">
    <tbody>
         <tr>
            <td class="FormLabelCell">Checkout URL:</td>
            <td class="FormFieldCell">
                <asp:TextBox runat="server" ID="txtCheckoutUrl" CssClass="karnapayment-parameters-url" />
                <asp:RequiredFieldValidator ID="requiredCheckoutUrl" runat="server" ControlToValidate="txtCheckoutUrl" ErrorMessage="Checkout URL is required." />
            </td>
        </tr>
        <tr>
            <td class="FormLabelCell">Terms URL:</td>
            <td class="FormFieldCell">
                <asp:TextBox runat="server" ID="txtTermsUrl" CssClass="karnapayment-parameters-url" />
                <asp:RequiredFieldValidator ID="requiredTermsUrl" runat="server" ControlToValidate="txtTermsUrl" ErrorMessage="Terms URL is required." />
            </td>
        </tr>
         <tr>
            <td class="FormLabelCell">Cancellation terms URL:</td>
            <td class="FormFieldCell">
                <asp:TextBox runat="server" ID="txtCancellationTermsUrl" CssClass="karnapayment-parameters-url" />
            </td>
        </tr>
         <tr>
            <td class="FormLabelCell">Push URL:</td>
            <td class="FormFieldCell">
                <asp:TextBox runat="server" ID="txtPushUrl" CssClass="karnapayment-parameters-url" />
                <asp:RequiredFieldValidator ID="requiredPushUrl" runat="server" ControlToValidate="txtPushUrl" ErrorMessage="Push URL is required." />
            </td>
        </tr>
         <tr>
            <td class="FormLabelCell">Notification/fraud URL:</td>
            <td class="FormFieldCell">
                <asp:TextBox runat="server" ID="txtNotificationUrl" CssClass="karnapayment-parameters-url" />
                <asp:RequiredFieldValidator ID="requiredNotificationUrl" runat="server" ControlToValidate="txtNotificationUrl" ErrorMessage="Notification URL is required." />
            </td>
        </tr>
        <tr>
            <td class="FormLabelCell">Shipping option update URL:</td>
            <td class="FormFieldCell">
                <asp:TextBox runat="server" ID="txtShippingOptionUpdateUrl" CssClass="karnapayment-parameters-url" />
                <asp:RequiredFieldValidator ID="requiredShippingOptionUpdateUrl" runat="server" ControlToValidate="txtShippingOptionUpdateUrl" ErrorMessage="Shipping option update URL is required." />
            </td>
        </tr>
        <tr>
            <td class="FormLabelCell">Address update URL:</td>
            <td class="FormFieldCell">
                <asp:TextBox runat="server" ID="txtAddressUpdateUrl" CssClass="karnapayment-parameters-url" />
                <asp:RequiredFieldValidator ID="requiredAddressUpdateUrl" runat="server" ControlToValidate="txtAddressUpdateUrl" ErrorMessage="Address update URL is required." />
            </td>
        </tr>
        <tr>
            <td class="FormLabelCell">Order validation URL:</td>
            <td class="FormFieldCell">
                <asp:TextBox runat="server" ID="txtOrderValidationUrl" CssClass="karnapayment-parameters-url" />
                <asp:RequiredFieldValidator ID="requiredOrderValidationUrl" runat="server" ControlToValidate="txtOrderValidationUrl" ErrorMessage="Order validation URL is required." />
            </td>
        </tr>
         <tr>
            <td class="FormLabelCell">Confirmation URL:</td>
            <td class="FormFieldCell">
                <asp:TextBox runat="server" ID="txtConfirmationUrl" CssClass="karnapayment-parameters-url" />
                <asp:RequiredFieldValidator ID="requiredConfirmationUrl" runat="server" ControlToValidate="txtConfirmationUrl" ErrorMessage="Confirmation URL is required." />
            </td>
        </tr>
        <tr>
            <td class="FormLabelCell">Require validate callback success:</td>
            <td class="FormFieldCell">
                <asp:CheckBox runat="server" ID="requireValidateCallbackSuccessCheckBox" />
            </td>
        </tr>
    </tbody>
</table>
</div>
                        </ContentTemplate></asp:UpdatePanel>