from django.db import models
from django.contrib.auth.models import User
from apps.configuraciones.models import Departamento
from apps.registro.administrador.models import Actividad
from apps.usuario_depart.models import UsuarioDepart

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


class Empleados(models.Model):
    
    codigoE = models.CharField(max_length=50)
    cod_actividad_e = models.ForeignKey(Actividad, null=True, blank=True)
    codigoDepartamento_e = models.ForeignKey(Departamento, related_name='empleado_departamento', null=True, blank=True)
    empleados = models.ForeignKey(User, related_name='*', null=True, blank=True)
    nom_actividad_e = models.TextField(max_length=300, null=True, blank=True)
    des_actividad_e = models.TextField(max_length=300, null=True, blank=True)
    fecha_i_e = models.DateField(auto_now_add=False, auto_now=False, null=True, blank=True)
    fecha_p_e = models.DateField(auto_now_add=False, auto_now=False, null=True, blank=True)
    fechaP_a_e = models.DateField(auto_now_add=False, auto_now=False, null=True, blank=True)
    indicaciones_e = models.TextField(max_length=300, null=True, blank=True)
    porcentaje = models.CharField(choices=PORCENTAJE, default=0, max_length=3, null=True, blank=True)
   
    
    #  Auditoria
    user_create = models.ForeignKey(User, null=True, blank=True, related_name='+')
    user_update = models.ForeignKey(User, null=True, blank=True, related_name='+')
    
    class Meta:
        """ Ordena los registros en base a el campo fechaI_a."""
        ordering = ('codigoE',)  # Ordenado por

    def __unicode__(self):
        return self.codigoE

