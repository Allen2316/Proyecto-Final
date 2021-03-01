package com.example.appfinal.modelo;
import com.google.gson.annotations.SerializedName;
public class Materia {
    @SerializedName("materia_id")
    private int materia_id;
    @SerializedName("nombre")
    private String nombre;

    public Materia() {
    }

    public Materia(int materia_id, String nombre) {
        this.materia_id = materia_id;
        this.nombre = nombre;
    }

    public int getMateria_id() {
        return materia_id;
    }

    public void setMateria_id(int materia_id) {
        this.materia_id = materia_id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
