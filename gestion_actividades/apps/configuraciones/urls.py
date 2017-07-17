from django.conf.urls import patterns, include, url
from .views import RegistrarDepartamento, ListarDepartamento, ActualizarDepartamento, EliminarDepartamento
from django.contrib.auth.decorators import login_required

urlpatterns = patterns('',
    url(r'registro/$', RegistrarDepartamento.as_view(),name='registrando'),
    url(r'listar/$', ListarDepartamento.as_view(),name='listar'),
    url(r'edit/(?P<pk>\d+)$', ActualizarDepartamento.as_view(),name='actualizar'),
    url(r'elimi/(?P<pk>\d+)$', EliminarDepartamento.as_view(),name='eliminar'),
)