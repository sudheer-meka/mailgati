/*! jQuery Validation Plugin - v1.13.1 - 10/14/2014
 * http://jqueryvalidation.org/
 * Copyright (c) 2014 Jörn Zaefferer; Licensed MIT */

!function(a){"function"==typeof define&&define.amd?define(["jquery","../jquery.validate.min"],a):a(jQuery)}(function(a){a.extend(a.validator.messages,{required:"Dette felt er påkrævet.",maxlength:a.validator.format("Indtast højst {0} tegn."),minlength:a.validator.format("Indtast mindst {0} tegn."),rangelength:a.validator.format("Indtast mindst {0} og højst {1} tegn."),email:"Indtast en gyldig email-adresse.",url:"Indtast en gyldig URL.",date:"Indtast en gyldig dato.",number:"Indtast et tal.",digits:"Indtast kun cifre.",equalTo:"Indtast den samme værdi igen.",range:a.validator.format("Angiv en værdi mellem {0} og {1}."),max:a.validator.format("Angiv en værdi der højst er {0}."),min:a.validator.format("Angiv en værdi der mindst er {0}."),creditcard:"Indtast et gyldigt kreditkortnummer."})});
