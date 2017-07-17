# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('configuraciones', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='UsuarioDepart',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('grupo_usuario', models.IntegerField(null=True, blank=True)),
                ('departamento', models.OneToOneField(null=True, to='configuraciones.Departamento')),
                ('usuario', models.OneToOneField(null=True, to=settings.AUTH_USER_MODEL)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
    ]
