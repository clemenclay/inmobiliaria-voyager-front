<?php 
namespace App\Http\Controllers;

	use Session;
	use Request;
	use DB;
	use Hash;
	use CRUDBooster;

	class FrontendController extends Controller {
		
		// index
		public function getIndex(){
			$title =DB::table('cms_settings')->where('name','appname')->First();
			$googleapikey =DB::table('cms_settings')->where('name','google_api_key')->First();

			$data['title'] = $title->content;
			$data['googleapikey'] = $googleapikey->content;
			
			$data['active'] = 'index';
			$data['gallery'] = DB::table('gallery')->orderby('id','desc')->get();

			$data['listadocompleto'] = DB::table('propiedad')
			->join('moneda','propiedad.moneda_id','=','moneda.id')
			->join('localidad_propiedad','propiedad.localidad_propiedad_id','=','localidad_propiedad.id')
			->join('tipooperacion','propiedad.tipooperacion_id','=','tipooperacion.id')
			->join('barrio_propiedad','propiedad.barrio_propiedad_id','=','barrio_propiedad.id')
	
			->select(
				'propiedad.*',
				'imagen',
				'titulo',
				'descripcion',
				'precio_compra',
				'precio_compra',
				'moneda',
				'barrio_propiedad.name as barrio',
				'localidad_propiedad.name as localidad',
				'localidad_propiedad.name as localidad',
				'localidad_propiedad.name as localidad',
				'tipooperacion.name as operacion'
			)

			->where('publicado',1)
			->orderby('propiedad.id','desc')->get();


			$data['listadoalquiler'] = DB::table('propiedad')
			->join('moneda','propiedad.moneda_id','=','moneda.id')
			->join('localidad_propiedad','propiedad.localidad_propiedad_id','=','localidad_propiedad.id')
			->join('tipooperacion','propiedad.tipooperacion_id','=','tipooperacion.id')
			->join('barrio_propiedad','propiedad.barrio_propiedad_id','=','barrio_propiedad.id')
			->select(
				'propiedad.*',
				'imagen',
				'titulo',
				'descripcion',
				'precio_compra',
				'precio_compra',
				'moneda',
				'barrio_propiedad.name as barrio',
				'localidad_propiedad.name as localidad',
				'tipooperacion.name as operacion'
			)
			->where('publicado',1)
			->where('tipooperacion_id',2)
			->orderby('propiedad.id','desc')->get();

			return view('index',$data);
		}


		

// listadoalquiler?tipooperacion_id=1&tipopropiedad_id=7

		public function getListado(){

			$title =DB::table('cms_settings')->where('name','appname')->First();
			$data['title'] = $title->content;


			//filtros
			$operacion = Request::get('operacion');
			$barrio = Request::get('barrio');
			
			

			$data['verbarrios'] = DB::table('propiedad')
			->join('barrio_propiedad','propiedad.barrio_propiedad_id','=','barrio_propiedad.id')
			->select(
				
				'barrio_propiedad.name as barrio'
			)
			->groupBy('barrio')
			->where('publicado',1)
			->get();

			
			$query = DB::table('propiedad')
			->join('moneda','propiedad.moneda_id','=','moneda.id')
			->join('localidad_propiedad','propiedad.localidad_propiedad_id','=','localidad_propiedad.id')
			->join('tipooperacion','propiedad.tipooperacion_id','=','tipooperacion.id')
			->join('barrio_propiedad','propiedad.barrio_propiedad_id','=','barrio_propiedad.id')
			->join('tipopropiedad','propiedad.tipopropiedad_id','=','tipopropiedad.id')
			
			->select(
				'propiedad.*',
				'imagen',
				'titulo',
				'descripcion',
				'precio_compra',
				'precio_compra',
				'moneda',
				'barrio_propiedad.name as barrio',
				'localidad_propiedad.name as localidad',
				'tipooperacion.name as operacion',
				'tipopropiedad.name as tipopropiedad'
			)
			->where('publicado',1);
			$data['active'] = 'listadocompleto';


			if (Request::exists('barrio')) {
				$query = $query->where('barrio_propiedad.name', '=', $barrio);
			}
			if (Request::exists('operacion')) {
				$query = $query->where('tipooperacion.name', '=', $operacion);
			}

			// menu

			if (Request::exists('operacion') && $operacion == 'venta') {
				$data['active'] = 'listadoventa';
			}

		 	if (Request::exists('operacion') && $operacion == 'alquiler') {
				$data['active'] = 'listadoalquiler';
			}
			else{
				
			}

			$query = $query->orderby('propiedad.id','desc')->get();
			$data['listadocompleto'] = $query;
			return view('listado',$data);

		}











		
		public function getListadoventa(){
			$title =DB::table('cms_settings')->where('name','appname')->First();
			$data['title'] = $title->content;
			$data['active'] = 'listadoventa';
			$data['listadoventa'] = DB::table('propiedad')
			->join('moneda','propiedad.moneda_id','=','moneda.id')
			->join('localidad_propiedad','propiedad.localidad_propiedad_id','=','localidad_propiedad.id')
			->join('tipooperacion','propiedad.tipooperacion_id','=','tipooperacion.id')
			->join('barrio_propiedad','propiedad.barrio_propiedad_id','=','barrio_propiedad.id')
	
			->select(
				'propiedad.*',
				'imagen',
				'titulo',
				'descripcion',
				'precio_compra',
				'precio_compra',
				'moneda',
				'barrio_propiedad.name as barrio',
				'localidad_propiedad.name as localidad',
				'localidad_propiedad.name as localidad',
				'localidad_propiedad.name as localidad',
				'tipooperacion.name as operacion'
			)

			->where('publicado',1)
			->where('tipooperacion_id',1)
			->orderby('propiedad.id','desc')->get();
			return view('listadoventa',$data);
		}



		public function getListadoalquiler(){
			$title =DB::table('cms_settings')->where('name','appname')->First();
			$data['title'] = $title->content;
			$data['active'] = 'listadoalquiler';
			$data['listadoalquiler'] = DB::table('propiedad')
			->join('moneda','propiedad.moneda_id','=','moneda.id')
			->join('localidad_propiedad','propiedad.localidad_propiedad_id','=','localidad_propiedad.id')
			->join('tipooperacion','propiedad.tipooperacion_id','=','tipooperacion.id')
			->join('barrio_propiedad','propiedad.barrio_propiedad_id','=','barrio_propiedad.id')
	
			->select(
				'propiedad.*',
				'imagen',
				'titulo',
				'descripcion',
				'precio_compra',
				'precio_compra',
				'moneda',
				'barrio_propiedad.name as barrio',
				'localidad_propiedad.name as localidad',
				'localidad_propiedad.name as localidad',
				'localidad_propiedad.name as localidad',
				'tipooperacion.name as operacion'
			)

			->where('publicado',1)
			->where('tipooperacion_id',2)
			->orderby('propiedad.id','desc')->get();
			return view('listadoalquiler',$data);
		}

		// about
		public function getAbout(){
			$title =DB::table('cms_settings')->where('name','appname')->First();
			$data['title'] = $title->content;
			$data['active'] = 'about';
			$data['about_img'] = DB::table('cms_settings')->where('name','about_us')->first();
			$data['about_desc'] = DB::table('cms_settings')->where('name','description')->first();
			return view('about',$data);
		}
		// contact
		public function getContact(){
			$title =DB::table('cms_settings')->where('name','appname')->First();
			$data['title'] = $title->content;
			$data['active'] = 'contact';
			return view('contact',$data);
		}
		public function postContact(){

			$save['full_name'] = Request::get('first_name').' '.Request::get('last_name');
			$save['email'] = Request::get('email');
			$save['message'] = Request::get('message');
			DB::table('contact_us')->insert($save);

			$data['full_name'] = Request::get('first_name').' '.Request::get('last_name');
			$data['email'] = Request::get('email');
			$data['message'] = Request::get('message');
			CRUDBooster::sendEmail(['to'=>'clemenclay@gmail.com','data'=>$data,'template'=>'formulariocontacto']);
			Session::flash('message', "Mensaje enviado OK");
			return redirect()->back();
			// return response()->json(['success'=>'Data is successfully added']);
		}

	}
?>