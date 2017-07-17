from django.conf.urls import patterns, include, url
from .views import RegistrarActividad, ListarActividad, ActualizarActividad, EliminarActividad, Activo, BuscarActividad
from django.contrib.auth.decorators import login_required

urlpatterns = patterns('',
    url(r'registro/$', RegistrarActividad.as_view(),name='registrar'),
    url(r'listado/$', ListarActividad.as_view(),name='lista'),
    url(r'edita/(?P<pk>\d+)$', ActualizarActividad.as_view(),name='actualiza'),
    url(r'elimina/(?P<pk>\d+)$', EliminarActividad.as_view(),name='elimina'),
    url(r'^activo/$', login_required(Activo.as_view(),
                                                login_url='/'), name='estatus_activo'),
    url(r'^busqueda_solicitud/$', 'apps.registro.actividad.views.BuscarActividad', name='busqueda_solicitud'),
)