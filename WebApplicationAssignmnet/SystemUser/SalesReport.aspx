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

        .dt-button {
  color: #fff;
  background-color: #007bff;
  border-color: #007bff;
  margin-left:10px;
}

.dt-button:hover {
  color: #fff;
  background-color: #0069d9;
  border-color: #0062cc;
}

.dt-button:focus, .dt-button.focus {
  box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.5);
}

.dt-button.disabled, .dt-button:disabled {
  color: #fff;
  background-color: #007bff;
  border-color: #007bff;
}

.dt-button:not(:disabled):not(.disabled):active, .dt-button:not(:disabled):not(.disabled).active,
.show > .dt-button.dropdown-toggle {
  color: #fff;
  background-color: #0062cc;
  border-color: #005cbf;
}

.dt-button:not(:disabled):not(.disabled):active:focus, .dt-button:not(:disabled):not(.disabled).active:focus,
.show > .dt-button.dropdown-toggle:focus {
  box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.5);
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
                        Customer ID :
                            </asp:Label>
                            <br />
                            <asp:TextBox CssClass="form-control" ID="CustomerID" runat="server"></asp:TextBox>
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
                            <asp:Button Text="Search" ID="BtnSearch" runat="server" CssClass="btn btn-primary" ClientIDMode="Static" OnClientClick="return clickSearch();" />
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
                    <table id="GridViewSales" style="display mdl-data-table">
                        <thead>
                            <tr>
                                <th>Order time</th>
                                <th>Payment method</th>
                                <th>Billing address</th>
                                <th>Discount</th>
                                <th>Delivery cost</th>
                                <th>Final total</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
        </div>
    </form>

    <script>
        var isSearch;

        $(document).ready(function () {
            //if (isSearch === true) {
                redraw();
            //}
            //isSearch = false;
        }
        );

        function redraw() {
            var cust = $('#ContentPlaceHolder1_CustomerID').val();
            if (cust === "") cust = null;

            var obj = {
                startTime: $('#ContentPlaceHolder1_StartDate').val(),
                endTime: $('#ContentPlaceHolder1_EndDate').val(),
                custID: cust,
                address: $('#ContentPlaceHolder1_TxtBillingEmail').val(),
                paymentMethod: $('#PaymentMethod option:selected').text()
            };

            $.ajax({
                type: "POST",
                url: "SalesReport.aspx/BindDatatable",
                data: JSON.stringify(obj),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $('#GridViewSales').dataTable({
                        responsive: true,
                        dom: 'lBftrip',
                        buttons: [
                            'copy', 'csv', 'excel', 'pdf','print'
                        ],
                        data: JSON.parse(data.d),
                        columns: [
                            { 'data': 'ordertime' },
                            { 'data': 'paymentMethod' },
                            { 'data': 'billingaddress' },
                            { 'data': 'discount' },
                            { 'data': 'DeliveryCost' },
                            { 'data': 'FinalTotal' },
                        ],
                        "responsive": {
                            "details": {
                                "type": 'column'
                            }
                        },
                        "columnDefs": [
                            {
                                "targets": ['_all'],
                                "className": 'mdc-data-table__cell',
                                "language": {
                                    "infoEmpty": "Empty information.",
                                    "emptyTable": "No record.",
                                    "zeroRecords": "No record."
                                }
                            }]
                    });
                },
                error: function (e) {
                    console.log("Error :  ");
                    console.log(JSON.stringify(e));
                }
            });
        }

        function clickSearch() {
            console.log(isSearch);
            isSearch = true;
        }

    </script>
</asp:Content>
