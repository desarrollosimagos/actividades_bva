# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('configuraciones', '0002_departamento_siglas'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('administrador', '0003_actividad_fecha_f'),
    ]

    operations = [
        migrations.CreateModel(
            name='Empleados',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('codigoE', models.CharField(max_length=50)),
                ('nom_actividad_e', models.TextField(max_length=300, null=True, blank=True)),
                ('des_actividad_e', models.TextField(max_length=300, null=True, blank=True)),
                ('fecha_i_e', models.DateField(null=True, blank=True)),
                ('fecha_p_e', models.DateField(null=True, blank=True)),
                ('fechaP_a_e', models.DateField(null=True, blank=True)),
                ('indicaciones_e', models.TextField(max_length=300, null=True, blank=True)),
                ('porcentaje', models.CharField(default=0, max_length=3, null=True, blank=True, choices=[(b'0', b'Seleccione'), (b'1', b'10%'), (b'2', b'20%'), (b'3', b'30%'), (b'4', b'40%'), (b'5', b'50%'), (b'6', b'60%'), (b'7', b'70%'), (b'8', b'80%'), (b'9', b'90%'), (b'10', b'100%')])),
                ('cod_actividad_e', models.ForeignKey(blank=True, to='administrador.Actividad', null=True)),
                ('codigoDepartamento_e', models.ForeignKey(related_name='empleado_departamento', blank=True, to='configuraciones.Departamento', null=True)),
                ('empleados', models.ForeignKey(related_name='*', blank=True, to=settings.AUTH_USER_MODEL, null=True)),
                ('user_create', models.ForeignKey(related_name='+', blank=True, to=settings.AUTH_USER_MODEL, null=True)),
                ('user_update', models.ForeignKey(related_name='+', blank=True, to=settings.AUTH_USER_MODEL, null=True)),
            ],
            options={
                'ordering': ('codigoE',),
            },
            bases=(models.Model,),
        ),
    ]
