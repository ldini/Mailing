<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAccountingFirm.master" AutoEventWireup="true" CodeFile="AccountingFirmDashboardEvents.aspx.cs" Inherits="New_AccountingFirmDashboardEvents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headAccountingFirm" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--
    <ul class="breadcrumb">
        <li>
            <i class="icon-home"></i>
            <a href="index.html">Home</a>
            <i class="icon-angle-right"></i>
        </li>
        <li><a href="">Tasks</a></li>
    </ul>
    -->

    <%-----------------------------------------------------------------------------------------------------%>
    <%--  START CAMPAIGNS     -----------------------------------------------------------------------------%>
    <%-----------------------------------------------------------------------------------------------------%>

    <div class="row">
        <asp:DropDownList  ID="comboCampaign" runat="server" CssClass="form-control" Style="margin-left:8px" AutoPostBack="true" OnSelectedIndexChanged="comboCampaign_SelectedIndexChanged">
          </asp:DropDownList>
    </div>
    <div class="row">

        <div runat="server" id="idCodeBarCampaignOPenMailing" class="span8 widget blue" ontablet="span7" ondesktop="span8" style="width: 375px; margin-left: 8px">
            <div style="height: 20px; text-align: center; font-size: 15px">
                <a href="#" style="color: white" target="_blank">Open Mailing per Hour per Campaign</a>
                <%-- <asp:LinkButton runat="server" ID="LinkButton100" OnClick="botonRep3_Click" ForeColor="White"> Budget vs Current Staff per month [Resources]</asp:LinkButton>--%>
            </div>
            <div id="chart2-openmail" style="height: 282px"></div>
        </div>

        <div runat="server" id="idCodeBarCampaignRegistration" class="span8 widget blue" ontablet="span7" ondesktop="span8" style="width: 375px; margin-left: 8px">
            <div style="height: 20px; text-align: center; font-size: 15px">
                <a href="#" style="color: white" target="_blank">Registration Prospects per Hour per Campaign</a>
                <%-- <asp:LinkButton runat="server" ID="LinkButton100" OnClick="botonRep3_Click" ForeColor="White"> Budget vs Current Staff per month [Resources]</asp:LinkButton>--%>
            </div>
            <div id="chart2-registermail" style="height: 282px"></div>
        </div>

    </div>
    <div class="row">
    	<div class="widget span3 red" onTablet="span6" onDesktop="span3" style="margin-left:8px" runat="server" id="mailingQ">
					
					<h2><span class="glyphicons pie_chart"><i></i></span> Mailing Results Q</h2>
					
					<hr>
					
					<div class="content">
						
						<div class="browserStat big">
							<img src="img/emailsSent.png" alt="EmailOpen"/>
							<span class="number" runat="server" id="emailSentQ"></span>
							
						</div>
						<div class="browserStat big">
							<img src="img/emailsOpen.png" alt="Firefox"/>
							<span class="number" runat="server" id="emailOpenQ"></span>
						</div>
						<div class="browserStat">
							<img src="img/emailsNotOpen.png" alt="Internet Explorer">
							<span class="number" runat="server" id="emailNotOpenQ"></span>
						</div>
						<div class="browserStat">
							<img src="img/emailsRebound.png" alt="Safari">
							<span class="number" runat="server" id="emailReboundQ"></span>
						</div>
						<div class="browserStat">
							<img src="img/emailsUnSubscription.png" alt="Opera">
							<span class="number" runat="server" id="emailUnSubscribeQ"></span>
						</div>	
								
						
					</div>
				</div>
        <div class="widget span3 blue" onTablet="span6" onDesktop="span3" runat="server" id="mailingP">
					
					<h2><span class="glyphicons pie_chart"><i></i></span> Mailing Results %</h2>
					
					<hr>
					
					<div class="content">
						
						<div class="browserStat big">
							<img src="img/emailsSentb.png" alt="EmailOpen"/>
                           <span class="number" runat="server" id="emailSentP"></span>
						</div>
						<div class="browserStat big">
							<img src="img/emailsOpenb.png" alt="Firefox">
							<span class="number" runat="server" id="emailOpenP"></span>
						</div>
						<div class="browserStat">
							<img src="img/emailsNotOpenb.png" alt="Internet Explorer">
							<span class="number" runat="server" id="emailNotOpenP"></span>
						</div>
						<div class="browserStat">
							<img src="img/emailsReboundb.png" alt="Safari">
							<span class="number" runat="server" id="emailReboundP"></span>
						</div>
						<div class="browserStat">
							<img src="img/emailsUnSubscriptionb.png" alt="Opera">
							<span class="number" runat="server" id="emailUnSubscribeP"></span>
						</div>	
								
						
					</div>
				</div>

        <div runat="server" id="graphReboundMotives" class="widget blue span5" ontablet="span6" ondesktop="span5" style="width: 350px">

            <h2>% Rebound Motives </h2>
            <hr>

            <div class="content">

                <div class="verticalChart">

                    <asp:Repeater ID="RepeaterBarras" runat="server">
                        <ItemTemplate>
                            <%--<asp:LinkButton runat="server" id="BtnBudgetVsActualStaffSubGraph" onclick="BtnBudgetVsActualStaff_Click" ></asp:LinkButton>
                              <a href="http://reportes.itbusinessco.com/Reports/Pages/Report.aspx?ItemPath=%2fHR%2fHR_staffVSbudgetGeneral" target="_blank">--%>
                           
                                <div class="singleBar">

                                    <div class="bar">

                                        <div class="value">
                                            <span><%# Eval("percentMotive") %> </span>
                                        </div>

                                    </div>

                                    <div class="title" style="font-size: 10px; color: white"><%# Eval("namemotive") %> </div>
                            </a>
                            </div>

                        </ItemTemplate>
                    </asp:Repeater>

                    <div class="clearfix"></div>

                </div>

            </div>

        </div>

      

    </div>
    <div class="row">
        <div runat="server" id="graphOpenGroup" class="widget blue span5" ontablet="span6" ondesktop="span5" style="width: 600px">

            <h2>% Open Mailing per Group States</h2>
            <hr>

            <div class="content">

                <div class="verticalChart">

                    <asp:Repeater ID="repeaterOpenGroup" runat="server">
                        <ItemTemplate>
                            <%--<asp:LinkButton runat="server" id="BtnBudgetVsActualStaffSubGraph" onclick="BtnBudgetVsActualStaff_Click" ></asp:LinkButton>
                              <a href="http://reportes.itbusinessco.com/Reports/Pages/Report.aspx?ItemPath=%2fHR%2fHR_staffVSbudgetGeneral" target="_blank">--%>
                           
                                <div class="singleBar">

                                    <div class="bar">

                                        <div class="value">
                                            <span><%# Eval("quantityopen") %> </span>
                                        </div>

                                    </div>

                                    <div class="title" style="font-size: 10px; color: white"><%# Eval("name") %> </div>
                            </a>
                            </div>

                        </ItemTemplate>
                    </asp:Repeater>

                    <div class="clearfix"></div>

                </div>

            </div>

        </div>
        <div runat="server" id="graphProspectGroup" class="widget blue span5" ontablet="span6" ondesktop="span5" style="width: 600px">

            <h2>% Prospect per Group States</h2>
            <hr>

            <div class="content">

                <div class="verticalChart">

                    <asp:Repeater ID="repeaterProspectGroup" runat="server">
                        <ItemTemplate>
                            <%--<asp:LinkButton runat="server" id="BtnBudgetVsActualStaffSubGraph" onclick="BtnBudgetVsActualStaff_Click" ></asp:LinkButton>
                              <a href="http://reportes.itbusinessco.com/Reports/Pages/Report.aspx?ItemPath=%2fHR%2fHR_staffVSbudgetGeneral" target="_blank">--%>
                           
                                <div class="singleBar">

                                    <div class="bar">

                                        <div class="value">
                                            <span><%# Eval("quantityprospect") %> </span>
                                        </div>

                                    </div>

                                    <div class="title" style="font-size: 10px; color: white"><%# Eval("name") %> </div>
                            </a>
                            </div>

                        </ItemTemplate>
                    </asp:Repeater>

                    <div class="clearfix"></div>

                </div>

            </div>

        </div>
    </div>

    <div class="row">
        <div runat="server" id="graphOpenStates" class="widget blue span5" ontablet="span6" ondesktop="span5" style="width: 600px">

            <h2>% Open Mailing per States</h2>
            <hr>

            <div class="content">

                <div class="verticalChart">

                    <asp:Repeater ID="repeaterOpenState" runat="server">
                        <ItemTemplate>
                            <%--<asp:LinkButton runat="server" id="BtnBudgetVsActualStaffSubGraph" onclick="BtnBudgetVsActualStaff_Click" ></asp:LinkButton>
                              <a href="http://reportes.itbusinessco.com/Reports/Pages/Report.aspx?ItemPath=%2fHR%2fHR_staffVSbudgetGeneral" target="_blank">--%>
                           
                                <div class="singleBar">

                                    <div class="bar">

                                        <div class="value">
                                            <span><%# Eval("quantityopen") %> </span>
                                        </div>

                                    </div>

                                    <div class="title" style="font-size: 10px; color: white"><%# Eval("name") %> </div>
                            </a>
                            </div>

                        </ItemTemplate>
                    </asp:Repeater>

                    <div class="clearfix"></div>

                </div>

            </div>

        </div>
        <div runat="server" id="graphProspectStates" class="widget blue span5" ontablet="span6" ondesktop="span5" style="width: 600px">

            <h2>% Prospect per States</h2>
            <hr>

            <div class="content">

                <div class="verticalChart">

                    <asp:Repeater ID="repeaterProspectStates" runat="server">
                        <ItemTemplate>
                            <%--<asp:LinkButton runat="server" id="BtnBudgetVsActualStaffSubGraph" onclick="BtnBudgetVsActualStaff_Click" ></asp:LinkButton>
                              <a href="http://reportes.itbusinessco.com/Reports/Pages/Report.aspx?ItemPath=%2fHR%2fHR_staffVSbudgetGeneral" target="_blank">--%>
                           
                                <div class="singleBar">

                                    <div class="bar">

                                        <div class="value">
                                            <span><%# Eval("quantityprospect") %> </span>
                                        </div>

                                    </div>

                                    <div class="title" style="font-size: 10px; color: white"><%# Eval("name") %> </div>
                            </a>
                            </div>

                        </ItemTemplate>
                    </asp:Repeater>

                    <div class="clearfix"></div>

                </div>

            </div>

        </div>
    </div>
    <!--
     <div class="row">
        <div runat="server" id="graphOpenStatesSubStates" class="widget blue span5" ontablet="span6" ondesktop="span5" style="width: 600px">

            <h2>% Open Mailing per States/SubStates</h2>
            <hr>

            <div class="content">

                <div class="verticalChart">

                    <asp:Repeater ID="repeaterOpenStatesSubStates" runat="server">
                        <ItemTemplate>
                            <%--<asp:LinkButton runat="server" id="BtnBudgetVsActualStaffSubGraph" onclick="BtnBudgetVsActualStaff_Click" ></asp:LinkButton>
                              <a href="http://reportes.itbusinessco.com/Reports/Pages/Report.aspx?ItemPath=%2fHR%2fHR_staffVSbudgetGeneral" target="_blank">--%>
                           
                                <div class="singleBar">

                                    <div class="bar">

                                        <div class="value">
                                            <span><%# Eval("quantityopen") %> </span>
                                        </div>

                                    </div>

                                    <div class="title" style="font-size: 10px; color: white"><%# Eval("name") %> </div>
                            </a>
                            </div>

                        </ItemTemplate>
                    </asp:Repeater>

                    <div class="clearfix"></div>

                </div>

            </div>

        </div>
        <div runat="server" id="GraphProspectStatesSubstates" class="widget blue span5" ontablet="span6" ondesktop="span5" style="width: 600px">

            <h2>% Prospect per States/Substates</h2>
            <hr>

            <div class="content">

                <div class="verticalChart">

                    <asp:Repeater ID="repeaterGraphProspectStatesSubstates" runat="server">
                        <ItemTemplate>
                            <%--<asp:LinkButton runat="server" id="BtnBudgetVsActualStaffSubGraph" onclick="BtnBudgetVsActualStaff_Click" ></asp:LinkButton>
                              <a href="http://reportes.itbusinessco.com/Reports/Pages/Report.aspx?ItemPath=%2fHR%2fHR_staffVSbudgetGeneral" target="_blank">--%>
                           
                                <div class="singleBar">

                                    <div class="bar">

                                        <div class="value">
                                            <span><%# Eval("quantityprospect") %> </span>
                                        </div>

                                    </div>

                                    <div class="title" style="font-size: 10px; color: white"><%# Eval("name") %> </div>
                            </a>
                            </div>

                        </ItemTemplate>
                    </asp:Repeater>

                    <div class="clearfix"></div>

                </div>

            </div>

        </div>
    </div>
    -->

    <%-----------------------------------------------------------------------------------------------------%>
    <%--  END CAMPAIGNS     -------------------------------------------------------------------------------%>
    <%-----------------------------------------------------------------------------------------------------%>
    

    <%-----------------------------------------------------------------------------------------------------%>
    <%--  START EVENTS LISTS     --------------------------------------------------------------------------%>
    <%-----------------------------------------------------------------------------------------------------%>

        <div class="row-fluid">
        <div class="span5 noMarginLeft">
            <!-- <div class="dark"> -->
            <h1>Timeline</h1>
            <div class="timeline">

                <asp:Repeater ID="RepeaterTimeLine1" runat="server" OnItemCommand="RepeaterTimeLine1_ItemCommand">
                    <ItemTemplate>

                        <div class="<%# Eval("tlot") %>">

                            <div class="task">
                                <span>


                                    <span class="type"><%# Eval("idClientTask") %> </span>
                                    <span class="type"><%# Eval("nameTaskClass") %> </span>

                                    <span class="details"><%# Eval("titleTask") %>
                                        <br></br>
                                        <%# Eval("nameClientFE") %>  
                                    </span>
                                    <%# Eval("nameUser") %>
                                    <span>remaining time
										<span class="remaining"><%# Eval("remainingtime") %>   
                                        </span>
                                    </span>
                                    <asp:LinkButton ID="LinkButton1" runat="server"
                                        CommandArgument='<%# Eval("idClientTask")%>'
                                        OnClick="BtnView_Click" CssClass="center btn btn-info"> <i class="halflings-icon white edit" text="Edit"></i></asp:LinkButton>

                                </span>
                                <div class="arrow"></div>

                            </div>
                            <div class="icon">
                                <i class="<%# Eval("icon") %>"></i>
                            </div>
                            <div class="time">
                                <%# Eval("diahora") %>
                            </div>

                        </div>

                    </ItemTemplate>
                </asp:Repeater>

            </div>
        </div>

        <!-- </div>-->
        <div class="clearfix"></div>
    </div>
    <h1></h1>
    <h1></h1>
    <h1></h1>
    <div class="row-fluid">
        <div class="span5 noMarginLeft">

            <!--    <div class="dark"> -->

            <div class="priority high"><span>high priority</span></div>

            <asp:Repeater ID="RepeaterHighPriority" runat="server">
                <ItemTemplate>

                    <div class="task high">
                        <div class="desc">
                            <div class="title"><%# Eval("nameUser") %></div>
                            <div><%# Eval("nameTaskClass") %> - <%# Eval("nameClientFE") %></div>
                            <div><%# Eval("titleTask") %></div>
                        </div>
                        <div class="time">
                            <div class="date"><%# Eval("dayTask") %></div>
                            <div><%# Eval("taskDuration") %> <%# Eval("nameTaskUnit") %></div>
                        </div>
                    </div>

                </ItemTemplate>
            </asp:Repeater>

            <div class="priority medium"><span>medium priority</span></div>

            <asp:Repeater ID="RepeaterMediumPriority" runat="server">
                <ItemTemplate>

                    <div class="task medium">
                        <div class="desc">
                            <div class="title"><%# Eval("nameUser") %></div>
                            <div><%# Eval("nameTaskClass") %> - <%# Eval("nameClientFE") %></div>
                            <div><%# Eval("titleTask") %></div>
                        </div>
                        <div class="time">
                            <div class="date"><%# Eval("dayTask") %></div>
                            <div><%# Eval("taskDuration") %> <%# Eval("nameTaskUnit") %></div>
                        </div>
                </ItemTemplate>
            </asp:Repeater>

            <div class="priority low"><span>low priority</span></div>
            <asp:Repeater ID="RepeaterLowPriority" runat="server">
                <ItemTemplate>

                    <div class="task low">
                        <div class="desc">
                            <div class="title"><%# Eval("nameUser") %></div>
                            <div><%# Eval("nameTaskClass") %> - <%# Eval("nameClientFE") %></div>
                            <div><%# Eval("titleTask") %></div>
                        </div>
                        <div class="time">
                            <div class="date"><%# Eval("dayTask") %></div>
                            <div><%# Eval("taskDuration") %> <%# Eval("nameTaskUnit") %></div>
                        </div>
                    </div>

                </ItemTemplate>
            </asp:Repeater>
        </div>
        <!--  </div> -->
        <div class="clearfix"></div>
    </div>

    
    <%-----------------------------------------------------------------------------------------------------%>
    <%--  END EVENTS LISTS     ----------------------------------------------------------------------------%>
    <%-----------------------------------------------------------------------------------------------------%>



    <literal  id="Literal501" runat="server" EnableViewState="false">
		    <script>
		        /* -------------------- Check Browser --------------------- */

		        function browser() {

		            var isOpera = !!(window.opera && window.opera.version);  // Opera 8.0+
		            var isFirefox = testCSS('MozBoxSizing');                 // FF 0.8+
		            var isSafari = Object.prototype.toString.call(window.HTMLElement).indexOf('Constructor') > 0;
		            // At least Safari 3+: "[object HTMLElementConstructor]"
		            var isChrome = !isSafari && testCSS('WebkitTransform');  // Chrome 1+
		            //var isIE = /*@cc_on!@*/false || testCSS('msTransform');  // At least IE6

		            function testCSS(prop) {
		                return prop in document.documentElement.style;
		            }

		            if (isOpera) {

		                return false;

		            } else if (isSafari || isChrome) {

		                return true;

		            } else {

		                return false;

		            }

		        }

		        /* ---------- IE8 list style hack (:nth-child(odd)) ---------- */

		        jQuery(document).ready(function ($) {

		            if ($('.messagesList').width()) {

		                if (jQuery.browser.version.substring(0, 2) == "8.") {

		                    $('ul.messagesList li:nth-child(2n+1)').addClass('odd');

		                }

		            }

		        });

		        $(document).ready(function () {


		            $("#username").focus(function () {

		                $(this).parent(".input-prepend").addClass("input-prepend-focus");

		            });

		            $("#username").focusout(function () {

		                $(this).parent(".input-prepend").removeClass("input-prepend-focus");

		            });

		            $("#password").focus(function () {

		                $(this).parent(".input-prepend").addClass("input-prepend-focus");

		            });

		            $("#password").focusout(function () {

		                $(this).parent(".input-prepend").removeClass("input-prepend-focus");

		            });


		            /* ---------- Add class .active to current link  ---------- */
		            $('ul.main-menu li a').each(function () {

		                if ($($(this))[0].href == String(window.location)) {

		                    $(this).parent().addClass('active');

		                }

		            });

		            $('ul.main-menu li ul li a').each(function () {

		                if ($($(this))[0].href == String(window.location)) {

		                    $(this).parent().addClass('active');
		                    $(this).parent().parent().show();

		                }

		            });

		            /* ---------- Submenu  ---------- */

		            $('.dropmenu').click(function (e) {

		                e.preventDefault();

		                $(this).parent().find('ul').slideToggle();

		            });

		            /* ---------- Acivate Functions ---------- */
		            template_functions();
		            init_masonry();
		            sparkline_charts();
		            charts();
		            calendars();
		            growlLikeNotifications();
		            widthFunctions();

		            if (jQuery.browser.version.substring(0, 2) == "8.") {

		                //disable jQuery Knob

		            } else {

		                circle_progess();

		            }

		            chart();
		            messageLike();

		        });

		        /* ---------- Like/Dislike ---------- */

		        function messageLike() {

		            if ($('.messagesList')) {

		                $('.messagesList').on('click', '.star', function () {

		                    $(this).removeClass('star');

		                    $(this).addClass('dislikes');

		                    //here add your function

		                });

		                $('.messagesList').on('click', '.dislikes', function () {

		                    $(this).removeClass('dislikes');

		                    $(this).addClass('star');

		                    //here add your function

		                });

		            }

		        }

		        /* ---------- Check Retina ---------- */

		        function retina() {

		            retinaMode = (window.devicePixelRatio > 1);

		            return retinaMode;

		        }

		        /* ---------- Chart ---------- */

		        function chart() {

		            if ($('.verticalChart')) {

		                $('.singleBar').each(function () {

		                    var theColorIs = $(this).parent().parent().parent().css("background");

		                    var percent = $(this).find('.value span').html();

		                    $(this).find('.value span').css('color', theColorIs);

		                    $(this).find('.value').animate({ height: percent }, 2000, function () {

		                        $(this).find('span').fadeIn();

		                    });

		                });

		            }

		        }

		        /* ---------- Masonry Gallery ---------- */

		        function init_masonry() {
		            var $container = $('.masonry-gallery');

		            var gutter = 6;
		            var min_width = 250;
		            $container.imagesLoaded(function () {
		                $container.masonry({
		                    itemSelector: '.masonry-thumb',
		                    gutterWidth: gutter,
		                    isAnimated: true,
		                    columnWidth: function (containerWidth) {
		                        var num_of_boxes = (containerWidth / min_width | 0);

		                        var box_width = (((containerWidth - (num_of_boxes - 1) * gutter) / num_of_boxes) | 0);

		                        if (containerWidth < min_width) {
		                            box_width = containerWidth;
		                        }

		                        $('.masonry-thumb').width(box_width);

		                        return box_width;
		                    }
		                });
		            });
		        }

		        /* ---------- Numbers Sepparator ---------- */

		        function numberWithCommas(x) {
		            x = x.toString();
		            var pattern = /(-?\d+)(\d{3})/;
		            while (pattern.test(x))
		                x = x.replace(pattern, "$1.$2");
		            return x;
		        }

		        /* ---------- Template Functions ---------- */

		        function template_functions() {

		            /* ---------- ToDo List Action Buttons ---------- */

		            $(".todo-remove").click(function () {

		                $(this).parent().parent().fadeTo("slow", 0.00, function () { //fade
		                    $(this).slideUp("slow", function () { //slide up
		                        $(this).remove(); //then remove from the DOM
		                    });
		                });


		                return false;
		            });

		            $(".todo-list").find('.action').each(function () {

		                $(this).click(function () {

		                    if ($(this).hasClass('icon-check-empty')) {

		                        $(this).removeClass('icon-check-empty');
		                        $(this).addClass('icon-check');

		                        $(this).parent().css('text-decoration', 'line-through');

		                    } else {

		                        $(this).removeClass('icon-check');
		                        $(this).addClass('icon-check-empty');

		                        $(this).parent().css('text-decoration', 'none');

		                    }

		                    return false;

		                });

		            });



		            /* ---------- Skill Bars ---------- */
		            $(".meter > span").each(function () {

		                var getColor = $(this).parent().css('borderTopColor');

		                $(this).css('background', getColor);

		                $(this)
                        .data("origWidth", $(this).width())
                        .width(0)
                        .animate({
                            width: $(this).data("origWidth")
                        }, 3000);
		            });

		            /* ---------- Disable moving to top ---------- */
		            $('a[href="#"][data-top!=true]').click(function (e) {
		                e.preventDefault();
		            });

		            /* ---------- Text editor ---------- */
		            $('.cleditor').cleditor();

		            /* ---------- Datapicker ---------- */
		            $('.datepicker').datepicker();

		            /* ---------- Notifications ---------- */
		            $('.noty').click(function (e) {
		                e.preventDefault();
		                var options = $.parseJSON($(this).attr('data-noty-options'));
		                noty(options);
		            });

		            /* ---------- Uniform ---------- */
		            $("input:checkbox, input:radio, input:file").not('[data-no-uniform="true"],#uniform-is-ajax').uniform();

		            /* ---------- Choosen ---------- */
		            $('[data-rel="chosen"],[rel="chosen"]').chosen();

		            /* ---------- Tabs ---------- */
		            $('#myTab a:first').tab('show');
		            $('#myTab a').click(function (e) {
		                e.preventDefault();
		                $(this).tab('show');
		            });

		            /* ---------- Makes elements soratble, elements that sort need to have id attribute to save the result ---------- */
		            $('.sortable').sortable({
		                revert: true,
		                cancel: '.btn,.box-content,.nav-header',
		                update: function (event, ui) {
		                    //line below gives the ids of elements, you can make ajax call here to save it to the database
		                    //console.log($(this).sortable('toArray'));
		                }
		            });

		            /* ---------- Tooltip ---------- */
		            $('[rel="tooltip"],[data-rel="tooltip"]').tooltip({ "placement": "bottom", delay: { show: 400, hide: 200 } });

		            /* ---------- Popover ---------- */
		            $('[rel="popover"],[data-rel="popover"]').popover();

		            /* ---------- File Manager ---------- */
		            var elf = $('.file-manager').elfinder({
		                url: 'misc/elfinder-connector/connector.php'  // connector URL (REQUIRED)
		            }).elfinder('instance');

		            /* ---------- Star Rating ---------- */
		            $('.raty').raty({
		                score: 4 //default stars
		            });

		            /* ---------- Uploadify ---------- */
		            $('#file_upload').uploadify({
		                'swf': 'misc/uploadify.swf',
		                'uploader': 'misc/uploadify.php'
		                // Put your options here
		            });

		            /* ---------- Fullscreen ---------- */
		            $('#toggle-fullscreen').button().click(function () {
		                var button = $(this), root = document.documentElement;
		                if (!button.hasClass('active')) {
		                    $('#thumbnails').addClass('modal-fullscreen');
		                    if (root.webkitRequestFullScreen) {
		                        root.webkitRequestFullScreen(
                                    window.Element.ALLOW_KEYBOARD_INPUT
                                );
		                    } else if (root.mozRequestFullScreen) {
		                        root.mozRequestFullScreen();
		                    }
		                } else {
		                    $('#thumbnails').removeClass('modal-fullscreen');
		                    (document.webkitCancelFullScreen ||
                                document.mozCancelFullScreen ||
                                $.noop).apply(document);
		                }
		            });

		            /* ---------- Datable ---------- */
		            $('.datatable').dataTable({
		                "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span12'i><'span12 center'p>>",
		                "sPaginationType": "bootstrap",
		                "oLanguage": {
		                    "sLengthMenu": "_MENU_ records per page"
		                }
		            });
		            $('.btn-close').click(function (e) {
		                e.preventDefault();
		                $(this).parent().parent().parent().fadeOut();
		            });
		            $('.btn-minimize').click(function (e) {
		                e.preventDefault();
		                var $target = $(this).parent().parent().next('.box-content');
		                if ($target.is(':visible')) $('i', $(this)).removeClass('chevron-up').addClass('chevron-down');
		                else $('i', $(this)).removeClass('chevron-down').addClass('chevron-up');
		                $target.slideToggle();
		            });
		            $('.btn-setting').click(function (e) {
		                e.preventDefault();
		                $('#myModal').modal('show');
		            });


		            /* ---------- Progress  ---------- */

		            $(".simpleProgress").progressbar({
		                value: 89
		            });

		            $(".progressAnimate").progressbar({
		                value: 1,
		                create: function () {
		                    $(".progressAnimate .ui-progressbar-value").animate({ "width": "100%" }, {
		                        duration: 10000,
		                        step: function (now) {
		                            $(".progressAnimateValue").html(parseInt(now) + "%");
		                        },
		                        easing: "linear"
		                    })
		                }
		            });

		            $(".progressUploadAnimate").progressbar({
		                value: 1,
		                create: function () {
		                    $(".progressUploadAnimate .ui-progressbar-value").animate({ "width": "100%" }, {
		                        duration: 20000,
		                        easing: 'linear',
		                        step: function (now) {
		                            $(".progressUploadAnimateValue").html(parseInt(now * 40.96) + " Gb");
		                        },
		                        complete: function () {
		                            $(".progressUploadAnimate + .field_notice").html("<span class='must'>Upload Finished</span>");
		                        }
		                    })
		                }
		            });

		            if ($(".taskProgress")) {

		                $(".taskProgress").each(function () {

		                    var endValue = parseInt($(this).html());

		                    $(this).progressbar({
		                        value: endValue
		                    });

		                    $(this).parent().find(".percent").html(endValue + "%");

		                });

		            }

		            if ($(".progressBarValue")) {

		                $(".progressBarValue").each(function () {

		                    var endValueHTML = $(this).find(".progressCustomValueVal").html();

		                    var endValue = parseInt(endValueHTML);

		                    $(this).find(".progressCustomValue").progressbar({

		                        value: 1,
		                        create: function () {
		                            $(this).find(".ui-progressbar-value").animate({ "width": endValue + "%" }, {
		                                duration: 5000,
		                                step: function (now) {

		                                    $(this).parent().parent().parent().find(".progressCustomValueVal").html(parseInt(now) + "%");
		                                },
		                                easing: "linear"
		                            })
		                        }
		                    });

		                });

		            }


		            /* ---------- Custom Slider ---------- */
		            $(".sliderSimple").slider();

		            $(".sliderMin").slider({
		                range: "min",
		                value: 180,
		                min: 1,
		                max: 700,
		                slide: function (event, ui) {
		                    $(".sliderMinLabel").html("$" + ui.value);
		                }
		            });

		            $(".sliderMin-1").slider({
		                range: "min",
		                value: 50,
		                min: 1,
		                max: 700,
		                slide: function (event, ui) {
		                    $(".sliderMin1Label").html("$" + ui.value);
		                }
		            });

		            $(".sliderMin-2").slider({
		                range: "min",
		                value: 100,
		                min: 1,
		                max: 700,
		                slide: function (event, ui) {
		                    $(".sliderMin2Label").html("$" + ui.value);
		                }
		            });

		            $(".sliderMin-3").slider({
		                range: "min",
		                value: 150,
		                min: 1,
		                max: 700,
		                slide: function (event, ui) {
		                    $(".sliderMin3Label").html("$" + ui.value);
		                }
		            });

		            $(".sliderMin-4").slider({
		                range: "min",
		                value: 250,
		                min: 1,
		                max: 700,
		                slide: function (event, ui) {
		                    $(".sliderMin4Label").html("$" + ui.value);
		                }
		            });

		            $(".sliderMin-5").slider({
		                range: "min",
		                value: 350,
		                min: 1,
		                max: 700,
		                slide: function (event, ui) {
		                    $(".sliderLabel").html("$" + ui.value);
		                }
		            });

		            $(".sliderMin-6").slider({
		                range: "min",
		                value: 450,
		                min: 1,
		                max: 700,
		                slide: function (event, ui) {
		                    $(".sliderLabel").html("$" + ui.value);
		                }
		            });

		            $(".sliderMin-7").slider({
		                range: "min",
		                value: 550,
		                min: 1,
		                max: 700,
		                slide: function (event, ui) {
		                    $(".sliderLabel").html("$" + ui.value);
		                }
		            });

		            $(".sliderMin-8").slider({
		                range: "min",
		                value: 650,
		                min: 1,
		                max: 700,
		                slide: function (event, ui) {
		                    $(".sliderLabel").html("$" + ui.value);
		                }
		            });


		            $(".sliderMax").slider({
		                range: "max",
		                value: 280,
		                min: 1,
		                max: 700,
		                slide: function (event, ui) {
		                    $(".sliderMaxLabel").html("$" + ui.value);
		                }
		            });

		            $(".sliderRange").slider({
		                range: true,
		                min: 0,
		                max: 500,
		                values: [192, 470],
		                slide: function (event, ui) {
		                    $(".sliderRangeLabel").html("$" + ui.values[0] + " - $" + ui.values[1]);
		                }
		            });

		            $("#sliderVertical-1").slider({
		                orientation: "vertical",
		                range: "min",
		                min: 0,
		                max: 100,
		                value: 60,
		            });

		            $("#sliderVertical-2").slider({
		                orientation: "vertical",
		                range: "min",
		                min: 0,
		                max: 100,
		                value: 40,
		            });

		            $("#sliderVertical-3").slider({
		                orientation: "vertical",
		                range: "min",
		                min: 0,
		                max: 100,
		                value: 30,
		            });

		            $("#sliderVertical-4").slider({
		                orientation: "vertical",
		                range: "min",
		                min: 0,
		                max: 100,
		                value: 15,
		            });

		            $("#sliderVertical-5").slider({
		                orientation: "vertical",
		                range: "min",
		                min: 0,
		                max: 100,
		                value: 40,
		            });

		            $("#sliderVertical-6").slider({
		                orientation: "vertical",
		                range: "min",
		                min: 0,
		                max: 100,
		                value: 80,
		            });

		            $("#sliderVertical-7").slider({
		                orientation: "vertical",
		                range: "min",
		                min: 0,
		                max: 100,
		                value: 60,
		            });

		            $("#sliderVertical-8").slider({
		                orientation: "vertical",
		                range: "min",
		                min: 0,
		                max: 100,
		                value: 40,
		            });

		            $("#sliderVertical-9").slider({
		                orientation: "vertical",
		                range: "min",
		                min: 0,
		                max: 100,
		                value: 30,
		            });

		            $("#sliderVertical-10").slider({
		                orientation: "vertical",
		                range: "min",
		                min: 0,
		                max: 100,
		                value: 15,
		            });

		            $("#sliderVertical-11").slider({
		                orientation: "vertical",
		                range: "min",
		                min: 0,
		                max: 100,
		                value: 40,
		            });

		            $("#sliderVertical-12").slider({
		                orientation: "vertical",
		                range: "min",
		                min: 0,
		                max: 100,
		                value: 80,
		            });

		        }

		        /* ---------- Circle Progess Bars ---------- */

		        function circle_progess() {

		            var divElement = $('div'); //log all div elements

		            if (retina()) {

		                $(".whiteCircle").knob({
		                    'min': 0,
		                    'max': 150,
		                    'readOnly': true,
		                    'width': 240,
		                    'height': 240,
		                    'bgColor': 'rgba(255,255,255,0.5)',
		                    'fgColor': 'rgba(255,255,255,0.9)',
		                    'dynamicDraw': true,
		                    'thickness': 0.2,
		                    'tickColorizeValues': true
		                });

		                $(".circleStat").css('zoom', 0.5);
		                $(".whiteCircle").css('zoom', 0.999);


		            } else {

		                $(".whiteCircle").knob({
		                    'min': 0,
		                    'max': 150,
		                    'readOnly': true,
		                    'width': 120,
		                    'height': 120,
		                    'bgColor': 'rgba(255,255,255,0.5)',
		                    'fgColor': 'rgba(255,255,255,0.9)',
		                    'dynamicDraw': true,
		                    'thickness': 0.2,
		                    'tickColorizeValues': true
		                });

		            }



		            $(".circleStatsItemBox").each(function () {

		                var value = $(this).find(".value > .number").html();
		                var unit = $(this).find(".value > .unit").html();
		                var percent = $(this).find("input").val() / 100;

		                countSpeed = 2300 * percent;

		                endValue = value * percent;

		                $(this).find(".count > .unit").html(unit);
		                $(this).find(".count > .number").countTo({

		                    from: 0,
		                    to: endValue,
		                    speed: countSpeed,
		                    refreshInterval: 50

		                });

		                //$(this).find(".count").html(value*percent + unit);

		            });

		        }



		        /* ---------- Calendars ---------- */

		        function calendars() {


		            $('#external-events div.external-event').each(function () {

		                // it doesn't need to have a start or end
		                var eventObject = {
		                    title: $.trim($(this).text()) // use the element's text as the event title
		                };

		                // store the Event Object in the DOM element so we can get to it later
		                $(this).data('eventObject', eventObject);

		                // make the event draggable using jQuery UI
		                $(this).draggable({
		                    zIndex: 999,
		                    revert: true,      // will cause the event to go back to its
		                    revertDuration: 0  //  original position after the drag
		                });

		            });

		            var date = new Date();
		            var d = date.getDate();
		            var m = date.getMonth();
		            var y = date.getFullYear();

		            $('#main_calendar').fullCalendar({
		                header: {
		                    left: 'title',
		                    right: 'prev,next today,month,agendaWeek,agendaDay'
		                },
		                editable: true,
		                events: [
                            {
                                title: 'All Day Event',
                                start: new Date(y, m, 1)
                            },
                            {
                                title: 'Long Event',
                                start: new Date(y, m, d - 5),
                                end: new Date(y, m, d - 2)
                            },
              {
                  title: 'Mi Propio Evento',
                  start: new Date(2016, 2, 23, 11, 30),
                  end: new Date(2016, 2, 26, 11, 30)
              },
              {
                  title: 'Mi Propio Evento 2',
                  start: new Date(2016, 2, 25, 11, 30),
                  end: new Date(2016, 2, 25, 11, 30)
              },

                            {
                                id: 999,
                                title: 'Repeating Event',
                                start: new Date(y, m, d - 3, 16, 0),
                                allDay: false
                            },
                            {
                                id: 999,
                                title: 'Repeating Event',
                                start: new Date(y, m, d + 4, 16, 0),
                                allDay: false
                            },
                             {
                                 title: 'Mi Propio Evento',
                                 start: new Date(2016, 2, 23),
                                 end: new Date(2016, 2, 26)
                             },
                            {
                                title: 'Meeting',
                                start: new Date(y, m, d, 10, 30),
                                allDay: false
                            },
                            {
                                title: 'Lunch',
                                start: new Date(y, m, d, 12, 0),
                                end: new Date(y, m, d, 14, 0),
                                allDay: false
                            },
                            {
                                title: 'Birthday Party',
                                start: new Date(y, m, d + 1, 19, 0),
                                end: new Date(y, m, d + 1, 22, 30),
                                allDay: false
                            },
                            {
                                title: 'Click for Google',
                                start: new Date(y, m, 28),
                                end: new Date(y, m, 29),
                                url: 'http://google.com/'
                            }
		                ]
		            });

		            $('#main_calendar_phone').fullCalendar({
		                header: {
		                    left: 'title',
		                    right: 'prev,next'
		                },
		                defaultView: 'agendaDay',
		                editable: true,
		                events: [
                            {
                                title: 'All Day Event',
                                start: new Date(y, m, 1)
                            },
                            {
                                title: 'Long Event',
                                start: new Date(y, m, d - 5),
                                end: new Date(y, m, d - 2)
                            },
                            {
                                id: 999,
                                title: 'Repeating Event',
                                start: new Date(y, m, d - 3, 16, 0),
                                allDay: false
                            },
                            {
                                id: 999,
                                title: 'Repeating Event',
                                start: new Date(y, m, d + 4, 16, 0),
                                allDay: false
                            },
                            {
                                title: 'Meeting',
                                start: new Date(y, m, d, 10, 30),
                                allDay: false
                            },
                            {
                                title: 'Lunch',
                                start: new Date(y, m, d, 12, 0),
                                end: new Date(y, m, d, 14, 0),
                                allDay: false
                            },
                            {
                                title: 'Birthday Party',
                                start: new Date(y, m, d + 1, 19, 0),
                                end: new Date(y, m, d + 1, 22, 30),
                                allDay: false
                            },
                            {
                                title: 'Click for Google',
                                start: new Date(y, m, 28),
                                end: new Date(y, m, 29),
                                url: 'http://google.com/'
                            }
		                ]
		            });


		            $('#calendar').fullCalendar({
		                header: {
		                    left: 'title',
		                    right: 'prev,next today,month,agendaWeek,agendaDay'
		                },
		                editable: true,
		                droppable: true, // this allows things to be dropped onto the calendar !!!
		                drop: function (date, allDay) { // this function is called when something is dropped

		                    // retrieve the dropped element's stored Event Object
		                    var originalEventObject = $(this).data('eventObject');

		                    // we need to copy it, so that multiple events don't have a reference to the same object
		                    var copiedEventObject = $.extend({}, originalEventObject);

		                    // assign it the date that was reported
		                    copiedEventObject.start = date;
		                    copiedEventObject.allDay = allDay;

		                    // render the event on the calendar
		                    // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
		                    $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);

		                    // is the "remove after drop" checkbox checked?
		                    if ($('#drop-remove').is(':checked')) {
		                        // if so, remove the element from the "Draggable Events" list
		                        $(this).remove();
		                    }

		                }
		            });

		        }

		        /* ---------- Sparkline Charts ---------- */

		        function sparkline_charts() {

		            //generate random number for charts
		            randNum = function () {
		                //return Math.floor(Math.random()*101);
		                return (Math.floor(Math.random() * (1 + 40 - 20))) + 20;
		            }

		            var chartColours = ['#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff'];



		            /*[[1, 3 + randNum()], [2, 5 + randNum()], [3, 8 + randNum()], [4, 11 + randNum()], [5, 14 + randNum()], [6, 17 + randNum()], [7, 20 + randNum()], [8, 15 + randNum()], [9, 18 + randNum()], [10, 22 + randNum()]];*/




		            if ($(".boxchart")) {

		                if (retina()) {

		                    $(".boxchart").sparkline('html', {
		                        type: 'bar',
		                        height: '120', // Double pixel number for retina display
		                        barWidth: '8', // Double pixel number for retina display
		                        barSpacing: '2', // Double pixel number for retina display
		                        barColor: '#ffffff',
		                        negBarColor: '#eeeeee'
		                    }
                            );

		                    $(".boxchart").css('zoom', 0.5);

		                } else {

		                    $(".boxchart").sparkline('html', {
		                        type: 'bar',
		                        height: '60',
		                        barWidth: '4',
		                        barSpacing: '1',
		                        barColor: '#ffffff',
		                        negBarColor: '#eeeeee'
		                    }
                            );

		                }

		            }

		        }

		        /* ---------- Charts ---------- */

		        function charts() {

		            function randNum() {
		                return ((Math.floor(Math.random() * (1 + 40 - 20))) + 20) * 1200;
		            }

		            function randNum2() {
		                return ((Math.floor(Math.random() * (1 + 40 - 20))) + 20) * 500;
		            }

		            function randNum3() {
		                return ((Math.floor(Math.random() * (1 + 40 - 20))) + 20) * 300;
		            }

		            function randNum4() {
		                return ((Math.floor(Math.random() * (1 + 40 - 20))) + 20) * 100;
		            }

		            /* ---------- Chart with points ---------- */
		            
		            // START
		            if ($("#chart2-registermail").length) {
		                // var pageviews = PAGEVIEWSREPLACE
		                var facturacionlibros = LANDINGREGISTERMAILING
		                //var facturacionlibros = [[1, 8000], [2, 6000], [3, 15000]];
		                /*
                        var visits = [[1, randNum2() - 10], [2, randNum2() - 10], [3, randNum2() - 10], [4, randNum2()], [5, randNum2()], [6, 4 + randNum2()], [7, 5 + randNum2()], [8, 6 + randNum2()], [9, 6 + randNum2()], [10, 8 + randNum2()], [11, 9 + randNum2()], [12, 10 + randNum2()], [13, 11 + randNum2()], [14, 12 + randNum2()], [15, 13 + randNum2()], [16, 14 + randNum2()], [17, 15 + randNum2()], [18, 15 + randNum2()], [19, 16 + randNum2()], [20, 17 + randNum2()], [21, 18 + randNum2()], [22, 19 + randNum2()], [23, 20 + randNum2()], [24, 21 + randNum2()], [25, 14 + randNum2()], [26, 24 + randNum2()], [27, 25 + randNum2()], [28, 26 + randNum2()], [29, 27 + randNum2()], [30, 31 + randNum2()]];
                        var visitors = [[1, 5 + randNum3()], [2, 10 + randNum3()], [3, 15 + randNum3()], [4, 20 + randNum3()], [5, 25 + randNum3()], [6, 30 + randNum3()], [7, 35 + randNum3()], [8, 40 + randNum3()], [9, 45 + randNum3()], [10, 50 + randNum3()], [11, 55 + randNum3()], [12, 60 + randNum3()], [13, 65 + randNum3()], [14, 70 + randNum3()], [15, 75 + randNum3()], [16, 80 + randNum3()], [17, 85 + randNum3()], [18, 90 + randNum3()], [19, 85 + randNum3()], [20, 80 + randNum3()], [21, 75 + randNum3()], [22, 80 + randNum3()], [23, 75 + randNum3()], [24, 70 + randNum3()], [25, 65 + randNum3()], [26, 75 + randNum3()], [27, 80 + randNum3()], [28, 85 + randNum3()], [29, 90 + randNum3()], [30, 95 + randNum3()]];
                        var newVisitors = [[1, randNum4() - 10], [2, randNum4() - 10], [3, randNum4() - 10], [4, randNum4()], [5, randNum4()], [6, 4 + randNum4()], [7, 5 + randNum4()], [8, 6 + randNum4()], [9, 6 + randNum4()], [10, 8 + randNum4()], [11, 9 + randNum4()], [12, 10 + randNum4()], [13, 11 + randNum4()], [14, 12 + randNum4()], [15, 13 + randNum4()], [16, 14 + randNum4()], [17, 15 + randNum4()], [18, 15 + randNum4()], [19, 16 + randNum4()], [20, 17 + randNum4()], [21, 18 + randNum4()], [22, 19 + randNum4()], [23, 20 + randNum4()], [24, 21 + randNum4()], [25, 14 + randNum4()], [26, 24 + randNum4()], [27, 25 + randNum4()], [28, 26 + randNum4()], [29, 27 + randNum4()], [30, 31 + randNum4()]];
                        */
		                // var visits = BUDGETSTAFF
		                /*
                        [[1, 8000], [2, 6000], [3, 15000]];
                        var visitors = [[1, 15000], [2, 5000], [3, 25000]];
                        var newVisitors = [[1, 5000], [2, 5000], [3, 25000]];
                        */

		                var plot = $.plot($("#chart2-registermail"),
                               [/*{
                                   data: visits,
                                   label: "Budget Staff Company",
                                   lines: {
                                       show: true,
                                       fill: true,
                                       lineWidth: 5


                                   },
                                   shadowSize: 0
                               },*/ {
                                   data: facturacionlibros,
                                   label: "Number of Prospects Registered per Hour",
                                   bars: {
                                       show: true,
                                       fill: true,
                                       barWidth: 0.3,
                                       align: "center",
                                       lineWidth: 3,
                                   }
                               }
                               ], {

                                   grid: {
                                       hoverable: true,
                                       clickable: true,
                                       tickColor: "rgba(255,255,255,0.05)",
                                       borderWidth: 0
                                   },
                                   legend: {
                                       show: false


                                   },
                                   colors: ["rgba(255,255,70,0.8)", "rgba(255,255,255,0.6)", "rgba(255,255,255,0.4)", "rgba(255,255,255,0.2)"],
                                   xaxis: { ticks: 15, tickDecimals: 0, color: "rgba(255,255,255,0.8)" },
                                   yaxis: { ticks: 5, tickDecimals: 0, color: "rgba(255,255,255,0.8)" },
                               });

		                /*
                           [ { data: visitors, label: "Visits"}], {
                               series: {
                                   lines: { show: true,
                                            lineWidth: 2
                                         },
                                   points: { show: true, 
                                             lineWidth: 2 
                                         },
                                   shadowSize: 0
                               },	
                               grid: { hoverable: true, 
                                       clickable: true, 
                                       tickColor: "rgba(255,255,255,0.025)",
                                       borderWidth: 0
                                     },
                             legend: {
                                        show: false
                                    },	
                               colors: ["rgba(255,255,255,0.8)", "rgba(255,255,255,0.6)", "rgba(255,255,255,0.4)", "rgba(255,255,255,0.2)"],
                                xaxis: {ticks:15, tickDecimals: 0},
                                yaxis: {ticks:5, tickDecimals: 0},
                             });
                        */



		                function showTooltip(x, y, contents) {
		                    $('<div id="tooltip">' + contents + '</div>').css({
		                        position: 'absolute',
		                        display: 'none',
		                        top: y + 5,
		                        left: x + 5,
		                        border: '1px solid #fdd',
		                        padding: '2px',
		                        'background-color': '#dfeffc',
		                        opacity: 0.80
		                    }).appendTo("body").fadeIn(200);
		                }

		                var previousPoint = null;
		                $("#chart2-registermail").bind("plothover", function (event, pos, item) {
		                    $("#x").text(pos.x.toFixed(2));
		                    $("#y").text(pos.y.toFixed(2));

		                    if (item) {
		                        if (previousPoint != item.dataIndex) {
		                            previousPoint = item.dataIndex;

		                            $("#tooltip").remove();
		                            var x = item.datapoint[0].toFixed(0),
                                        y = item.datapoint[1].toFixed(0);

		                            showTooltip(item.pageX, item.pageY,
                                                item.series.label + " of " + x + " = " + y);
		                        }
		                    }
		                    else {
		                        $("#tooltip").remove();
		                        previousPoint = null;
		                    }
		                });

		            }
                    // END
		            if ($("#chart2-openmail").length) {
		                // var pageviews = PAGEVIEWSREPLACE
		                var facturacionlibros = FACTURACIONLIBROSREPLACE
		                //var facturacionlibros = [[1, 8000], [2, 6000], [3, 15000]];
		                /*
                        var visits = [[1, randNum2() - 10], [2, randNum2() - 10], [3, randNum2() - 10], [4, randNum2()], [5, randNum2()], [6, 4 + randNum2()], [7, 5 + randNum2()], [8, 6 + randNum2()], [9, 6 + randNum2()], [10, 8 + randNum2()], [11, 9 + randNum2()], [12, 10 + randNum2()], [13, 11 + randNum2()], [14, 12 + randNum2()], [15, 13 + randNum2()], [16, 14 + randNum2()], [17, 15 + randNum2()], [18, 15 + randNum2()], [19, 16 + randNum2()], [20, 17 + randNum2()], [21, 18 + randNum2()], [22, 19 + randNum2()], [23, 20 + randNum2()], [24, 21 + randNum2()], [25, 14 + randNum2()], [26, 24 + randNum2()], [27, 25 + randNum2()], [28, 26 + randNum2()], [29, 27 + randNum2()], [30, 31 + randNum2()]];
                        var visitors = [[1, 5 + randNum3()], [2, 10 + randNum3()], [3, 15 + randNum3()], [4, 20 + randNum3()], [5, 25 + randNum3()], [6, 30 + randNum3()], [7, 35 + randNum3()], [8, 40 + randNum3()], [9, 45 + randNum3()], [10, 50 + randNum3()], [11, 55 + randNum3()], [12, 60 + randNum3()], [13, 65 + randNum3()], [14, 70 + randNum3()], [15, 75 + randNum3()], [16, 80 + randNum3()], [17, 85 + randNum3()], [18, 90 + randNum3()], [19, 85 + randNum3()], [20, 80 + randNum3()], [21, 75 + randNum3()], [22, 80 + randNum3()], [23, 75 + randNum3()], [24, 70 + randNum3()], [25, 65 + randNum3()], [26, 75 + randNum3()], [27, 80 + randNum3()], [28, 85 + randNum3()], [29, 90 + randNum3()], [30, 95 + randNum3()]];
                        var newVisitors = [[1, randNum4() - 10], [2, randNum4() - 10], [3, randNum4() - 10], [4, randNum4()], [5, randNum4()], [6, 4 + randNum4()], [7, 5 + randNum4()], [8, 6 + randNum4()], [9, 6 + randNum4()], [10, 8 + randNum4()], [11, 9 + randNum4()], [12, 10 + randNum4()], [13, 11 + randNum4()], [14, 12 + randNum4()], [15, 13 + randNum4()], [16, 14 + randNum4()], [17, 15 + randNum4()], [18, 15 + randNum4()], [19, 16 + randNum4()], [20, 17 + randNum4()], [21, 18 + randNum4()], [22, 19 + randNum4()], [23, 20 + randNum4()], [24, 21 + randNum4()], [25, 14 + randNum4()], [26, 24 + randNum4()], [27, 25 + randNum4()], [28, 26 + randNum4()], [29, 27 + randNum4()], [30, 31 + randNum4()]];
                        */
		                // var visits = BUDGETSTAFF
		                /*
                        [[1, 8000], [2, 6000], [3, 15000]];
                        var visitors = [[1, 15000], [2, 5000], [3, 25000]];
                        var newVisitors = [[1, 5000], [2, 5000], [3, 25000]];
                        */

		                var plot = $.plot($("#chart2-openmail"),
                               [/*{
                                   data: visits,
                                   label: "Budget Staff Company",
                                   lines: {
                                       show: true,
                                       fill: true,
                                       lineWidth: 5


                                   },
                                   shadowSize: 0
                               },*/ {
                                   data: facturacionlibros,
                                   label: "Number of Open Mail per Hour",
                                   bars: {
                                       show: true,
                                       fill: true,
                                       barWidth: 0.3,
                                       align: "center",
                                       lineWidth: 3,
                                   }
                               }
                               ], {

                                   grid: {
                                       hoverable: true,
                                       clickable: true,
                                       tickColor: "rgba(255,255,255,0.05)",
                                       borderWidth: 0
                                   },
                                   legend: {
                                       show: false


                                   },
                                   colors: ["rgba(255,255,70,0.8)", "rgba(255,255,255,0.6)", "rgba(255,255,255,0.4)", "rgba(255,255,255,0.2)"],
                                   xaxis: { ticks: 15, tickDecimals: 0, color: "rgba(255,255,255,0.8)" },
                                   yaxis: { ticks: 5, tickDecimals: 0, color: "rgba(255,255,255,0.8)" },
                               });

		                /*
                           [ { data: visitors, label: "Visits"}], {
                               series: {
                                   lines: { show: true,
                                            lineWidth: 2
                                         },
                                   points: { show: true, 
                                             lineWidth: 2 
                                         },
                                   shadowSize: 0
                               },	
                               grid: { hoverable: true, 
                                       clickable: true, 
                                       tickColor: "rgba(255,255,255,0.025)",
                                       borderWidth: 0
                                     },
                             legend: {
                                        show: false
                                    },	
                               colors: ["rgba(255,255,255,0.8)", "rgba(255,255,255,0.6)", "rgba(255,255,255,0.4)", "rgba(255,255,255,0.2)"],
                                xaxis: {ticks:15, tickDecimals: 0},
                                yaxis: {ticks:5, tickDecimals: 0},
                             });
                        */



		                function showTooltip(x, y, contents) {
		                    $('<div id="tooltip">' + contents + '</div>').css({
		                        position: 'absolute',
		                        display: 'none',
		                        top: y + 5,
		                        left: x + 5,
		                        border: '1px solid #fdd',
		                        padding: '2px',
		                        'background-color': '#dfeffc',
		                        opacity: 0.80
		                    }).appendTo("body").fadeIn(200);
		                }

		                var previousPoint = null;
		                $("#chart2-openmail").bind("plothover", function (event, pos, item) {
		                    $("#x").text(pos.x.toFixed(2));
		                    $("#y").text(pos.y.toFixed(2));

		                    if (item) {
		                        if (previousPoint != item.dataIndex) {
		                            previousPoint = item.dataIndex;

		                            $("#tooltip").remove();
		                            var x = item.datapoint[0].toFixed(0),
                                        y = item.datapoint[1].toFixed(0);

		                            showTooltip(item.pageX, item.pageY,
                                                item.series.label + " of " + x + " = " + y);
		                        }
		                    }
		                    else {
		                        $("#tooltip").remove();
		                        previousPoint = null;
		                    }
		                });

		            }


		            if ($("#stats-chart201").length) {
		                // var salaries = RETRIEVESALARYPERMONTH;
		                // var salariestotalcost = RETRIEVETOTALCOSTPERMONTH;
		                /*PAGEVIEWSREPLACE*/
		                /*
                        var visits = [[1, randNum2() - 10], [2, randNum2() - 10], [3, randNum2() - 10], [4, randNum2()], [5, randNum2()], [6, 4 + randNum2()], [7, 5 + randNum2()], [8, 6 + randNum2()], [9, 6 + randNum2()], [10, 8 + randNum2()], [11, 9 + randNum2()], [12, 10 + randNum2()], [13, 11 + randNum2()], [14, 12 + randNum2()], [15, 13 + randNum2()], [16, 14 + randNum2()], [17, 15 + randNum2()], [18, 15 + randNum2()], [19, 16 + randNum2()], [20, 17 + randNum2()], [21, 18 + randNum2()], [22, 19 + randNum2()], [23, 20 + randNum2()], [24, 21 + randNum2()], [25, 14 + randNum2()], [26, 24 + randNum2()], [27, 25 + randNum2()], [28, 26 + randNum2()], [29, 27 + randNum2()], [30, 31 + randNum2()]];
                        var visitors = [[1, 5 + randNum3()], [2, 10 + randNum3()], [3, 15 + randNum3()], [4, 20 + randNum3()], [5, 25 + randNum3()], [6, 30 + randNum3()], [7, 35 + randNum3()], [8, 40 + randNum3()], [9, 45 + randNum3()], [10, 50 + randNum3()], [11, 55 + randNum3()], [12, 60 + randNum3()], [13, 65 + randNum3()], [14, 70 + randNum3()], [15, 75 + randNum3()], [16, 80 + randNum3()], [17, 85 + randNum3()], [18, 90 + randNum3()], [19, 85 + randNum3()], [20, 80 + randNum3()], [21, 75 + randNum3()], [22, 80 + randNum3()], [23, 75 + randNum3()], [24, 70 + randNum3()], [25, 65 + randNum3()], [26, 75 + randNum3()], [27, 80 + randNum3()], [28, 85 + randNum3()], [29, 90 + randNum3()], [30, 95 + randNum3()]];
                        var newVisitors = [[1, randNum4() - 10], [2, randNum4() - 10], [3, randNum4() - 10], [4, randNum4()], [5, randNum4()], [6, 4 + randNum4()], [7, 5 + randNum4()], [8, 6 + randNum4()], [9, 6 + randNum4()], [10, 8 + randNum4()], [11, 9 + randNum4()], [12, 10 + randNum4()], [13, 11 + randNum4()], [14, 12 + randNum4()], [15, 13 + randNum4()], [16, 14 + randNum4()], [17, 15 + randNum4()], [18, 15 + randNum4()], [19, 16 + randNum4()], [20, 17 + randNum4()], [21, 18 + randNum4()], [22, 19 + randNum4()], [23, 20 + randNum4()], [24, 21 + randNum4()], [25, 14 + randNum4()], [26, 24 + randNum4()], [27, 25 + randNum4()], [28, 26 + randNum4()], [29, 27 + randNum4()], [30, 31 + randNum4()]];
                        */
		                var facturasSinRecibos = LIBROSFACTURASSINRECIBOS // BUDGETSTAFF
		                /*
                        [[1, 8000], [2, 6000], [3, 15000]];
                        var visitors = [[1, 15000], [2, 5000], [3, 25000]];
                        var newVisitors = [[1, 5000], [2, 5000], [3, 25000]];
                        */

		                var plot = $.plot($("#stats-chart201"),
                               [
                                   {
                                       data: facturasSinRecibos,
                                       label: "Facturas Sin Recibos",
                                       lines: {
                                           show: true,
                                           fill: false,
                                           lineWidth: 5
                                       },
                                       shadowSize: 0
                                   }
                                   /*, {
                                       data: salariestotalcost,
                                       label: "Total Cost",
                                       bars: {
                                           show: true,
                                           fill: true,
                                           barWidth: 0.3,
                                           align: "center",
                                           lineWidth: 3,
                                       }
                                   },
                                {
                                    data: salaries,
                                    label: "Salaries",
                                    bars: {
                                        show: true,
                                        fill: true,
                                        barWidth: 0.3,
                                        align: "center",
                                        lineWidth: 3,
                                    }
                                }
                                */
                               ],
                                    {

                                        grid: {
                                            hoverable: true,
                                            clickable: true,
                                            tickColor: "rgba(0,0,0,0.05)",
                                            borderWidth: 0
                                        },
                                        legend: {
                                            show: false


                                        },
                                        colors: ["rgba(24,102,20,0.8)", "rgba(255,255,255,1)", "rgba(0,0,0,0.4)", "rgba(255,255,255,0.2)"],
                                        background: ["rgba(255,255,255,0.8)"],
                                        xaxis: { ticks: 15, tickDecimals: 0, color: "rgba(255,255,255,0.8)" },
                                        yaxis: { ticks: 5, tickDecimals: 0, color: "rgba(255,255,255,0.8)" },
                                    });

		                /*
                           [ { data: visitors, label: "Visits"}], {
                               series: {
                                   lines: { show: true,
                                            lineWidth: 2
                                         },
                                   points: { show: true, 
                                             lineWidth: 2 
                                         },
                                   shadowSize: 0
                               },	
                               grid: { hoverable: true, 
                                       clickable: true, 
                                       tickColor: "rgba(255,255,255,0.025)",
                                       borderWidth: 0
                                     },
                             legend: {
                                        show: false
                                    },	
                               colors: ["rgba(255,255,255,0.8)", "rgba(255,255,255,0.6)", "rgba(255,255,255,0.4)", "rgba(255,255,255,0.2)"],
                                xaxis: {ticks:15, tickDecimals: 0},
                                yaxis: {ticks:5, tickDecimals: 0},
                             });
                        */



		                function showTooltip(x, y, contents) {
		                    $('<div id="tooltip">' + contents + '</div>').css({
		                        position: 'absolute',
		                        display: 'none',
		                        top: y + 5,
		                        left: x + 5,
		                        border: '1px solid #fdd',
		                        padding: '2px',
		                        'background-color': '#dfeffc',
		                        opacity: 0.80
		                    }).appendTo("body").fadeIn(200);
		                }

		                var previousPoint = null;
		                $("#stats-chart201").bind("plothover", function (event, pos, item) {
		                    $("#x").text(pos.x.toFixed(2));
		                    $("#y").text(pos.y.toFixed(2));

		                    if (item) {
		                        if (previousPoint != item.dataIndex) {
		                            previousPoint = item.dataIndex;

		                            $("#tooltip").remove();
		                            var x = item.datapoint[0].toFixed(0),
                                        y = item.datapoint[1].toFixed(0);

		                            showTooltip(item.pageX, item.pageY,
                                                item.series.label + " of " + x + " = " + y);
		                        }
		                    }
		                    else {
		                        $("#tooltip").remove();
		                        previousPoint = null;
		                    }
		                });

		            }

		            if ($("#stats-chart201_ae").length) {
		                // var salaries = RETRIEVESALARYPERMONTH;
		                // var salariestotalcost = RETRIEVETOTALCOSTPERMONTH;
		                /*PAGEVIEWSREPLACE*/
		                /*
                        var visits = [[1, randNum2() - 10], [2, randNum2() - 10], [3, randNum2() - 10], [4, randNum2()], [5, randNum2()], [6, 4 + randNum2()], [7, 5 + randNum2()], [8, 6 + randNum2()], [9, 6 + randNum2()], [10, 8 + randNum2()], [11, 9 + randNum2()], [12, 10 + randNum2()], [13, 11 + randNum2()], [14, 12 + randNum2()], [15, 13 + randNum2()], [16, 14 + randNum2()], [17, 15 + randNum2()], [18, 15 + randNum2()], [19, 16 + randNum2()], [20, 17 + randNum2()], [21, 18 + randNum2()], [22, 19 + randNum2()], [23, 20 + randNum2()], [24, 21 + randNum2()], [25, 14 + randNum2()], [26, 24 + randNum2()], [27, 25 + randNum2()], [28, 26 + randNum2()], [29, 27 + randNum2()], [30, 31 + randNum2()]];
                        var visitors = [[1, 5 + randNum3()], [2, 10 + randNum3()], [3, 15 + randNum3()], [4, 20 + randNum3()], [5, 25 + randNum3()], [6, 30 + randNum3()], [7, 35 + randNum3()], [8, 40 + randNum3()], [9, 45 + randNum3()], [10, 50 + randNum3()], [11, 55 + randNum3()], [12, 60 + randNum3()], [13, 65 + randNum3()], [14, 70 + randNum3()], [15, 75 + randNum3()], [16, 80 + randNum3()], [17, 85 + randNum3()], [18, 90 + randNum3()], [19, 85 + randNum3()], [20, 80 + randNum3()], [21, 75 + randNum3()], [22, 80 + randNum3()], [23, 75 + randNum3()], [24, 70 + randNum3()], [25, 65 + randNum3()], [26, 75 + randNum3()], [27, 80 + randNum3()], [28, 85 + randNum3()], [29, 90 + randNum3()], [30, 95 + randNum3()]];
                        var newVisitors = [[1, randNum4() - 10], [2, randNum4() - 10], [3, randNum4() - 10], [4, randNum4()], [5, randNum4()], [6, 4 + randNum4()], [7, 5 + randNum4()], [8, 6 + randNum4()], [9, 6 + randNum4()], [10, 8 + randNum4()], [11, 9 + randNum4()], [12, 10 + randNum4()], [13, 11 + randNum4()], [14, 12 + randNum4()], [15, 13 + randNum4()], [16, 14 + randNum4()], [17, 15 + randNum4()], [18, 15 + randNum4()], [19, 16 + randNum4()], [20, 17 + randNum4()], [21, 18 + randNum4()], [22, 19 + randNum4()], [23, 20 + randNum4()], [24, 21 + randNum4()], [25, 14 + randNum4()], [26, 24 + randNum4()], [27, 25 + randNum4()], [28, 26 + randNum4()], [29, 27 + randNum4()], [30, 31 + randNum4()]];
                        */
		                var facturasSinRecibos = ACTIVEEVOLUTIONPERSEMESTER // BUDGETSTAFF
		                /*
                        [[1, 8000], [2, 6000], [3, 15000]];
                        var visitors = [[1, 15000], [2, 5000], [3, 25000]];
                        var newVisitors = [[1, 5000], [2, 5000], [3, 25000]];
                        */

		                var plot = $.plot($("#stats-chart201_ae"),
                               [
                                   {
                                       data: facturasSinRecibos,
                                       label: "Activos último semestre",
                                       lines: {
                                           show: true,
                                           fill: false,
                                           lineWidth: 5
                                       },
                                       shadowSize: 0
                                   }
                                   /*, {
                                       data: salariestotalcost,
                                       label: "Total Cost",
                                       bars: {
                                           show: true,
                                           fill: true,
                                           barWidth: 0.3,
                                           align: "center",
                                           lineWidth: 3,
                                       }
                                   },
                                {
                                    data: salaries,
                                    label: "Salaries",
                                    bars: {
                                        show: true,
                                        fill: true,
                                        barWidth: 0.3,
                                        align: "center",
                                        lineWidth: 3,
                                    }
                                }
                                */
                               ],
                                    {

                                        grid: {
                                            hoverable: true,
                                            clickable: true,
                                            tickColor: "rgba(0,0,0,0.05)",
                                            borderWidth: 0
                                        },
                                        legend: {
                                            show: false


                                        },
                                        colors: ["rgba(24,102,20,0.8)", "rgba(255,255,255,1)", "rgba(0,0,0,0.4)", "rgba(255,255,255,0.2)"],
                                        background: ["rgba(255,255,255,0.8)"],
                                        xaxis: { ticks: 15, tickDecimals: 0, color: "rgba(255,255,255,0.8)" },
                                        yaxis: { ticks: 5, tickDecimals: 0, color: "rgba(255,255,255,0.8)" },
                                    });

		                /*
                           [ { data: visitors, label: "Visits"}], {
                               series: {
                                   lines: { show: true,
                                            lineWidth: 2
                                         },
                                   points: { show: true, 
                                             lineWidth: 2 
                                         },
                                   shadowSize: 0
                               },	
                               grid: { hoverable: true, 
                                       clickable: true, 
                                       tickColor: "rgba(255,255,255,0.025)",
                                       borderWidth: 0
                                     },
                             legend: {
                                        show: false
                                    },	
                               colors: ["rgba(255,255,255,0.8)", "rgba(255,255,255,0.6)", "rgba(255,255,255,0.4)", "rgba(255,255,255,0.2)"],
                                xaxis: {ticks:15, tickDecimals: 0},
                                yaxis: {ticks:5, tickDecimals: 0},
                             });
                        */



		                function showTooltip(x, y, contents) {
		                    $('<div id="tooltip">' + contents + '</div>').css({
		                        position: 'absolute',
		                        display: 'none',
		                        top: y + 5,
		                        left: x + 5,
		                        border: '1px solid #fdd',
		                        padding: '2px',
		                        'background-color': '#dfeffc',
		                        opacity: 0.80
		                    }).appendTo("body").fadeIn(200);
		                }

		                var previousPoint = null;
		                $("#stats-chart201_ae").bind("plothover", function (event, pos, item) {
		                    $("#x").text(pos.x.toFixed(2));
		                    $("#y").text(pos.y.toFixed(2));

		                    if (item) {
		                        if (previousPoint != item.dataIndex) {
		                            previousPoint = item.dataIndex;

		                            $("#tooltip").remove();
		                            var x = item.datapoint[0].toFixed(0),
                                        y = item.datapoint[1].toFixed(0);

		                            showTooltip(item.pageX, item.pageY,
                                                item.series.label + " of " + x + " = " + y);
		                        }
		                    }
		                    else {
		                        $("#tooltip").remove();
		                        previousPoint = null;
		                    }
		                });

		            }

		            if ($("#stats-chart201_ae_perproduct").length) {
		                // var salaries = RETRIEVESALARYPERMONTH;
		                // var salariestotalcost = RETRIEVETOTALCOSTPERMONTH;
		                /*PAGEVIEWSREPLACE*/
		                /*
                        var visits = [[1, randNum2() - 10], [2, randNum2() - 10], [3, randNum2() - 10], [4, randNum2()], [5, randNum2()], [6, 4 + randNum2()], [7, 5 + randNum2()], [8, 6 + randNum2()], [9, 6 + randNum2()], [10, 8 + randNum2()], [11, 9 + randNum2()], [12, 10 + randNum2()], [13, 11 + randNum2()], [14, 12 + randNum2()], [15, 13 + randNum2()], [16, 14 + randNum2()], [17, 15 + randNum2()], [18, 15 + randNum2()], [19, 16 + randNum2()], [20, 17 + randNum2()], [21, 18 + randNum2()], [22, 19 + randNum2()], [23, 20 + randNum2()], [24, 21 + randNum2()], [25, 14 + randNum2()], [26, 24 + randNum2()], [27, 25 + randNum2()], [28, 26 + randNum2()], [29, 27 + randNum2()], [30, 31 + randNum2()]];
                        var visitors = [[1, 5 + randNum3()], [2, 10 + randNum3()], [3, 15 + randNum3()], [4, 20 + randNum3()], [5, 25 + randNum3()], [6, 30 + randNum3()], [7, 35 + randNum3()], [8, 40 + randNum3()], [9, 45 + randNum3()], [10, 50 + randNum3()], [11, 55 + randNum3()], [12, 60 + randNum3()], [13, 65 + randNum3()], [14, 70 + randNum3()], [15, 75 + randNum3()], [16, 80 + randNum3()], [17, 85 + randNum3()], [18, 90 + randNum3()], [19, 85 + randNum3()], [20, 80 + randNum3()], [21, 75 + randNum3()], [22, 80 + randNum3()], [23, 75 + randNum3()], [24, 70 + randNum3()], [25, 65 + randNum3()], [26, 75 + randNum3()], [27, 80 + randNum3()], [28, 85 + randNum3()], [29, 90 + randNum3()], [30, 95 + randNum3()]];
                        var newVisitors = [[1, randNum4() - 10], [2, randNum4() - 10], [3, randNum4() - 10], [4, randNum4()], [5, randNum4()], [6, 4 + randNum4()], [7, 5 + randNum4()], [8, 6 + randNum4()], [9, 6 + randNum4()], [10, 8 + randNum4()], [11, 9 + randNum4()], [12, 10 + randNum4()], [13, 11 + randNum4()], [14, 12 + randNum4()], [15, 13 + randNum4()], [16, 14 + randNum4()], [17, 15 + randNum4()], [18, 15 + randNum4()], [19, 16 + randNum4()], [20, 17 + randNum4()], [21, 18 + randNum4()], [22, 19 + randNum4()], [23, 20 + randNum4()], [24, 21 + randNum4()], [25, 14 + randNum4()], [26, 24 + randNum4()], [27, 25 + randNum4()], [28, 26 + randNum4()], [29, 27 + randNum4()], [30, 31 + randNum4()]];
                        */
		                var facturasSinRecibos = PERPRODUCTACTEVOPERSEMESTER // BUDGETSTAFF
		                /*
                        [[1, 8000], [2, 6000], [3, 15000]];
                        var visitors = [[1, 15000], [2, 5000], [3, 25000]];
                        var newVisitors = [[1, 5000], [2, 5000], [3, 25000]];
                        */

		                var plot = $.plot($("#stats-chart201_ae_perproduct"),
                               [
                                   {
                                       data: facturasSinRecibos,
                                       label: "Activos último semestre Per Producto",
                                       lines: {
                                           show: true,
                                           fill: false,
                                           lineWidth: 5
                                       },
                                       shadowSize: 0
                                   }
                                   /*, {
                                       data: salariestotalcost,
                                       label: "Total Cost",
                                       bars: {
                                           show: true,
                                           fill: true,
                                           barWidth: 0.3,
                                           align: "center",
                                           lineWidth: 3,
                                       }
                                   },
                                {
                                    data: salaries,
                                    label: "Salaries",
                                    bars: {
                                        show: true,
                                        fill: true,
                                        barWidth: 0.3,
                                        align: "center",
                                        lineWidth: 3,
                                    }
                                }
                                */
                               ],
                                    {

                                        grid: {
                                            hoverable: true,
                                            clickable: true,
                                            tickColor: "rgba(0,0,0,0.05)",
                                            borderWidth: 0
                                        },
                                        legend: {
                                            show: false


                                        },
                                        colors: ["rgba(24,102,20,0.8)", "rgba(255,255,255,1)", "rgba(0,0,0,0.4)", "rgba(255,255,255,0.2)"],
                                        background: ["rgba(255,255,255,0.8)"],
                                        xaxis: { ticks: 15, tickDecimals: 0, color: "rgba(255,255,255,0.8)" },
                                        yaxis: { ticks: 5, tickDecimals: 0, color: "rgba(255,255,255,0.8)" },
                                    });

		                /*
                           [ { data: visitors, label: "Visits"}], {
                               series: {
                                   lines: { show: true,
                                            lineWidth: 2
                                         },
                                   points: { show: true, 
                                             lineWidth: 2 
                                         },
                                   shadowSize: 0
                               },	
                               grid: { hoverable: true, 
                                       clickable: true, 
                                       tickColor: "rgba(255,255,255,0.025)",
                                       borderWidth: 0
                                     },
                             legend: {
                                        show: false
                                    },	
                               colors: ["rgba(255,255,255,0.8)", "rgba(255,255,255,0.6)", "rgba(255,255,255,0.4)", "rgba(255,255,255,0.2)"],
                                xaxis: {ticks:15, tickDecimals: 0},
                                yaxis: {ticks:5, tickDecimals: 0},
                             });
                        */



		                function showTooltip(x, y, contents) {
		                    $('<div id="tooltip">' + contents + '</div>').css({
		                        position: 'absolute',
		                        display: 'none',
		                        top: y + 5,
		                        left: x + 5,
		                        border: '1px solid #fdd',
		                        padding: '2px',
		                        'background-color': '#dfeffc',
		                        opacity: 0.80
		                    }).appendTo("body").fadeIn(200);
		                }

		                var previousPoint = null;
		                $("#stats-chart201_ae_perproduct").bind("plothover", function (event, pos, item) {
		                    $("#x").text(pos.x.toFixed(2));
		                    $("#y").text(pos.y.toFixed(2));

		                    if (item) {
		                        if (previousPoint != item.dataIndex) {
		                            previousPoint = item.dataIndex;

		                            $("#tooltip").remove();
		                            var x = item.datapoint[0].toFixed(0),
                                        y = item.datapoint[1].toFixed(0);

		                            showTooltip(item.pageX, item.pageY,
                                                item.series.label + " of " + x + " = " + y);
		                        }
		                    }
		                    else {
		                        $("#tooltip").remove();
		                        previousPoint = null;
		                    }
		                });

		            }

		            if ($("#stats-chart201_ae_productVSactive").length) {
		                // var salaries = RETRIEVESALARYPERMONTH;
		                // var salariestotalcost = RETRIEVETOTALCOSTPERMONTH;
		                /*PAGEVIEWSREPLACE*/
		                /*
                        var visits = [[1, randNum2() - 10], [2, randNum2() - 10], [3, randNum2() - 10], [4, randNum2()], [5, randNum2()], [6, 4 + randNum2()], [7, 5 + randNum2()], [8, 6 + randNum2()], [9, 6 + randNum2()], [10, 8 + randNum2()], [11, 9 + randNum2()], [12, 10 + randNum2()], [13, 11 + randNum2()], [14, 12 + randNum2()], [15, 13 + randNum2()], [16, 14 + randNum2()], [17, 15 + randNum2()], [18, 15 + randNum2()], [19, 16 + randNum2()], [20, 17 + randNum2()], [21, 18 + randNum2()], [22, 19 + randNum2()], [23, 20 + randNum2()], [24, 21 + randNum2()], [25, 14 + randNum2()], [26, 24 + randNum2()], [27, 25 + randNum2()], [28, 26 + randNum2()], [29, 27 + randNum2()], [30, 31 + randNum2()]];
                        var visitors = [[1, 5 + randNum3()], [2, 10 + randNum3()], [3, 15 + randNum3()], [4, 20 + randNum3()], [5, 25 + randNum3()], [6, 30 + randNum3()], [7, 35 + randNum3()], [8, 40 + randNum3()], [9, 45 + randNum3()], [10, 50 + randNum3()], [11, 55 + randNum3()], [12, 60 + randNum3()], [13, 65 + randNum3()], [14, 70 + randNum3()], [15, 75 + randNum3()], [16, 80 + randNum3()], [17, 85 + randNum3()], [18, 90 + randNum3()], [19, 85 + randNum3()], [20, 80 + randNum3()], [21, 75 + randNum3()], [22, 80 + randNum3()], [23, 75 + randNum3()], [24, 70 + randNum3()], [25, 65 + randNum3()], [26, 75 + randNum3()], [27, 80 + randNum3()], [28, 85 + randNum3()], [29, 90 + randNum3()], [30, 95 + randNum3()]];
                        var newVisitors = [[1, randNum4() - 10], [2, randNum4() - 10], [3, randNum4() - 10], [4, randNum4()], [5, randNum4()], [6, 4 + randNum4()], [7, 5 + randNum4()], [8, 6 + randNum4()], [9, 6 + randNum4()], [10, 8 + randNum4()], [11, 9 + randNum4()], [12, 10 + randNum4()], [13, 11 + randNum4()], [14, 12 + randNum4()], [15, 13 + randNum4()], [16, 14 + randNum4()], [17, 15 + randNum4()], [18, 15 + randNum4()], [19, 16 + randNum4()], [20, 17 + randNum4()], [21, 18 + randNum4()], [22, 19 + randNum4()], [23, 20 + randNum4()], [24, 21 + randNum4()], [25, 14 + randNum4()], [26, 24 + randNum4()], [27, 25 + randNum4()], [28, 26 + randNum4()], [29, 27 + randNum4()], [30, 31 + randNum4()]];
                        */
		                var facturasSinRecibos = ACTIVESVSPRODUCTPERSEMESTER // BUDGETSTAFF
		                /*
                        [[1, 8000], [2, 6000], [3, 15000]];
                        var visitors = [[1, 15000], [2, 5000], [3, 25000]];
                        var newVisitors = [[1, 5000], [2, 5000], [3, 25000]];
                        */

		                var plot = $.plot($("#stats-chart201_ae_productVSactive"),
                               [
                                   {
                                       data: facturasSinRecibos,
                                       label: "Productos VS Activos último semestre",
                                       lines: {
                                           show: true,
                                           fill: false,
                                           lineWidth: 5
                                       },
                                       shadowSize: 0
                                   }
                                   /*, {
                                       data: salariestotalcost,
                                       label: "Total Cost",
                                       bars: {
                                           show: true,
                                           fill: true,
                                           barWidth: 0.3,
                                           align: "center",
                                           lineWidth: 3,
                                       }
                                   },
                                {
                                    data: salaries,
                                    label: "Salaries",
                                    bars: {
                                        show: true,
                                        fill: true,
                                        barWidth: 0.3,
                                        align: "center",
                                        lineWidth: 3,
                                    }
                                }
                                */
                               ],
                                    {

                                        grid: {
                                            hoverable: true,
                                            clickable: true,
                                            tickColor: "rgba(0,0,0,0.05)",
                                            borderWidth: 0
                                        },
                                        legend: {
                                            show: false


                                        },
                                        colors: ["rgba(124,202,20,0.8)", "rgba(255,255,255,1)", "rgba(0,0,0,0.4)", "rgba(255,255,255,0.2)"],
                                        background: ["rgba(255,255,255,0.8)"],
                                        xaxis: { ticks: 15, tickDecimals: 0, color: "rgba(255,255,255,0.8)" },
                                        yaxis: { ticks: 5, tickDecimals: 0, color: "rgba(255,255,255,0.8)" },
                                    });

		                /*
                           [ { data: visitors, label: "Visits"}], {
                               series: {
                                   lines: { show: true,
                                            lineWidth: 2
                                         },
                                   points: { show: true, 
                                             lineWidth: 2 
                                         },
                                   shadowSize: 0
                               },	
                               grid: { hoverable: true, 
                                       clickable: true, 
                                       tickColor: "rgba(255,255,255,0.025)",
                                       borderWidth: 0
                                     },
                             legend: {
                                        show: false
                                    },	
                               colors: ["rgba(255,255,255,0.8)", "rgba(255,255,255,0.6)", "rgba(255,255,255,0.4)", "rgba(255,255,255,0.2)"],
                                xaxis: {ticks:15, tickDecimals: 0},
                                yaxis: {ticks:5, tickDecimals: 0},
                             });
                        */



		                function showTooltip(x, y, contents) {
		                    $('<div id="tooltip">' + contents + '</div>').css({
		                        position: 'absolute',
		                        display: 'none',
		                        top: y + 5,
		                        left: x + 5,
		                        border: '1px solid #fdd',
		                        padding: '2px',
		                        'background-color': '#dfeffc',
		                        opacity: 0.80
		                    }).appendTo("body").fadeIn(200);
		                }

		                var previousPoint = null;
		                $("#stats-chart201_ae_productVSactive").bind("plothover", function (event, pos, item) {
		                    $("#x").text(pos.x.toFixed(2));
		                    $("#y").text(pos.y.toFixed(2));

		                    if (item) {
		                        if (previousPoint != item.dataIndex) {
		                            previousPoint = item.dataIndex;

		                            $("#tooltip").remove();
		                            var x = item.datapoint[0].toFixed(0),
                                        y = item.datapoint[1].toFixed(0);

		                            showTooltip(item.pageX, item.pageY,
                                                item.series.label + " of " + x + " = " + y);
		                        }
		                    }
		                    else {
		                        $("#tooltip").remove();
		                        previousPoint = null;
		                    }
		                });

		            }

		            /* desde aqui new graph online accounting stat-chart201-oa */
		            if ($("#stat-chart201-oa").length) {
		                var ejecucionoa = EJECUCIONOA //RETRIEVESALARYPERMONTH;
		                // var salariestotalcost = RETRIEVETOTALCOSTPERMONTH;
		                /*PAGEVIEWSREPLACE*/
		                /*
                        var visits = [[1, randNum2() - 10], [2, randNum2() - 10], [3, randNum2() - 10], [4, randNum2()], [5, randNum2()], [6, 4 + randNum2()], [7, 5 + randNum2()], [8, 6 + randNum2()], [9, 6 + randNum2()], [10, 8 + randNum2()], [11, 9 + randNum2()], [12, 10 + randNum2()], [13, 11 + randNum2()], [14, 12 + randNum2()], [15, 13 + randNum2()], [16, 14 + randNum2()], [17, 15 + randNum2()], [18, 15 + randNum2()], [19, 16 + randNum2()], [20, 17 + randNum2()], [21, 18 + randNum2()], [22, 19 + randNum2()], [23, 20 + randNum2()], [24, 21 + randNum2()], [25, 14 + randNum2()], [26, 24 + randNum2()], [27, 25 + randNum2()], [28, 26 + randNum2()], [29, 27 + randNum2()], [30, 31 + randNum2()]];
                        var visitors = [[1, 5 + randNum3()], [2, 10 + randNum3()], [3, 15 + randNum3()], [4, 20 + randNum3()], [5, 25 + randNum3()], [6, 30 + randNum3()], [7, 35 + randNum3()], [8, 40 + randNum3()], [9, 45 + randNum3()], [10, 50 + randNum3()], [11, 55 + randNum3()], [12, 60 + randNum3()], [13, 65 + randNum3()], [14, 70 + randNum3()], [15, 75 + randNum3()], [16, 80 + randNum3()], [17, 85 + randNum3()], [18, 90 + randNum3()], [19, 85 + randNum3()], [20, 80 + randNum3()], [21, 75 + randNum3()], [22, 80 + randNum3()], [23, 75 + randNum3()], [24, 70 + randNum3()], [25, 65 + randNum3()], [26, 75 + randNum3()], [27, 80 + randNum3()], [28, 85 + randNum3()], [29, 90 + randNum3()], [30, 95 + randNum3()]];
                        var newVisitors = [[1, randNum4() - 10], [2, randNum4() - 10], [3, randNum4() - 10], [4, randNum4()], [5, randNum4()], [6, 4 + randNum4()], [7, 5 + randNum4()], [8, 6 + randNum4()], [9, 6 + randNum4()], [10, 8 + randNum4()], [11, 9 + randNum4()], [12, 10 + randNum4()], [13, 11 + randNum4()], [14, 12 + randNum4()], [15, 13 + randNum4()], [16, 14 + randNum4()], [17, 15 + randNum4()], [18, 15 + randNum4()], [19, 16 + randNum4()], [20, 17 + randNum4()], [21, 18 + randNum4()], [22, 19 + randNum4()], [23, 20 + randNum4()], [24, 21 + randNum4()], [25, 14 + randNum4()], [26, 24 + randNum4()], [27, 25 + randNum4()], [28, 26 + randNum4()], [29, 27 + randNum4()], [30, 31 + randNum4()]];
                        */
		                var budgetoa = BUDGETOA // BUDGETSTAFF
		                /*
                        [[1, 8000], [2, 6000], [3, 15000]];
                        var visitors = [[1, 15000], [2, 5000], [3, 25000]];
                        var newVisitors = [[1, 5000], [2, 5000], [3, 25000]];
                        */

		                var plot = $.plot($("#stat-chart201-oa"),
                               [
                                   {
                                       data: budgetoa,
                                       label: "Budget",
                                       lines: {
                                           show: true,
                                           fill: false,
                                           lineWidth: 5
                                       },
                                       shadowSize: 0
                                   }/*,
                               {
                                   data: budgetoa,
                                   label: "Budget",
                                   bars: {
                                       show: true,
                                       fill: true,
                                       barWidth: 0.3,
                                       align: "center",
                                       lineWidth: 3,
                                   }
                               }*/,
                                {
                                    data: ejecucionoa,
                                    label: "Ejecución",
                                    bars: {
                                        show: true,
                                        fill: true,
                                        barWidth: 0.3,
                                        align: "center",
                                        lineWidth: 3,
                                    }
                                }

                               ],
                                    {

                                        grid: {
                                            hoverable: true,
                                            clickable: true,
                                            tickColor: "rgba(0,0,0,0.05)",
                                            borderWidth: 0
                                        },
                                        legend: {
                                            show: false


                                        },
                                        colors: ["rgba(24,102,20,0.8)", "rgba(255,255,255,1)", "rgba(0,0,0,0.4)", "rgba(255,255,255,0.2)"],
                                        background: ["rgba(255,255,255,0.8)"],
                                        xaxis: { ticks: 15, tickDecimals: 0, color: "rgba(255,255,255,0.8)" },
                                        yaxis: { ticks: 5, tickDecimals: 0, color: "rgba(255,255,255,0.8)" },
                                    });

		                /*
                           [ { data: visitors, label: "Visits"}], {
                               series: {
                                   lines: { show: true,
                                            lineWidth: 2
                                         },
                                   points: { show: true, 
                                             lineWidth: 2 
                                         },
                                   shadowSize: 0
                               },	
                               grid: { hoverable: true, 
                                       clickable: true, 
                                       tickColor: "rgba(255,255,255,0.025)",
                                       borderWidth: 0
                                     },
                             legend: {
                                        show: false
                                    },	
                               colors: ["rgba(255,255,255,0.8)", "rgba(255,255,255,0.6)", "rgba(255,255,255,0.4)", "rgba(255,255,255,0.2)"],
                                xaxis: {ticks:15, tickDecimals: 0},
                                yaxis: {ticks:5, tickDecimals: 0},
                             });
                        */



		                function showTooltip(x, y, contents) {
		                    $('<div id="tooltip">' + contents + '</div>').css({
		                        position: 'absolute',
		                        display: 'none',
		                        top: y + 5,
		                        left: x + 5,
		                        border: '1px solid #fdd',
		                        padding: '2px',
		                        'background-color': '#dfeffc',
		                        opacity: 0.80
		                    }).appendTo("body").fadeIn(200);
		                }

		                var previousPoint = null;
		                $("#stat-chart201-oa").bind("plothover", function (event, pos, item) {
		                    $("#x").text(pos.x.toFixed(2));
		                    $("#y").text(pos.y.toFixed(2));

		                    if (item) {
		                        if (previousPoint != item.dataIndex) {
		                            previousPoint = item.dataIndex;

		                            $("#tooltip").remove();
		                            var x = item.datapoint[0].toFixed(0),
                                        y = item.datapoint[1].toFixed(0);

		                            showTooltip(item.pageX, item.pageY,
                                                item.series.label + " of " + x + " = " + y);
		                        }
		                    }
		                    else {
		                        $("#tooltip").remove();
		                        previousPoint = null;
		                    }
		                });

		            }

		            /* hasta aqui new graph online accounting stat-chart201-oa */


		            /* ---------- Chart with new chart ---------- */

		            function randNumFB() {
		                return ((Math.floor(Math.random() * (1 + 40 - 20))) + 20);
		            }

		            /* ---------- Chart with points ---------- */
		            if ($("#facebookChart").length) {
		                var likes = [[1, 5 + randNumFB()], [2, 10 + randNumFB()], [3, 15 + randNumFB()], [4, 20 + randNumFB()], [5, 25 + randNumFB()], [6, 30 + randNumFB()], [7, 35 + randNumFB()], [8, 40 + randNumFB()], [9, 45 + randNumFB()], [10, 50 + randNumFB()], [11, 55 + randNumFB()], [12, 60 + randNumFB()], [13, 65 + randNumFB()], [14, 70 + randNumFB()], [15, 75 + randNumFB()], [16, 80 + randNumFB()], [17, 85 + randNumFB()], [18, 90 + randNumFB()], [19, 85 + randNumFB()], [20, 80 + randNumFB()], [21, 75 + randNumFB()], [22, 80 + randNumFB()], [23, 75 + randNumFB()], [24, 70 + randNumFB()], [25, 65 + randNumFB()], [26, 75 + randNumFB()], [27, 80 + randNumFB()], [28, 85 + randNumFB()], [29, 90 + randNumFB()], [30, 95 + randNumFB()]];

		                var plot = $.plot($("#facebookChart"),
                               [{ data: likes, label: "Fans" }], {
                                   series: {
                                       lines: {
                                           show: true,
                                           lineWidth: 2,
                                           fill: true, fillColor: { colors: [{ opacity: 0.5 }, { opacity: 0.2 }] }
                                       },
                                       points: {
                                           show: true,
                                           lineWidth: 2
                                       },
                                       shadowSize: 0
                                   },
                                   grid: {
                                       hoverable: true,
                                       clickable: true,
                                       tickColor: "#f9f9f9",
                                       borderWidth: 0
                                   },
                                   colors: ["#3B5998"],
                                   xaxis: { ticks: 6, tickDecimals: 0 },
                                   yaxis: { ticks: 3, tickDecimals: 0 },
                               });

		                function showTooltip(x, y, contents) {
		                    $('<div id="tooltip">' + contents + '</div>').css({
		                        position: 'absolute',
		                        display: 'none',
		                        top: y + 5,
		                        left: x + 5,
		                        border: '1px solid #fdd',
		                        padding: '2px',
		                        'background-color': '#dfeffc',
		                        opacity: 0.80
		                    }).appendTo("body").fadeIn(200);
		                }

		                var previousPoint = null;
		                $("#facebookChart").bind("plothover", function (event, pos, item) {
		                    $("#x").text(pos.x.toFixed(2));
		                    $("#y").text(pos.y.toFixed(2));

		                    if (item) {
		                        if (previousPoint != item.dataIndex) {
		                            previousPoint = item.dataIndex;

		                            $("#tooltip").remove();
		                            var x = item.datapoint[0].toFixed(2),
                                        y = item.datapoint[1].toFixed(2);

		                            showTooltip(item.pageX, item.pageY,
                                                item.series.label + " of " + x + " = " + y);
		                        }
		                    }
		                    else {
		                        $("#tooltip").remove();
		                        previousPoint = null;
		                    }
		                });

		            }

		            function randNumTW() {
		                return ((Math.floor(Math.random() * (1 + 40 - 20))) + 20);
		            }

		            /* ---------- Chart with points ---------- */
		            if ($("#twitterChart").length) {
		                var followers = [[1, 5 + randNumTW()], [2, 10 + randNumTW()], [3, 15 + randNumTW()], [4, 20 + randNumTW()], [5, 25 + randNumTW()], [6, 30 + randNumTW()], [7, 35 + randNumTW()], [8, 40 + randNumTW()], [9, 45 + randNumTW()], [10, 50 + randNumTW()], [11, 55 + randNumTW()], [12, 60 + randNumTW()], [13, 65 + randNumTW()], [14, 70 + randNumTW()], [15, 75 + randNumTW()], [16, 80 + randNumTW()], [17, 85 + randNumTW()], [18, 90 + randNumTW()], [19, 85 + randNumTW()], [20, 80 + randNumTW()], [21, 75 + randNumTW()], [22, 80 + randNumTW()], [23, 75 + randNumTW()], [24, 70 + randNumTW()], [25, 65 + randNumTW()], [26, 75 + randNumTW()], [27, 80 + randNumTW()], [28, 85 + randNumTW()], [29, 90 + randNumTW()], [30, 95 + randNumTW()]];

		                var plot = $.plot($("#twitterChart"),
                               [{ data: followers, label: "Followers" }], {
                                   series: {
                                       lines: {
                                           show: true,
                                           lineWidth: 2,
                                           fill: true, fillColor: { colors: [{ opacity: 0.5 }, { opacity: 0.2 }] }
                                       },
                                       points: {
                                           show: true,
                                           lineWidth: 2
                                       },
                                       shadowSize: 0
                                   },
                                   grid: {
                                       hoverable: true,
                                       clickable: true,
                                       tickColor: "#f9f9f9",
                                       borderWidth: 0
                                   },
                                   colors: ["#1BB2E9"],
                                   xaxis: { ticks: 6, tickDecimals: 0 },
                                   yaxis: { ticks: 3, tickDecimals: 0 },
                               });

		                function showTooltip(x, y, contents) {
		                    $('<div id="tooltip">' + contents + '</div>').css({
		                        position: 'absolute',
		                        display: 'none',
		                        top: y + 5,
		                        left: x + 5,
		                        border: '1px solid #fdd',
		                        padding: '2px',
		                        'background-color': '#dfeffc',
		                        opacity: 0.80
		                    }).appendTo("body").fadeIn(200);
		                }

		                var previousPoint = null;
		                $("#twitterChart").bind("plothover", function (event, pos, item) {
		                    $("#x").text(pos.x.toFixed(2));
		                    $("#y").text(pos.y.toFixed(2));

		                    if (item) {
		                        if (previousPoint != item.dataIndex) {
		                            previousPoint = item.dataIndex;

		                            $("#tooltip").remove();
		                            var x = item.datapoint[0].toFixed(2),
                                        y = item.datapoint[1].toFixed(2);

		                            showTooltip(item.pageX, item.pageY,
                                                item.series.label + " of " + x + " = " + y);
		                        }
		                    }
		                    else {
		                        $("#tooltip").remove();
		                        previousPoint = null;
		                    }
		                });

		            }


		            if ($("#activeUsers").length) {
		                var d1 = [];

		                for (var i = 0; i <= 160; i += 1) {
		                    d1.push([i, parseInt(Math.random() * 123123)]);
		                }

		                var stack = 0, bars = true, lines = false, steps = false;

		                function plotWithOptions2() {

		                    $.plot($("#activeUsers"), [d1], {
		                        series: {
		                            bars: {
		                                show: bars,
		                                fill: true,
		                                barWidth: 0.1,
		                                align: "center",
		                                lineWidth: 5,
		                                fillColor: { colors: [{ opacity: 1 }, { opacity: 0.5 }] }
		                            },
		                        },
		                        grid: {
		                            hoverable: true,
		                            clickable: true,
		                            tickColor: "#f6f6f6",
		                            borderWidth: 0,
		                        },
		                        colors: ["#CBE968"],
		                        xaxis: { ticks: 0, tickDecimals: 0, tickFormatter: function (v, a) { return v } },
		                        yaxis: { ticks: 5, tickDecimals: 0, tickFormatter: function (v) { return v } },

		                    });
		                }

		                plotWithOptions2();

		            }

		            /* ---------- Chart with points ---------- */
		            if ($("#stats-chart").length) {
		                var visitors = [[1, randNum() - 10], [2, randNum() - 10], [3, randNum() - 10], [4, randNum()], [5, randNum()], [6, 4 + randNum()], [7, 5 + randNum()], [8, 6 + randNum()], [9, 6 + randNum()], [10, 8 + randNum()], [11, 9 + randNum()], [12, 10 + randNum()], [13, 11 + randNum()], [14, 12 + randNum()], [15, 13 + randNum()], [16, 14 + randNum()], [17, 15 + randNum()], [18, 15 + randNum()], [19, 16 + randNum()], [20, 17 + randNum()], [21, 18 + randNum()], [22, 19 + randNum()], [23, 20 + randNum()], [24, 21 + randNum()], [25, 14 + randNum()], [26, 24 + randNum()], [27, 25 + randNum()], [28, 26 + randNum()], [29, 27 + randNum()], [30, 31 + randNum()]];

		                var plot = $.plot($("#stats-chart"),
                               [{ data: visitors, label: "visitors" }], {
                                   series: {
                                       lines: {
                                           show: true,
                                           lineWidth: 3,
                                           fill: true, fillColor: { colors: [{ opacity: 0.5 }, { opacity: 0.2 }] }
                                       },
                                       points: { show: true },
                                       shadowSize: 2
                                   },
                                   grid: {
                                       hoverable: true,
                                       clickable: true,
                                       tickColor: "#eee",
                                       borderWidth: 0,
                                   },
                                   colors: ["#b1d3d4"],
                                   xaxis: { ticks: 11, tickDecimals: 0 },
                                   yaxis: { ticks: 11, tickDecimals: 0 },
                               });

		                function showTooltip(x, y, contents) {
		                    $('<div id="tooltip">' + contents + '</div>').css({
		                        position: 'absolute',
		                        display: 'none',
		                        top: y + 5,
		                        left: x + 5,
		                        border: '1px solid #fdd',
		                        padding: '2px',
		                        'background-color': '#dfeffc',
		                        opacity: 0.80
		                    }).appendTo("body").fadeIn(200);
		                }

		                var previousPoint = null;
		                $("#stats-chart").bind("plothover", function (event, pos, item) {
		                    $("#x").text(pos.x.toFixed(2));
		                    $("#y").text(pos.y.toFixed(2));

		                    if (item) {
		                        if (previousPoint != item.dataIndex) {
		                            previousPoint = item.dataIndex;

		                            $("#tooltip").remove();
		                            var x = item.datapoint[0].toFixed(2),
                                        y = item.datapoint[1].toFixed(2);

		                            showTooltip(item.pageX, item.pageY,
                                                item.series.label + " of " + x + " = " + y);
		                        }
		                    }
		                    else {
		                        $("#tooltip").remove();
		                        previousPoint = null;
		                    }
		                });



		                $("#sincos").bind("plotclick", function (event, pos, item) {
		                    if (item) {
		                        $("#clickdata").text("You clicked point " + item.dataIndex + " in " + item.series.label + ".");
		                        plot.highlight(item.series, item.datapoint);
		                    }
		                });
		            }



		            /* ---------- Chart with points ---------- */
		            if ($("#sincos").length) {
		                var sin = [], cos = [];

		                for (var i = 0; i < 14; i += 0.5) {
		                    sin.push([i, Math.sin(i) / i]);
		                    cos.push([i, Math.cos(i)]);
		                }

		                var plot = $.plot($("#sincos"),
                               [{ data: sin, label: "sin(x)/x" }, { data: cos, label: "cos(x)" }], {
                                   series: {
                                       lines: {
                                           show: true,
                                           lineWidth: 2,
                                       },
                                       points: { show: true },
                                       shadowSize: 2
                                   },
                                   grid: {
                                       hoverable: true,
                                       clickable: true,
                                       tickColor: "#dddddd",
                                       borderWidth: 0
                                   },
                                   yaxis: { min: -1.2, max: 1.2 },
                                   colors: ["#FA5833", "#2FABE9"]
                               });

		                function showTooltip(x, y, contents) {
		                    $('<div id="tooltip">' + contents + '</div>').css({
		                        position: 'absolute',
		                        display: 'none',
		                        top: y + 5,
		                        left: x + 5,
		                        border: '1px solid #fdd',
		                        padding: '2px',
		                        'background-color': '#dfeffc',
		                        opacity: 0.80
		                    }).appendTo("body").fadeIn(200);
		                }

		                var previousPoint = null;
		                $("#sincos").bind("plothover", function (event, pos, item) {
		                    $("#x").text(pos.x.toFixed(2));
		                    $("#y").text(pos.y.toFixed(2));

		                    if (item) {
		                        if (previousPoint != item.dataIndex) {
		                            previousPoint = item.dataIndex;

		                            $("#tooltip").remove();
		                            var x = item.datapoint[0].toFixed(2),
                                        y = item.datapoint[1].toFixed(2);

		                            showTooltip(item.pageX, item.pageY,
                                                item.series.label + " of " + x + " = " + y);
		                        }
		                    }
		                    else {
		                        $("#tooltip").remove();
		                        previousPoint = null;
		                    }
		                });



		                $("#sincos").bind("plotclick", function (event, pos, item) {
		                    if (item) {
		                        $("#clickdata").text("You clicked point " + item.dataIndex + " in " + item.series.label + ".");
		                        plot.highlight(item.series, item.datapoint);
		                    }
		                });
		            }

		            /* ---------- Flot chart ---------- */
		            if ($("#flotchart").length) {
		                var d1 = [];
		                for (var i = 0; i < Math.PI * 2; i += 0.25)
		                    d1.push([i, Math.sin(i)]);

		                var d2 = [];
		                for (var i = 0; i < Math.PI * 2; i += 0.25)
		                    d2.push([i, Math.cos(i)]);

		                var d3 = [];
		                for (var i = 0; i < Math.PI * 2; i += 0.1)
		                    d3.push([i, Math.tan(i)]);

		                $.plot($("#flotchart"), [
                            { label: "sin(x)", data: d1 },
                            { label: "cos(x)", data: d2 },
                            { label: "tan(x)", data: d3 }
		                ], {
		                    series: {
		                        lines: { show: true },
		                        points: { show: true }
		                    },
		                    xaxis: {
		                        ticks: [0, [Math.PI / 2, "\u03c0/2"], [Math.PI, "\u03c0"], [Math.PI * 3 / 2, "3\u03c0/2"], [Math.PI * 2, "2\u03c0"]]
		                    },
		                    yaxis: {
		                        ticks: 10,
		                        min: -2,
		                        max: 2
		                    },
		                    grid: {
		                        tickColor: "#dddddd",
		                        borderWidth: 0
		                    },
		                    colors: ["#FA5833", "#2FABE9", "#FABB3D"]
		                });
		            }

		            /* ---------- Stack chart ---------- */
		            if ($("#stackchart").length) {
		                var d1 = [];
		                for (var i = 0; i <= 10; i += 1)
		                    d1.push([i, parseInt(Math.random() * 30)]);

		                var d2 = [];
		                for (var i = 0; i <= 10; i += 1)
		                    d2.push([i, parseInt(Math.random() * 30)]);

		                var d3 = [];
		                for (var i = 0; i <= 10; i += 1)
		                    d3.push([i, parseInt(Math.random() * 30)]);

		                var stack = 0, bars = true, lines = false, steps = false;

		                function plotWithOptions() {
		                    $.plot($("#stackchart"), [d1, d2, d3], {
		                        series: {
		                            stack: stack,
		                            lines: { show: lines, fill: true, steps: steps },
		                            bars: { show: bars, barWidth: 0.6 },
		                        },
		                        colors: ["#FA5833", "#2FABE9", "#FABB3D"]
		                    });
		                }

		                plotWithOptions();

		                $(".stackControls input").click(function (e) {
		                    e.preventDefault();
		                    stack = $(this).val() == "With stacking" ? true : null;
		                    plotWithOptions();
		                });
		                $(".graphControls input").click(function (e) {
		                    e.preventDefault();
		                    bars = $(this).val().indexOf("Bars") != -1;
		                    lines = $(this).val().indexOf("Lines") != -1;
		                    steps = $(this).val().indexOf("steps") != -1;
		                    plotWithOptions();
		                });
		            }

		            /* ---------- Device chart ---------- */

		            var data = [
                    { label: "Desktop", data: 73 },
                    { label: "Mobile", data: 27 }
		            ];

		            /* ---------- Donut chart ---------- */
		            if ($("#deviceChart").length) {
		                $.plot($("#deviceChart"), data,
                        {
                            series: {
                                pie: {
                                    innerRadius: 0.6,
                                    show: true
                                }
                            },
                            legend: {
                                show: true
                            },
                            colors: ["#FA5833", "#2FABE9", "#FABB3D", "#78CD51"]
                        });
		            }

		            var data = [
                    { label: "iOS", data: 20 },
                    { label: "Android", data: 7 },
                    { label: "Linux", data: 11 },
                    { label: "Mac OSX", data: 14 },
                    { label: "Windows", data: 48 }
		            ];

		            /* ---------- Donut chart ---------- */
		            if ($("#osChart").length) {
		                $.plot($("#osChart"), data,
                        {
                            series: {
                                pie: {
                                    innerRadius: 0.6,
                                    show: true
                                }
                            },
                            legend: {
                                show: true
                            },
                            colors: ["#FA5833", "#2FABE9", "#FABB3D", "#78CD51"]
                        });
		            }

		            /* ---------- Pie chart ---------- */
		            var data = [
                    { label: "Internet Explorer", data: 12 },
                    { label: "Mobile", data: 27 },
                    { label: "Safari", data: 85 },
                    { label: "Opera", data: 64 },
                    { label: "Firefox", data: 90 },
                    { label: "Chrome", data: 112 }
		            ];

		            if ($("#piechart").length) {
		                $.plot($("#piechart"), data,
                        {
                            series: {
                                pie: {
                                    show: true
                                }
                            },
                            grid: {
                                hoverable: true,
                                clickable: true
                            },
                            legend: {
                                show: false
                            },
                            colors: ["#FA5833", "#2FABE9", "#FABB3D", "#78CD51"]
                        });

		                function pieHover(event, pos, obj) {
		                    if (!obj)
		                        return;
		                    percent = parseFloat(obj.series.percent).toFixed(2);
		                    $("#hover").html('<span style="font-weight: bold; color: ' + obj.series.color + '">' + obj.series.label + ' (' + percent + '%)</span>');
		                }
		                $("#piechart").bind("plothover", pieHover);
		            }

		            /* ---------- Donut chart ---------- */
		            if ($("#donutchart").length) {
		                $.plot($("#donutchart"), data,
                        {
                            series: {
                                pie: {
                                    innerRadius: 0.5,
                                    show: true
                                }
                            },
                            legend: {
                                show: false
                            },
                            colors: ["#FA5833", "#2FABE9", "#FABB3D", "#78CD51"]
                        });
		            }




		            // we use an inline data source in the example, usually data would
		            // be fetched from a server
		            var data = [], totalPoints = 300;
		            function getRandomData() {
		                if (data.length > 0)
		                    data = data.slice(1);

		                // do a random walk
		                while (data.length < totalPoints) {
		                    var prev = data.length > 0 ? data[data.length - 1] : 50;
		                    var y = prev + Math.random() * 10 - 5;
		                    if (y < 0)
		                        y = 0;
		                    if (y > 100)
		                        y = 100;
		                    data.push(y);
		                }

		                // zip the generated y values with the x values
		                var res = [];
		                for (var i = 0; i < data.length; ++i)
		                    res.push([i, data[i]])
		                return res;
		            }

		            // setup control widget
		            var updateInterval = 30;
		            $("#updateInterval").val(updateInterval).change(function () {
		                var v = $(this).val();
		                if (v && !isNaN(+v)) {
		                    updateInterval = +v;
		                    if (updateInterval < 1)
		                        updateInterval = 1;
		                    if (updateInterval > 2000)
		                        updateInterval = 2000;
		                    $(this).val("" + updateInterval);
		                }
		            });

		            /* ---------- Realtime chart ---------- */
		            if ($("#serverLoad").length) {
		                var options = {
		                    series: { shadowSize: 1 },
		                    lines: { show: true, lineWidth: 3, fill: true, fillColor: { colors: [{ opacity: 0.9 }, { opacity: 0.9 }] } },
		                    yaxis: { min: 0, max: 100, tickFormatter: function (v) { return v + "%"; } },
		                    xaxis: { show: false },
		                    colors: ["#FA5833"],
		                    grid: {
		                        tickColor: "#f9f9f9",
		                        borderWidth: 0,
		                    },
		                };
		                var plot = $.plot($("#serverLoad"), [getRandomData()], options);
		                function update() {
		                    plot.setData([getRandomData()]);
		                    // since the axes don't change, we don't need to call plot.setupGrid()
		                    plot.draw();

		                    setTimeout(update, updateInterval);
		                }

		                update();
		            }

		            if ($("#serverLoad2").length) {
		                var options = {
		                    series: { shadowSize: 1 },
		                    lines: { show: true, lineWidth: 2, fill: true, fillColor: { colors: [{ opacity: 0.9 }, { opacity: 0.9 }] } },
		                    yaxis: { min: 0, max: 100, tickFormatter: function (v) { return v + "%"; }, color: "rgba(255,255,255,0.8)" },
		                    xaxis: { show: false, color: "rgba(255,255,255,0.8)" },
		                    colors: ["rgba(255,255,255,0.95)"],
		                    grid: {
		                        tickColor: "rgba(255,255,255,0.15)",
		                        borderWidth: 0,
		                    },
		                };
		                var plot = $.plot($("#serverLoad2"), [getRandomData()], options);
		                function update() {
		                    plot.setData([getRandomData()]);
		                    // since the axes don't change, we don't need to call plot.setupGrid()
		                    plot.draw();

		                    setTimeout(update, updateInterval);
		                }

		                update();
		            }

		            if ($("#realtimechart").length) {
		                var options = {
		                    series: { shadowSize: 1 },
		                    lines: { fill: true, fillColor: { colors: [{ opacity: 1 }, { opacity: 0.1 }] } },
		                    yaxis: { min: 0, max: 100 },
		                    xaxis: { show: false },
		                    colors: ["#F4A506"],
		                    grid: {
		                        tickColor: "#dddddd",
		                        borderWidth: 0
		                    },
		                };
		                var plot = $.plot($("#realtimechart"), [getRandomData()], options);
		                function update() {
		                    plot.setData([getRandomData()]);
		                    // since the axes don't change, we don't need to call plot.setupGrid()
		                    plot.draw();

		                    setTimeout(update, updateInterval);
		                }

		                update();
		            }
		        }

		        function growlLikeNotifications() {

		            $('#add-sticky').click(function () {

		                var unique_id = $.gritter.add({
		                    // (string | mandatory) the heading of the notification
		                    title: 'This is a sticky notice!',
		                    // (string | mandatory) the text inside the notification
		                    text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus eget tincidunt velit. Cum sociis natoque penatibus et <a href="#" style="color:#ccc">magnis dis parturient</a> montes, nascetur ridiculus mus.',
		                    // (string | optional) the image to display on the left
		                    image: 'img/avatar.jpg',
		                    // (bool | optional) if you want it to fade out on its own or just sit there
		                    sticky: true,
		                    // (int | optional) the time you want it to be alive for before fading out
		                    time: '',
		                    // (string | optional) the class name you want to apply to that specific message
		                    class_name: 'my-sticky-class'
		                });

		                // You can have it return a unique id, this can be used to manually remove it later using
		                /* ----------
                        setTimeout(function(){
                
                            $.gritter.remove(unique_id, {
                                fade: true,
                                speed: 'slow'
                            });
                
                        }, 6000)
                        */

		                return false;

		            });

		            $('#add-regular').click(function () {

		                $.gritter.add({
		                    // (string | mandatory) the heading of the notification
		                    title: 'This is a regular notice!',
		                    // (string | mandatory) the text inside the notification
		                    text: 'This will fade out after a certain amount of time. Vivamus eget tincidunt velit. Cum sociis natoque penatibus et <a href="#" style="color:#ccc">magnis dis parturient</a> montes, nascetur ridiculus mus.',
		                    // (string | optional) the image to display on the left
		                    image: 'img/avatar.jpg',
		                    // (bool | optional) if you want it to fade out on its own or just sit there
		                    sticky: false,
		                    // (int | optional) the time you want it to be alive for before fading out
		                    time: ''
		                });

		                return false;

		            });

		            $('#add-max').click(function () {

		                $.gritter.add({
		                    // (string | mandatory) the heading of the notification
		                    title: 'This is a notice with a max of 3 on screen at one time!',
		                    // (string | mandatory) the text inside the notification
		                    text: 'This will fade out after a certain amount of time. Vivamus eget tincidunt velit. Cum sociis natoque penatibus et <a href="#" style="color:#ccc">magnis dis parturient</a> montes, nascetur ridiculus mus.',
		                    // (string | optional) the image to display on the left
		                    image: 'img/avatar.jpg',
		                    // (bool | optional) if you want it to fade out on its own or just sit there
		                    sticky: false,
		                    // (function) before the gritter notice is opened
		                    before_open: function () {
		                        if ($('.gritter-item-wrapper').length == 3) {
		                            // Returning false prevents a new gritter from opening
		                            return false;
		                        }
		                    }
		                });

		                return false;

		            });

		            $('#add-without-image').click(function () {

		                $.gritter.add({
		                    // (string | mandatory) the heading of the notification
		                    title: 'This is a notice without an image!',
		                    // (string | mandatory) the text inside the notification
		                    text: 'This will fade out after a certain amount of time. Vivamus eget tincidunt velit. Cum sociis natoque penatibus et <a href="#" style="color:#ccc">magnis dis parturient</a> montes, nascetur ridiculus mus.'
		                });

		                return false;
		            });

		            $('#add-gritter-light').click(function () {

		                $.gritter.add({
		                    // (string | mandatory) the heading of the notification
		                    title: 'This is a light notification',
		                    // (string | mandatory) the text inside the notification
		                    text: 'Just add a "gritter-light" class_name to your $.gritter.add or globally to $.gritter.options.class_name',
		                    class_name: 'gritter-light'
		                });

		                return false;
		            });

		            $('#add-with-callbacks').click(function () {

		                $.gritter.add({
		                    // (string | mandatory) the heading of the notification
		                    title: 'This is a notice with callbacks!',
		                    // (string | mandatory) the text inside the notification
		                    text: 'The callback is...',
		                    // (function | optional) function called before it opens
		                    before_open: function () {
		                        alert('I am called before it opens');
		                    },
		                    // (function | optional) function called after it opens
		                    after_open: function (e) {
		                        alert("I am called after it opens: \nI am passed the jQuery object for the created Gritter element...\n" + e);
		                    },
		                    // (function | optional) function called before it closes
		                    before_close: function (e, manual_close) {
		                        var manually = (manual_close) ? 'The "X" was clicked to close me!' : '';
		                        alert("I am called before it closes: I am passed the jQuery object for the Gritter element... \n" + manually);
		                    },
		                    // (function | optional) function called after it closes
		                    after_close: function (e, manual_close) {
		                        var manually = (manual_close) ? 'The "X" was clicked to close me!' : '';
		                        alert('I am called after it closes. ' + manually);
		                    }
		                });

		                return false;
		            });

		            $('#add-sticky-with-callbacks').click(function () {

		                $.gritter.add({
		                    // (string | mandatory) the heading of the notification
		                    title: 'This is a sticky notice with callbacks!',
		                    // (string | mandatory) the text inside the notification
		                    text: 'Sticky sticky notice.. sticky sticky notice...',
		                    // Stickeh!
		                    sticky: true,
		                    // (function | optional) function called before it opens
		                    before_open: function () {
		                        alert('I am a sticky called before it opens');
		                    },
		                    // (function | optional) function called after it opens
		                    after_open: function (e) {
		                        alert("I am a sticky called after it opens: \nI am passed the jQuery object for the created Gritter element...\n" + e);
		                    },
		                    // (function | optional) function called before it closes
		                    before_close: function (e) {
		                        alert("I am a sticky called before it closes: I am passed the jQuery object for the Gritter element... \n" + e);
		                    },
		                    // (function | optional) function called after it closes
		                    after_close: function () {
		                        alert('I am a sticky called after it closes');
		                    }
		                });

		                return false;

		            });

		            $("#remove-all").click(function () {

		                $.gritter.removeAll();
		                return false;

		            });

		            $("#remove-all-with-callbacks").click(function () {

		                $.gritter.removeAll({
		                    before_close: function (e) {
		                        alert("I am called before all notifications are closed.  I am passed the jQuery object containing all  of Gritter notifications.\n" + e);
		                    },
		                    after_close: function () {
		                        alert('I am called after everything has been closed.');
		                    }
		                });
		                return false;

		            });


		        }


		        /* ---------- Additional functions for data table ---------- */
		        $.fn.dataTableExt.oApi.fnPagingInfo = function (oSettings) {
		            return {
		                "iStart": oSettings._iDisplayStart,
		                "iEnd": oSettings.fnDisplayEnd(),
		                "iLength": oSettings._iDisplayLength,
		                "iTotal": oSettings.fnRecordsTotal(),
		                "iFilteredTotal": oSettings.fnRecordsDisplay(),
		                "iPage": Math.ceil(oSettings._iDisplayStart / oSettings._iDisplayLength),
		                "iTotalPages": Math.ceil(oSettings.fnRecordsDisplay() / oSettings._iDisplayLength)
		            };
		        }
		        $.extend($.fn.dataTableExt.oPagination, {
		            "bootstrap": {
		                "fnInit": function (oSettings, nPaging, fnDraw) {
		                    var oLang = oSettings.oLanguage.oPaginate;
		                    var fnClickHandler = function (e) {
		                        e.preventDefault();
		                        if (oSettings.oApi._fnPageChange(oSettings, e.data.action)) {
		                            fnDraw(oSettings);
		                        }
		                    };

		                    $(nPaging).addClass('pagination').append(
                                '<ul>' +
                                    '<li class="prev disabled"><a href="#">&larr; ' + oLang.sPrevious + '</a></li>' +
                                    '<li class="next disabled"><a href="#">' + oLang.sNext + ' &rarr; </a></li>' +
                                '</ul>'
                            );
		                    var els = $('a', nPaging);
		                    $(els[0]).bind('click.DT', { action: "previous" }, fnClickHandler);
		                    $(els[1]).bind('click.DT', { action: "next" }, fnClickHandler);
		                },

		                "fnUpdate": function (oSettings, fnDraw) {
		                    var iListLength = 5;
		                    var oPaging = oSettings.oInstance.fnPagingInfo();
		                    var an = oSettings.aanFeatures.p;
		                    var i, j, sClass, iStart, iEnd, iHalf = Math.floor(iListLength / 2);

		                    if (oPaging.iTotalPages < iListLength) {
		                        iStart = 1;
		                        iEnd = oPaging.iTotalPages;
		                    }
		                    else if (oPaging.iPage <= iHalf) {
		                        iStart = 1;
		                        iEnd = iListLength;
		                    } else if (oPaging.iPage >= (oPaging.iTotalPages - iHalf)) {
		                        iStart = oPaging.iTotalPages - iListLength + 1;
		                        iEnd = oPaging.iTotalPages;
		                    } else {
		                        iStart = oPaging.iPage - iHalf + 1;
		                        iEnd = iStart + iListLength - 1;
		                    }

		                    for (i = 0, iLen = an.length ; i < iLen ; i++) {
		                        // remove the middle elements
		                        $('li:gt(0)', an[i]).filter(':not(:last)').remove();

		                        // add the new list items and their event handlers
		                        for (j = iStart ; j <= iEnd ; j++) {
		                            sClass = (j == oPaging.iPage + 1) ? 'class="active"' : '';
		                            $('<li ' + sClass + '><a href="#">' + j + '</a></li>')
                                        .insertBefore($('li:last', an[i])[0])
                                        .bind('click', function (e) {
                                            e.preventDefault();
                                            oSettings._iDisplayStart = (parseInt($('a', this).text(), 10) - 1) * oPaging.iLength;
                                            fnDraw(oSettings);
                                        });
		                        }

		                        // add / remove disabled classes from the static elements
		                        if (oPaging.iPage === 0) {
		                            $('li:first', an[i]).addClass('disabled');
		                        } else {
		                            $('li:first', an[i]).removeClass('disabled');
		                        }

		                        if (oPaging.iPage === oPaging.iTotalPages - 1 || oPaging.iTotalPages === 0) {
		                            $('li:last', an[i]).addClass('disabled');
		                        } else {
		                            $('li:last', an[i]).removeClass('disabled');
		                        }
		                    }
		                }
		            }
		        });

		        /* ---------- Page width functions ---------- */

		        $(window).bind("resize", widthFunctions);

		        function widthFunctions(e) {

		            var winHeight = $(window).height();
		            var winWidth = $(window).width();

		            var contentHeight = $("#content").height();

		            if (winHeight) {

		                $("#content").css("min-height", winHeight);

		            }

		            if (contentHeight) {

		                $("#sidebar-left2").css("height", contentHeight);

		            }

		            if (winWidth < 980 && winWidth > 750) {

		                if ($("#sidebar-left").hasClass("span2")) {

		                    $("#sidebar-left").removeClass("span2");
		                    $("#sidebar-left").addClass("span1");

		                }

		                if ($("#content").hasClass("span10")) {

		                    $("#content").removeClass("span10");
		                    $("#content").addClass("span11");

		                }


		                $("a").each(function () {

		                    if ($(this).hasClass("quick-button-small span1")) {

		                        $(this).removeClass("quick-button-small span1");
		                        $(this).addClass("quick-button span2 changed");

		                    }

		                });

		                $(".circleStatsItem, .circleStatsItemBox").each(function () {

		                    var getOnTablet = $(this).parent().attr('onTablet');
		                    var getOnDesktop = $(this).parent().attr('onDesktop');

		                    if (getOnTablet) {

		                        $(this).parent().removeClass(getOnDesktop);
		                        $(this).parent().addClass(getOnTablet);

		                    }

		                });

		                $(".box").each(function () {

		                    var getOnTablet = $(this).attr('onTablet');
		                    var getOnDesktop = $(this).attr('onDesktop');

		                    if (getOnTablet) {

		                        $(this).removeClass(getOnDesktop);
		                        $(this).addClass(getOnTablet);

		                    }

		                });

		                $(".widget").each(function () {

		                    var getOnTablet = $(this).attr('onTablet');
		                    var getOnDesktop = $(this).attr('onDesktop');

		                    if (getOnTablet) {

		                        $(this).removeClass(getOnDesktop);
		                        $(this).addClass(getOnTablet);

		                    }

		                });

		                $(".statbox").each(function () {

		                    var getOnTablet = $(this).attr('onTablet');
		                    var getOnDesktop = $(this).attr('onDesktop');

		                    if (getOnTablet) {

		                        $(this).removeClass(getOnDesktop);
		                        $(this).addClass(getOnTablet);

		                    }

		                });

		            } else {

		                if ($("#sidebar-left").hasClass("span1")) {

		                    $("#sidebar-left").removeClass("span1");
		                    $("#sidebar-left").addClass("span2");

		                }

		                if ($("#content").hasClass("span11")) {

		                    $("#content").removeClass("span11");
		                    $("#content").addClass("span11");

		                }

		                $("a").each(function () {

		                    if ($(this).hasClass("quick-button span2 changed")) {

		                        $(this).removeClass("quick-button span2 changed");
		                        $(this).addClass("quick-button-small span1");

		                    }

		                });

		                $(".circleStatsItem, .circleStatsItemBox").each(function () {

		                    var getOnTablet = $(this).parent().attr('onTablet');
		                    var getOnDesktop = $(this).parent().attr('onDesktop');

		                    if (getOnTablet) {

		                        $(this).parent().removeClass(getOnTablet);
		                        $(this).parent().addClass(getOnDesktop);

		                    }

		                });

		                $(".box").each(function () {

		                    var getOnTablet = $(this).attr('onTablet');
		                    var getOnDesktop = $(this).attr('onDesktop');

		                    if (getOnTablet) {

		                        $(this).removeClass(getOnTablet);
		                        $(this).addClass(getOnDesktop);

		                    }

		                });

		                $(".widget").each(function () {

		                    var getOnTablet = $(this).attr('onTablet');
		                    var getOnDesktop = $(this).attr('onDesktop');

		                    if (getOnTablet) {

		                        $(this).removeClass(getOnTablet);
		                        $(this).addClass(getOnDesktop);

		                    }

		                });

		                $(".statbox").each(function () {

		                    var getOnTablet = $(this).attr('onTablet');
		                    var getOnDesktop = $(this).attr('onDesktop');

		                    if (getOnTablet) {

		                        $(this).removeClass(getOnTablet);
		                        $(this).addClass(getOnDesktop);

		                    }

		                });

		            }

		            if ($('.timeline')) {

		                $('.timeslot').each(function () {

		                    var timeslotHeight = $(this).find('.task').outerHeight();

		                    $(this).css('height', timeslotHeight);

		                });

		            }

		        }

		</script>
    </literal>


</asp:Content>

