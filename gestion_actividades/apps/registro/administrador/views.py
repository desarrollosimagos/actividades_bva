from django.views.generic import CreateView, ListView, UpdateView, DeleteView
from django.core.urlresolvers import reverse_lazy
from .models import Actividad
from apps.configuraciones.models import Departamento
from apps.registro.actividad.models import Registros
from django.http import HttpResponse, HttpResponseRedirect
from django.core import serializers
from django.contrib.auth.models import User
import time
import json
import re

class RegistrarAct(CreateView):
    template_name = 'registros/administrador/actividades.html'
    model = Actividad
    success_url = reverse_lazy("listando")
    
    def get_context_data(self, **kwargs):
        context = super(RegistrarAct, self).get_context_data(**kwargs)
        
        fecha_i = time.strftime("%d/%m/%Y")
        usuario_id = self.request.user.id
        usuario = User.objects.get(id=usuario_id).username
        
        codigo = Actividad.objects.order_by('-id').values('cod_actividad')[:1] # ordenar de forma decendente y traer solo 1
        
        if codigo.count() > 0:
            
            codigo = re.findall(r'\d+', codigo[0]['cod_actividad']) # extraer solo numeros 
            codigo =  int(codigo[0]) # convertir a entero osea eliminar los 0 a las izquierda
            codigo = "C"+str(codigo+1).zfill(4) # sumo 1 y  rellenar con 4 "0" a la izquierda
        else:
            codigo = 'C0001'
        departamento = Departamento.objects.all()
       
        context['fecha_i'] = fecha_i
        context['usuario'] = usuario
        context['codigo'] = codigo
        context['lista_departamento'] = departamento
        return context
    
    def post(self, request, *args, **kwargs):
       
        codigo = request.POST.get('cod_actividad')

        existe_codigo = Actividad.objects.filter(cod_actividad=codigo).exists()
        if existe_codigo == True:
            return HttpResponse('existe_codigo')
        else:
            form_class = self.get_form_class()
            form = self.get_form(form_class)
            if form.is_valid():
                form.save()
                return HttpResponse('/menu/registros/administrador/listar/')
 
class ListarAct(ListView):
    
    template_name = 'registros/administrador/listado.html'
    model = Actividad
    
    def get_context_data(self, **kwargs):
        context = {}
        usuario_id = self.request.user.id
        es_administrador = self.request.user.groups.all().filter(name='administrador').exists()
        
        data = {}
        datos = []
            
        if es_administrador:
            actividades = Actividad.objects.all()
            actividades_f = actividades.filter(user_create_id=usuario_id)
            actividades_v = actividades.values('id', 'porcentaje', 'cod_actividad','departamento', 'departamento__siglas', 'departamento__nom_departamento', 'nom_actividad', 'status', 'fecha_p', 'fecha_f')
            for n in actividades_v:
                data = n
                datos.append(data)
           
        context['listado'] = datos
        return context

class Visualizar(UpdateView):
    template_name = 'registros/administrador/visualizar.html'
    model = Actividad
    context_object_name = "registro_act"
    success_url = reverse_lazy("listando")
    
    def get_context_data(self, **kwargs):
        context = super(Visualizar, self).get_context_data(**kwargs)
        
        fecha_i = time.strftime("%d/%m/%Y")
        fecha_p = time.strftime("%d/%m/%Y")
        usuario_id = self.request.user.id
        usuario = User.objects.get(id=usuario_id).username
        departamento = Departamento.objects.all()
       
        context['fecha_i'] = fecha_i
        context['fecha_p'] = fecha_p
        context['usuario'] = usuario
        context['lista_departamento'] = departamento
        return context

class ActualizarAct(UpdateView):
    template_name = 'registros/administrador/actualizar.html'
    model = Actividad
    success_url = reverse_lazy("listando")
    context_object_name = "registro_act" 
    
    def get_context_data(self, **kwargs):
        context = super(ActualizarAct, self).get_context_data(**kwargs)
        
        fecha_i = time.strftime("%d/%m/%Y")
        fecha_p = time.strftime("%d/%m/%Y")
        fecha_o = time.strftime("%d/%m/%y")
        usuario_id = self.request.user.id
        usuario = User.objects.get(id=usuario_id).username
        
        codigo = Actividad.objects.order_by('-id').values('cod_actividad')[:1] 
        codigo = re.findall(r'\d+', codigo[0]['cod_actividad'])
        codigo =  int(codigo[0])
        codigo = "C"+str(codigo+1).zfill(4)
        
        departamento = Departamento.objects.all()
        
        id_act = self.kwargs['pk']
        actividades = Registros.objects.all()
        actividades_f = actividades.filter(cod_actividad_id=id_act)
        
        context['registro_existe'] = 0
        
        if actividades_f.exists():
            context['registro_existe'] = 1
        
        
        context['fecha_i'] = fecha_i
        context['fecha_p'] = fecha_p
        context['fecha_o'] = fecha_o
        context['usuario'] = usuario
        context['codigo'] = codigo
        context['lista_departamento'] = departamento
        return context
    
    def post(self, request, *args, **kwargs):

        id_act = request.POST.get('cod_actividad')
        observacion = request.POST.get('observacion')
        fecha_o = request.POST.get('fecha_o')
        porcentaje = request.POST.get('porcentaje')
        
        id_adm = Actividad.objects.filter(cod_actividad=id_act).values('id')
        date = fecha_o.split("/")
        try:
            nueva_fecha = date[2]+"-"+date[1]+"-"+date[0]
        
        except:
            nueva_fecha = None
            
        if nueva_fecha != None:
            
            Registros.objects.filter(cod_actividad_id=id_adm).update(observacion=observacion, porcentaje=porcentaje, fecha_o=nueva_fecha)
            Actividad.objects.filter(id=id_adm).update(observacion=observacion, porcentaje=porcentaje, fecha_o=nueva_fecha)
            
        
        form_class = self.get_form_class()
        form = self.get_form(form_class)
        add = form.save(commit=False)
        if form.is_valid():
            add.id = self.kwargs['pk']
            add.save()
        return HttpResponse('procesado')

class EliminarAct(DeleteView):
    template_name = 'registros/administrador/eliminar.html'
    model = Actividad
  
    def delete(self, request, *args, **kwargs):
        response_data = {}
        existe = Registros.objects.filter(cod_actividad_id=self.kwargs['pk'])
        if existe.exists():
            response_data['existe'] = 'si'
        else:
            existe = Actividad.objects.filter(id=self.kwargs['pk'])
            print existe
            if existe.exists():
                self.object = self.get_object()
                self.object.delete()
                response_data['eliminado'] = 'ok'
        
        return HttpResponse(json.dumps(response_data), status=200, content_type='application/json')