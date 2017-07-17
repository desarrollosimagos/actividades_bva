from django.conf.urls import patterns, include, url
from .views import Inicio
from django.contrib.auth.decorators import login_required


"""
    Urls a la plantilla base de la aplicacion
"""
urlpatterns = patterns('',
                       url(r'^$', login_required(Inicio.as_view(template_name="inicio.html"), login_url='/')),
                       url(r'^registros/', include('apps.registro.urls')),
                       url(r'^configuraciones/', include('apps.configuraciones.urls')),
                       url(r'^asignaciones/', include('apps.asignaciones.urls')),
                       url(r'^empleados/', include('apps.empleados.urls')),
                       url(r'^reportes/', include('apps.reportes.urls')),
                       )