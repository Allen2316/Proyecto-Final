package com.example.appfinal.service;
import com.example.appfinal.modelo.Estudiante;
import com.example.appfinal.modelo.Materia;

import java.util.List;
import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.Field;
import retrofit2.http.FormUrlEncoded;
import retrofit2.http.GET;
import retrofit2.http.POST;
import retrofit2.http.PUT;
import retrofit2.http.Path;

public interface ServiceAPI {

    //Materias
    @GET("getMateria/")
    Call< List<Materia> > list();

    @POST("getMateria/")
    Call<Materia> post(@Body Materia materia);

    @PUT("getMateria/{nombre}/")
    Call<Materia> put(@Path("nombre") @Body Materia materia);

    @GET("getMateria/{nombre}")
    Call<Materia> get(@Path("nombre") String nombre);



    //estudiantes
    @GET("getEstudiante/")
    Call< List<Estudiante> > listaEstudiantes();

    @POST("getEstudiante/")
    Call<Estudiante> postEstudiante(@Body Estudiante estudiante);

    @PUT("getEstudiante/{cedula}/")
    Call<Materia> putEstudiante(@Path("nombre") @Body Estudiante estudiante);

    @GET("getEstudiante/{cedula}")
    Call<Estudiante> getEstudiante(@Path("cedula") String cedula);
}