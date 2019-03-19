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
Route::view('/','principal')->name('inicio');//se utiliza para paginas que solo muestren contenido html
Route::view('coberturas','coberturas')->name('coberturas');
Route::view('colecciones','colecciones')->name('colecciones');
Route::view('fotografos','fotografos')->name('fotografos');
Route::view('aviso','aviso')->name('aviso');//muestra el aviso legal
//Route::view('login','login')->name('inicio_sesion');
//Route::view('registro','registro')->name('registro');

Route::get('contacto','MessagesController@create')->name('contacto.create');
Route::post('contacto','MessagesController@store')->name('contacto.store');

//Route::get('/contact','contactController@show')->name('contacto');
//Route::post('/contact','contactController@store')->name('contacto.form');

//Route::get('login','Auth\LoginController@showLoginForm')->name('inicio_sesion');
//Route::post('login','Auth\LoginController@login');

//Auth::routes();

//Tabla Usuarios
Route::get('/pruebas','UsuarioController@create')->name('usuarios');
Route::post('/pruebas','UsuarioController@store');

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
Route::get('/home', 'Auth\LoginController@authenticated')->name('datos-session');


