from django.contrib.auth.models import User
from django.db import models
from apps.configuraciones.models import Departamento


class UsuarioDepart(models.Model):

    grupo_usuario = models.IntegerField(null=True, blank=True)
    usuario = models.OneToOneField(User, null=True)
    departamento = models.ForeignKey(Departamento, null=True)
    def __unicode__(self):
        return self.usuario