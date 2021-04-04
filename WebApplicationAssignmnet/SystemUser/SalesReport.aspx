<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SalesReport.aspx.cs" MasterPageFile="~/WebUser.Master" Inherits="WebApplicationAssignmnet.SystemUser.SalesReport" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        #GridViewSales {
            width: 99%;
        }
    </style>
    <script src="../lib/js/jquery.js"></script>

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
                        <asp:TextBox CssClass="form-control" runat="server" ID="StartDate" ClientIDMode="Static"></asp:TextBox>
                    </div>
                    <div class="col">
                        <asp:Label runat="server" Font-Bold="true">
                        End Date :
                        </asp:Label>
                        <br />
                        <asp:TextBox CssClass="form-control" ID="EndDate" runat="server" ClientIDMode="Static"></asp:TextBox>
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
                        <asp:TextBox CssClass="form-control" ID="CustomerID" runat="server" ClientIDMode="Static"></asp:TextBox>
                        <br />
                        <br />
                    </div>
                    <div class="w-100"></div>
                    <div class="col">
                        <asp:Label runat="server" Font-Bold="true">
                        Billing email address :
                        </asp:Label>
                        <br />
                        <asp:TextBox CssClass="form-control" ID="TxtBillingEmail" runat="server" ClientIDMode="Static"></asp:TextBox>
                        <br />
                        <br />
                    </div>
                </div>
                <div class="row" style="float: right;">
                    <div class="row" style="float: right;">
                        <button type="button" id="BtnSearch" class="btn btn-primary" onclick="clickSearch();">Search</button>
                    </div>
                </div>
                <div>
                </div>
            </div>
        </div>
    </div>

    <div class="card input-group">
        <div class="card-body" style="margin: auto; width: 100%;">
            <table id="GridViewSales" class="display nowrap responsive mdl-data-table">
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

    <script>
        var table;
        $(document).ready(function () {
            redraw();
            var startdate = moment().startOf('month').format("DD-MM-YYYY");
            var enddate = moment(new Date()).format("DD-MM-YYYY");
            $("input[id*='StartDate']").datepicker({
                format: "dd-mm-yyyy",
                defaultDate: startdate
            });
            $("input[id*='EndDate']").datepicker({
                format: "dd-mm-yyyy",
                defaultDate: enddate
            });
            $("input[id*='StartDate']").datepicker("setDate", startdate);
            $("input[id*='EndDate']").datepicker("setDate", enddate);

        }
        );

        function redraw() {
            var cust = $('#CustomerID').val();
            //if (cust === "") cust = ;
            var startDate = $('#StartDate').val();
            var endDate = $('#EndDate').val();
            if (startDate === undefined)
                startDate = '';
            if (endDate === undefined)
                endDate = '';
            var obj = {
                startTime: startDate,
                endTime: endDate,
                custID: cust,
                address: $('#TxtBillingEmail').val(),
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
                        dom: 'lBftrip',
                        buttons: [
                            'copy', 'csv', 'excel', 'pdf', 'print'
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
            debugger;
            var table = table = $('#GridViewSales').DataTable();
            table.destroy();
            redraw();
        }


    </script>
    <script src="../lib/js/Moment.js"></script>
</asp:Content>
