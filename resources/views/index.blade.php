@extends('layout')
@section('content')

<div id="home-slider" class="card hoverable carousel carousel-slider">
    @foreach($gallery as $q)
		<div class="carousel-item item id-{{$q->id}}">
			<img src="{{asset('/')}}{{$q->image}}">
			<div id="blur-bg"><h5>{!! $q->description !!}</h5></div>
			<div class="carousel-caption">
					<h5>{!! $q->description !!}</h5>
					
			</div>
		</div>
	@endforeach
<div class="botonera-home-slider">
	<div class="left prev btn-floating waves-effect waves-light btn white scale-transition"><i class="material-icons blue-text text-darken-2">navigate_before</i></div>
	<div class="right next btn-floating waves-effect waves-light btn white scale-transition"><i class="material-icons blue-text text-darken-2">navigate_next</i></div>
</div>


</div>
<br>    








	<div class="col l12">
	<h5>Listado Alquiler</h5>
	</div>
	<!-- start content -->
	<div class="row">	
					@foreach($listadoalquiler as $q)
		
					
					<div class="col s12 m6 l3">
					<div class="card hoverable">
						<div class="card-image waves-effect waves-block waves-light">
								<div class="card-mapa-imagen">
									<ul class="tabs tabs-cards">
										<li id="ver-mapa-alquiler-{{ $q->id }}" class="tab btn-floating waves-effect waves-light btn white scale-transition">
											<a class="" href="#mapa-alquiler-{{ $q->id }}"><i class="material-icons blue-text text-darken-2">place</i></a>
										</li>
										<li id="ver-fotos-alquiler-{{ $q->id }}" class="tab btn-floating waves-effect waves-light btn white scale-transition scale-out">
											<a class="active" href="#fotos-alquiler-{{ $q->id }}"><i class="material-icons blue-text text-darken-2">photo_camera</i></a>
										</li>
									</ul>
									<div id="mapa-alquiler-{{ $q->id }}" class="tabs-content carousel carousel-slider">
											<div class="carousel-item">
												<iframe width="100%" height="250" frameborder="0" style="border:0" src="https://www.google.com/maps/embed/v1/place?q={{ $q->map_latitude }},{{ $q->map_longitude }}&zoom=15&key=AIzaSyAOCzRBIJRykPBCzw_F1eggTD4uCxCwVRg" allowfullscreen="false"></iframe>
											</div>	
									</div>
									<div id="fotos-alquiler-{{ $q->id }}" class="tabs-content carousel carousel-slider">
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
						
							$("#ver-mapa-alquiler-{{ $q->id }}").click(function(){
							$("#ver-mapa-alquiler-{{ $q->id }}").addClass("scale-out");
							$("#ver-fotos-alquiler-{{ $q->id }}").removeClass("scale-out");
							// $('mapa-{{ $q->id }}').addClass('animated bounceOutLeft');
							// $('mapa-{{ $q->id }}').addClass('animated bounceInRight');					
						});
						
							$("#ver-fotos-alquiler-{{ $q->id }}").click(function(){	
							$("#ver-fotos-alquiler-{{ $q->id }}").addClass("scale-out");
							$("#ver-mapa-alquiler-{{ $q->id }}").removeClass("scale-out");
							// $('fotos-{{ $q->id }}').addClass('animated bounceOutLeft');
							// $('fotos-{{ $q->id }}').addClass('animated bounceInRight');		
						});
						
						
						});
						
						</script>
	
					@endforeach	
					
	</div>








	<div id="index-banner" class="parallax-container">
			<div class="section no-pad-bot">
			  <div class="container">
				<br><br>
				<h1 class="header center teal-text text-lighten-2">Parallax Template</h1>
				<div class="row center">
				  <h5 class="header col s12 light">A modern responsive front-end framework based on Material Design</h5>
				</div>
				<div class="row center">
				  <a href="http://materializecss.com/getting-started.html" id="download-button" class="btn-large waves-effect waves-light teal lighten-1">Get Started</a>
				</div>
				<br><br>
		
			  </div>
			</div>
			<div class="parallax">
				
		
						<img src="{{asset('/')}}/uploads/1/2018-10/descarga_1.jpg">
		
		
		
		
			</div>
		  </div>
		








<div class="l12">
<h5>Listado Completo</h5>
</div>
<!-- start content -->
<div class="row">	
				@foreach($listadocompleto as $q)
	
				
				<div class="col s12 m6 l3">
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
<!-- end content -->






<script>
	$(document).ready(function(){
		$('#home-slider').carousel(
			
	{
    dist: 0,
    padding: 0,
    fullWidth: true,
    indicators: true,
    duration: 100,
  	}

		);
		
		setInterval(function(){
			$('#home-slider').carousel('next');
		}, 4000);

    // function for next slide
		$('.next').click(function(){
			$('#home-slider').carousel('next');
		});
    
    // function for prev slide
		$('.prev').click(function(){
			$('#home-slider').carousel('prev');
		});
	});
	
</script>
@endsection
