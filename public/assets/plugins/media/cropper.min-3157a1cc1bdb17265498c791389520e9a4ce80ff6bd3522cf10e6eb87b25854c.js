/*!
 * Cropper v0.6.2
 * https://github.com/fengyuanchen/cropper
 *
 * Copyright 2014 Fengyuan Chen
 * Released under the MIT license
 */


!function(a){"function"==typeof define&&define.amd?define(["jquery"],a):a(jQuery)}(function(a){"use strict";var b=a(window),c=a(document),d=null,e=void 0,f=/^(e|n|w|s|ne|nw|sw|se|\*|\+)$/i,g=/^(x|y|width|height)$/i,h="cropper-hidden",i="cropper-invisible",j=".cropper",k="mousedown touchstart",l="mousemove touchmove",m="mouseup mouseleave touchend touchleave touchcancel",n="resize"+j,o=["build"+j,"built"+j,"dragstart"+j,"dragmove"+j,"dragend"+j],p=function(a){return"number"==typeof a},q=function(a){return'<img src="'+a+'">'},r=function(b,c){this.$element=a(b),this.setDefaults(c),this.init()},s=Math.round,t=Math.min,u=Math.max,v=Math.abs,w=parseFloat;r.prototype={constructor:r,setDefaults:function(b){b=a.extend({},r.defaults,a.isPlainObject(b)?b:{}),a.each(b,function(a,c){switch(a){case"aspectRatio":b[a]=v(w(c))||0/0;break;case"minWidth":case"minHeight":b[a]=v(w(c))||0;break;case"maxWidth":case"maxHeight":b[a]=v(w(c))||1/0}}),this.defaults=b},init:function(){var b,c,d=this,e=this.$element,f=e[0],g={};e.is("img")?b=e.attr("src"):e.is("canvas")&&f.getContext&&(b=f.toDataURL()),b&&(this.$clone&&this.$clone.remove(),this.$clone=c=a(q(b)),c.one("load",function(){g.naturalWidth=this.naturalWidth||c.width(),g.naturalHeight=this.naturalHeight||c.height(),g.aspectRatio=g.naturalWidth/g.naturalHeight,d.active=!0,d.src=b,d.image=g,d.build()}),c.addClass(i).prependTo("body"))},build:function(){var b,d,e=this.$element,f=this.defaults;this.built&&this.unbuild(),b=a.Event(o[0]),e.trigger(b),a.isFunction(f.build)&&f.build(b),b.isDefaultPrevented()||(this.$cropper=d=a(r.template),e.addClass(h),this.$clone.removeClass(i).prependTo(d),this.$container=e.parent(),this.$container.append(d),this.$modal=d.find(".cropper-modal"),this.$canvas=d.find(".cropper-canvas"),this.$dragger=d.find(".cropper-dragger"),this.$viewer=d.find(".cropper-viewer"),this.cropped=!0,f.autoCrop||(this.$dragger.addClass(h),this.cropped=!1),this.$modal.toggleClass(h,!f.modal),this.$canvas.toggleClass(h,!f.dragCrop),!f.dashed&&this.$dragger.find(".cropper-dashed").addClass(h),!f.movable&&this.$dragger.find(".cropper-face").addClass(h),!f.resizable&&this.$dragger.find(".cropper-line, .cropper-point").addClass(h),this.$dragScope=f.multiple?this.$cropper:c,this.addListener(),this.initPreview(),this.built=!0,this.update(),e.trigger(o[1]))},unbuild:function(){this.built&&(this.built=!1,this.removeListener(),this.$preview.empty(),this.$preview=d,this.$dragger=d,this.$canvas=d,this.$modal=d,this.$container=d,this.$cropper.remove(),this.$cropper=d)},update:function(a){this.initContainer(),this.initCropper(),this.initDragger(),a?this.setData(a,!0):this.setData(this.defaults.data)},resize:function(){clearTimeout(this.resizing),this.resizing=setTimeout(a.proxy(this.update,this,this.getData()),200)},reset:function(a){this.cropped&&(a&&(this.defaults.data={}),this.dragger=this.cloneDragger(),this.setData(this.defaults.data))},release:function(){this.cropped&&(this.cropped=!1,this.defaults.done({x:0,y:0,width:0,height:0}),this.$modal.addClass(h),this.$dragger.addClass(h))},destroy:function(){var a=this.$element;this.active&&(this.unbuild(),a.removeClass(h),a.removeData("cropper"),a=d)},preview:function(){var b=this.cropper,c=this.dragger;this.$viewer.find("img").css({width:s(b.width),height:s(b.height),marginLeft:-s(c.left),marginTop:-s(c.top)}),this.$preview.each(function(){var d=a(this),e=d.width()/c.width,f={width:s(b.width*e),height:s(b.height*e),marginLeft:-s(c.left*e),marginTop:-s(c.top*e)};d.find("img").css(f)})},addListener:function(){var c=this.$element,d=this.defaults;a.each(o,function(b,e){var f=d[o[b].replace(j,"")];a.isFunction(f)&&c.on(e,f)}),this.$cropper.on(k,a.proxy(this.dragstart,this)),this.$dragScope.on(l,a.proxy(this.dragmove,this)).on(m,a.proxy(this.dragend,this)),b.on(n,a.proxy(this.resize,this))},removeListener:function(){var c=this.$element,d=this.defaults;a.each(o,function(b,e){var f=d[o[b].replace(j,"")];a.isFunction(f)&&c.off(e,f)}),this.$cropper.off(k,this.dragstart),this.$dragScope.off(l,this.dragmove).off(m,this.dragend),b.off(n,this.resize)},initPreview:function(){var b=q(this.src);this.$preview=a(this.defaults.preview),this.$preview.html(b),this.$viewer.html(b)},initContainer:function(){var a=this.$container;this.container={width:a.width(),height:a.height()}},initCropper:function(){var a,b=this.container,c=this.image;c.naturalWidth*b.height/c.naturalHeight-b.width>=0?(a={height:b.width/c.aspectRatio,width:b.width,left:0},a.top=(b.height-a.height)/2):(a={height:b.height,width:b.height*c.aspectRatio,top:0},a.left=(b.width-a.width)/2),c.ratio=a.width/c.naturalWidth,c.height=a.height,c.width=a.width,this.$cropper.css({width:s(a.width),height:s(a.height),left:s(a.left),top:s(a.top)}),this.cropper=a},initDragger:function(){var a,b=this.defaults,c=this.cropper,d=b.aspectRatio||this.image.aspectRatio,e=this.image.ratio;a=c.height*d-c.width>=0?{height:c.width/d,width:c.width,left:0,top:(c.height-c.width/d)/2,maxWidth:c.width,maxHeight:c.width/d}:{height:c.height,width:c.height*d,left:(c.width-c.height*d)/2,top:0,maxWidth:c.height*d,maxHeight:c.height},a.minWidth=0,a.minHeight=0,b.aspectRatio?(isFinite(b.maxWidth)?(a.maxWidth=t(a.maxWidth,b.maxWidth*e),a.maxHeight=a.maxWidth/d):isFinite(b.maxHeight)&&(a.maxHeight=t(a.maxHeight,b.maxHeight*e),a.maxWidth=a.maxHeight*d),b.minWidth>0?(a.minWidth=u(0,b.minWidth*e),a.minHeight=a.minWidth/d):b.minHeight>0&&(a.minHeight=u(0,b.minHeight*e),a.minWidth=a.minHeight*d)):(a.maxWidth=t(a.maxWidth,b.maxWidth*e),a.maxHeight=t(a.maxHeight,b.maxHeight*e),a.minWidth=u(0,b.minWidth*e),a.minHeight=u(0,b.minHeight*e)),a.minWidth=t(a.maxWidth,a.minWidth),a.minHeight=t(a.maxHeight,a.minHeight),a.height*=.8,a.width*=.8,a.left=(c.width-a.width)/2,a.top=(c.height-a.height)/2,a._left=a.left,a._top=a.top,this.defaultDragger=a,this.dragger=this.cloneDragger()},cloneDragger:function(){return a.extend({},this.defaultDragger)},renderDragger:function(){var a=this.dragger,b=this.cropper;a.width>a.maxWidth?(a.width=a.maxWidth,a.left=a._left):a.width<a.minWidth&&(a.width=a.minWidth,a.left=a._left),a.height>a.maxHeight?(a.height=a.maxHeight,a.top=a._top):a.height<a.minHeight&&(a.height=a.minHeight,a.top=a._top),a.left=t(u(a.left,0),b.width-a.width),a.top=t(u(a.top,0),b.height-a.height),a._left=a.left,a._top=a.top,this.dragger=a,this.defaults.done(this.getData()),this.$dragger.css({width:s(a.width),height:s(a.height),left:s(a.left),top:s(a.top)}),this.preview()},setData:function(b,c){var e=this.cropper,f=this.dragger,g=this.defaults.aspectRatio;this.built&&"undefined"!=typeof b&&((b===d||a.isEmptyObject(b))&&(f=this.cloneDragger()),a.isPlainObject(b)&&!a.isEmptyObject(b)&&(c||(this.defaults.data=b),b=this.transformData(b),p(b.x)&&b.x<=e.width&&(f.left=b.x),p(b.y)&&b.y<=e.height&&(f.top=b.y),g?p(b.width)&&b.width<=f.maxWidth&&b.width>=f.minWidth?(f.width=b.width,f.height=f.width/g):p(b.height)&&b.height<=f.maxHeight&&b.height>=f.minHeight&&(f.height=b.height,f.width=f.height*g):(p(b.width)&&b.width<=f.maxWidth&&b.width>=f.minWidth&&(f.width=b.width),p(b.height)&&b.height<=f.maxHeight&&b.height>=f.minHeight&&(f.height=b.height))),this.dragger=f,this.renderDragger())},getData:function(){var a=this.dragger,b={};return this.built&&(b={x:a.left,y:a.top,width:a.width,height:a.height},b=this.transformData(b,!0)),b},transformData:function(b,c){var d=this.image.ratio,e={};return a.each(b,function(a,b){b=w(b),g.test(a)&&!isNaN(b)&&(e[a]=c?s(b/d):b*d)}),e},setAspectRatio:function(a){var b="auto"===a;a=w(a),(b||!isNaN(a)&&a>0)&&(this.defaults.aspectRatio=b?0/0:a,this.built&&(this.initDragger(),this.renderDragger()))},setImgSrc:function(b){var c,d=this,e=this.$element,f=e[0];b&&b!==this.src&&(e.is("img")?(e.attr("src",b),this.init()):e.is("canvas")&&f.getContext&&(c=f.getContext("2d"),a(q(b)).one("load",function(){f.width=this.width,f.height=this.height,c.clearRect(0,0,f.width,f.height),c.drawImage(this,0,0),d.init()})))},getImgInfo:function(){return this.image||{}},dragstart:function(b){var c,d,e=b.originalEvent.touches,g=b;if(e){if(e.length>1)return;g=e[0]}if(c=a(g.target).data("directive"),f.test(c)){if(b.preventDefault(),d=a.Event(o[2]),this.$element.trigger(d),d.isDefaultPrevented())return;this.directive=c,this.startX=g.pageX,this.startY=g.pageY,"+"===c&&(this.cropping=!0,this.$modal.removeClass(h))}},dragmove:function(b){var c,d=b.originalEvent.touches,e=b;if(d){if(d.length>1)return;e=d[0]}if(this.directive){if(b.preventDefault(),c=a.Event(o[3]),this.$element.trigger(c),c.isDefaultPrevented())return;this.endX=e.pageX,this.endY=e.pageY,this.dragging()}},dragend:function(b){var c;if(this.directive){if(b.preventDefault(),c=a.Event(o[4]),this.$element.trigger(c),c.isDefaultPrevented())return;this.cropping&&(this.cropping=!1,this.$modal.toggleClass(h,!(this.cropped&&this.defaults.modal))),this.directive=""}},dragging:function(){var a,b=this.directive,c=this.cropper,d=c.width,e=c.height,f=this.dragger,g=f.width,i=f.height,j=f.left,k=f.top,l=j+g,m=k+i,n=!0,o=this.defaults.aspectRatio,p={x:this.endX-this.startX,y:this.endY-this.startY};switch(o&&(p.X=p.y*o,p.Y=p.x/o),b){case"+":p.x&&p.y&&(a=this.$cropper.offset(),j=this.startX-a.left,k=this.startY-a.top,g=f.minWidth,i=f.minHeight,p.x>0?p.y>0?b="se":(b="ne",k-=i):p.y>0?(b="sw",j-=g):(b="nw",j-=g,k-=i),this.cropped||(this.cropped=!0,this.$dragger.removeClass(h)));break;case"*":j+=p.x,k+=p.y;break;case"e":if(p.x>=0&&(l>=d||o&&(0>=k||m>=e))){n=!1;break}g+=p.x,o&&(i=g/o,k-=p.Y/2),0>g&&(b="w",g=0);break;case"n":if(p.y<=0&&(0>=k||o&&(0>=j||l>=d))){n=!1;break}i-=p.y,k+=p.y,o&&(g=i*o,j+=p.X/2),0>i&&(b="s",i=0);break;case"w":if(p.x<=0&&(0>=j||o&&(0>=k||m>=e))){n=!1;break}g-=p.x,j+=p.x,o&&(i=g/o,k+=p.Y/2),0>g&&(b="e",g=0);break;case"s":if(p.y>=0&&(m>=e||o&&(0>=j||l>=d))){n=!1;break}i+=p.y,o&&(g=i*o,j-=p.X/2),0>i&&(b="n",i=0);break;case"ne":if(p.y<=0&&(0>=k||l>=d)){n=!1;break}i-=p.y,k+=p.y,o?g=i*o:g+=p.x,0>i&&(b="sw",i=0,g=0);break;case"nw":if(p.y<=0&&(0>=k||0>=j)){n=!1;break}i-=p.y,k+=p.y,o?(g=i*o,j+=p.X):(g-=p.x,j+=p.x),0>i&&(b="se",i=0,g=0);break;case"sw":if(p.x<=0&&(0>=j||m>=e)){n=!1;break}g-=p.x,j+=p.x,o?i=g/o:i+=p.y,0>g&&(b="ne",i=0,g=0);break;case"se":if(p.x>=0&&(l>=d||m>=e)){n=!1;break}g+=p.x,o?i=g/o:i+=p.y,0>g&&(b="nw",i=0,g=0)}n&&(f.width=g,f.height=i,f.left=j,f.top=k,this.directive=b,this.renderDragger()),this.startX=this.endX,this.startY=this.endY}},r.template=function(a,b){return b=b.split(","),a.replace(/\d+/g,function(a){return b[a]})}('<0 6="5-container"><0 6="5-modal"></0><0 6="5-canvas" 3-2="+"></0><0 6="5-dragger"><1 6="5-viewer"></1><1 6="5-8 8-h"></1><1 6="5-8 8-v"></1><1 6="5-face" 3-2="*"></1><1 6="5-7 7-e" 3-2="e"></1><1 6="5-7 7-n" 3-2="n"></1><1 6="5-7 7-w" 3-2="w"></1><1 6="5-7 7-s" 3-2="s"></1><1 6="5-4 4-e" 3-2="e"></1><1 6="5-4 4-n" 3-2="n"></1><1 6="5-4 4-w" 3-2="w"></1><1 6="5-4 4-s" 3-2="s"></1><1 6="5-4 4-ne" 3-2="ne"></1><1 6="5-4 4-nw" 3-2="nw"></1><1 6="5-4 4-sw" 3-2="sw"></1><1 6="5-4 4-se" 3-2="se"></1></0></0>',"div,span,directive,data,point,cropper,class,line,dashed"),r.defaults={aspectRatio:"auto",data:{},done:a.noop,preview:e,multiple:!1,autoCrop:!0,dragCrop:!0,dashed:!0,modal:!0,movable:!0,resizable:!0,minWidth:0,minHeight:0,maxWidth:1/0,maxHeight:1/0,build:e,built:e,dragstart:e,dragmove:e,dragend:e},r.setDefaults=function(b){a.extend(r.defaults,b)},r.other=a.fn.cropper,a.fn.cropper=function(b){var c,d=[].slice.call(arguments,1);return this.each(function(){var e,f=a(this),g=f.data("cropper");g||f.data("cropper",g=new r(this,b)),"string"==typeof b&&a.isFunction(e=g[b])&&(c=e.apply(g,d))}),"undefined"!=typeof c?c:this},a.fn.cropper.constructor=r,a.fn.cropper.setDefaults=r.setDefaults,a.fn.cropper.noConflict=function(){return a.fn.cropper=r.other,this}});
