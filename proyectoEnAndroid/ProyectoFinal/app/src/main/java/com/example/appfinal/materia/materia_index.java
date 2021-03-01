package com.example.appfinal.materia;

import androidx.appcompat.app.AppCompatActivity;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Toast;

import com.example.appfinal.R;
import com.example.appfinal.VistaGeneral;
import com.example.appfinal.estudiante.estudiante_index;
import com.example.appfinal.modelo.Estudiante;
import com.example.appfinal.modelo.Materia;
import com.example.appfinal.service.ServiceAPI;

import java.util.ArrayList;
import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class materia_index extends AppCompatActivity {
    private static final String BASE_URL = "https://proyectofinaldjango.herokuapp.com/api/v1/";

    private EditText txtNombreAsignatura;
    private ArrayAdapter arrayAdapter;
    private Button btnAgregar, btnRecargar;
    ListView list;
    ArrayList<String> titles = new ArrayList<>();

    @SuppressLint("WrongViewCast")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_materia_index);
        txtNombreAsignatura = findViewById(R.id.txtNombreMateria);

        arrayAdapter = new ArrayAdapter(this, android.R.layout.simple_list_item_1, titles);
        list = findViewById(R.id.lista);
        list.setAdapter(arrayAdapter);
        listar();

        btnAgregar = findViewById(R.id.btnRegistrar);
        btnRecargar = findViewById(R.id.btnRecargar);
        btnAgregar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                post();
            }
        });

        btnRecargar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                listar();
                arrayAdapter.clear();
                arrayAdapter = new ArrayAdapter(materia_index.this, android.R.layout.simple_list_item_1, titles);
                list.setAdapter(arrayAdapter);
                arrayAdapter.notifyDataSetChanged();
            }
        });
    }

    private void listar() {
        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl(BASE_URL)
                .addConverterFactory(GsonConverterFactory.create())
                .build();
        ServiceAPI postService = retrofit.create(ServiceAPI.class);
        Call<List<Materia>> call = postService.list();
        call.enqueue(new Callback<List<Materia>>() {
            @Override
            public void onResponse(Call<List<Materia>> call, Response<List<Materia>> response) {
                for (Materia materia : response.body()) {
                    titles.add(materia.getMateria_id() + " " + materia.getNombre());
                }
                arrayAdapter.notifyDataSetChanged();
            }

            @Override
            public void onFailure(Call<List<Materia>> call, Throwable t) {
                Toast.makeText(getApplicationContext(), "Error por: " + t.getMessage(), Toast.LENGTH_LONG).show();
            }
        });
    }

    private void post() {
        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl(BASE_URL)
                .addConverterFactory(GsonConverterFactory.create())
                .build();
        ServiceAPI postService = retrofit.create(ServiceAPI.class);
        Materia materia = new Materia();
        if (txtNombreAsignatura.getText().length() > 0){
            materia.setNombre(txtNombreAsignatura.getText().toString());
            Call<Materia> call = postService.post(materia);
            call.enqueue(new Callback<Materia>() {
                @Override
                public void onResponse(Call<Materia> call, Response<Materia> response) {
                    if (response.isSuccessful()) {
                        Toast.makeText(getApplicationContext(), "agregado con exito", Toast.LENGTH_LONG).show();
                    }
                }

                @Override
                public void onFailure(Call<Materia> call, Throwable t) {
                    Toast.makeText(getApplicationContext(), "Error por: " + t.getMessage(), Toast.LENGTH_LONG).show();
                }
            });
        }else {
            Toast.makeText(getApplicationContext(), "Todos los campos son Obligatorios", Toast.LENGTH_LONG).show();
        }

    }

}