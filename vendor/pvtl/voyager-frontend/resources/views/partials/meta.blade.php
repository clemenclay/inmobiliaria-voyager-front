<!doctype html>
<html lang="en" class="no-js">
<head>
		<title>@yield('meta_title', setting('site.title'))</title>
		<meta name="description" content="@yield('meta_description', setting('site.description')) - {{ setting('site.title') }}">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="csrf-token" content="{{ csrf_token() }}">

		<!-- Open Graph -->
		<meta property="og:site_name" content="{{ setting('site.title') }}" />
		<meta property="og:title" content="@yield('meta_title')" />
		<meta property="og:type" content="website" />
		<meta property="og:url" content="{{ url('/') }}" />
		<meta property="og:image" content="@yield('meta_image', url('/') . '/images/apple-touch-icon.png')" />
		<meta property="og:description" content="@yield('meta_description', setting('site.description'))" />

		<!-- Icons -->
		<meta name="msapplication-TileImage" content="{{ url('/') }}/ms-tile-icon.png" />
		<meta name="msapplication-TileColor" content="#8cc641" />
		<link rel="shortcut icon" href="{{ url('/') }}/images/favicon.ico" />
		<link rel="apple-touch-icon-precomposed" href="{{ url('/') }}/images/apple-touch-icon.png" />

		<!-- Styles 
		<link rel="stylesheet" type="text/css" href="{{ url('/') }}/css/app.css">
-->
		@if (setting('site.google_analytics_tracking_id'))
				<!-- Google Analytics (gtag.js) -->
				<script async src="https://www.googletagmanager.com/gtag/js?id={{ setting('site.google_analytics_tracking_id') }}"></script>
				<script>
						window.dataLayer = window.dataLayer || [];
						function gtag(){dataLayer.push(arguments);}
						gtag('js', new Date());

						gtag('config', '{{ setting('site.google_analytics_tracking_id') }}');
				</script>
		@endif

        @if (setting('admin.google_recaptcha_site_key'))
            <script src='https://www.google.com/recaptcha/api.js' async defer></script>
            <script>
                function setFormId(formId) {
                    window.formId = formId;
                }

                function onSubmit(token) {
                    document.getElementById(window.formId).submit();
                }
            </script>
	 @endif
	 

<!-- Styles -->
<link rel="stylesheet" href="{{ url('/') }}/materialize/css/font-awesome.min.css">
<link rel="stylesheet" href="{{ url('/') }}/materialize/css/animate.css">
<link href='http://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/css?family=Poppins" rel="stylesheet">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">


<link rel="stylesheet" href="{{ url('/') }}/materialize/css/materialize.min.css">
<link rel="stylesheet" href="{{ url('/') }}/materialize/css/custom-styles.css">
<!-- <link rel="stylesheet" href="{{asset('frontend/css/custom.css')}}"> -->
<script src="{{ url('/') }}/materialize/js/modernizr-2.6.2-respond-1.1.0.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/js/materialize.min.js"></script>






</head>
<body>
