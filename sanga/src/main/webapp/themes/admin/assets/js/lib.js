var lib = new lib();

function lib() {
    this.parsetoDate = function (strDate, split) {
        var date = strDate.split(split);
        return new Date(date[2], date[1] - 1, date[0]);
    };
    // Hàm chuyển đổi thành phương thức doc / ghi / xoa lên server
    this.getAction = function (action) {
        var result = action;
        switch (action) {
            case "them":
                result = "doc";
                break;
            case "sua":
                result = "doc";
                break;
            case "xem":
                result = "doc";
                break;
            case "capnhatngayve":
                result = "doc";
                break;
            default:
                result = action;
                break;
        }
        return result;
    };

    this.get = function (option) {
        if (option.beforePost) {
            option.beforePost();
        }
        $.ajax({
            type: "GET",
            contentType: "application/json",
            url: option.url,
            data: option.data,
            async: false,
            dataType: 'json',
            complete: function (response) {
                try {
                    if (response.responseJSON.result === 'Success') {
                        if (option.complete) {
                            option.complete(response);
                        }
                    } else {
                        if (option.error) {
                            option.error(response);
                        }
                    }
                } catch (e) {
                    debugger;
                    console.log(e);
                    var loading = document.getElementById("loading") ;
                    if(loading !== null && loading !== undefined){
                        show('loading', false);
                    }
                    lib.showMessage('Lỗi hệ thống', 'error');
                }
            }
        });
    };

    this.getApi = function (option) {
        // option = {
        //     url: '/urlapi/...',
        //     data: {
        //         variable: 'example',
        //         ...
        //     },
        //     beforePost: function () {
        //         ...
        //     },
        //     complete: function (response) {
        //         ...
        //     },
        //     error: function (ex) {
        //         ...
        //     }
        // }
        if (option.beforePost) {
            option.beforePost();
        }
        $.get(option.url, option.data)
            .then(function (res) {
                if (option.complete) {
                    option.complete(res);
                }
            })
            .fail(function (err) {
                if (option.error) {
                    option.error(err);
                }
            });
    };

    this.postApi = function (option) {
        // option = {
        //     url: '/urlapi/...',
        //     data: {
        //         variable: 'example',
        //         ...
        //     },
        //     beforePost: function () {
        //         ...
        //     },
        //     complete: function (response) {
        //         ...
        //     },
        //     error: function (ex) {
        //         ...
        //     }
        // }
        if (option.beforePost) {
            option.beforePost();
        }
        $.post(option.url, option.data)
            .then(function (res) {
                if (option.complete) {
                    option.complete(res);
                }
            })
            .fail(function (err) {
                if (option.error) {
                    option.error(err);
                }
            });
    };

    this.postDataAndFile = function (option) {
        if (option.beforePost) {
            option.beforePost();
        }
        $.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            url: option.url,
            data: option.data,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            dataType: 'json',
            complete: function (response) {
                try {
                    if (response.responseJSON.result === 'Success') {
                        if (option.complete) {
                            option.complete(response);
                        }
                    } else {
                        if (option.error) {
                            option.error(response);
                        }
                    }
                } catch (e) {
                    console.log(e);
                    var loading = document.getElementById("loading") ;
                    if(loading !== null && loading !== undefined){
                        show('loading', false);
                    }
                    lib.showMessage('Lỗi hệ thống', 'error');
                }
            }
        });
    };

    this.post = function (option) {
        if (option.beforePost) {
            option.beforePost();
        }
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: option.url,
            data: option.data,
            //async: false,
            dataType: 'json',
            complete: function (response) {
                try {
                    if (response.responseJSON.result === 'Success') {
                        if (option.complete) {
                            option.complete(response);
                        }
                    } else {
                        if (option.error) {
                            option.error(response);
                        }
                    }
                } catch (e) {
                    console.log(e);
                    var loading = document.getElementById("loading") ;
                    if(loading !== null && loading !== undefined){
                        show('loading', false);
                    }
                    lib.showMessage('Lỗi hệ thống', 'error');
                }
            }
        });
    };

    this.changeAlias = function (alias) {
        var str = alias;
        str = str.toLowerCase();
        str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, "a");
        str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, "e");
        str = str.replace(/ì|í|ị|ỉ|ĩ/g, "i");
        str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, "o");
        str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, "u");
        str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, "y");
        str = str.replace(/đ/g, "d");
        str = str.replace(/!|@|%|\^|\*|\(|\)|\+|\=|\<|\>|\?|\/|,|\.|\:|\;|\'|\"|\&|\#|\[|\]|~|\$|_|`|-|{|}|\||\\/g, " ");
        str = str.replace(/ + /g, " ");
        str = str.trim();
        return str;
    };

    this.clearValueRespon = function (res) {
        var value = JSON.parse(JSON.stringify(res));
        delete value.msg;
        delete value.result;
        return value;
    };

    this.getClassInputForm = function (name) {
        return name ?
            'input[name="' + name + '"],textarea[name="' + name + '"],select[name="' + name + '"]' :
            'input,textarea,select';
    };

    this.confirm = function (content) {
        return confirm(content);
    };

    this.confirm = function (content, resultFC) {
        $.confirm({
            title: '',
            type: 'blue',
            columnClass: 'col-md-4 col-md-offset-4',
            content: content,
            buttons: {
                btnAccept: {
                    text: 'Đồng ý',
                    btnClass: 'btn-blue',
                    action: function () {
                        if (resultFC) {
                            resultFC(true);
                        }
                    }
                },
                btnCancel: {
                    text: 'Đóng',
                    action: function () {
                        if (resultFC) {
                            resultFC(false);
                        }
                    }
                }
            }
        });
    };

    this.showMessage = function (message) {
        var messageTxt = message;
        if (Array.isArray(message)) {
            messageTxt = '';
            for (const item of message) {
                messageTxt += item + '\n';
            }

        }
        alert(messageTxt);
    };

    this.showMessage = function (message, type, resultFC) {
        var typeClass = 'blue';
        if (type === 'error') {
            typeClass = 'red';
        } else if (type === 'success') {
            typeClass = 'green';
        }
        var messageTxt = message;
        if (Array.isArray(message)) {
            messageTxt = '';
            for (const item of message) {
                messageTxt += item + '<br/>';
            }

        }

        toastr.options = {
            "closeButton": false,
            "debug": false,
            "newestOnTop": false,
            "progressBar": false,
            "positionClass": "toast-top-right",
            "preventDuplicates": false,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        }


        if (type === 'error') {
            toastr["error"](messageTxt);
        } else if (type === 'success') {
            toastr["success"](messageTxt);
        } else {
            toastr["primary"](messageTxt);
        }
        if (resultFC) {
            setTimeout(function () {
                resultFC();
            }, 1000)
        }

        // $.alert({
        //     title: '',
        //     type: typeClass,
        //     columnClass: 'col-md-4 col-md-offset-4',
        //     content: messageTxt,
        //     buttons: {
        //         btnAccept: {
        //             text: 'Đóng',
        //             btnClass: 'btn-second',
        //             action: function () {
        //                 if (resultFC) {
        //                     resultFC();
        //                 }
        //             }
        //         }
        //     }
        // });
    };

    this.getValueControl = function (control) {
        var result;
        if (control.length === 1) {
            var type = control[0].getAttribute('type');
            switch (type) {
                case 'checkbox':
                    result = control[0].checked ? true : false;
                    break;
                case 'radio':
                    result = control[0].checked ? true : false;
                    break;
                case 'number':
                    var valueInt = parseFloat(control[0].value);
                    if (isNaN(valueInt)) {
                        valueInt = null;
                    }
                    result = valueInt;
                    break;
                default:
                    result = control.val();
                    break;
            }
        } else if (control.length > 1) {
            var type = control[0].getAttribute('type');
            switch (type) {
                case 'checkbox':
                    result = getValueControlChecked(control);
                    break;
                case 'radio':
                    result = getValueControlRadioChecked(control);
                    break;
            }
        }
        return result;

        function getValueControlChecked(control) {
            var result = [];
            for (let index = 0; index < control.length; index++) {
                const item = control[index];
                if (item.checked) {
                    result.push(item.value);
                }
            }
            return result;
        }

        //Khangtn.tgg
        function getValueControlRadioChecked(control) {
            var result = "0";
            for (var index = 0; index < control.length; index++) {
                var item = control[index];
                if (item.checked) {
                    result = item.value;
                }
            }
            return result;
        }
    };

    this.setValueControl = function (control, value) {
        var type = control.attr('type');
        var element = control[0].tagName;
        if (element === 'SELECT') {
            type = element;
        }
        if ($(control).hasClass('date')) {
            type = 'date';
        }
        switch (type) {
            case 'checkbox':
                $(control[0]).prop("checked", value);
                break;
            case 'radio': //khangtn.tgg
                for (var i = 0; i < control.length; i++) {
                    var item = control[i];
                    if (item.value === value.toString()) {
                        $("#" + item.id + "").prop("checked", true);
                    }
                }
                break;
            case 'SELECT':
                control.val(value).change();
                // truong hop set value nhung select chua co du lieu set
                if (!control.select2('data').find(x => (x.id + '') === (value + ''))) {
                    lib.setDefaultValueSelect2(control[0], value);
                }
                break;
            case 'date':
                var dateValue = value ? value.split('/') : null;
                $(control).datepicker("setDate", value ? new Date(dateValue[2], +dateValue[1] - 1, dateValue[0]) : null);
                break;
            default:
                control.val(value);
                break;
        }
        if (value === null || value === undefined || value === '') {
            $(control).parents('.form-group').removeClass('active');
        } else {
            $(control).parents('.form-group').addClass('active');
        }
        $(control).parents('.form-group').addClass('active');
    };

    this.mergeValue = function (source1, source2) {
        var dataClone1 = JSON.parse(JSON.stringify(source1));
        var dataClone2 = JSON.parse(JSON.stringify(source2));
        for (const key in dataClone1) {
            dataClone2[key] = dataClone1[key];
        }
        return dataClone2;
    };

    this.reload = function () {
        location.reload();
    };

    this.getParamsUrl = function (search) {
        if (!search) {
            return {};
        }
        return JSON.parse('{"' + decodeURI(search).replace(/"/g, '\\"').replace(/&/g, '","').replace(/=/g, '":"') + '"}');
    };

    this.replaceUrlParam = function (url, paramName, paramValue) {
        if (paramValue === null) {
            paramValue = '';
        }
        var pattern = new RegExp('\\b(' + paramName + '=).*?(&|#|$)');
        if (url.search(pattern) >= 0) {
            return url.replace(pattern, '$1' + paramValue + '$2');
        }
        url = url.replace(/[?#]$/, '');
        return url + (url.indexOf('?') > 0 ? '&' : '?') + paramName + '=' + paramValue;
    };

    this.setDefaultValueSelect2 = function (item, valueDefault) {
        var multiple = item.hasAttribute("multiple");
        var dataUrl = item.getAttribute("data-url");
        var dataParam = item.getAttribute("data-param");
        valueDefault = multiple ? JSON.parse(valueDefault) : valueDefault;
        if (!dataUrl) {
            $(item).val(valueDefault).change();
            $(item).parents('.form-group').addClass('active');
            return;
        }
        var paramJson = {
            valueSearch: multiple ? valueDefault.join(',') : valueDefault
        };
        if (dataParam) {
            var dataParamObject = JSON.parse(dataParam);
            for (var keyName in dataParamObject) {
                paramJson[keyName] = dataParamObject[keyName];
            }
        }
        lib.get({
            url: dataUrl,
            data: paramJson,
            complete: function (response) {
                findOneResult(response);
            },
            error: function (ex) {
                lib.showMessage(ex.responseText, 'error');
            }
        });

        function findOneResult(res) {
            if (res.responseJSON.data) {
                $(item).empty();
                for (let key in res.responseJSON.data) {
                    var itemValue = {};
                    itemValue.id = key;
                    itemValue.text = res.responseJSON.data[key];
                    var newOption = new Option(itemValue.text, itemValue.id, false, false);
                    $(item).append(newOption).trigger('change');
                }
                $(item).val(valueDefault).change();
                $(item).parents('.form-group').addClass('active');
            }
        }
    };

    this.rowTableSelect = function (that, className = 'tr-list') {
        var rpId;
        rpId = $(that).attr('lst-id');
        $('.' + className).css("background-color", "");
        $(that).css("background-color", "#33CCCC");
        return rpId;
    };

    this.replaceUrlObject = function (url, objectParam) {
        for (var key in objectParam) {
            url = lib.replaceUrlParam(url, key, objectParam[key]);
        }
        return url;
    };

    this.fillNumberCount = function (param = "", length = 2, char = "0") {
        if ((param + '').length >= length) {
            return param;
        } else {
            var sub = length = (param + '').length;
            return char.repeat(sub) + param;
        }
    };
};

// rp thu vien bao cao

var rp = new rp();

function rp() {

    this.dowloadFile = function (formId, type) {
        var urlBase = $('#PageContext').val() + '/exploitReportDataPost';
        var formData = $(formId).getValue();
        formData.fileType = type;
        urlBase = encodeURI(lib.replaceUrlObject(urlBase, formData));
        location.href = urlBase;
    };

    this.dowloadFileParam = function (jsonParam, type) {
        var urlBase = $('#PageContext').val() + '/exploitReportDataPost';
        // var formData = $(formId).getValue();
        jsonParam.fileType = type;
        urlBase = lib.replaceUrlObject(urlBase, jsonParam);
        location.href = urlBase;
    };

    this.renderIframe = function (formId, loadDone) {
        var urlOld = $("#reportviewer").attr('src');
        var urlBase = $('#PageContext').val() + '/exploitReportDataPost';
        //view bao cao pdf
        var formData = $(formId).getValue();
        formData.isView = true;
        formData.fileType = 'pdf';
        urlBase = lib.replaceUrlObject(urlBase, formData);
        // if (urlBase !== urlOld) {
            //tạo event lắng nghe iframe lắng nghe duy nhất 1 lần rồi tự hủy khi thành công
            var reportElement = document.getElementById("reportviewer");
            reportElement.addEventListener('load', function _listener() {
                if (loadDone) {
                    loadDone();
                }
                reportElement.removeEventListener('load', _listener, true);
            }, true);
            $("#reportviewer").attr('src', urlBase);
        // } else {
        //     if (loadDone) {
        //         loadDone();
        //     }
        // }
    };

    this.renderIframeParam = function (formData, reportviewer, loadDone) {
        var urlOld = $("#reportviewer").attr('src');
        var urlBase = $('#PageContext').val() + '/exploitReportDataPost';
        //view bao cao pdf
        formData.isView = true;
        formData.fileType = 'pdf';
        urlBase = lib.replaceUrlObject(urlBase, formData);
        // if (urlBase !== urlOld) {
            //tạo event lắng nghe iframe lắng nghe duy nhất 1 lần rồi tự hủy khi thành công
            var reportElement = document.getElementById(reportviewer);
            reportElement.addEventListener('load', function _listener() {
                if (loadDone) {
                    loadDone();
                }
                reportElement.removeEventListener('load', _listener, true);
            }, true);
            $("#" + reportviewer).attr('src', urlBase);
        // } else {
        //     if (loadDone) {
        //         loadDone();
        //     }
        // }
    };

    this.view = function (formId) {
        rp.renderIframe(formId, null);
        $("#reportviewer").show();
    };

    this.print = function (formId) {
        rp.renderIframe(formId, function () {
            window.frames.reportviewer.print();
        });
    };
}


// extention jQuery
jQuery.fn.extend({
    shownDialog: function (options) {
        // set title dialog
        switch (options.action) {
            case 'xem':
                if (options.title && options.title.view) {
                    $(this).find(".modal-title").html(options.title.view);
                }
                break;
            case 'them':
                if (options.title && options.title.add) {
                    $(this).find(".modal-title").html(options.title.add);
                }
                break;
            case 'sua':
            case 'capnhat':
                if (options.title && options.title.edit) {
                    $(this).find(".modal-title").html(options.title.edit);
                }
                break;
            case 'khaithacbaocao':
                if (options.title && options.title.edit) {
                    $(this).find(".modal-title").html(options.title.khaithacbaocao);
                }
                break;
            case 'guilaiemail':
                if (options.title && options.title.edit) {
                    $(this).find(".modal-title").html(options.title.guilaiemail);
                }
                break;
            case 'capnhatngayve':
                if (options.title && options.title.capnhatngayve) {
                    $(this).find(".modal-title").html(options.title.capnhatngayve);
                }
                break;
            default:
                if (options.title) {
                    $(this).find(".modal-title").html(options.title);
                }
                break;
        }

        $(this).unbind('shown.bs.modal');
        // shown dialog
        $(this).modal('show');
        // event dialog
        $(this).on('shown.bs.modal', function () {
            if (options.onShown) {
                options.onShown();
            }
        });
    },
    shownDialogBC: function (options) {
        var myform = this;
        $(this).find(".modal-title").html(options.title[options.action]);
        $(this).unbind('shown.bs.modal');
        // shown dialog
        $(this).modal('show');
        // event dialog
        $(this).on('shown.bs.modal', function () {
            if (options.onShown) {
                options.onShown();
                //focus first control
                for (var property in $(this).getValue()) {
                    var control = $(myform).find(lib.getClassInputForm(property));
                    if ($(control).is(':disabled')) {
                        continue;
                    }
                    setTimeout(function () {
                        $(myform).find(lib.getClassInputForm(property)).focus();
                    }, 300)
                    break;
                }
            }
        });
        $(this).find('.modal-footer').empty();
        if (options.buttons) {
            if (options.buttons[options.action]) {
                for (const btn of options.buttons[options.action]) {
                    const objButton = {};
                    if (btn.id) {
                        objButton.id = btn.id;
                    }
                    if (btn.class) {
                        objButton.class = btn.class;
                    } else {
                        objButton.class = 'btn btn-line';
                    }
                    if (btn.name) {
                        objButton.name = btn.name;
                    }
                    if (btn.tabindex) {
                        objButton.tabindex = btn.tabindex;
                    }
                    console.log(objButton);
                    const $btn = $("<Button>", objButton);
                    if (btn.func) {
                        $btn.click(btn.func);
                    }
                    $btn.html(btn.title);
                    $(this).find('.modal-footer').append($btn);
                }
            }
        }
        if (!options.hideClose)
            $(this).find('.modal-footer').append('<button class="btn btn-line" name="btn-close">Quay lại</button>');
    },
    focusFristControl: function () {
        for (var property in $(this).getValue()) {
            var control = $(this).find(lib.getClassInputForm(property));
            if ($(control).is(':disabled')) {
                continue;
            }
            setTimeout(function () {
                $(this).find(lib.getClassInputForm(property)).focus();
            }, 1000)
            break;
        }
    },
    hideDialog: function () {
        $(this).modal('hide');
    },
    pathValue: function (value) {
        for (const property in value) {
            var valueItem = value[property];
            var control = $(this).find(lib.getClassInputForm(property));
            if (control.length > 0) {
                // todo check box in array
                lib.setValueControl(control, valueItem);
            }
        }
    },
    resetValueControl: function (value) {
        for (const property in value) {
            var valueItem = value[property];
            var control = $(this).find(lib.getClassInputForm(property));
            if (control.length > 0) {
                // todo check box in array
                lib.setValueControl(control, valueItem);
                $(control).parents('.form-group').find('.form-control').removeClass('control-invalid');
                $(control).parents('.form-group').removeClass('group-invalid');
                $(control).parents('.form-group').find('.error-message').remove();
                $(control).parents('.form-group').removeClass('active');
            }
        }
    },
    disableControl: function (items, value) {
        for (var property in items) {
            var control = $(this).find(lib.getClassInputForm(property));
            if (control.length > 0) {
                $(control[0]).prop("disabled", value);
            }
        }
    },
    disableControlValue: function (items) {
        for (var property in items) {
            var control = $(this).find(lib.getClassInputForm(property));
            if (control.length > 0) {
                $(control[0]).prop("disabled", items[property]);
            }
        }
    },
    disableAllControl: function (value) {
        var control = $(this).find(lib.getClassInputForm()).prop("disabled", value);
    },
    showHideControlValue: function (items) {
        for (var property in items) {
            var control = $(this).find(lib.getClassInputForm(property));
            if (control.length > 0) {
                if (items[property])
                    $(control[0]).show();
                else
                    $(control[0]).hide();

            }
        }
    },
    showHideControlValueById: function (items) {
        for (var property in items) {
            var control = $(this).find(lib.getClassInputForm(property));
            if (items[property])
                $("#" + property).show();
            else
                $("#" + property).hide();

        }
    },
    clearAllControl: function (value) {
        var control = $(this).find(lib.getClassInputForm()).val(value);
    },
    clearControlValue: function (items) {
        for (var property in items) {
            var control = $(this).find(lib.getClassInputForm(property));
            if (control.length > 0) {
                $(control[0]).val(items[property]);
            }
        }
    },
    validation: function (options) {
        var formId = this;
        var result = {
            isValid: true,
            errors: [],
            controlErrors: []
        };
        var controlFirstError = null;
        $(formId).find(lib.getClassInputForm()).removeClass('control-invalid');

        validationLogic();

        if (controlFirstError) {
            $(controlFirstError).focus();
        }
        return result;

        // --Functions--
        function setControlFirst(control) {
            if (!controlFirstError) {
                controlFirstError = control;
            }
        }

        function addControlError(key, objError) {
            if (!result.controlErrors[key]) {
                result.controlErrors[key] = [objError];
            }
            result.controlErrors[key].push(objError);
        }

        function validationLogic() {
            // required
            if (options.required) { // exp: { [keyname]: '[message error]'}
                for (const property in options.required) {
                    var control = $(formId).find(lib.getClassInputForm(property));
                    if (control.length > 0) {
                        var controlValue = lib.getValueControl(control);
                        if (!controlValue || controlValue === 'NULL' || controlValue === null) {
                            setControlFirst(control[0]);
                            $(control[0]).addClass('control-invalid');
                            result.isValid = false;
                            result.errors.push(options.required[property]);
                            addControlError(property, {
                                required: options.required[property]
                            });
                        }
                    }
                }
            }
            // minlength
            if (options.minlength) { // exp: {[keyname]: {value: [value min
                // length],message:'[message error]'}}
                for (const property in options.minlength) {
                    var control = $(formId).find(lib.getClassInputForm(property));
                    if (control.length > 0) {
                        var controlValue = lib.getValueControl(control);
                        if (controlValue && controlValue !== 'NULL' && controlValue !== null && (controlValue + '').length < options.minlength[property].value) {
                            setControlFirst(control[0]);
                            $(control[0]).addClass('control-invalid');
                            result.isValid = false;
                            result.errors.push(options.minlength[property].message);
                            addControlError(property, {
                                minlength: options.minlength[property].message
                            });
                        }
                    }
                }
            }
            // maxlength
            if (options.maxlength) { // exp: {[keyname]: {value: [value max
                // length],message:'[message error]'}}
                for (const property in options.maxlength) {
                    var control = $(formId).find(lib.getClassInputForm(property));
                    if (control.length > 0) {
                        var controlValue = lib.getValueControl(control);
                        if (controlValue && controlValue !== 'NULL' && controlValue !== null && (controlValue + '').length > options.maxlength[property].value) {
                            setControlFirst(control[0]);
                            $(control[0]).addClass('control-invalid');
                            result.isValid = false;
                            result.errors.push(options.maxlength[property].message);
                            addControlError(property, {
                                maxlength: options.maxlength[property].message
                            });
                        }
                    }
                }
            }
            // min
            if (options.min) { // exp: {[keyname]: {value: [value
                // min],message:'[message error]'}}
                for (const property in options.min) {
                    var control = $(formId).find(lib.getClassInputForm(property));
                    if (control.length > 0) {
                        var controlValue = lib.getValueControl(control);
                        if (controlValue && controlValue !== 'NULL' && controlValue !== null && +controlValue < options.min[property].value) {
                            setControlFirst(control[0]);
                            $(control[0]).addClass('control-invalid');
                            result.isValid = false;
                            result.errors.push(options.min[property].message);
                            addControlError(property, {
                                min: options.min[property].message
                            });
                        }
                    }
                }
            }

            if (options.max) { // exp: {[keyname]: {value: [value
                // max],message:'[message error]'}}
                for (const property in options.max) {
                    var control = $(formId).find(lib.getClassInputForm(property));
                    if (control.length > 0) {
                        var controlValue = lib.getValueControl(control);
                        if (controlValue && controlValue !== 'NULL' && controlValue !== null && +controlValue > options.max[property].value) {
                            setControlFirst(control[0]);
                            $(control[0]).addClass('control-invalid');
                            result.isValid = false;
                            result.errors.push(options.max[property].message);
                            addControlError(property, {
                                max: options.max[property].message
                            });
                        }
                    }
                }
            }

            if (options.phone) { // exp: {[keyname]:[message]}
                var phoneRegex = /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/im;
                for (const property in options.phone) {
                    var control = $(formId).find(lib.getClassInputForm(property));
                    if (control.length > 0) {
                        var controlValue = lib.getValueControl(control);
                        if (controlValue && controlValue !== 'NULL' && controlValue !== null && !phoneRegex.test(controlValue)) {
                            setControlFirst(control[0]);
                            $(control[0]).addClass('control-invalid');
                            result.isValid = false;
                            result.errors.push(options.phone[property]);
                            addControlError(property, {
                                phone: options.phone[property]
                            });
                        }
                    }
                }
            }

            if (options.email) { // exp: {[keyname]:[message error]}
                var emailRegex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                for (const property in options.email) {
                    var control = $(formId).find(lib.getClassInputForm(property));
                    if (control.length > 0) {
                        var controlValue = lib.getValueControl(control);
                        if (controlValue && controlValue !== 'NULL' && controlValue !== null && !emailRegex.test(String(controlValue).toLowerCase())) {
                            setControlFirst(control[0]);
                            $(control[0]).addClass('control-invalid');
                            result.isValid = false;
                            result.errors.push(options.email[property]);
                            addControlError(property, {
                                email: options.email[property]
                            });
                        }
                    }
                }
            }
            if (options.date) { // exp: {[keyname]:[message error]} DD/MM/YYYY
                var dateRegex = /^(((0[1-9]|[12]\d|3[01])\/(0[13578]|1[02])\/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)\/(0[13456789]|1[012])\/((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])\/02\/((19|[2-9]\d)\d{2}))|(29\/02\/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|(([1][26]|[2468][048]|[3579][26])00))))$/g;
                for (const property in options.date) {
                    var control = $(formId).find(lib.getClassInputForm(property));
                    if (control.length > 0) {
                        var controlValue = lib.getValueControl(control);
                        if (controlValue && controlValue !== 'NULL' && controlValue !== null && !dateRegex.test(String(controlValue).toLowerCase())) {
                            setControlFirst(control[0]);
                            $(control[0]).addClass('control-invalid');
                            result.isValid = false;
                            result.errors.push(options.date[property]);
                            addControlError(property, {
                                date: options.date[property]
                            });
                        }
                    }
                }
            }
            if (options.number) { // exp: {[keyname]:[message error]}
                var numberRegex = /^\d+$/;
                for (const property in options.number) {
                    var control = $(formId).find(lib.getClassInputForm(property));
                    if (control.length > 0) {
                        var controlValue = lib.getValueControl(control);
                        if (controlValue && controlValue !== 'NULL' && controlValue !== null && !numberRegex.test(controlValue)) {
                            setControlFirst(control[0]);
                            $(control[0]).addClass('control-invalid');
                            result.isValid = false;
                            result.errors.push(options.number[property]);
                            addControlError(property, {
                                number: options.number[property]
                            });
                        }
                    }
                }
            }

            if (options.regex) { // exp:
                // {[keyname]:{value:[regex],message:[message
                // error]}}
                for (const property in options.regex) {
                    var control = $(formId).find(lib.getClassInputForm(property));
                    if (control.length > 0) {
                        var controlValue = control[0].value;
                        var regexValue = options.regex[property].value;
                        if (controlValue && controlValue !== 'NULL' && controlValue !== null && !regexValue.test(controlValue)) {
                            setControlFirst(control[0]);
                            $(control[0]).addClass('control-invalid');
                            result.isValid = false;
                            result.errors.push(options.regex[property].message);
                            addControlError(property, {
                                regex: options.regex[property].message
                            });
                        }
                    }
                }
            }
            if (options.cmndCccd) { // exp: {[keyname]:[message error]}
                for (const property in options.cmndCccd) {
                    var control = $(formId).find(lib.getClassInputForm(property));
                    if (control.length > 0) {
                        var controlValue = lib.getValueControl(control);
                        if (controlValue && controlValue !== 'NULL' && controlValue !== null && ((controlValue + '').length !== 9 && (controlValue + '').length !== 12)) {
                            setControlFirst(control[0]);
                            $(control[0]).addClass('control-invalid');
                            result.isValid = false;
                            result.errors.push(options.cmndCccd[property]);
                            addControlError(property, { cmndCccd: options.cmndCccd[property] });
                        }
                    }
                }
            }
        }
    },
    resetValidation: function () {
        $(this).find('.form-control').removeClass('control-invalid');
        $(this).find('.form-group').removeClass('group-invalid');
        $(this).find('.form-group').find('.error-message').remove();
    },
    getValue: function () {
        var result = {};
        var control = $(this).find(lib.getClassInputForm());
        var controlName = [];
        for (let index = 0; index < control.length; index++) {
            var name = control[index].getAttribute('name');
            if (!controlName.find(x => x === name)) {
                controlName.push(name);
            }
        }
        for (const name of controlName) {
            var controls = $(this).find(lib.getClassInputForm(name));
            var ctlValue = lib.getValueControl(controls);
            if (ctlValue !== undefined) {
                result[name] = ctlValue;
            }
        }
        return result;
    },
    uiLoading: function (value) {
        var loading = document.getElementById("loading") ;
        if(loading !== null && loading !== undefined){
            show('loading', value);
        }

    },
    setError: function (obj, showMessage = true) {
        for (var key in obj) {
            if (obj[key]) {
                //check control exist
                if ($(this).find(lib.getClassInputForm(key)).length === 0) {
                    lib.showMessage(obj[key], 'error');
                    return;
                }
                $(this).find(lib.getClassInputForm(key)).addClass('control-invalid');
                $(this).find(lib.getClassInputForm(key)).parents('.form-group').eq(0).addClass('group-invalid');
                var spanMess = $(this).find(lib.getClassInputForm(key)).parents('.form-group').eq(0).find('.error-message');
                if (spanMess.length === 0) {
                    $(this).find(lib.getClassInputForm(key)).parents('.form-group').eq(0)
                        .append('<span class="error-message">' + obj[key] + '</span>');
                } else {
                    spanMess.html('<span class="error-message">' + obj[key] + '</span>')
                }

            } else {
                $(this).find(lib.getClassInputForm(key)).removeClass('control-invalid');
                $(this).find(lib.getClassInputForm(key)).parents('.form-group').eq(0).removeClass('group-invalid');
                var spanMess = $(this).find(lib.getClassInputForm(key)).parents('.form-group').eq(0).find('.error-message');
                if (spanMess.length > 0) {
                    $(spanMess).remove();
                }
            }
        }
    },
    bindError: function (res) {
        try {
            if (res.controlErrors) {
                //loi tu valid
                $(this).resetValidation();
                for (const key in res.controlErrors) {
                    if (res.controlErrors[key].length > 0) {
                        for (const item in res.controlErrors[key][0]) {
                            const element = res.controlErrors[key][0][item];
                            var control = {};
                            control[key] = element;
                            $(this).setError(control);
                        }
                    }
                }
            } else {
                //loi tu api
                var result = res.responseJSON;
                if (result && result.errors) {
                    for (const key in result.errors) {
                        var control = {};
                        control[key] = result.errors[key];
                        $(this).setError(control);
                    }
                }
            }
        } catch (error) {
            lib.showMessage(res.responseText, 'error');
        }
    },
    getSelectRow: function () {
        var listId = [];
        var selected = $(this).find('input:checkbox[class="select-row"]:checked');
        for (let i = 0; i < selected.length; i++) {
            var element = selected.eq(i);
            listId.push(+element.val());
        }
        return listId;
    },
    getSelectRowMore: function (ref = "") {
        var listId = [];
        var selected = $(this).find('input:checkbox[ref="' + ref + '"]:checked');
        for (let i = 0; i < selected.length; i++) {
            var element = selected.eq(i);
            listId.push(element.val());
        }
        return listId;
    },
    selectAddRows: function (check) {
        $(this).find('input:checkbox[class=select-row]:checked').prop('checked', check);
    },
    formTextTrim: function () {
        var result = {};
        var control = $(this).find(lib.getClassInputForm());
        var controlName = [];
        for (let index = 0; index < control.length; index++) {
            var name = control[index].getAttribute('name');
            var type = control[index].getAttribute('type');
            if (type !== 'text') continue;
            if (!controlName.find(x => x === name)) {
                controlName.push(name);
            }
        }
        for (const name of controlName) {
            var controls = $(this).find(lib.getClassInputForm(name));
            var ctlValue = lib.getValueControl(controls);
            if (ctlValue !== undefined) {
                result[name] = (ctlValue + '').trim();
            }
        }
        $(this).pathValue(result);
    }
});

String.prototype.compose = (function () {
    var re = /\{{(.+?)\}}/g;
    return function (o) {
        return this.replace(re, function (_, k) {
            return typeof o[k] != 'undefined' ? o[k] : '';
        });
    }
}());

// init control js
$(document).ready(function () {
    // select2 init
    var selectControl = $(this).find('select');
    $(selectControl).each(function () {
        var item = this;
        var name = item.name;
        if (name) {
            var dataUrl = item.getAttribute("data-url");
            var placeholder = item.getAttribute("placeholder");
            var allowClear = item.hasAttribute("allowClear");
            var allowSearch = dataUrl ? null : -1;
            var valueDefault = item.getAttribute("value");
            if (item.hasAttribute("allowSearch")) {
                allowSearch = item.hasAttribute("allowSearch") === 'true' ? null : -1;
            }

            var sourceOptionArray = [];
            var sourceOption = $(item).find('option');
            for (var i = 0; i < sourceOption.length; i++) {
                var text = $(sourceOption[i]).text();
                var value = $(sourceOption[i]).attr('value');
                sourceOptionArray.push({
                    id: value,
                    text
                });
            }
            var itemSizePerPage = 50;
            var divParent = $(item).parents('.form-group').eq(0);
            $(item).select2({
                dropdownParent: divParent,
                language: 'es',
                allowClear: allowClear,
                placeholder: placeholder,
                minimumResultsForSearch: allowSearch,
                language: {
                    noResults: function () {
                        return "Không có dữ liệu được tìm thấy";
                    },
                    searching: function () {
                        return 'Đang tìm kiếm…';
                    },
                    loadingMore: function () {
                        return 'Đang tải thêm dữ liệu…';
                    },
                },
                ajax: !dataUrl ? null : {
                    delay: 350,
                    url: dataUrl,
                    processResults: function (res, params) {
                        params.page = params.page || 1;
                        var options = [];
                        if (params.page === 1) {
                            //nếu là trang 1 add thêm các option có sẵn trên html
                            options = JSON.parse(JSON.stringify(sourceOptionArray.filter(x => x.text.includes(params.term ? params.term : ''))));
                        }
                        var countItem = 0;
                        for (let key in res.data) {
                            var itemValue = {};
                            itemValue.id = key;
                            itemValue.text = res.data[key];
                            options.push(itemValue);
                            countItem += 1;
                        }
                        return {
                            results: options,
                            pagination: {
                                more: countItem >= itemSizePerPage
                            }
                        };
                    },
                    data: function (params) {
                        var query = {
                            keySearch: params.term,
                            page: params.page || 1,
                            size: itemSizePerPage
                        };
                        //bo sung them tham so truyen len server json object
                        var paramData = $(item).attr('data-param');
                        if (paramData) {
                            var paramJson = JSON.parse(paramData);
                            for (var key in paramJson) {
                                query[key] = paramJson[key];
                            }
                        }
                        return query;
                    }
                }
            });
            if (valueDefault) {
                lib.setDefaultValueSelect2(item, valueDefault);
            }
        }
    });
    $(selectControl).on('change', function (e) {
        // Do something
        $(this).parents('.form-group').addClass('active');
    });
    $(selectControl).on('select2:open', function () {
        var control = this;
        var multile = control.hasAttribute('multiple');
        if (!multile) {
            setTimeout(() => {
                $(control).parents('.form-group').eq(0).find('.select2-search__field').focus();
            }, 300);
        }
    })
    // init page
    // init datetime
    $('input[type="date"]').each(function () {
        var control = this;
        $(control).attr('type', 'text');
        $(control).addClass('date');
        $(control).attr('autocomplete', 'off');
        setTimeout(function () {
            $(control).datepicker({
                format: "dd/mm/yyyy",
                language: 'vi',
                autoclose: true,
                showOnFocus: true,
                todayHighlight: true
            }).on('hide', function (e) {
                e.stopPropagation();
            });
            $(control).mask('00/00/0000', {
                placeholder: "dd/mm/yyyy"
            });
            var controlValue = $(control).attr('value');
            if (controlValue) {
                setTimeout(function () {
                    lib.setValueControl($(control), controlValue);
                }, 50);
            }
        }, 100);
        $(control).on('change', function () {
            $(control).parents('.form-group').addClass('active');
        });
    });

    //checkbox all
    var isSelectAll = true;
    $(document).on('click', 'input:checkbox[name="selectAllRows"]', function ($event) {
        $('input:checkbox[class="select-row"]').prop('checked', isSelectAll);
        isSelectAll = !isSelectAll;
    });

    $(document).on('click', 'input:checkbox[class="select-all-rows"]', function ($event) {
        var isCheckAll = $(this).is(':checked');
        var childref = $(this).attr("childref");
        $('input:checkbox[ref="' + childref + '"]').prop('checked', isCheckAll);
    });
    $(document).on('click', 'input:checkbox', function ($event) {
        if ($(this).attr('ref')) {
            var childref = $(this).attr('ref');
            if ($('input:checkbox[ref="' + childref + '"]:checked').length === $('td[ref="' + childref + '"]').length) {
                $('input:checkbox[childref="' + childref + '"]').prop('checked', true);
            } else {
                $('input:checkbox[childref="' + childref + '"]').prop('checked', false);
            }
        }
    });

    //tr click select checkbox
    $(document).on('click', '.tr-list', function ($event) {
        if (event.target.type !== 'checkbox') {
            if ($(event.target).attr('class')) {
                if (!($(event.target).attr('class')).includes('vnpt-underline-blue') && !($(event.target).attr('class')).includes('not-click')) {
                    $(':checkbox', this).trigger('click');
                }
            } else {
                $(':checkbox', this).trigger('click');
            }
        }
    });
    // toggle form search
    $(document).on('click', '.expand-collapse-icon', function ($event) {
        if ($event.currentTarget.textContent.trim() === 'ẨN ĐIỀU KIỆN TÌM KIẾM') {
            $($event.currentTarget).html('<i class="fa fa-chevron-circle-down text-primary" aria-hidden="true"></i> HIỆN ĐIỀU KIỆN TÌM KIẾM');
        } else {
            $($event.currentTarget).html('<i class="fa fa-chevron-circle-up text-primary" aria-hidden="true"></i> ẨN ĐIỀU KIỆN TÌM KIẾM');
        }
    });
    // init text mask date
    var typeTmDate = 1;
    var maskOptions = {
        placeholder: "",
        translation: {
            '*': {
                pattern: /[0-9\/]/, optional: true
            }
        },
        onKeyPress: function (cep, e, field, options) {
            var masks = ["99********", "00/0000**", "00/00/0000"];
            var lengh = cep.replace(/[^0-9]/g, "").length;
            var mask = masks[0];
            if (lengh <= 4) {
                if (typeTmDate !== 1) {
                    typeTmDate = 1;
                    mask = masks[0];
                }
            }
            if (lengh > 4 && lengh <= 6) {
                if (typeTmDate !== 2) {
                    typeTmDate = 2;
                    mask = masks[1];
                }
            }
            if (lengh > 6) {
                if (typeTmDate !== 3) {
                    typeTmDate = 3;
                    mask = masks[2];
                }
            }
            $(".text-mask-date").mask(mask, options);
        }
    };
    //
});
function formatNumber(n) {
    // format number 1000000 to 1,234,567
    return n.replace(/\D/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ",")
}


function formatCurrency(input, blur) {
    // appends $ to value, validates decimal side
    // and puts cursor back in right position.

    // get input value
    blur = 0;
    //var input = input.val();

    // don't validate empty input
    if (input === "") { return; }

    // original length
    var original_len = input.length;

    // initial caret position
    // var caret_pos = input.prop("selectionStart");

    // check for decimal
    // if (input.indexOf(".") >= 0) {

    //     // get position of first decimal
    //     // this prevents multiple decimals from
    //     // being entered
    //     var decimal_pos = input.indexOf(".");

    //     // split number by decimal point
    //     var left_side = input.substring(0, decimal_pos);
    //     var right_side = input.substring(decimal_pos);

    //     // add commas to left side of number
    //     left_side = formatNumber(left_side);

    //     // validate right side
    //     right_side = formatNumber(right_side);

    //     // On blur make sure 2 numbers after decimal
    //     if (blur === "blur") {
    //         right_side += "00";
    //     }

    //     // Limit decimal to only 2 digits
    //     right_side = right_side.substring(0, 2);

    //     // join number by .
    //     input = left_side + "." + right_side;

    // } else {
        // no decimal entered
        // add commas to number
        // remove all non-digits
        input = formatNumber(input);
        return input;
        // input = input;

        // final formatting
    //     if (blur === "blur") {
    //         input += ".00";
    //     }
    // }

    // send updated string to input
    // input.val(input);

    // put caret back in the right position
    // var updated_len = input.length;
    // caret_pos = updated_len - original_len + caret_pos;
    // input[0].setSelectionRange(caret_pos, caret_pos);
}
//set result Error
function setResultError(result, param, message) {
    result.isValid = false;
    result.errors.push(message);
    result.controlErrors[param] = [{ required: message }];
    result.controlErrors[param].push(message);
    return result
}



function show(id, value) {
    document.getElementById(id).style.display = value ? 'block' : 'none';
}