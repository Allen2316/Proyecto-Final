package com.example.appfinal.estudiante;

import androidx.appcompat.app.AppCompatActivity;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.Toast;

import com.example.appfinal.R;
import com.example.appfinal.VistaGeneral;
import com.example.appfinal.modelo.Estudiante;
import com.example.appfinal.service.ServiceAPI;

import java.util.ArrayList;
import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class estudiante_index extends AppCompatActivity {
    private static final String BASE_URL = "https://proyectofinaldjango.herokuapp.com/api/v1/";

    private ArrayAdapter arrayAdapter;
    private Button btnNuevo, btnRecargar;
    ListView list;
    ArrayList<String> titles = new ArrayList<>();

    @SuppressLint("WrongViewCast")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_estudiante_index);
        arrayAdapter = new ArrayAdapter(this, android.R.layout.simple_list_item_1, titles);
        list = findViewById(R.id.listaEstudiante);
        list.setAdapter(arrayAdapter);
        listarEstudiantes();

        btnNuevo = findViewById(R.id.btnNuevoEstu);
        btnRecargar = findViewById(R.id.btnReloadEstu);
        btnNuevo.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(estudiante_index.this, estudiante_form.class);
                startActivity(intent);
            }
        });

        btnRecargar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                listarEstudiantes();
                arrayAdapter.clear();
                arrayAdapter = new ArrayAdapter(estudiante_index.this, android.R.layout.simple_list_item_1, titles);
                list.setAdapter(arrayAdapter);
                arrayAdapter.notifyDataSetChanged();
            }
        });
    }


    private void listarEstudiantes() {
        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl(BASE_URL)
                .addConverterFactory(GsonConverterFactory.create())
                .build();
        ServiceAPI postService = retrofit.create(ServiceAPI.class);
        Call<List<Estudiante>> call = postService.listaEstudiantes();
        call.enqueue(new Callback<List<Estudiante>>() {
            @Override
            public void onResponse(Call<List<Estudiante>> call, Response<List<Estudiante>> response) {
                for (Estudiante estudiante : response.body()) {
                    titles.add(estudiante.getEstudiante_id() + " ~ " + estudiante.getCedula()
                            + " " + estudiante.getNombres()  + " " + estudiante.getCorreo());
                }
                arrayAdapter.notifyDataSetChanged();
            }

            @Override
            public void onFailure(Call<List<Estudiante>> call, Throwable t) {
                Toast.makeText(getApplicationContext(), "Error por: " + t.getMessage(), Toast.LENGTH_LONG).show();
            }
        });
    }

}