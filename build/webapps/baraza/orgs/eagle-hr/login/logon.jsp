<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />

    <!DOCTYPE html>

    <html class="whatinput-types-initial whatinput-types-initial whatinput-types-mouse whatinput-types-mouse" lang="en-US" data-whatinput="mouse" data-whatintent="mouse">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


        <!-- Force IE to use the latest rendering engine available -->
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <!-- Mobile Meta -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta class="foundation-mq">

        <title>Expert HR Advisory Consultant solutions in Kenya and Africa.</title>


        <jsp:include page="includes/orgs/eagle-hr/login/css_assets.jsp"></jsp:include>

    </head>

    <!-- Uncomment this line if using the Off-Canvas Menu -->

    <!-- LOADER -->

    <body class="shiftnav-enabled shiftnav-lock shiftnav-disable-shift-body">
        <div class="loader"></div>

        <div class="off-canvas-wrapper">


            <jsp:include page="includes/orgs/eagle-hr/login/header_resp.jsp"></jsp:include>
            <div class="off-canvas-content" data-off-canvas-content="">

                <!-- START OF HEADER SECTION -->
                <jsp:include page="includes/orgs/eagle-hr/login/header.jsp"></jsp:include>

                <!-- START OF MAIN SECTION -->
                <main aria="main">

                    <!-- START OF CONTACT SECTION -->
                    <section class="contact">
                        <div class="row">
                            <div class="small-12 columns">
                                <div class="contact_title" style="padding-bottom: 10px;">
                                    EAGLE HR LOGIN </div>
                            </div>
                        </div>
                    </section>

                    <!--END OF CONTACT SECTION -->

                    <!-- CONTACT FORM SECTION -->
                    <section class="contact_form" style="padding: 20px 0px 20px 0px;">
                        <div class="row">
                            <!-- <div class="small-12 columns"> -->
                            <div class="small-6 small-offset-3 columns">

                                <div role="form" class="wpcf7" id="wpcf7-f65-p13-o1" lang="en-US" dir="ltr">
                                    <div class="screen-reader-response">
                                        <p role="status" aria-live="polite" aria-atomic="true"></p>
                                        <ul></ul>
                                    </div>
                                    <form method="POST" action="j_security_check" class="wpcf7-form init" novalidate="novalidate" data-status="init">

                                        <p>
                                            <label> USERNAME<br>
                                            <span class="wpcf7-form-control-wrap first-name">
                                                <input type="text"  id="j_username" name="j_username" value="" size="40" aria-required="true" class="wpcf7-form-control wpcf7-text wpcf7-validates-as-required" required>
                                            </span> 
                                        </label>
                                        </p>

                                        <p>
                                            <label> PASSWORD<br>
                                            <span class="wpcf7-form-control-wrap last-name">
                                                <input type="password"  id="j_password" name="j_password" value="" size="40" aria-required="true" class="wpcf7-form-control wpcf7-text wpcf7-validates-as-required" required>
                                            </span> 
                                        </label>
                                        </p>

                                        <p>
                                            <!-- <label> -->
                                            <input type="submit" value="Login" class="wpcf7-form-control wpcf7-submit">
                                            <!-- </label> -->
                                        </p>
                                        <p>
                                            <a href="#/" id="forgotPasswordBtn"> Forgot Password ?</a>
                                        </p>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- END OF CONTACT FORM SECTION -->

                    <!-- Forgot Password Modal -->
                    <div id="forgotPasswordModal" class="modal">

                        <!-- Modal content -->
                        <div class="modal-content modal-md">
                            <div class="modal-header">
                                <span class="close">&times;</span>
                                <h4>Forgot Password</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <!-- <div class="small-12 columns"> -->
                                    <div class="small-6 small-offset-3 columns">
                                        <div id='frmPasswordResetAlert'></div>
                                        
                                        <form id="frm_passwordReset">
                                            <p>
                                                <label> Email<br>
                                                <span class="wpcf7-form-control-wrap first-name">
                                                    <input type="email" name="request_email" class="wpcf7-form-control wpcf7-text wpcf7-validates-as-required email" placeholder="Your account Email *" required="required">
                                                </span> 
                                            </label>
                                            </p>
    
                                            <p>
                                                <input type="button" value="Reset Password" id="btn_passwordReset" class="wpcf7-form-control wpcf7-submit" />
                                            </p>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer" style="display: none;">
                                <h3>Modal Footer</h3>
                            </div>
                        </div>
                    
                    </div>

                </main>
                <!-- END OF MAIN SECTION -->

                <jsp:include page="includes/orgs/eagle-hr/login/footer.jsp"></jsp:include>
                <jsp:include page="includes/orgs/eagle-hr/login/js_assets.jsp"></jsp:include>

            </div>
        </div>
        <div class="js-off-canvas-overlay is-overlay-fixed"></div>
        <div id="shiftnav-toggle-main" class="shiftnav-toggle-main-align-center shiftnav-toggle-style-burger_only shiftnav-togglebar-gap-auto shiftnav-toggle-edge-right shiftnav-toggle-icon-x"><button id="shiftnav-toggle-main-button" class="shiftnav-toggle shiftnav-toggle-shiftnav-main shiftnav-toggle-burger" tabindex="1" data-shiftnav-target="shiftnav-main" aria-label="Toggle Menu"><i class="fa fa-bars"></i></button> </div>
        <div class="shiftnav shiftnav-shiftnav-main shiftnav-right-edge shiftnav-skin-light shiftnav-transition-standard" id="shiftnav-main" data-shiftnav-id="shiftnav-main" style="max-height: 593px;">
            <div class="shiftnav-inner">


                <nav class="shiftnav-nav">
                    <ul id="menu-main_menu-2" class="shiftnav-menu shiftnav-targets-default shiftnav-targets-text-medium shiftnav-targets-icon-medium">
                        <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-18 shiftnav-depth-0"><a class="shiftnav-target" href="https://eaglehr.co.ke/about-us/">About Us</a></li>
                        <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-16 shiftnav-depth-0"><a class="shiftnav-target" href="https://eagle.hcm.co.ke/hcmke/recruitment.jsp">Recruitment</a></li>
                        <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-99 shiftnav-depth-0"><a class="shiftnav-target" href="https://eaglehr.co.ke/hr-outsourcing/">HR Outsourcing</a></li>
                        <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-15 shiftnav-depth-0"><a class="shiftnav-target" href="https://eagle.hcm.co.ke/hcmke/trainings.jsp">Training</a></li>
                        <li class="menu-item menu-item-type-post_type menu-item-object-page  page-item-13  menu-item-17 shiftnav-depth-0 "><a class="shiftnav-target" href="https://eaglehr.co.ke/contact-us/">Contact Us</a></li>
                        <li class="menu-item menu-item-type-post_type menu-item-object-page current-menu-item page_item page-item-13 current_page_item menu-item-17 shiftnav-depth-0 active"><a class="shiftnav-target" href="#">Login</a></li>
                    </ul>
                </nav>
                <button class="shiftnav-sr-close shiftnav-sr-only shiftnav-sr-only-focusable">
			× Close Panel		</button>

            </div>
            <!-- /.shiftnav-inner -->
        </div>



 
    </body>

    </html>