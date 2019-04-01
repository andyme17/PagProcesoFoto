<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

//Insertar nuevos usuarios con route
/*
Route::get('test',function(){
    $user = new App\Admin;
    $user->nombre = 'Andrea';
    $user->apellido = 'Morales';
    $user->emailpf = 'andrea@mail.com';
    $user->password = bcrypt('pruebas123');
    $user->perfil_id = 2;
    $user->save();

    return $user;
});*/


Route::view('aviso','aviso')->name('aviso');//muestra el aviso legal

Route::view('/','principal')->name('inicio');
Route::view('coberturas','coberturas')->name('coberturas');
Route::view('colecciones','colecciones')->name('colecciones');
Route::view('fotografos','fotografos')->name('fotografos');
Route::view('aviso','aviso')->name('aviso');

Route::get('contacto','MessagesController@create')->name('contacto.create');
Route::post('contacto','MessagesController@store')->name('contacto.store');

/////////////////////////////////////////////////////////////////////////////////////////////////
////////////////   Rutas de autenticación del usuario               ////////////////////////////

//Auth::routes();

// Authentication Routes...
Route::get('login', 'Auth\LoginController@showLoginForm')->name('login');
Route::post('login', 'Auth\LoginController@login');
Route::post('logout', 'Auth\LoginController@logout')->name('logout');

// Registration Routes...
if ($options['register'] ?? true) {
    Route::get('register', 'Auth\RegisterController@showRegistrationForm')->name('register');
    Route::post('register', 'Auth\RegisterController@register');
}

// Password Reset Routes...
if ($options['reset'] ?? true) {
    $this->resetPassword();
}

// Email Verification Routes...
if ($options['verify'] ?? false) {
    $this->emailVerification();
}

Route::get('/home', 'HomeController@index')->name('home');

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////   Rutas de autenticación del administrador              ////////////////////////////

// Authentication Routes...
Route::get('admin', 'Admin\AdministratorController@showLoginForm')->name('admin.login');
Route::post('admin', 'Admin\AdministratorController@login');

Route::get('/admin_home', 'Admin\AdminHomeController@index');

//Route::post('logout', 'Auth\LoginController@logout')->name('logout');



