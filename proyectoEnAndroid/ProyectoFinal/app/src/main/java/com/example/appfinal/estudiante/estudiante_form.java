package com.example.appfinal.estudiante;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.view.ViewGroup.LayoutParams;
import android.widget.RelativeLayout;
import android.widget.Spinner;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.example.appfinal.R;
import com.example.appfinal.modelo.Estudiante;
import com.example.appfinal.modelo.Materia;
import com.example.appfinal.service.ServiceAPI;
import com.google.gson.annotations.SerializedName;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class estudiante_form extends AppCompatActivity {
    Spinner genero, eCivil;
    CheckBox ch ;
    EditText cedula, nombres, apellidos, correo, celular, direccion;
    Button btnGuardar;
    private static final String BASE_URL = "https://proyectofinaldjango.herokuapp.com/api/v1/";
    ArrayList<String> materias = new ArrayList<>();
    ArrayList<Integer> materiasID = new ArrayList<>();
    int[]ma={} ;
    int cont=0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_estudiante_form);

        //
        cedula = findViewById(R.id.txtCedulaFrm);
        nombres = findViewById(R.id.txtNombresFrm);
        apellidos = findViewById(R.id.txtApellidosFrm);
        celular = findViewById(R.id.txtCelularFrm);
        correo = findViewById(R.id.txtEmailFrm);
        direccion = findViewById(R.id.txtDireccionFrm);
        btnGuardar = findViewById(R.id.btnGuardarFrm);

        //
        listaOpciones();
        listaMaterias();
        btnGuardar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                post();
            }
        });

    }


    private void post() {
        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl(BASE_URL)
                .addConverterFactory(GsonConverterFactory.create())
                .build();
        ServiceAPI postService = retrofit.create(ServiceAPI.class);
        String ced = cedula.getText().toString();
        String nom = nombres.getText().toString();
        String ape = apellidos.getText().toString();
        String gen =genero.getSelectedItem().toString().toLowerCase();
        String estaC=eCivil.getSelectedItem().toString().toLowerCase() ;
        String corr=correo.getText().toString();
        String cel=celular.getText().toString();
        String dir=direccion.getText().toString();

        if (ced.length() > 0 && nom.length()>0 && ape.length()>0 && gen.length()>0 &&
            estaC.length()>0 && corr.length()>0 && cel.length()>0 && dir.length()>0){
            Estudiante es = new Estudiante();
            es.setApellidos(apellidos.getText().toString());
            es.setCedula(cedula.getText().toString());
            es.setCelular(celular.getText().toString());
            es.setCorreo(correo.getText().toString());
            es.setDireccion(direccion.getText().toString());
            es.setEstadoCivil(eCivil.getSelectedItem().toString().toLowerCase());
            es.setGenero(genero.getSelectedItem().toString().toLowerCase());
            es.setMateria(ma);
            es.setNombres(nombres.getText().toString());

            Call<Estudiante> call = postService.postEstudiante(es);
            call.enqueue(new Callback<Estudiante>() {
                @Override
                public void onResponse(Call<Estudiante> call, Response<Estudiante> response) {
                    if (response.isSuccessful()) {
                        Toast.makeText(getApplicationContext(), "Agregado con exito", Toast.LENGTH_LONG).show();
                    }else{
                        Log.println(Log.INFO,"infoaaaa ",""+response.errorBody().toString());
                        Toast.makeText(getApplicationContext(), "Algo paso "+response.errorBody(), Toast.LENGTH_LONG).show();
                    }
                }

                @Override
                public void onFailure(Call<Estudiante> call, Throwable t) {
                    Toast.makeText(getApplicationContext(), "Error al agregar por: " + t.getMessage(), Toast.LENGTH_LONG).show();
                }
            });
        }else {
            Toast.makeText(getApplicationContext(), "Todos los campos son Obligatorios", Toast.LENGTH_LONG).show();
        }
    }

    private void listaOpciones() {
        genero = findViewById(R.id.spinnerGenero);
        eCivil = findViewById(R.id.spinnerECivil);

        ArrayAdapter<CharSequence> adapterGe = ArrayAdapter.createFromResource(this, R.array.listaGenero, android.R.layout.simple_list_item_1);
        genero.setAdapter(adapterGe);
        ArrayAdapter<CharSequence> adapterEC = ArrayAdapter.createFromResource(this, R.array.listaECivil, android.R.layout.simple_list_item_1);
        eCivil.setAdapter(adapterEC);
    }


    private void listaMaterias() {
        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl(BASE_URL)
                .addConverterFactory(GsonConverterFactory.create())
                .build();
        ServiceAPI postService = retrofit.create(ServiceAPI.class);
        Call<List<Materia>> call = postService.list();
        call.enqueue(new Callback<List<Materia>>() {
            @Override
            public void onResponse(Call<List<Materia>> call, Response<List<Materia>> response) {
                if (response.isSuccessful()) {
                    LinearLayout seccionIndustria = findViewById(R.id.formEst);

                    for (Materia materia : response.body()) {
                        Log.println(Log.INFO, "materiaaaaas==", materia.getNombre());
                        CheckBox opcion = new CheckBox(estudiante_form.this);
                        opcion.setLayoutParams(
                                new LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT));
                        opcion.setId(materia.getMateria_id());
                        Log.println(Log.INFO,"idchec ",""+opcion.getId());
                        opcion.setText(materia.getNombre());
                        seccionIndustria.addView(opcion);
                    }
                }

            }
            @Override
            public void onFailure(Call<List<Materia>> call, Throwable t) {
                Toast.makeText(getApplicationContext(), "Error al listar materias: " + t.getMessage(), Toast.LENGTH_LONG).show();
            }
        });

    }
}