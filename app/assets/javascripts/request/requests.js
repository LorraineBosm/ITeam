// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
/*# sourceMappingURL=jquery.fullpage.min.js.map */
/*# sourceMappingURL=scrolloverflow.min.js.map */


$(document).ready(function() {
    $('#fullpage').fullpage({
        menu: '#navigation',
        scrollingSpeed: 1000,
        sectionsColor: ['#4CAF50', '#FF5722', '#00BCD4', '#009688'],
        anchors: ['about_us', 'problem', 'device', 'owner'],
        paddingTop: 40,
        navigation:true,
    });

    $('#request_phone_model').parent().hide()
    $('#request_device_brand').parent().hide();
    $('#request_device_model_id').parent().hide();
    $('#request_device_model_id').val('');
    brands = $('#request_device_brand').html();
    models = $('#request_device_model_id').html();
    $('#request_device_type').change(function() {
        type = $('#request_device_type :selected').text();
        options = $(brands).filter("optgroup[label='" + type + "']").html();
        options_with_blank = "<option value></option>" + options
        console.log('filtered brands: ' + options)
        if(options) {
            $('#request_device_brand').html(options_with_blank)
            $('#request_device_brand').parent().show()

        } else {
            $('#request_device_brand').empty()
            $('#request_device_brand').parent().hide()
        }

    });

    $('#request_device_brand').change(function() {
        brand = $('#request_device_brand :selected').text();
        options = $(models).filter("optgroup[label='" + brand + "']").html();
        options_with_blank = "<option value></option>" + options
        console.log('filtered models: ' + options)
        if(options) {
            $('#request_device_model_id').html(options_with_blank)
            $('#request_device_model_id').parent().show()

        } else {
            $('#request_device_model_id').empty()
            $('#request_device_model_id').parent().hide()
        }

    });

    $(window).on('load',function(){
        $('#errorModal').modal('show');
    });

    $('#progress_bar').click(function() {
        $('#update_progress').modal('show');
    })
});