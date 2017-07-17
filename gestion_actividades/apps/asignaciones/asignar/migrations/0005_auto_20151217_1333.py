# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('asignar', '0004_auto_20151119_1421'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='asignar',
            options={'ordering': ('codigoA',)},
        ),
    ]
