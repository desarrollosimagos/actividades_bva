# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('configuraciones', '0002_departamento_siglas'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('administrador', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Registros',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('nom_actividad', models.CharField(max_length=100)),
                ('des_actividad', models.TextField(max_length=300)),
                ('porcentaje', models.CharField(default=0, max_length=3, choices=[(b'0', b'Seleccione'), (b'1', b'10%'), (b'2', b'20%'), (b'3', b'30%'), (b'4', b'40%'), (b'5', b'50%'), (b'6', b'60%'), (b'7', b'70%'), (b'8', b'80%'), (b'9', b'90%'), (b'10', b'100%')])),
                ('status', models.CharField(default=0, max_length=1, choices=[(b'0', b'Seleccione'), (b'1', b'Activo'), (b'2', b'Inactivo')])),
                ('fecha_i', models.DateField()),
                ('fecha_p', models.DateField()),
                ('fecha_f', models.DateField(null=True, blank=True)),
                ('observacion', models.TextField(null=True, blank=True)),
                ('cod_actividad', models.ForeignKey(to='administrador.Actividad')),
                ('cod_departamento', models.ForeignKey(blank=True, to='configuraciones.Departamento', null=True)),
                ('user_create', models.ForeignKey(related_name='+', blank=True, to=settings.AUTH_USER_MODEL, null=True)),
                ('user_update', models.ForeignKey(related_name='+', blank=True, to=settings.AUTH_USER_MODEL, null=True)),
            ],
            options={
                'ordering': ('cod_actividad',),
            },
            bases=(models.Model,),
        ),
    ]
