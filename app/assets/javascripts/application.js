// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs

//= require bootstrap-wysihtml5

//= require modernizr.custom.17475

//= require masonry/jquery.masonry
//= require masonry/jquery.event-drag
//= require masonry/jquery.imagesloaded.min
//= require masonry/jquery.infinitescroll.min
//= require masonry/modernizr-transitions
//= require masonry/box-maker
//= require masonry/jquery.loremimages.min
//= require isotope/jquery.isotope

//= require magnific-popup

//= require bootstrap-sprockets

//= require_tree .

$(document).ready(function(){
$('.popup-gallery').magnificPopup({
    delegate: 'a',
    type: 'image',
    tLoading: 'Loading image #%curr%...',
    mainClass: 'mfp-img-mobile',
    closeOnContentClick: true,
    gallery: {
      enabled: true,
      navigateByImgClick: false,
      preload: [0,1] // Will preload 0 - before current, and 1 after the current image
    },
    image: {
      tError: '<a href="%url%">The image #%curr%</a> could not be loaded.',
    },
    mainClass: 'mfp-with-zoom', // this class is for CSS animation below

  zoom: {
    enabled: true, // By default it's false, so don't forget to enable it

    duration: 300, // duration of the effect, in milliseconds
    easing: 'ease-in-out', // CSS transition easing function

    // The "opener" function should return the element from which popup will be zoomed in
    // and to which popup will be scaled down
    // By defailt it looks for an image tag:
    opener: function(openerElement) {
      // openerElement is the element on which popup was initialized, in this case its <a> tag
      // you don't need to add "opener" option if this code matches your needs, it's defailt one.
      return openerElement.is('img') ? openerElement : openerElement.find('img');
    }
  }
  });

  // $('.box').magnificPopup({
  //   delegate: 'a', // child items selector, by clicking on it popup will open
  //   type: 'image',
  //   closeOnContentClick: true,
  //   // other options
  // });

  $('#masonry-container').masonry({
    itemSelector: '.box',
    isAnimated: !Modernizr.csstransitions,
    isFitWidth: true,
  });


  $('#masonry-container').imagesLoaded( function() {
    $('#masonry-container').masonry();
  });


	$('.wysihtml5').each(function(i, elem) {
      $(elem).wysihtml5();
   });

   $(".owl-agenda").owlCarousel({
        loop:false,
        margin: 5,
        center: true,
        URLhashListener:true,
        autoplayHoverPause:true,
        startPosition: 'URLHash',
        responsiveClass:true,
        responsive:{
            0:{
                items:1,
            },
            600:{
                items:3,
            },
            1000:{
                items:7,
                loop:false
            }
        }
    });

    var owl = $(".owl-maand");

    owl.owlCarousel({
        items: 1,
        center:true,
        loop:true,
        URLhashListener:true,
        autoplayHoverPause:true,
        startPosition: 'URLHash'
    });

  // Custom Navigation Events
  $(".next").click(function(){
    owl.trigger('next.owl.carousel');
  });
  $(".prev").click(function(){
    owl.trigger('prev.owl.carousel');
  });

  var touch = window.ontouchstart
              || (navigator.MaxTouchPoints > 0)
              || (navigator.msMaxTouchPoints > 0);

  if (touch) { // remove all :hover stylesheets
      try { // prevent crash on browsers not supporting DOM styleSheets properly
          for (var si in document.styleSheets) {
              var styleSheet = document.styleSheets[si];
              if (!styleSheet.rules) continue;

              for (var ri = styleSheet.rules.length - 1; ri >= 0; ri--) {
                  if (!styleSheet.rules[ri].selectorText) continue;

                  if (styleSheet.rules[ri].selectorText.match(':hover')) {
                      styleSheet.deleteRule(ri);
                  }
              }
          }
      } catch (ex) {}
  }


})


//= require turbolinks
