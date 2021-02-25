# Generated by Django 3.1.7 on 2021-02-19 18:03

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Estudiante',
            fields=[
                ('Estudiante_id', models.AutoField(primary_key=True, serialize=False)),
                ('cedula', models.CharField(max_length=10, unique=True)),
                ('nombres', models.CharField(max_length=70)),
                ('apellidos', models.CharField(max_length=70)),
                ('genero', models.CharField(choices=[('femenino', 'Femenino'), ('masculino', 'Masculino')], default='femenino', max_length=20)),
                ('estadoCivil', models.CharField(choices=[('soltero', 'Soltero'), ('casado', 'Casado'), ('divorciado', 'Divorciado'), ('viudo', 'Viudo'), ('separado', 'Separado')], max_length=20)),
                ('correo', models.CharField(max_length=105)),
                ('celular', models.CharField(max_length=15)),
                ('direccion', models.TextField(max_length=200)),
                ('date_created', models.DateTimeField(auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name='Materia',
            fields=[
                ('materia_id', models.AutoField(primary_key=True, serialize=False)),
                ('nombre', models.CharField(max_length=70)),
                ('nota1', models.DecimalField(decimal_places=2, max_digits=10)),
                ('nota2', models.DecimalField(decimal_places=2, max_digits=10)),
                ('nota3', models.DecimalField(decimal_places=2, max_digits=10)),
                ('promedio', models.DecimalField(decimal_places=2, max_digits=10)),
                ('estado', models.BooleanField(default=True)),
                ('date_created', models.DateTimeField(auto_now_add=True)),
                ('Estudiante', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='modelo.estudiante')),
            ],
        ),
    ]