<?php

namespace App\Http\Controllers\Admin;

use App\Admin;
use Session;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class AdminHomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('roles');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //$users = Admin::all();
        $users = Admin::paginate(6);

        return view('admin.index', compact('users'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'nombre' => ['required', 'string', 'max:255'],
            'apellido' => ['required', 'string', 'max:255'],
            'emailpf' => ['required', 'string', 'email', 'max:255', 'unique:pf_cliente'],
            'password' => ['required', 'string', 'min:6', 'confirmed'],
            'perfil_id' => ['required'],
        ],[
            'nombre.required' => 'Ingresa tu nombre',
            'apellido.required' => 'Ingresa tus apellidos',
            'emailpf.required' => 'Ingresa tu correo electrónico',
            'emailpf.email' => 'Ingresa un correo electrónico válido',
            'emailpf.email' => 'Ingresa un correo electrónico válido',
            'perfil_id.required' => 'Asigna un perfil al usuario',
        ]);

        Admin::create($request->all());
        
        Session::flash('message','Usuario creado correctamente');
        return redirect()->route('admin.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
