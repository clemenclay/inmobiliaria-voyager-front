
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
	<meta charset="utf-8">
	<title>{{$title}}</title>
	<meta name="viewport" content="width=device-width">
	
	<link rel="icon" href="favicon.ico" type="image/x-icon"/>
	<link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
	
	<!-- Styles -->
	<link rel="stylesheet" href="{{asset('frontend/materialize/css/font-awesome.min.css')}}">
	<link rel="stylesheet" href="{{asset('frontend/materialize/css/animate.css')}}">
	<link href='http://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
	<link href="https://fonts.googleapis.com/css?family=Poppins" rel="stylesheet">
	
	<!-- Google Fonts -->
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	
	
	<link rel="stylesheet" href="{{asset('frontend/materialize/css/materialize.min.css')}}">
	<link rel="stylesheet" href="{{asset('frontend/materialize/css/custom-styles.css')}}">
	<!-- <link rel="stylesheet" href="{{asset('frontend/css/custom.css')}}"> -->
	<script src="{{asset('frontend/materialize/js/modernizr-2.6.2-respond-1.1.0.min.js')}}"></script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/js/materialize.min.js"></script>
		{{-- <script src="https://cdn.jsdelivr.net/jquery.mixitup/latest/jquery.mixitup.min.js"></script>
		<script src="https://afarkas.github.io/lazysizes/lazysizes.min.js"></script> --}}
		
		{{-- <script src="{{asset('frontend/materialize/js/materialize.js')}}"></script> --}}
		{{-- <script src="{{asset('frontend/materialize/js/init.js')}}"></script> --}}

		



		
		<script src="//code.tidio.co/sk4iuwxfeabvtqpwirjoll7s1ln6uxbd.js"></script>
	
	
		<style>
	
			.pace {
				-webkit-pointer-events: none;
				pointer-events: none;
	
				-webkit-user-select: none;
				-moz-user-select: none;
				user-select: none;
				-webkit-animation-name: fadeOut;
				animation-name: fadeOut;
			}
	
			.pace-inactive {
				display: none;
			}
	
			.pace .pace-progress {
				background: #26a69a;
				position: fixed;
				z-index: 2000;
				top: 0;
				right: 100%;
				width: 100%;
				height: 2px;
			}
	
			@-webkit-keyframes fadeIn {
				0% {opacity: 0;}
				100% {opacity: 1;}
			}
	
			@-moz-keyframes fadeIn {
				0% {opacity: 0;}
				100% {opacity: 1;}
			}
	
			@-o-keyframes fadeIn {
				0% {opacity: 0;}
				100% {opacity: 1;}
			}
	
			@keyframes fadeIn {
				0% {opacity: 0;}
				100% {opacity: 1;}
			}
	
			.fadeIn {
				-webkit-animation-name: fadeIn;
				-moz-animation-name: fadeIn;
				-o-animation-name: fadeIn;
				animation-name: fadeIn;
			}
	
	
			body.pace-running #pagina {
				opacity: 0;
			}
			body.pace-done #pagina {
				opacity: 1;
				-webkit-animation-name: fadeIn;
				animation-name: fadeIn;
				-webkit-animation-duration: 2s;animation-duration: 2s;
				-webkit-animation-fill-mode: both;animation-fill-mode: both;
			}
			}
		</style>
	
	
	</head>

	<body class="theme-indigo">

	
	@include('menu')


	

	<!-- END .header -->
	<!-- content -->
	<main>
	<section class="filtrado">	
	@yield('content')
	</section>
	</main>
	<!-- end content -->
	{{-- <style>
		#logoAnimago{
		width: 30px;
		height: 30px;
		display: block;
		text-align: center;
		overflow: hidden;
		left: -33px;
		top: 32px;
		position: relative;
		}
		</style>
		
		
		<script type="text/javascript">
			$(document).ready(function(){
				
				var imgHeight = 30;
		var numImgs = 19;
		var cont = 0;
		
		var animation = setInterval(function(){
			var position =  -1 * (cont*imgHeight);
			$('#logoAnimago').find('img').css('margin-top', position);
			
			cont++;
			if(cont == numImgs){
				cont = 0;
			}
		},45);
			
		
		});
		</script> --}}
		
		
		
		@include('footer')	

		<script src="{{asset('frontend/materialize/js/mixitup.min.js')}}"></script>
		<script src="{{asset('frontend/materialize/js/mixitup-multifilter.min.js')}}"></script>
		
		
	</body>
</html>
