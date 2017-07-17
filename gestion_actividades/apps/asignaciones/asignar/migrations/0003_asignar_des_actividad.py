# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('asignar', '0002_asignar_fecha_p'),
    ]

    operations = [
        migrations.AddField(
            model_name='asignar',
            name='des_actividad',
            field=models.TextField(max_length=300, null=True, blank=True),
            preserve_default=True,
        ),
    ]
