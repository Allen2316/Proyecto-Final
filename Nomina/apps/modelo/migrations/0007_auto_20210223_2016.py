# Generated by Django 3.1.7 on 2021-02-24 01:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('modelo', '0006_auto_20210223_1636'),
    ]

    operations = [
        migrations.AddField(
            model_name='estudiante',
            name='estudiante',
            field=models.ManyToManyField(blank=True, to='modelo.Materia'),
        ),
        migrations.DeleteModel(
            name='AsigMateria',
        ),
    ]