@extends('layout')
@section('content')

<div class="row">
	<div class="container">
		<div class="col l12">
			<h5>Propiedades</h5>
		</div>
	</div>
</div>


<div class="row">
	<div class="container">
		<div class="col s12 m6 l4"  data-filter-group>
			<div class="controls">
				<button type="button" class="control tab btn-floating waves-effect waves-light btn white" data-filter="all">
					<i class="material-icons blue-text text-darken-2">filter_list</i>
				</button>
				<button type="button" class="control tab btn-floating waves-effect waves-light btn white" data-toggle=".Venta">
					<i class="material-icons blue-text text-darken-2">store</i>
				</button>
				<label>
						<span> Venta</span>
				</label>
				<button type="button" class="control tab btn-floating waves-effect waves-light btn white" data-toggle=".Alquiler">
					<i class="material-icons blue-text text-darken-2">event</i>
				</button>
				<label>
					<span> Alquiler</span>
				</label>
			</div>
		</div>

		<div class="col s12 m6 l6">
			<div class="controls">

		
							
						<fieldset data-filter-group style="display: contents;">
								<select multiple>
									<option value="" disabled="" selected="">Elija el Barrio: </option>
								@foreach($verbarrios as $q)
									<option value=".{{ $q->barrio }}">{{ $q->barrio }}</option>
								@endforeach
							</select>
						</fieldset>

			</div>
		</div>
	</div>
</div>


	<!-- start content -->
	<div class="row">
			<div class="container">	
					@foreach($listadocompleto as $q)
		
					
					<div class="col s12 m6 l3 mix {{ $q->operacion }} {{ $q->barrio }}">
					<div class="card hoverable">
						<div class="card-image waves-effect waves-block waves-light">
								<div class="card-mapa-imagen">
									<ul class="tabs tabs-cards">
										<li id="ver-mapa-{{ $q->id }}" class="tab btn-floating waves-effect waves-light btn white scale-transition">
											<a class="" href="#mapa-{{ $q->id }}"><i class="material-icons blue-text text-darken-2">place</i></a>
										</li>
										<li id="ver-fotos-{{ $q->id }}" class="tab btn-floating waves-effect waves-light btn white scale-transition scale-out">
											<a class="active" href="#fotos-{{ $q->id }}"><i class="material-icons blue-text text-darken-2">photo_camera</i></a>
										</li>
									</ul>
									<div id="mapa-{{ $q->id }}" class="tabs-content carousel carousel-slider">
											<div class="carousel-item">
												<iframe width="100%" height="250" frameborder="0" style="border:0" src="https://www.google.com/maps/embed/v1/place?q={{ $q->map_latitude }},{{ $q->map_longitude }}&zoom=15&key=AIzaSyAOCzRBIJRykPBCzw_F1eggTD4uCxCwVRg" allowfullscreen="false"></iframe>
											</div>	
									</div>
									<div id="fotos-{{ $q->id }}" class="tabs-content carousel carousel-slider">
											<div class="carousel-item">	
												<div class="carousel carousel-slider">
														<a class="carousel-item modal-trigger" href="#fotos-modal-{{ $q->id }}"><img src="{{asset('/')}}{{$q->imagen}}"></a>
	
	
														
	
														
	
	
												</div>
											</div>	
									</div>
								</div>
						  
						</div>
						<div class="card-content">
						  <span class="card-title activator indigo-text">
								<i class="material-icons right">more_vert</i>
								{!! $q->titulo !!}</span>
							<b>Localidad: {{ $q->barrio }}</b>
							<br>
							<b>Operacion: {{ $q->operacion }}</b>
							@if($q->precio_compra != 0 )
								<b>{{ number_format($q->precio_compra, 0, ".", ".") }}</b>
							@else
								<b>{{ number_format($q->precio_alquiler, 0, ".", ".") }}</b>
							@endif
								<b>{{ $q->moneda }}</b>
						</div>
						<div class="card-reveal">
						  <span class="card-title indigo-text">
								<i class="material-icons right">close</i>
								{!! $q->titulo !!}</span>
						  <p>{!! $q->descripcion !!}</p>
						</div>
					  </div>
					</div>
	
					<script>
	
	
	
		
						$(document).ready(function() {
						
							$("i.material-icons.close").click(function(){
							  	parent.history.back();
							 	return false;					
							 });


						// $('.chips').on('chip.delete', function(e, chip){
						// 	parent.history.back();
						// 	});


							$("#ver-mapa-{{ $q->id }}").click(function(){
							$("#ver-mapa-{{ $q->id }}").addClass("scale-out");
							$("#ver-fotos-{{ $q->id }}").removeClass("scale-out");
							// $('mapa-{{ $q->id }}').addClass('animated bounceOutLeft');
							// $('mapa-{{ $q->id }}').addClass('animated bounceInRight');					
						});
						
							$("#ver-fotos-{{ $q->id }}").click(function(){	
							$("#ver-fotos-{{ $q->id }}").addClass("scale-out");
							$("#ver-mapa-{{ $q->id }}").removeClass("scale-out");
							// $('fotos-{{ $q->id }}').addClass('animated bounceOutLeft');
							// $('fotos-{{ $q->id }}').addClass('animated bounceInRight');		
						});
						
						
						});
						







						</script>
						<!-- Modal Structure -->
						<div id="fotos-modal-{{ $q->id }}" class="modal modalfullheigth">
							<a href="#!" class="modal-close waves-effect"><i class="material-icons blue-text text-darken-2">close</i></a>
							<img style="width: 100%;" src="{{asset('/')}}{{$q->imagen}}">
						</div>
					@endforeach	
			</div>					
		</div>
	<!-- end content -->




<script>

			$( document ).ready(function() {
var mixer = mixitup('.filtrado', {
    multifilter: {
        enable: true
    },
    callbacks: {
        onMixStart: function(state, futureState) {
            console.log(futureState.activeFilter.selector);
        }
    }
});
})
</script>
	@endsection

	
	