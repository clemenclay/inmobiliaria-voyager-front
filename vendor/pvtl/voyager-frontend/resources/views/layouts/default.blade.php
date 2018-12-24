@include('voyager-frontend::partials.meta')
@include('voyager-frontend::partials.header')

    <main>
        <section class="filtrado">
            @yield('content')
        </section>
    </main>

<script src="{{ url('/') }}/materialize/js/mixitup.min.js"></script>
<script src="{{ url('/') }}/materialize/js/mixitup-multifilter.min.js"></script>

@include('voyager-frontend::partials.footer')
