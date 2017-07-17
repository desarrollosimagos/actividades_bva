from django.views.generic import CreateView, ListView, UpdateView
from django.core.urlresolvers import reverse_lazy
from .models import Asignar
from django.contrib.auth.models import User
from apps.registro.administrador.models import Actividad
from apps.registro.actividad.models import Registros
from apps.configuraciones.models import Departamento
from django.http import HttpResponse, HttpResponseRedirect
from django.core import serializers
from django.shortcuts import render_to_response
from django.template import RequestContext
from django.db import connection
import time
from django.db.models import Q
import re

class RegistrarAsignar(CreateView):
    template_name = 'registros/asignaciones/asignacion.html'
    model = Asignar
    success_url = reverse_lazy("listandose") 
    
    def get_context_data(self, **kwargs):
        context = super(RegistrarAsignar, self).get_context_data(**kwargs)
        
        usuario = self.request.user
        departamento_id = usuario.usuariodepart.departamento_id

        actividades = Registros.objects.all()
        actividades_f = actividades.filter(cod_departamento_id=departamento_id) 
        actividades_v =  actividades_f.values('cod_actividad__id','cod_actividad__cod_actividad')
        codigoA = Asignar.objects.order_by('-id').values('codigoA')[:1] # ordenar de forma decendente y traer solo 
        if codigoA.count() > 0:
            codigoA = re.findall(r'\d+', codigoA[0]['codigoA']) # extraer solo numeros 
            codigoA =  int(codigoA[0]) # convertir a entero osea eliminar los 0 a las izquierda
            codigoA = "A"+str(codigoA+1).zfill(4) # sumo 1 y  rellenar con 4 "0" a la izquierda
        else:
            codigoA = "A"+str(codigoA.count()+1).zfill(4)
            
        usuario_id = self.request.user.id
        usuario = User.objects.get(id=usuario_id).username
        depar = Departamento.objects.all()
        departamento = Departamento.objects.all().exclude(id=departamento_id) ### Aqui excluye el usuario del departamento logueado de la lista para asignar actividades
        fecha_i = time.strftime("%d/%m/%Y")
        
        # dep = Asignar.objects.all().exclude(codigoDepartamentoA_id=usuario_id).values('codigoDepartamentoA')
        # departamento = dep.values('codigoDepartamentoA')
        # print 'aquiiii',departamento
        
        context['fecha_i'] = fecha_i
        context['codigoA'] = codigoA
        context['usuario'] = usuario
        context['lista_depar'] = depar
        context['lista_departamento'] = departamento
        context['actividades'] = actividades_v
        return context
    
    def post(self, request, *args, **kwargs):
        
        codigosasignar = request.POST.getlist('codigoDepartamentoA')
   
        asi = Asignar()

        for cod in codigosasignar:
            ids = Asignar.objects.order_by('-id').values('id')[:1]
            ids = ids[0]['id']+1
            print ids
            asi.codigoA = request.POST.get('codigoA')
            asi.codigoDepartamentoA_id = cod
            
            #########CONVERSION DE FECHAS#############
            fecha_i = request.POST.get('fecha_i')
            date = fecha_i.split("/")
            fecha_in = date[2]+"-"+date[1]+"-"+date[0]
            asi.fecha_i = fecha_in
            
            fecha_p = request.POST.get('fecha_p')
            date = fecha_p.split("/")
            fecha_pn = date[2]+"-"+date[1]+"-"+date[0]
            asi.fecha_p = fecha_pn
           
            fechaP_a = request.POST.get('fechaP_a')
            date = fechaP_a.split("/")
            fechaP_an = date[2]+"-"+date[1]+"-"+date[0] 
            asi.fechaP_a = fechaP_an
            ##########################################
            
            asi.cod_actividad_id=request.POST.get('cod_actividad')
            asi.codigoDepartamento_id=request.POST.get('codigoDepartamento')
            asi.nom_actividad=request.POST.get('nom_actividad')
            asi.des_actividad=request.POST.get('des_actividad')
            asi.indicaciones=request.POST.get('indicaciones')
            asi.porcentaje=request.POST.get('porcentaje')
            asi.user_create_id=request.POST.get('user_create')
            asi.id = ids
            asi.save()
            
        return HttpResponse('/menu/asignaciones/asignar/listandose/')
            
