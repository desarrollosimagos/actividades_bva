from django.conf.urls import patterns, include, url


urlpatterns = patterns('',
                       url(r'asignar/', include('apps.asignaciones.asignar.urls')),
)