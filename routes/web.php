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

////////////////   Rutas de autenticación del usuario               ////////////////////////////

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

///////////////    Rutas de autenticación del administrador         ////////////////////////////

Route::get('admin/login', 'Admin\AdministratorController@showLoginForm')->name('admin.login');
Route::post('admin/login', 'Admin\AdministratorController@login');
Route::post('admin/logout', 'Admin\AdministratorController@logout')->name('admin.logout');

//Route::get('/admin/index', 'Admin\AdminHomeController@index');

//CRUD Usuarios

Route::resource('admin','Admin\AdminHomeController');



