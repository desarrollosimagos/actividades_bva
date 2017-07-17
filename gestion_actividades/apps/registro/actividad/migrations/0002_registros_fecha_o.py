# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('actividad', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='registros',
            name='fecha_o',
            field=models.DateField(null=True, blank=True),
            preserve_default=True,
        ),
    ]
