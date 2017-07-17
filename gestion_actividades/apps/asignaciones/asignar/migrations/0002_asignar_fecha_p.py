# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('asignar', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='asignar',
            name='fecha_p',
            field=models.DateField(null=True, blank=True),
            preserve_default=True,
        ),
    ]
