# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('asignar', '0003_asignar_des_actividad'),
    ]

    operations = [
        migrations.AddField(
            model_name='asignar',
            name='fecha_f',
            field=models.DateField(null=True, blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='asignar',
            name='porcentaje',
            field=models.CharField(default=0, max_length=3, null=True, blank=True, choices=[(b'0', b'Seleccione'), (b'1', b'10%'), (b'2', b'20%'), (b'3', b'30%'), (b'4', b'40%'), (b'5', b'50%'), (b'6', b'60%'), (b'7', b'70%'), (b'8', b'80%'), (b'9', b'90%'), (b'10', b'100%')]),
            preserve_default=True,
        ),
    ]
