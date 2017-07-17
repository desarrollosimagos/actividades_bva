from django.views.generic import CreateView, ListView, UpdateView, DeleteView
from django.core.urlresolvers import reverse_lazy
from .models import Departamento
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth.models import User
from django.core import serializers
import time

class RegistrarDepartamento(CreateView):
    template_name = 'configuraciones/registro.html'
    model = Departamento
    success_url = reverse_lazy("listar") 
    
    def get_context_data(self, **kwargs):
        context = super(RegistrarDepartamento, self).get_context_data(**kwargs)
        
        usuario_id = self.request.user.id
        usuario = User.objects.get(id=usuario_id).username
        codigo = Departamento.objects.count()
        codigo = "D"+str(codigo+1).zfill(4)
       
        context['usuario'] = usuario
        context['codigo'] = codigo
        return context
    
    def post(self, request, *args, **kwargs):
       
        codigo = request.POST.get('cod_departamento')

        existe_codigo = Departamento.objects.filter(cod_departamento=codigo).exists()
        if existe_codigo == True:
            return HttpResponse('existe_codigo')
        else:
            form_class = self.get_form_class()
            form = self.get_form(form_class)
            if form.is_valid():
                form.save()
                return HttpResponse('/menu/configuraciones/listar/')
    
class ListarDepartamento(ListView):
    template_name = 'configuraciones/listado.html'
    model = Departamento
    context_object_name = "listado"
 
class ActualizarDepartamento(UpdateView):
    template_name = 'configuraciones/actualizar.html'
    model = Departamento
    success_url = reverse_lazy("listar")
    context_object_name = "departamento_act" 
    
    def get_context_data(self, **kwargs):
        context = super(ActualizarDepartamento, self).get_context_data(**kwargs)
        
        usuario_id = self.request.user.id
        usuario = User.objects.get(id=usuario_id).username
        codigo = Departamento.objects.count()
        codigo = "D"+str(codigo+1).zfill(4)
       
        context['usuario'] = usuario
        context['codigo'] = codigo
        return context

class EliminarDepartamento(DeleteView):
    template_name = 'configuraciones/eliminar.html'
    model = Departamento
    success_url = reverse_lazy("listar")
    context_object_name = "listado"