from django.conf.urls import patterns, include, url
from .views import RegistrarAsignar, ListarAsignar, ActualizarAsignar, BuscarActivi
from django.contrib.auth.decorators import login_required

urlpatterns = patterns('',
    url(r'registrados/$', RegistrarAsignar.as_view(),name='registrados'),
    url(r'listandose/$', ListarAsignar.as_view(),name='listandose'),
    url(r'editarAsignar/(?P<pk>\d+)$', ActualizarAsignar.as_view(),name='editando'),
    url(r'^busqueda_actividad/$', 'apps.asignaciones.asignar.views.BuscarActivi', name='busqueda_actividad'),
)