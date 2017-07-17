from django.views.generic import CreateView, ListView, UpdateView
from django.core.urlresolvers import reverse_lazy
from .models import Empleados
from apps.registro.administrador.models import Actividad
from apps.registro.actividad.models import Registros
from django.contrib.auth.models import User
from apps.usuario_depart.models import UsuarioDepart
from apps.configuraciones.models import Departamento
from django.http import HttpResponse, HttpResponseRedirect
from django.core import serializers
from django.shortcuts import render_to_response
from django.template import RequestContext
from django.db import connection
import time
import json
from django.db.models import Q
import re

class RegistrarEmpleados(CreateView):
    template_name = 'registros/empleados/empleados_tareas.html'
    model = Empleados
    success_url = reverse_lazy("listado_emp")
    
    def get_context_data(self, **kwargs):
        context = super(RegistrarEmpleados, self).get_context_data(**kwargs)
        
        usuario = self.request.user
        departamento_id = usuario.usuariodepart.departamento_id
        ##grupo_id = usuario.usuariodepart.grupo_usuario
        
        actividades = Registros.objects.all()
        actividades_f = actividades.filter(cod_departamento_id=departamento_id) 
        actividades_v =  actividades_f.values('cod_actividad__id','cod_actividad__cod_actividad')
        
        codigoE = Empleados.objects.order_by('-id').values('codigoE')[:1] # ordenar de forma decendente y traer solo 
        if codigoE.count() > 0:
            codigoE = re.findall(r'\d+', codigoE[0]['codigoE']) # extraer solo numeros 
            codigoE =  int(codigoE[0]) # convertir a entero osea eliminar los 0 a las izquierda
            codigoE = "E"+str(codigoE+1).zfill(4) # sumo 1 y  rellenar con 4 "0" a la izquierda
        else:
            codigoE = "E"+str(codigoE.count()+1).zfill(4) 

        empleados = UsuarioDepart.objects.all().filter(departamento_id=departamento_id, grupo_usuario=3)
        empleados_id = empleados.values('usuario_id')
      
        emple = User.objects.all().filter(id=empleados_id)
        
        context['codigoE'] = codigoE
        context['usuario_E'] = usuario
        context['lista_emp'] = emple
        context['actividad_e'] = actividades_v
        return context
    
    def post(self, request, *args, **kwargs):
        
        codigo = request.POST.get('codigoE')
        
        existe_codigo = Empleados.objects.filter(codigoE=codigo).exists()
        
        if existe_codigo:
            return HttpResponse('existe_cod')
        else:
            
            form_class = self.get_form_class()
            form = self.get_form(form_class)
            
            if form.is_valid():
                
                
                add = form.save(commit=False)
                add.save()
                
                return HttpResponse('/menu/empleados/asignar_tareas/listado_emp/')
            
class ListarEmpleados(ListView):
    template_name = 'registros/empleados/lista_empleados.html'
    model = Empleados
    context_object_name = "lista_empleados"
    
class ActualizarEmpleados(UpdateView):
    template_name = 'registros/empleados/empleados_editar.html'
    model = Empleados
    success_url = reverse_lazy("listado_emp")
    context_object_name = "empleados_act" 
    
    def get_context_data(self, **kwargs):
        context = super(ActualizarEmpleados, self).get_context_data(**kwargs)
        
        usuario = self.request.user
        departamento_id = usuario.usuariodepart.departamento_id
        
        actividades = Registros.objects.all()
        actividades_f = actividades.filter(cod_departamento_id=departamento_id) 
        actividades_v =  actividades_f.values('cod_actividad__id','cod_actividad__cod_actividad')
        
        codigoE = Empleados.objects.order_by('-id').values('codigoE')[:1] # ordenar de forma decendente y traer solo 
        if codigoE.count() > 0:
            codigoE = re.findall(r'\d+', codigoE[0]['codigoE']) # extraer solo numeros 
            codigoE =  int(codigoE[0]) # convertir a entero osea eliminar los 0 a las izquierda
            codigoE = "E"+str(codigoE+1).zfill(4) # sumo 1 y  rellenar con 4 "0" a la izquierda
        else:
            codigoE = "E"+str(codigoE.count()+1).zfill(4) 

        empleados = UsuarioDepart.objects.all().filter(departamento_id=departamento_id, grupo_usuario=3)
        empleados_id = empleados.values('usuario_id')
      
        emple = User.objects.all().filter(id=empleados_id)

        context['codigoE'] = codigoE
        context['usuario_E'] = usuario
        context['lista_emp'] = emple
        context['actividad_e'] = actividades_v
        return context

def BuscarActivi_e(request):

    id_tareas_e = request.GET['id']
    
    actividad = Actividad.objects.filter(id=id_tareas_e)

    
    data = serializers.serialize('json', actividad,
                                 fields=('nom_actividad', 'des_actividad', 'fecha_i', 'fecha_p'))
   
    return HttpResponse(data, content_type='application/json')

def dictfetchall(cursor):
    "Returns all rows from a cursor as a dict"
    desc = cursor.description
    return [
        dict(zip([col[0] for col in desc], row))
        for row in cursor.fetchall()
    ]