from django.db import models
from apps.registro.administrador.models import Actividad
from apps.configuraciones.models import Departamento
from django.contrib.auth.models import User

ESTATUS = (
    ('0', "Seleccione"),
    ('1', 'Activo'),
    ('2', 'Inactivo'),
)

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

class Registros(models.Model):
    
    cod_actividad = models.ForeignKey(Actividad)
    cod_departamento = models.ForeignKey(Departamento, null=True, blank=True)
    nom_actividad = models.CharField(max_length=100)
    des_actividad = models.TextField(max_length=300)
    porcentaje = models.CharField(choices=PORCENTAJE, default=0, max_length=3)
    status     = models.CharField(choices=ESTATUS, default=0, max_length=1)
    fecha_i    = models.DateField(auto_now_add=False, auto_now=False)
    fecha_p    = models.DateField(auto_now_add=False, auto_now=False)
    fecha_f    = models.DateField(auto_now_add=False, auto_now=False, null=True, blank=True)
    observacion = models.TextField(null=True, blank=True)
    fecha_o    = models.DateField(auto_now_add=False, auto_now=False, null=True, blank=True)
        
    #  Auditoria
    user_create = models.ForeignKey(User, null=True, blank=True, related_name='+')
    user_update = models.ForeignKey(User, null=True, blank=True, related_name='+')
    
    class Meta:
        """ Ordena los registros en base a el campo cod_estado."""
        ordering = ('cod_actividad',)  # Ordenado por

    def __unicode__(self):
        return self.cod_actividad

