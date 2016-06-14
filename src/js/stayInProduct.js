/* global jQuery */
/*global location */
(function($){
    
$('.addPanier').click(function(event){
        event.preventDefault();
        $.ajax({
            url: $(this).attr('href'),
            }).success(function(data){
                var result = JSON.parse(data);
                console.log(result.count);
                if(confirm('Le produit a bien été rajouté. Voulez vous consulter votre panier ?')){
                    location.href = 'panier.php';
                }else{
                    $('#count').empty();
                    $('#count').append(result.count);
                };
            }).error(function(jqXhr){
                console.log('Echec');
            });
        return false;
    });
    
})(jQuery);