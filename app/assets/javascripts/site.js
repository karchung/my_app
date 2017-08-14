var refreshRating = function() { 
  $('.rating').raty({ 
    starHalf: '<%= asset_path 'star-half.png' %>', 
    starOff: '<%= asset_path 'star-off.png' %>', 
    starOn: '<%= asset_path 'star-on.png' %>', 
    scoreName: 'comment[rating]' 
  }); 
    $('.rated').raty({ 
    starHalf: '<%= asset_path 'star-half.png' %>', 
    starOff: '<%= asset_path 'star-off.png' %>', 
    starOn: '<%= asset_path 'star-on.png' %>', 
    readOnly: true, 
    score: function() { 
      return $(this).attr('data-score'); 
    } 
  }); 
}; 
 
$(document).on('turbolinks:load ajaxSuccess', function() {
    refreshRating(); 
 
    /*elevateZoom */
    $('.img-zoom').elevateZoom({
        zoomType: "lens",
        lensShape: "round",
        lensSize: 375,
   	}); /*ends elevateZoom*/
    
});