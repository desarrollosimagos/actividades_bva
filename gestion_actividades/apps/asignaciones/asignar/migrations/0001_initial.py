# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('administrador', '0001_initial'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('configuraciones', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Asignar',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('codigoA', models.CharField(max_length=50, null=True, blank=True)),
                ('nom_actividad', models.TextField(max_length=300)),
                ('fecha_i', models.DateField()),
                ('fechaP_a', models.DateField()),
                ('indicaciones', models.TextField(max_length=300, null=True, blank=True)),
                ('cod_actividad', models.ForeignKey(to='administrador.Actividad')),
                ('codigoDepartamento', models.ForeignKey(related_name=b'actividad_departamento', blank=True, to='configuraciones.Departamento', null=True)),
                ('codigoDepartamentoA', models.ForeignKey(related_name=b'asignar_departamento', blank=True, to='configuraciones.Departamento', null=True)),
                ('user_create', models.ForeignKey(related_name=b'+', blank=True, to=settings.AUTH_USER_MODEL, null=True)),
                ('user_update', models.ForeignKey(related_name=b'+', blank=True, to=settings.AUTH_USER_MODEL, null=True)),
            ],
            options={
                'ordering': ('fecha_i',),
            },
            bases=(models.Model,),
        ),
    ]
