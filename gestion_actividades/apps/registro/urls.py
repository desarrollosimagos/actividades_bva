from django.conf.urls import patterns, include, url


urlpatterns = patterns('',
                       url(r'actividad/', include('apps.registro.actividad.urls')),
                       url(r'administrador/', include('apps.registro.administrador.urls')),
)