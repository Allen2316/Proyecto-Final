package com.example.appfinal.modelo;

import com.google.gson.annotations.SerializedName;

public class Estudiante {

    @SerializedName("estudiante_id")
    private int estudiante_id;
    @SerializedName("cedula")
    private String cedula;
    @SerializedName("nombres")
    private String nombres;
    @SerializedName("apellidos")
    private String apellidos;
    @SerializedName("genero")
    private String genero;
    @SerializedName("estadoCivil")
    private String estadoCivil;
    @SerializedName("correo")
    private String correo;
    @SerializedName("celular")
    private String celular;
    @SerializedName("direccion")
    private String direccion;
    @SerializedName("materia")
    private int[] materia;

    public Estudiante() {
    }

    public Estudiante(int estudiante_id, String cedula, String nombres,
                      String apellidos, String genero, String estadoCivil,
                      String correo, String celular, String direccion, int[] materia) {
        this.estudiante_id = estudiante_id;
        this.cedula = cedula;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.genero = genero;
        this.estadoCivil = estadoCivil;
        this.correo = correo;
        this.celular = celular;
        this.direccion = direccion;
        this.materia = materia;
    }

    public int getEstudiante_id() {
        return estudiante_id;
    }

    public void setEstudiante_id(int estudiante_id) {
        this.estudiante_id = estudiante_id;
    }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getEstadoCivil() {
        return estadoCivil;
    }

    public void setEstadoCivil(String estadoCivil) {
        this.estadoCivil = estadoCivil;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int[] getMateria() {
        return materia;
    }

    public void setMateria(int[] materia) {
        this.materia = materia;
    }
}
