<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="SampleProject.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>
        <h3>Your contact page.</h3>
        <address>
            Acsys Internaltional Pvt ltd<br />
            Axware India pvt ltd, Chennai<br />
            <abbr title="Phone">Phone : </abbr>
            9792323282
        </address>

        <address>
            <strong>Support:</strong>   <a href="mailto:tamilselvan.mariappan@acsys.com">tamilselvan.mariappan@acsys.com</a><br />
            <strong>Marketing:</strong> <a href="mailto:Marketing@yopmail.com">Marketing@yopmail.com</a>
        </address>
    </main>
</asp:Content>
