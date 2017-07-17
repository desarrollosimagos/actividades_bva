from django.db import models
from apps.registro.administrador.models import Actividad
from apps.configuraciones.models import Departamento
from django.contrib.auth.models import User

PORCENTAJE = (
    ('0', "Seleccione"),
    ('1', '10%'),
    ('2', '20%'),
    ('3', '30%'),
    ('4', '40%'),
    ('5', '50%'),
    ('6', '60%'),
    ('7', '70%'),
    ('8', '80%'),
    ('9', '90%'),
    ('10', '100%'),
)

class Asignar(models.Model):
    
    codigoA = models.CharField(max_length=50, null=True, blank=True)
    cod_actividad = models.ForeignKey(Actividad)
    codigoDepartamento = models.ForeignKey(Departamento, related_name='actividad_departamento', null=True, blank=True)
    codigoDepartamentoA = models.ForeignKey(Departamento, related_name='asignar_departamento', null=True, blank=True)
    nom_actividad  = models.TextField(max_length=300)
    des_actividad = models.TextField(max_length=300, null=True, blank=True)
    fecha_i    = models.DateField(auto_now_add=False, auto_now=False)
    fecha_p    = models.DateField(auto_now_add=False, auto_now=False, null=True, blank=True)
    fechaP_a    = models.DateField(auto_now_add=False, auto_now=False)
    indicaciones   = models.TextField(max_length=300, null=True, blank=True)
    porcentaje = models.CharField(choices=PORCENTAJE, default=0, max_length=3, null=True, blank=True)
    fecha_f    = models.DateField(auto_now_add=False, auto_now=False, null=True, blank=True)
    
    #  Auditoria
    user_create = models.ForeignKey(User, null=True, blank=True, related_name='+')
    user_update = models.ForeignKey(User, null=True, blank=True, related_name='+')
    
    class Meta:
        """ Ordena los registros en base a el campo fechaI_a."""
        ordering = ('codigoA',)  # Ordenado por

    def __unicode__(self):
        return self.codigoA

