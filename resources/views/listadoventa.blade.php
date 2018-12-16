@extends('layout')
@section('content')


<div class="l12">
	<h5>Listado venta</h5>
	</div>
	<!-- start content -->
	<div class="row">	
					@foreach($listadoventa as $q)
		
					
					<div class="col s12 m6 l3">
					<div class="card hoverable">
						<div class="card-image waves-effect waves-block waves-light">
								<div class="card-mapa-imagen">
									<ul class="tabs tabs-cards">
										<li id="ver-mapa-venta-{{ $q->id }}" class="tab btn-floating waves-effect waves-light btn white scale-transition">
											<a class="" href="#mapa-venta-{{ $q->id }}"><i class="material-icons blue-text text-darken-2">place</i></a>
										</li>
										<li id="ver-fotos-venta-{{ $q->id }}" class="tab btn-floating waves-effect waves-light btn white scale-transition scale-out">
											<a class="active" href="#fotos-venta-{{ $q->id }}"><i class="material-icons blue-text text-darken-2">photo_camera</i></a>
										</li>
									</ul>
									<div id="mapa-venta-{{ $q->id }}" class="tabs-content carousel carousel-slider">
											<div class="carousel-item">
												<iframe width="100%" height="250" frameborder="0" style="border:0" src="https://www.google.com/maps/embed/v1/place?q={{ $q->map_latitude }},{{ $q->map_longitude }}&zoom=15&key={{$googleapikey}}" allowfullscreen="false"></iframe>
											</div>	
									</div>
									<div id="fotos-venta-{{ $q->id }}" class="tabs-content carousel carousel-slider">
											<div class="carousel-item">	
												<div class="carousel carousel-slider">
														<a class="carousel-item" href=""><img src="{{asset('/')}}{{$q->imagen}}"></a>
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
								<b>{{ number_format($q->precio_venta, 0, ".", ".") }}</b>
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
						
							$("#ver-mapa-venta-{{ $q->id }}").click(function(){
							$("#ver-mapa-venta-{{ $q->id }}").addClass("scale-out");
							$("#ver-fotos-venta-{{ $q->id }}").removeClass("scale-out");
							// $('mapa-{{ $q->id }}').addClass('animated bounceOutLeft');
							// $('mapa-{{ $q->id }}').addClass('animated bounceInRight');					
						});
						
							$("#ver-fotos-venta-{{ $q->id }}").click(function(){	
							$("#ver-fotos-venta-{{ $q->id }}").addClass("scale-out");
							$("#ver-mapa-venta-{{ $q->id }}").removeClass("scale-out");
							// $('fotos-{{ $q->id }}').addClass('animated bounceOutLeft');
							// $('fotos-{{ $q->id }}').addClass('animated bounceInRight');		
						});
						
						
						});
						
						</script>
	
					@endforeach	
					
	</div>



@endsection


	


	