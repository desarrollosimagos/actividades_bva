from django.conf.urls import patterns, include, url


urlpatterns = patterns('',
                       url(r'asignar_tareas/', include('apps.empleados.tareas.urls')),
)