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
                            
                            <a href="{{ route('voyager-blog.blog.post', ['slug' => $post->slug]) }}">
                                    <div class="card-image waves-effect waves-block waves-light">


                                 <?php $images = json_decode($post->image); ?>
                                @if($images != null)
                                    @foreach($images as $image)
                                    <div id="fotos-{{ $image }}" class="tabs-content carousel carousel-slider">
                                            <div class="carousel-item">	
                                                    <div class="carousel carousel-slider">
                                                        <img src="{{ imageUrl($image) }}" style="width:100%">
                                                        {{-- <img src="{{ imageUrl($image, 260, 175) }}" style="width:100%"> --}}
                                                    </div>
                                            </div>
                                    </div>
                                    @endforeach
                                @endif





                                    </div>

                            </a>
                            <div class="card-section">
                                <span class="label secondary">
                                    {{ $post->created_at->format('M. jS Y') }}
                                </span>
                                <a href="{{ route('voyager-blog.blog.post', ['slug' => $post->slug]) }}">
                                    <h4>{{ $post->title }}</h4>
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
