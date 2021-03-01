package com.example.appfinal;

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

import com.example.appfinal.estudiante.estudiante_form;
import com.example.appfinal.estudiante.estudiante_index;
import com.example.appfinal.materia.materia_index;
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

public class VistaGeneral extends AppCompatActivity {
    private static final String BASE_URL = "https://proyectofinaldjango.herokuapp.com/api/v1/";

    
    private Button btnVerEst, btnVerMa;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_vista_general);

        btnVerEst = findViewById(R.id.btnVerEst);
        btnVerMa = findViewById(R.id.btnVerMat);
        btnVerEst.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(VistaGeneral.this, estudiante_index.class);
                startActivity(intent);
            }
        });

        btnVerMa.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(VistaGeneral.this, materia_index.class);
                startActivity(intent);
            }
        });
    }





}
