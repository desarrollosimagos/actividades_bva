from django.db import models
from django.contrib.auth.models import User

class Departamento(models.Model):
    cod_departamento = models.CharField(max_length=50,)
    nom_departamento = models.CharField(max_length=100,)
    siglas = models.CharField(max_length=100, null=True, blank=True)
    
    #  Auditoria
    user_create = models.ForeignKey(User, null=True, blank=True, related_name='+')
    user_update = models.ForeignKey(User, null=True, blank=True, related_name='+')

