from django.conf.urls import patterns, include, url
from .views import RegistrarEmpleados, ListarEmpleados, ActualizarEmpleados, BuscarActivi_e
from django.contrib.auth.decorators import login_required

urlpatterns = patterns('',
    url(r'registro_empleados/$', RegistrarEmpleados.as_view(),name='registro_empleados'),
    url(r'listado_emp/$', ListarEmpleados.as_view(),name='listado_emp'),
    url(r'editarEmpleados/(?P<pk>\d+)$', ActualizarEmpleados.as_view(),name='editando_empleados'),
    url(r'^buscar_empleados/$', 'apps.empleados.tareas.views.BuscarActivi_e', name='buscar_empleados'),
)