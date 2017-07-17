from django.views.generic import CreateView, ListView, UpdateView, DeleteView
from django.core.urlresolvers import reverse_lazy
from .models import Registros
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth.models import User
from apps.registro.administrador.models import Actividad
from apps.configuraciones.models import Departamento
from apps.asignaciones.asignar.models import Asignar
from django.core import serializers
from django.shortcuts import render_to_response
from django.template import RequestContext
from django.db import connection
import time
import json
from apps.registro.administrador.models import Actividad
from django.db.models import Q

class RegistrarActividad(CreateView):
    template_name = 'registros/actividad/actividad.html'
    model = Registros
    success_url = reverse_lazy("lista") 
    
    def get_context_data(self, **kwargs):
        context = super(RegistrarActividad, self).get_context_data(**kwargs)
        
        usuario = self.request.user
        departamento_id = usuario.usuariodepart.departamento_id
        
        id_reg = Registros.objects.all().values('cod_actividad_id') ### se hace una busqueda del campo para la comparacion
        
        actividades = Actividad.objects.all()
       
        actividades_f = actividades.filter(departamento_id=departamento_id).exclude(id__in=id_reg) ### aqui se excluyen las actividades que ya estan agregadas en la lista de registros
        actividades_v =  actividades_f.values('id','cod_actividad')

        fecha_i = time.strftime("%d/%m/%Y")
        fecha_f = time.strftime("%d/%m/%Y")
        usuario_id = self.request.user.id
        usuario = User.objects.get(id=usuario_id).username
        actividad = Actividad.objects.all()
        departamento = Departamento.objects.all()
      
        context['fecha_i'] = fecha_i
        context['fecha_f'] = fecha_f
        context['usuario'] = usuario
        context['lista_actividades'] = actividad
        context['lista_departamento'] = departamento
        context['actividades'] = actividades_v
        return context
       
    def post(self, request, *args, **kwargs):
     
        codigo = request.POST.get('cod_actividad')
        
        existe_codigo = Registros.objects.filter(cod_actividad=codigo).exists()
        if existe_codigo:
            return HttpResponse('existe_cod')
        else:
            
            form_class = self.get_form_class()
            form = self.get_form(form_class)
            
            if form.is_valid():
                
                add = form.save(commit=False)
                add.save()
                
                ##### Desde aqui hasta la var "a", se actualiza
                ##### el campo "porcentaje" del modelo Actividad
                ##### una vez que se agregue la actividad en el departamento correspondiente
                
                porcentaje = request.POST.get('porcentaje')
                porcentaje = request.POST.get('porcentaje')
                
                id_adm = Actividad.objects.filter(id=codigo).values('id')
                
                a = Actividad.objects.filter(id=id_adm).update(porcentaje=porcentaje)
                
                return HttpResponse('/menu/registros/actividad/listado/')
    
class ListarActividad(ListView):
    template_name = 'registros/actividad/listado.html'
    model = Registros
    
    def get_context_data(self, **kwargs):
        context = {}
       
        usuario_id = self.request.user.id
        
        # Captura del ID del Grupo 'administrador'
        cursor = connection.cursor()
        sql_gru = "SELECT id FROM auth_group WHERE name = 'administrador'"
        cursor.execute(sql_gru)
        row = dictfetchall(cursor)
        # print row
        if row == []:
            id_grupo = 0
        else:
            id_grupo = row[0]['id']
        
        # Consulta a la tabla user_group si el usuario pertenece al grupo 'Web'
        cursor = connection.cursor()
        sql_use = "SELECT id FROM auth_user_groups"
        sql_use += " WHERE user_id=%s and group_id =%s;"
        cursor.execute(sql_use, [usuario_id, id_grupo])
        row2 = dictfetchall(cursor)
    
        if row2 == []:
            encuestas = Registros.objects.all()
            encuestas = Registros.objects.filter(user_create_id=usuario_id)
            encuestas = encuestas.order_by('id').reverse()
        else:            
            encuestas = Registros.objects.all()
        
        context['listado'] = encuestas
        return context

class Activo(UpdateView):
    
    def post(self, request, *args, **kwargs):
        response_data = {}
        id_act = self.request.POST.get('id')
        Registros.objects.filter(id=id_act).update(status='1')
        
        ##### en esta seccion se actualiza el status al hacer el cambio en menu gerente(agregar actividad)
        id_reg = Registros.objects.filter(id=id_act).values('cod_actividad_id')
        Actividad.objects.filter(id=id_reg).update(status='1')
                
        return HttpResponse('exito')

class ActualizarActividad(UpdateView):
    template_name = 'registros/actividad/actualiza.html'
    model = Registros
    success_url = reverse_lazy("lista")
    context_object_name = "registro_act" 
    
    def get_context_data(self, **kwargs):
        context = super(ActualizarActividad, self).get_context_data(**kwargs)
    
        usuario_id = self.request.user.id
        usuario = User.objects.get(id=usuario_id).username
        actividad = Actividad.objects.all()
        departamento = Departamento.objects.all()
        
        context['usuario'] = usuario
        context['lista_actividades'] = actividad
        context['lista_departamento'] = departamento
        return context
    
    #### En esta seccion se actualiza el porcentaje y la fecha final
    #### para ser visualizado en el menu administrador y hacer la compararcion para el estado de eficiencia
    def post(self, request, *args, **kwargs):
    
        id_act = request.POST.get('cod_actividad')
        porcentaje = request.POST.get('porcentaje')
        fecha_f = request.POST.get('fecha_f')
        
        id_por = Registros.objects.filter(cod_actividad=id_act).values('cod_actividad_id')
        date = fecha_f.split("/")
        try:
            nueva_fecha = date[2]+"-"+date[1]+"-"+date[0]
        
        except:
            nueva_fecha = None
            
        if nueva_fecha != None:
        
            Actividad.objects.filter(id=id_por).update(porcentaje=porcentaje, fecha_f=nueva_fecha)
            Registros.objects.filter(cod_actividad_id=id_por).update(porcentaje=porcentaje, fecha_f=nueva_fecha)
    
        return HttpResponse('procesado')

class EliminarActividad(DeleteView):
    template_name = 'registros/actividad/elimina.html'
    model = Registros
    
    def delete(self, request, *args, **kwargs):
        response_data = {}
        
        id_registro = Registros.objects.filter(id=self.kwargs['pk']).values('cod_actividad_id')
        
        existe  = Asignar.objects.filter(cod_actividad_id=id_registro)

        if existe.exists():
            response_data['existe'] = 'si'
        else:
            
            existe = Registros.objects.filter(id=self.kwargs['pk'])
            if existe.exists():
                self.object = self.get_object()
                self.object.delete()
                response_data['eliminado'] = 'ok'
        
        return HttpResponse(json.dumps(response_data), status=200, content_type='application/json')

def BuscarActividad(request):

    id_act = request.GET['id']
    actividades = Actividad.objects.filter(id=id_act)
    
    data = serializers.serialize('json', actividades,
                                 fields=('nom_actividad', 'fecha_i', 'fecha_p', 'des_actividad'))
    
    return HttpResponse(data, content_type='application/json')

def dictfetchall(cursor):
    "Returns all rows from a cursor as a dict"
    desc = cursor.description
    return [
        dict(zip([col[0] for col in desc], row))
        for row in cursor.fetchall()
    ]