/*! jQuery Validation Plugin - v1.13.1 - 10/14/2014
 * http://jqueryvalidation.org/
 * Copyright (c) 2014 Jörn Zaefferer; Licensed MIT */

!function(a){"function"==typeof define&&define.amd?define(["jquery","../jquery.validate.min"],a):a(jQuery)}(function(a){a.extend(a.validator.messages,{required:"Hãy nhập.",remote:"Hãy sửa cho đúng.",email:"Hãy nhập email.",url:"Hãy nhập URL.",date:"Hãy nhập ngày.",dateISO:"Hãy nhập ngày (ISO).",number:"Hãy nhập số.",digits:"Hãy nhập chữ số.",creditcard:"Hãy nhập số thẻ tín dụng.",equalTo:"Hãy nhập thêm lần nữa.",extension:"Phần mở rộng không đúng.",maxlength:a.validator.format("Hãy nhập từ {0} kí tự trở xuống."),minlength:a.validator.format("Hãy nhập từ {0} kí tự trở lên."),rangelength:a.validator.format("Hãy nhập từ {0} đến {1} kí tự."),range:a.validator.format("Hãy nhập từ {0} đến {1}."),max:a.validator.format("Hãy nhập từ {0} trở xuống."),min:a.validator.format("Hãy nhập từ {1} trở lên.")})});
