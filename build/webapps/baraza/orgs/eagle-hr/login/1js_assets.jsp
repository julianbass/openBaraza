<script src="./assets/eagle-hr/wordpress/jquery.js.download">
</script>

<script type="text/javascript" src="./assets/eagle-hr/wordpress/core.min.js.download" id="jquery-ui-core-js"></script>


<!-- <script src="./assets/assets_files/jquery.min.js"></script> -->
<script src="./assets/assets_files/modal-custom.js"></script>
<script src="./assets/assets_files/auth-api.js"></script>

<script type="text/javascript">
    $("div.modal-body input").on('change', function() {
        if ($(this).attr('name').includes('email')) {
            const re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            if (!re.test(String($(this).val()).toLowerCase())) {
                $(this).css({
                    "border": "1px solid #ff000087"
                });
                $(this).before('<span class="text-danger">Enter a valid email address</span>');
            } else {
                $(this).prev('.text-danger').remove();
                $(this).css({
                    "border": "1px solid #e5e5e5"
                });
            }
        } else if ($(this).val() == "" && $(this).attr("placeholder").includes("*")) {
            $(this).css({
                "border": "1px solid #ff000087"
            });
            $(this).before('<span class="text-danger">This field is required *</span>');
        } else {
            $(this).prev('.text-danger').remove();
            $(this).css({
                "border": "1px solid #e5e5e5"
            });
        }
    });
</script>

<script type="text/javascript">
    var app_xml = 'application.xml';
    AuthApi.init([app_xml]);
</script>


