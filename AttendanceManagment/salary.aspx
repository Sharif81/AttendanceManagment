<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="salary.aspx.cs" Inherits="AttendanceManagment.salary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #btn-submit {
            margin-top: 29px;
        }

        #generate-salary {
            margin-top: 29px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4><%:Page.Title %></h4>

                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item active"><%:Page.Title %></li>
                    </ol>
                </div>
            </div>
        </div>
    </section>

    <!-- Main content -->

    <section class="content">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                         <label for="month">Month</label>
                    <select class="form-control form-control-sm">
                        <option value="NA">Select Salary Process Month</option>
                        <option value="January">January</option>
                        <option value="February">February</option>
                        <option value="March">March</option>
                        <option value="April">April</option>
                        <option value="May">May</option>
                        <option value="June">June</option>
                        <option value="July">July</option>
                        <option value="August">August</option>
                        <option value="September">September</option>
                        <option value="October">October</option>
                        <option value="November">November</option>
                        <option value="December">December</option>
                    </select>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <label for="year">Year</label>
                        <select class="form-control form-control-sm" id="year">
                            <option value="NA">Select Salary Process Year</option>
                        </select>
                    </div>
                </div>

                <div class="col-md-4">
                    <button type="button" id="generate-salary" class="btn btn-success btn-sm"><i class="fas fa-file-pdf"></i> Generate Sheet</button>
                </div>

            </div>
        </div>
    </section>
    <%--<section class="content">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="codeno">Employee Code</label>
                        <asp:DropDownList runat="server" CssClass="form-control form-control-sm" ClientIDMode="Static" ID="empcode"></asp:DropDownList>
                    </div>
                </div>

                <div class="col-md-2">
                    <div class="form-group">
                        <label for="medical">Medical Allow</label>
                        <input type="text" class="form-control form-control-sm" id="medical" placeholder="Enter M.A">
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="form-group">
                        <label for="food">Food Allow</label>
                        <input type="text" class="form-control form-control-sm" id="food" placeholder="Enter F.A">
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="form-group">
                        <label for="houserent">House Rent</label>
                        <input type="text" class="form-control form-control-sm" id="houserent" placeholder="Enter House Rent">
                    </div>
                </div>
                 <div class="col-md-2">
                    <div class="form-group">
                        <label for="othersallowance">Others Allow</label>
                        <input type="text" class="form-control form-control-sm" id="otherallowance" placeholder="Enter O.A">
                    </div>
                </div>
                
            </div>

            <div class="row">
               <div class="col-md-2">
                    <div class="form-group">
                        <label for="present">Total Present</label>
                        <input type="text" class="form-control form-control-sm" id="present" placeholder="Enter Total Present">
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="form-group">
                        <label for="absent">Total Absent</label>
                        <input type="text" class="form-control form-control-sm" id="absent" placeholder="Enter Total Absent">
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="form-group">
                        <label for="leave">Leave</label>
                        <input type="text" class="form-control form-control-sm" id="leave" placeholder="Enter Employee Leave">
                    </div>
                </div>                  
                <div class="col-md-2">
                    <button type="button" data-id="0" class="btn btn-sm btn-success" id="btn-submit"><i class="fa fa-save"></i> Submit</button>
                </div>
            </div>         

        </div>
    </section>--%>



    <script>

        $(document).ready(function () {
            var ddIYears = $("#year");
            var currentYear = (new Date()).getFullYear();
            for (var i = 2016; i <= currentYear + 3; i++) {
                var option = $("<option />")
                option.html(i);
                option.val(i);
                ddIYears.append(option);
            }
        });
    <%--    $(document).ready(function () {

            $("#btn-submit").on("click", function () {

                var obj = {
                    SalaryID: parseInt($(this).attr("data-id")),
                    EmpCode: parseInt($("#empcode").val()),
                    MedicalAllowance: parseFloat($("#medical").val()),
                    FoodAllowance: parseFloat($("#food").val()),
                    HouseRent: parseFloat($("#houserent").val()),
                    OthersAllowance: parseFloat($("#otherallowance").val()),
                    AbsentDay: parseInt($("#absent").val()),
                    PresentDay: parseInt($("#present").val()),
                    LeaveStatus: parseInt($("#leave").val())

                }

                if (obj.EmpCode == 0 || obj.MedicalAllowance == '' || obj.FoodAllowance == '' || obj.HouseRent == '' || obj.OthersAllowance == '' || obj.AbsentDay == '' || obj.PresentDay == '' || obj.LeaveStatus == '') {

                     swal("Hi!", "Something Wrong!", "warning");
                     return false;
                 }
                 else {
                    save_salary_status_info(obj);
                 }
                
            });
        });


        function save_salary_status_info(obj) {

            $.post('<%=Page.ResolveUrl("attendance_services.asmx/Insert_Update_SalaryInfo")%>', { insertObject: JSON.stringify(obj) }, function (data, status, xhr) {

                 if (status == "success") {

                      swal("Hi", "Salary Status Save Successfully", "success");
                 }
                 else {
                     swal("Hi", "Something Wrong", "warning");
                 }

            });
        }--%>

    </script>

</asp:Content>
