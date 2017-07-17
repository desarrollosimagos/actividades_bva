# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('administrador', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='actividad',
            name='fecha_o',
            field=models.DateField(null=True, blank=True),
            preserve_default=True,
        ),
    ]
