<div class="navbar-fixed">
    {{-- <div class="header-site-search" data-toggle-search>
        <div class="grid-container">
            <div class="grid-x">
                <div class="cell medium-8 medium-offset-2">
                    @include('voyager-frontend::partials.search-box')
                </div> <!-- /.cell -->
            </div> <!-- /.grid -->
        </div> <!-- /.container -->
    </div> <!-- /.header-site-search --> --}}

	<nav class="blue darken-3" role="navigation">
            <div class="nav-wrapper container">

            <div class="header-logo float-left">
                <a href="{{ url('/') }}">
                    <img class="logo" src="{{ url('/') }}/images/logo.png" alt="{{ setting('site.title') }}" title="{{ setting('site.title') }}" />
                </a>
            </div> <!-- /.header-logo -->

            <ul class="menu show-for-medium">
                {{ menu('primary', 'voyager-frontend::partials.menu-left') }}
            </ul> <!-- /.menu -->

            <ul class="right hide-on-med-and-down">
                    @include('voyager-frontend::partials.menu-right')
                </ul>


        </div> <!-- /.top-bar-left -->


    </nav> <!-- /.top-bar  fin-->
</div>