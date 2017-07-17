# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('usuario_depart', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='usuariodepart',
            name='departamento',
            field=models.ForeignKey(to='configuraciones.Departamento', null=True),
        ),
    ]
