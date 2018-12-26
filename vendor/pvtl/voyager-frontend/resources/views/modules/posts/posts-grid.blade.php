@if (count($posts) > 0)
<div class="row">
        <div class="container">
            <div class="col l12">
                <h5>Propiedades</h5>
            </div>
        </div>
</div>

<div class="row">
        <div class="container">	
                @foreach($posts as $post)
                <div class="col s12 m6 l3 mix">
                        <div class="card hoverable">
                            <div class="card-image waves-effect waves-block waves-light">
                                <div class="card-mapa-imagen">
                                            <ul class="tabs tabs-cards">
                                                <li id="ver-mapa-" class="tab btn-floating waves-effect waves-light btn white scale-transition">
                                                    <a class="" href="#mapa-"><i class="material-icons blue-text text-darken-2">place</i></a>
                                                </li>
                                                <li id="ver-fotos-" class="tab btn-floating waves-effect waves-light btn white scale-transition scale-out">
                                                    <a class="active" href="#fotos-"><i class="material-icons blue-text text-darken-2">photo_camera</i></a>
                                                </li>
                                            </ul>

                                           
                                            
                                    <?php $images = json_decode($post->image); ?>
                                    @if($images != null)
                                    <div id="fotos-" class="tabs-content carousel carousel-slider">
                                        @foreach($images as $image)

                                                <div class="carousel-item">	
                                                        
                                                            <img src="{{ imageUrl($image) }}" style="width:100%">
                                                            {{-- <img src="{{ imageUrl($image, 260, 175) }}" style="width:100%"> --}}
                                                        
                                                </div>

                                        @endforeach
                                    </div>
                                    @endif

                                    <div id="mapa-" class="tabs-content carousel carousel-slider">
                                            <div class="carousel-item">
                                                <iframe width="100%" height="250" frameborder="0" style="border:0" src="https://www.google.com/maps/embed/v1/place?q={{ $post->calle }},{{ $post->altura }},{{ $post->localidad }}&zoom=15&key=AIzaSyAOCzRBIJRykPBCzw_F1eggTD4uCxCwVRg" allowfullscreen="false"></iframe>
                                            </div>	
                                    </div>
                                </div>
                            </div>

                           
                            <div class="card-content">
                                {{-- <span class="label secondary">
                                    {{ $post->created_at->format('M. jS Y') }}
                                </span> --}}
                                <a href="{{ route('voyager-blog.blog.post', ['slug' => $post->slug]) }}">
                                        <span class="card-title activator indigo-text">{{ $post->title }}</span>
                                        <span class="card-title activator indigo-text">
                                                {{ number_format($post->precio, 0, ".", ".") }}
                                        </span>
                                        <span class="card-title activator indigo-text">{{ $post->moneda_id }}</span>
                                </a>
                                @if ($post->excerpt)
                                    <p>{{ str_limit($post->excerpt, 50, '&hellip;') }}</p>
                                @endif
                            </div> <!-- /.card-section -->
                        </div> <!-- /.card -->
                    </div> <!-- /.cell -->
                @endforeach

        </div> <!-- /.cell -->
    </div> <!-- /.grid-container -->

    <div class="vspace-1"></div>
@else
    <div class="vspace-2"></div>

    <div class="grid-container">
        <div class="cell small-12">
            <div class="grid-x grid-padding-x">
                <p>There are currently no posts.</p>
            </div>
        </div>
    </div>

    <div class="vspace-1"></div>
@endif


<script>

    M.AutoInit()
    
        $('.carousel.carousel-slider').carousel({fullWidth: true});
        function autoplay() {
            $('.carousel').carousel('next');
        
            
        }
        
    </script>
    <script>
	
	
	
		
            $(document).ready(function() {
            
                $("i.material-icons.close").click(function(){
                      parent.history.back();
                     return false;					
                 });





                $("#ver-mapa-").click(function(){
                $("#ver-mapa-").addClass("scale-out");
                $("#ver-fotos-").removeClass("scale-out");
               				
            });
            
                $("#ver-fotos-").click(function(){	
                $("#ver-fotos-").addClass("scale-out");
                $("#ver-mapa-").removeClass("scale-out");
               	
            });
            
            
            });
            







            </script>