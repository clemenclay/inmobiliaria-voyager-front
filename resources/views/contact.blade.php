@extends('layout')
@section('content')

			<div class="row">
				<div class="col s12 m6 l6">
					
					<h5>Contacto</h5>
				<div class="card hoverable" style="min-height: 442px;">
						<div class="card-content">
							<form class="contact-form" spellcheck="false" action="{{ action('FrontendController@postContact') }}" method="post">       
							<input type="hidden" name="_token" value="{{ csrf_token() }}" />      
							
									{{-- <div class="col-md-6">
										<div class="form-group">
											<input type="text" class="form-control" placeholder="First Name" name="first_name" required="">	
										</div>
									</div> --}}

										
												<div class="input-field col s12 l6">
												<input name="first_name" id="first_name" type="text" class="validate" required>
												<label for="first_name">Nombre</label>
												<span class="helper-text" data-error="Complete Correctamente" data-success="ok"></span>
												</div>

												<div class="input-field col s12 l6">
												<input name="last_name" id="last_name" type="text" class="validate" required>
												<label for="last_name">Apellido</label>
												<span class="helper-text" data-error="Complete Correctamente" data-success="ok"></span>
												</div>
										
									{{-- <div class="col-md-6">
										<div class="form-group">
											<input type="text" class="form-control" placeholder="Last Name" name="last_name">
										</div>
									</div> --}}
									
									
										{{-- <div class="form-group">
											<input type="email" class="form-control" placeholder="Email Address" name="email" required="">
										</div> --}}
										
											
											
												<div class="input-field col s12">
												<input name="email" id="email" type="email" class="validate" required>
												<label for="email">Email</label>
												<span class="helper-text" data-error="Ingrese un e-mail Válido" data-success="ok"></span>
												</div>
											
											
										

										
											
											
												<div class="input-field col s12">
												<textarea name="message" id="message" class="materialize-textarea validate" type="text" required></textarea>
												<label for="message">Escriba su mensaje aquí</label>
												<span class="helper-text" data-error="Complete Correctamente" data-success="ok"></span>
												</div>
											
											
										
										{{-- <div class="form-group">
											<textarea name="message" id="message" cols="30" class="form-control" rows="10" required=""></textarea>
										</div> --}}
										<div class="form-group">
											<button id="enviarcontacto" type="submit" class="btn blue darken-3 waves-effect">{{trans("crudbooster.button_submit")}}</button>
										</div>
										<div class="alert alert-success" style="display:none"></div>
									
						
							</form>
						</div>
				</div>					
				</div>
				<div class="col s12 m6 l6">
					<h5>Ubicación</h5>
					<div class="card hoverable">
						
						<iframe class="mapa-contacto" width="100%" height="442" frameborder="0" style="border:0" src="https://www.google.com/maps/embed/v1/place?q=-34.626039,-58.38654&amp;zoom=15&amp;key=AIzaSyAOCzRBIJRykPBCzw_F1eggTD4uCxCwVRg" allowfullscreen="false"></iframe>
						
					</div>
				</div>
        		
        	</div>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

@if(Session::has('message'))
	<script type="text/javascript">
		$(document).ready(function(){
			swal({
			   title: '{{Session::get("message")}}',
			   text: '',
			   
			});
		});


		
	</script>
@endif
{{-- 
<script>
	jQuery(document).ready(function(){
		   jQuery('#enviarcontacto').click(function(e){
			  e.preventDefault();
			  $.ajaxSetup({
				 headers: {
					 'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
				 }
			 });
			  jQuery.ajax({
				 url: "{{ url('/contact') }}",
				 method: 'post',
				 data: {
					name: jQuery('#first_name').val(),
					type: jQuery('#first_name').val(),
					price: jQuery('#email').val(),
					price: jQuery('#message').val()
				 },
				 success: function(result){
					jQuery('.alert').show();
					jQuery('.alert').html(result.success);
				 }});
			  });
		   });
</script> --}}
@endsection








































