<div class="navbar-fixed">
<nav class="blue darken-3" role="navigation">
		<div class="nav-wrapper container">
			<ul class="left waves-effect" style="width: 285px;">     
				<a href="#" data-target="nav-mobile" class="sidenav-trigger"><i class="material-icons">menu</i></a>
				<a href="{{url('/')}}">
					<img class="logo" src="{{asset('/')}}frontend/images/logo.png" alt="">
					<div class="logo-texto">{{$title}}</div>
				</a>
				</ul>

		  <ul class="left hide-on-med-and-down">
							<li <?php if($active == 'listadocompleto'){ echo 'class="active"'; } ?> ><a class="waves-effect" href="{{url('listado')}}"><i class="material-icons left">view_list</i> Propiedades</a></li>				
							<li <?php if($active == 'listadoventa'){ echo 'class="active"'; } ?> ><a class="waves-effect" href="{{url('listado?operacion=venta')}}"><i class="material-icons left">store</i> Venta</a></li>
							<li <?php if($active == 'listadoalquiler'){ echo 'class="active"'; } ?> ><a class="waves-effect" href="{{url('listado?operacion=alquiler')}}"><i class="material-icons left">event</i> Alquiler</a></li>
		  </ul>

		 <ul class="right hide-on-med-and-down">
			<li <?php if($active == 'contact'){ echo 'class="active"'; } ?> ><a  class="waves-effect" href="{{url('contact')}}"><i class="material-icons left">email</i> Contacto</a></li>
		</ul>

		  <!--   MENU izquierda mobil -->
		  <ul id="nav-mobile" class="sidenav" style="transform: translateX(-105%);">
					
				<li <?php if($active == 'index'){ echo 'class="active"'; } ?> ><a class="collapsible-header waves-effect" href="{{url('/')}}"><i class="material-icons">home</i> Inicio</a></li>
				<li <?php if($active == 'listadocompleto'){ echo 'class="active"'; } ?> ><a class="collapsible-header waves-effect" href="{{url('listado')}}"><i class="material-icons">view_list</i> Propiedades</a></li>
				<li <?php if($active == 'listadoventa'){ echo 'class="active"'; } ?> ><a class="collapsible-header waves-effect" href="{{url('listado?operacion=venta')}}"><i class="material-icons">store</i> Venta</a></li>
				<li <?php if($active == 'listadoalquiler'){ echo 'class="active"'; } ?> ><a class="collapsible-header waves-effect" href="{{url('listado?operacion=alquiler')}}"><i class="material-icons">event</i> Alquiler</a></li>
				<li <?php if($active == 'contact'){ echo 'active"'; } ?> ><a class="collapsible-header waves-effect" href="{{url('contact')}}"><i class="material-icons">email</i> Contacto</a></li>
		  </ul>
		  
		</div>
	  </nav>
</div>


{{-- https://materializecss.com/templates/parallax-template/preview.html --}}


{{-- <nav class="white" role="navigation">
		<div class="nav-wrapper container">
		  <a id="logo-container" href="#" class="brand-logo">Logo</a>
		  <ul class="right hide-on-med-and-down">
			<li><a href="#">Navbar Link</a></li>
		  </ul>
	
		  <ul id="nav-mobile" class="sidenav" style="transform: translateX(-105%);">
			<li><a href="#">Navbar Link</a></li>
		  </ul>
		  <a href="#" data-target="nav-mobile" class="sidenav-trigger"><i class="material-icons">menu</i></a>
		</div>
	  </nav> --}}