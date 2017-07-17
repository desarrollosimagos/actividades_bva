from django.conf.urls import patterns, include, url
from .views import RegistrarAct, ListarAct, ActualizarAct, EliminarAct, Visualizar
from django.contrib.auth.decorators import login_required

urlpatterns = patterns('',
    url(r'registro/$', RegistrarAct.as_view(),name='registrar'),
    url(r'listar/$', ListarAct.as_view(),name='listando'),
    url(r'editar/(?P<pk>\d+)$', ActualizarAct.as_view(),name='actualizando'),
    url(r'ver_porcentaje/(?P<pk>\d+)$', Visualizar.as_view(),name='visualizar'),
    url(r'eliminar/(?P<pk>\d+)$', EliminarAct.as_view(),name='eliminando'),
    
)