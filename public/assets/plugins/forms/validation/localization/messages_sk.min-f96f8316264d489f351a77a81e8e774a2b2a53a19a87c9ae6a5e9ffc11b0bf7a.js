/*! jQuery Validation Plugin - v1.13.1 - 10/14/2014
 * http://jqueryvalidation.org/
 * Copyright (c) 2014 Jörn Zaefferer; Licensed MIT */

!function(a){"function"==typeof define&&define.amd?define(["jquery","../jquery.validate.min"],a):a(jQuery)}(function(a){a.extend(a.validator.messages,{required:"Povinné zadať.",maxlength:a.validator.format("Maximálne {0} znakov."),minlength:a.validator.format("Minimálne {0} znakov."),rangelength:a.validator.format("Minimálne {0} a Maximálne {1} znakov."),email:"E-mailová adresa musí byť platná.",url:"URL musí byť platný.",date:"Musí byť dátum.",number:"Musí byť číslo.",digits:"Môže obsahovať iba číslice.",equalTo:"Dva hodnoty sa musia rovnať.",range:a.validator.format("Musí byť medzi {0} a {1}."),max:a.validator.format("Nemôže byť viac ako{0}."),min:a.validator.format("Nemôže byť menej ako{0}."),creditcard:"Číslo platobnej karty musí byť platné."})});
