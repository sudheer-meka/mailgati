/*! jQuery Validation Plugin - v1.13.1 - 10/14/2014
 * http://jqueryvalidation.org/
 * Copyright (c) 2014 Jörn Zaefferer; Licensed MIT */

!function(a){"function"==typeof define&&define.amd?define(["jquery","../jquery.validate.min"],a):a(jQuery)}(function(a){a.extend(a.validator.messages,{required:"Medan ini diperlukan.",remote:"Sila betulkan medan ini.",email:"Sila masukkan alamat emel yang betul.",url:"Sila masukkan URL yang betul.",date:"Sila masukkan tarikh yang betul.",dateISO:"Sila masukkan tarikh(ISO) yang betul.",number:"Sila masukkan nombor yang betul.",digits:"Sila masukkan nilai digit sahaja.",creditcard:"Sila masukkan nombor kredit kad yang betul.",equalTo:"Sila masukkan nilai yang sama semula.",extension:"Sila masukkan nilai yang telah diterima.",maxlength:a.validator.format("Sila masukkan nilai tidak lebih dari {0} aksara."),minlength:a.validator.format("Sila masukkan nilai sekurang-kurangnya {0} aksara."),rangelength:a.validator.format("Sila masukkan panjang nilai antara {0} dan {1} aksara."),range:a.validator.format("Sila masukkan nilai antara {0} dan {1} aksara."),max:a.validator.format("Sila masukkan nilai yang kurang atau sama dengan {0}."),min:a.validator.format("Sila masukkan nilai yang lebih atau sama dengan {0}.")})});
