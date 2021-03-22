<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SalesReport.aspx.cs" MasterPageFile="~/WebUser.Master" Inherits="WebApplicationAssignmnet.SystemUser.SalesReport" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .row {
            margin: 0px;
        }

        .data-field {
            margin-right: 15px;
            margin-left: 15px;
        }

        .form-control, .input {
            width: 250px;
            display: inline-block;
        }

        #BtnSearch {
            right: 50px;
        }

        #GridViewSales {
            width: 100%;
        }

        .mdc-data-table {
            display: contents;
        }
    </style>
    <script src="../lib/js/jquery.js"></script>
    <form id="form1" runat="server">

        <div class="card input-group" style="margin-bottom: 10px;">
            <div class="card-body" style="border: solid; border-radius: 5px; border: brown 0.5px; margin-right: 5px;">
                <div class="data-field">
                    <div class="row">
                        <h3 style="margin-left: 10px;">Sales report</h3>
                    </div>
                    <div class="row">
                        <div class="col">
                            <asp:Label runat="server" Font-Bold="true">
                        Start Date :
                            </asp:Label>
                            <br />
                            <asp:TextBox CssClass="form-control" ID="StartDate" runat="server" OnTextChanged="StartDate_TextChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:LinkButton ID="StartDateButton" OnClick="StartDateButton_Click" runat="server">
                        <i class="fa fa-calendar"></i>
                            </asp:LinkButton>
                            <br />
                            <asp:Calendar ID="StartDateCalendar" runat="server" TodayDayStyle-ForeColor="SkyBlue" Visible="false" OnSelectionChanged="StartDateCalendar_SelectionChanged">
                                <SelectedDayStyle BackColor="PowderBlue" />
                            </asp:Calendar>
                            <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="StartDate" ErrorMessage="Invalid Date Format" Type="Date" Operator="DataTypeCheck" Display="Dynamic" Text="*" ForeColor="Red">
                            </asp:CompareValidator>
                        </div>
                        <div class="col">
                            <asp:Label runat="server" Font-Bold="true">
                        End Date :
                            </asp:Label>
                            <br />
                            <asp:TextBox CssClass="form-control" ID="EndDate" runat="server" OnTextChanged="EndDate_TextChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:LinkButton ID="EndDateButton" OnClick="EndDateButton_Click" runat="server">
                        <i class="fa fa-calendar"></i>
                            </asp:LinkButton>
                            <asp:Calendar ID="EndDateCalendar" runat="server" TodayDayStyle-ForeColor="SkyBlue" Visible="false" OnSelectionChanged="EndDateCalendar_SelectionChanged">
                                <SelectedDayStyle BackColor="PowderBlue" />
                            </asp:Calendar>
                        </div>
                        <div class="col">
                            <asp:Label runat="server" Font-Bold="true">
                        Payment Method :
                            </asp:Label>
                            <br />
                            <asp:DropDownList ID="PaymentMethod" ClientIDMode="Static" runat="server" CssClass="custom-select input" DataSourceID="SqlDataSource1" DataTextField="PMDescription" DataValueField="PaymentMethodID" AppendDataBoundItems="true">
                                <asp:ListItem Text="All" Value="0" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Tayy.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [PaymentMethodID], [PMDescription] FROM [PaymentMethod] WHERE ([IsActive] = @IsActive)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="true" Name="IsActive" Type="Boolean" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            -
                        </div>
                        <div class="col">
                            <asp:Label runat="server" Font-Bold="true">
                        Customer name :
                            </asp:Label>
                            <br />
                            <asp:TextBox CssClass="form-control" ID="CustomerName" runat="server"></asp:TextBox>
                            <br />
                            <br />
                        </div>
                        <div class="w-100"></div>
                        <div class="col">
                            <asp:Label runat="server" Font-Bold="true">
                        Billing email address :
                            </asp:Label>
                            <br />
                            <asp:TextBox CssClass="form-control" ID="TxtBillingEmail" runat="server"></asp:TextBox>
                            <br />
                            <br />
                        </div>
                    </div>
                    <div class="row" style="float: right;">
                        <div class="row" style="float: right;">
                            <asp:Button Text="Search" ID="BtnSearch" runat="server" CssClass="btn btn-primary" ClientIDMode="Static" OnClick="BtnSearch_Click" />
                        </div>
                    </div>
                    <div>
                    </div>
                </div>
            </div>
        </div>

        <div class="card input-group">
            <div class="card-body" style="margin: auto; width: 100%;">
                <div class="table-responsive">
                    <asp:GridView ID="GridViewSales" runat="server" CssClass="display mdl-data-table " AutoGenerateColumns="false" ClientIDMode="Static" EmptyDataText="No record." ShowHeaderWhenEmpty="true" EmptyDataRowStyle-BorderStyle="None">
                        <Columns>
                            <asp:BoundField DataField="OrderTime" HeaderText="Order Time" DataFormatString="{0:dd-MM-yyyy hh:mm:ss}" />
                            <asp:BoundField DataField="CustID" HeaderText="Customer ID" />
                            <asp:BoundField DataField="BillingAddress" HeaderText="Billing address" />
                            <asp:BoundField DataField="PaymentMethod" HeaderText="Payment Method" />
                            <asp:BoundField DataField="Discount" HeaderText="Coupon Discount" DataFormatString="{0:###,##0.00}" />
                            <asp:BoundField DataField="DeliveryCost" HeaderText="Delivery Cost" DataFormatString="{0:###,##0.00}" />
                            <asp:BoundField DataField="FinalTotal" HeaderText="Final Total" DataFormatString="{0:###,##0.00}" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>

    <script>

        $(document).ready(function () {
            var table = $('#GridViewSales').DataTable({
                responsive: {
                    details: {
                        type: 'column'
                    }
                },
                columnDefs: [
                    {
                        targets: ['_all'],
                        className: 'mdc-data-table__cell',
                        language: {
                            infoEmpty: "Empty information.",
                            emptyTable: "No record.",
                            zeroRecords: "No record."
                        }
                    }]
            });

        });

    </script>
</asp:Content>