class ListarAsignar(ListView):
    template_name = 'registros/asignaciones/lista.html'
    model = Asignar
    
    def get_context_data(self, **kwargs):
        context = {}
        usuario_id = self.request.user.id
        es_administrador = self.request.user.groups.all().filter(name='administrador').exists()
        
        data = {}
        datos = []
            
        if es_administrador:
            actividades = Asignar.objects.all()
            actividades_f = actividades.filter(user_create_id=usuario_id)
            actividades_v = actividades.values('id','fecha_i', 'cod_actividad__cod_actividad','codigoDepartamento', 'codigoDepartamento__nom_departamento', 'codigoDepartamentoA__nom_departamento')
            for n in actividades_v:
                data = n
                datos.append(data)
        else:
            
            usuario = self.request.user.usuariodepart
            departamento_id = usuario.departamento_id
            
            actividades = Asignar.objects.all()
            actividades_f = actividades.filter(Q(codigoDepartamento=departamento_id) | Q(codigoDepartamentoA=departamento_id))
            actividades_v = actividades_f.values('id','fecha_i', 'cod_actividad__cod_actividad', 'codigoDepartamento', 'codigoDepartamento__nom_departamento', 'codigoDepartamentoA__nom_departamento')
            
            for n in actividades_v:
                data = n
                datos.append(data)
           
           

        context['listado'] = datos
        return context
    
class ActualizarAsignar(UpdateView):
    template_name = 'registros/asignaciones/ver.html'
    model = Asignar
    success_url = reverse_lazy("listandose")
    context_object_name = "asignar_act" 
    
    def get_context_data(self, **kwargs):
        context = super(ActualizarAsignar, self).get_context_data(**kwargs)

        usuario_id = self.request.user.id
        usuario = User.objects.get(id=usuario_id).username
        codigo = Actividad.objects.all()
        depar = Departamento.objects.all()
        departamento = Departamento.objects.all()
       
        context['usuario'] = usuario
        context['list_cod'] = codigo
        context['lista_depar'] = depar
        context['lista_departamento'] = departamento
        return context
    
    #### En esta seccion se actualiza el porcentaje
    #### para ser visualizado en actividades asignadas
    def post(self, request, *args, **kwargs):
    
        id_asi = request.POST.getlist('codigoA')
        coda = request.POST.get('codigoDepartamentoA')
        
        porcentaje = request.POST.get('porcentaje')
        usuarioU = request.POST.get('user_create')
        des_actividad = request.POST.get('des_actividad')
        print usuarioU
        
        fecha_f = request.POST.get('fecha_f')
        date = fecha_f.split("/")
        fecha_fn = date[2]+"-"+date[1]+"-"+date[0]
        
        fecha_p = request.POST.get('fecha_p')
        date = fecha_p.split("/")
        fecha_pn = date[2]+"-"+date[1]+"-"+date[0]
        
        Asignar.objects.filter(codigoA=id_asi,codigoDepartamentoA_id=coda).update(porcentaje=porcentaje, fecha_f=fecha_fn, fecha_p=fecha_pn, user_create_id=usuarioU, des_actividad=des_actividad)
        
        form_class = self.get_form_class()
        form = self.get_form(form_class)
        add = form.save(commit=False)
        if form.is_valid():
            add.id = self.kwargs['pk']
            add.save()
        return HttpResponse('procesado')
    
def BuscarActivi(request):

    id_activi = request.GET['id']
    # id_registro = Registros.objects.filter(id=id_activi).values('cod_actividad_id')
    
    actividad = Actividad.objects.filter(id=id_activi)

    
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