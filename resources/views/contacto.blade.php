@extends('layouts.app')

@section('title','PF | Contacto')
    
@section('content')
<div class="container mt-5 py-5 font-secondary">
    <div class="row">
        <div class="col-12 col-md-7">
            <h2 class="titulo font-weight-bold pb-1">Contacto</h2>
            <hr>
            <form action="{{ route('contacto.store') }}" method="POST">
                @csrf    <!--Proporciona proteccion de errores xcss y de suplantacion de identidad, se recomienda hacer uso de esta directiva en cada formulario-->
                <div class="form-group pb-3">
                    <input type="text" class="form-control" name="name" placeholder="Nombre: " value="{{ old('name')}}">
                    {!! $errors-> first('name','<span class="text-danger">:message</span><br>') !!}     
                </div>

                <div class="form-group pb-3">
                    <input type="email" class="form-control" name="email" placeholder="Correo electrónico: " value="{{ old('email')}}">
                    {!! $errors-> first('email','<span class="text-danger">:message</span><br>') !!}
                    <small id="helpId" class="text-muted">Ejemplo: ejemplo@dominio.com</small>                    
                </div>

                <div class="form-group pb-3">
                    <label for="">Departamento a quien va dirigido:</label>
                    <select class="form-control" name="department" id="department">
                        <option selected value="0"> Elige una opción </option>
                        <option value="edicion">Edición</option>
                        <option value="fotografos">Fotografía</option>
                        <option value="web">Web</option>
                        <option value="ventas">Ventas</option>
                        <option value="publicidad">Publicidad</option>
                    </select>
                    {!! $errors-> first('department','<span class="text-danger">:message</span><br>') !!}
                </div>         
                              
                <div class="form-group pb-3">
                    <input type="text" class="form-control" name="subject" placeholder="Asunto: " value="{{ old('subject')}}">
                    {!! $errors-> first('subject','<span class="text-danger">:message</span><br>') !!}
                    <small id="helpId" class="text-muted">* Este campo es obligatorio.</small>
                </div>

                <div class="form-group pb-3">
                    <textarea name="message" class="form-control" placeholder="Mensaje: " rows="6" cols="80">{{ old('message')}}</textarea>
                    {!! $errors-> first('message','<span class="text-danger">:message</span><br>') !!}     
                </div>               
                
                <input type="submit" class="btn btn-primary" name="submit" value="Enviar Correo"><br><br>
            </form>    
        </div>
        <div class="col-12 col-md-5 pt-5 pl-5">
             <div class="col-12 col-md-10 pb-4">
                <h5 class="p-1 titulo"><i class="fas fa-phone"></i> Teléfonos</h5>
                <hr>
                <p> Conmutador: +52 55 56362000</p> 
                <p> Ventas: +52 55 56362059</p>
                <p> Fotografía: +52 55 56362016</p>
            </div>
            <div class="col-12 col-md-10 pb-4">
                <h5 class="p-1 titulo"><i class="fas fa-mail-bulk"></i> Email(s): </h5>
                <hr>
                <p>ventas@procesofoto.com.mx/<p>
                <p>foto@procesofoto.com.mx</p>   
            </div>           
        </div>
    </div>
</div>
<div class="container my-5 pb-5">
    <div class="row">
        <div class="col-12 pb-2 col-md-8">
            <h5 class="p-1 titulo"><i class="fas fa-building"></i> Oficinas</h5>
            <hr>
            <iframe class="pl-5 py-5" src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d240882.46112047488!2d-99.30450260406086!3d19.378310437206675!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x85d1ff9c6916e7fb%3A0x638f146617d0d207!2sComunicacion+E+Informacion+S.A.+de+C.V.!5e0!3m2!1ses-419!2smx!4v1550781994001" width="700" height="450" frameborder="0" allowfullscreen></iframe>
        </div>
        <div class="col-12 pb-2 col-md-4">
            <h5 class="p-1 titulo"><i class="fas fa-map-marked-alt"></i> Ubicación</h5>
            <hr>
            <p>Fresas 13, Tlacoquemecatl del Valle</p>
            <p>C.P. 03100  Benito Juarez, CDMX</p>
        </div>
    </div>
</div>

@endsection