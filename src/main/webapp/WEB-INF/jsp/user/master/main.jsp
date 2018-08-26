<%@ include file="../../taglibs.jsp" %>

<div class="panel panel-flat">
    <div class="panel-heading table-responsive">
        <div class="row">
            <div class="col-xs-7 col-xs-offset-5 margin-top-15px">
                <div class="col-lg-5 col-lg-offset-7">
                    <table class="table">
                        <tr>
                            <td class="col-lg-6 form-group border-top-none">
                                <a type="button" class="btn bg-primary-800 btn-block" href="${ctx}/user/add">
                                    <span class="glyphicon glyphicon-plus"></span> Add New User
                                </a>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>

        <div class="panel-body col-lg-12 table-responsive">
            <div class="topScrollVisible" id="topScrollVisibleMainCategory">
                <div class="topScrollTableLength" id="topScrollTableLengthMainCategory"></div>
            </div>
            <div class="tableWrapper" id="tableWrapperMainCategory">
                <div class="scrollTable" id="scrollTableMainCategory">
                    <!-- main searching is disabled in options  -->
                    <table class="table table-bordered dataTable nooverflow" class="display" id="userTable"
                           style="white-space: nowrap;">
                        <thead>
                        <tr class="bg-color-grey" style="white-space: nowrap;">
                            <th class="no-sort" style="width:5%;">ID</th>
                            <th class="no-sort">Username</th>
                            <th class="no-sort">FirstName</th>
                            <th class="no-sort">LastName</th>
                            <th class="no-sort">Email</th>
                            <th class="no-sort">Active Status</th>
                            <th class="no-sort">Role</th>
                            <th class="no-sort">Date Created</th>
                            <th class="no-sort">Action</th>
                        </tr>
                        </thead>
                        <thead>
                        <tr class="bg-color-grey">
                            <td></td>
                            <td>
                                <div class="input-group set-padding">
                                    <input type="text" data-column="1"
                                           class="form-control input-filter filter border-bottom-light-grey-important"/>
                                    <span class="input-group-btn">
										<i class="glyphicon glyphicon-search"></i>
									</span>
                                </div>
                            </td>
                            <td>
                                <div class="input-group set-padding">
                                    <input type="text" data-column="2"
                                           class="form-control input-filter filter border-bottom-light-grey-important"/>
                                    <span class="input-group-btn">
										<i class="glyphicon glyphicon-search"></i>
									</span>
                                </div>
                            </td>
                            <td>
                                <div class="input-group set-padding">
                                    <input type="text" data-column="3"
                                           class="form-control input-filter filter border-bottom-light-grey-important"/>
                                    <span class="input-group-btn">
										<i class="glyphicon glyphicon-search"></i>
									</span>
                                </div>
                            </td>
                            <td>
                                <div class="input-group set-padding">
                                    <input type="text" data-column="4"
                                           class="form-control input-filter filter border-bottom-light-grey-important"/>
                                    <span class="input-group-btn">
										<i class="glyphicon glyphicon-search"></i>
									</span>
                                </div>
                            </td>
                            <td>
                                <div class="input-group set-padding">
                                    <select class="search-input-select form-control select-filter filter"
                                            data-column="5">
                                        <option value="">Floor</option>
                                        <option value="Yes">Yes</option>
                                        <option value="No">No</option>
                                    </select>
                                </div>
                            </td>
                            <td>
                                <div class="input-group set-padding">
                                    <select class="search-input-select form-control select-filter filter"
                                            data-column="6">
                                        <option value="">Floor</option>
                                        <option value="Yes">Yes</option>
                                        <option value="No">No</option>
                                    </select>
                                </div>
                            </td>
                            <td>
                                <div class="range-filter" data-column="7">
                                    <div class='input-group date vertical-input' id='createDateFrom'>
										<span class="input-group-addon"> <span
                                                class="fa fa-calendar"></span>
										</span> <input type='text' class="form-control range-start filter"
                                                       readonly placeholder="From" id='createDateFromText'
                                                       name='createDateFrom'/>
                                    </div>
                                    <div class='input-group date vertical-input' id='createDateTo'>
										<span class="input-group-addon"> <span
                                                class="fa fa-calendar"></span>
										</span> <input type='text' class="form-control range-end filter"
                                                       readonly placeholder="To" id='createDateToText'
                                                       name='createDateTo'/>
                                    </div>
                                </div>
                            </td>
                            <td class="text-align-center">
                                <div>
                                    <div class="input-group" id="searchButton">
                                        <button type="button" class="btn bg-primary-800 btn-block">
                                            <span class="glyphicon glyphicon-search"></span> Search
                                        </button>
                                    </div>
                                    <div class="input-group vertical-input border-bottom-color-transparent">
                                        <a id="mcResetButton" class="color-blue"> RESET </a>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="u" items="${users}">
                            <tr>
                                <td>${u.id}</td>
                                <td>${u.userName}</td>
                                <td>${u.firstName}</td>
                                <td>${u.lastName}</td>
                                <td>${u.email}</td>
                                <td>${u.activeStatus}</td>
                                <td>${u.authorityName.roleName}</td>
                                <td>${u.createdTime}</td>
                                <td>
                                    <span><a href="${ctx}/user/edit/${u.id}">Edit</a></span>
                                    <span><a href="${ctx}/user/delete/${u.id}">Delete</a></span>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        var userTable = $('#userTable').DataTable({
            "order": [[7, "desc"]],
            "ordering": true,
            "bLengthChange": false,
            "pagingType": "full_numbers",
            "bInfo": false,
            "processing": true,
            "columnDefs": [{
                "orderable": true,
                "targets": "no-sort",
                "bFilter": false
            }]
        });
        $(".first.paginate_button, .last.paginate_button").remove();
        $(".dataTables_filter").remove();
        $('#userTable #createDateFrom, #userTable #createDateTo, #userTable #lastModifiedFrom, #userTable #lastModifiedTo').datetimepicker({
            dateFormat: 'M dd, yyyy',
            timeFormat: 'hh:mm:ss p',
            defaultDate: new Date(),
            autoclose: true
        });

        function mainDataFilter() {
            $('#userTable thead .input-filter').each(function () {
                var i = $(this).data('column');
                var text = $(this).val();
                userTable.columns(i).search(text);
            })
            $('#userTable thead .select-filter').each(function () {
                var i = $(this).data('column');
                var text = $.fn.dataTable.util.escapeRegex($(this).val());
                userTable.columns(i).search(text ? '^' + text + '$' : '', true, false);
            });
            userTable.draw();
            $(".first.paginate_button, .last.paginate_button").remove();
        }

        //search
        $('#userTable input').keypress(function (e) {
            // Check Enter key press
            if (e.which === 13) {
                mainDataFilter();
            }
        });

        $("#userTable #searchButton").click(function () {
            mainDataFilter();
        });

        $('#userTable thead td div span i').click(function () {
            mainDataFilter();
        });

        $('#mcResetButton').click(function () {
            $('#userTable .filter').each(function () {
                $(this).val("");
            });
            userTable.columns().search('').draw();
            $(".first.paginate_button, .last.paginate_button").remove();
        });

        $.fn.dataTable.ext.search.push(function (settings, data, dataIndex) {
            var draw = true;
            $('#userTable thead .range-filter').each(function () {
                var i = $(this).data('column');
                var start = $(this).find('.range-start').val();
                var end = $(this).find('.range-end').val();
                var current = data[i];
                var type = $(this).data('type');
                if (start !== "" && end !== "") {
                    if (current !== "") {
                        if (type == "number") {
                            start = parseInt(start);
                            end = parseInt(end);
                            current = parseInt(current);
                        } else {
                            start = new Date(start);
                            end = new Date(end);
                            current = new Date(current);
                        }
                        if (start > current) {
                            draw = false;
                        }
                        if (end < current) {
                            draw = false;
                        }
                    } else {
                        draw = false;
                    }
                }
            });
            return draw;
        });
    });
</script>