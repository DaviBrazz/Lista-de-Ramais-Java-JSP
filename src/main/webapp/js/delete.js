

  $(document).ready (function(){
    	$('[data-confirm]').click(function(ev){
    		var href =$(this).attr('href');
    		if(!$('#telaDeletarRamal').length) {
    			$('body').append('<div class="modal fade" id="telaDeletarRamal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">  <div class="modal-dialog modal-dialog-centered"  role="document"><div class="modal-content"><div class="modal-header bg-danger text-white"> <h5 class="modal-title" id="exampleModalLabel"> Excluir Ramal</h5><button type="button" class="close" data-dismiss="modal" aria-label="Fechar"> <span aria-hidden="true">&times;</span> </button> </div> <div class="modal-body"><h6> Deseja realmente excluir o ramal selecionado? </h6> </div><div class="modal-footer"><button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button> <a  class="btn btn-danger" id="dataConfirmOk">Excluir</button></a> </div> </div> </div></div>');
    		}
    		
    		$('#dataConfirmOk').attr('href',href);
        	$('#telaDeletarRamal').modal({shown:true});
        	return false;
        	  
    	});

    });
    