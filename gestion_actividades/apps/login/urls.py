from django.conf.urls import patterns, url
from django.conf.urls.static import static
from django.conf import settings
from .views import login_view, logout_view, RegistrarseUsuario, EliminarUsuarios


"""
    Urls a la plantilla de inicio de sesion
"""
urlpatterns = patterns('',
                       url(r'^$', login_view, name='vista_login'),
                       url(r'^logout/$', logout_view, name='logout_view'),
                       url(r'^nuevo_usuario/$', RegistrarseUsuario.as_view(), name="nuevo_usuario",),
                       url(r'^eliminar_usuario/(?P<pk>\d+)$', EliminarUsuarios.as_view(), name="eliminar_usuario",),
                       url(r'^buscar_grupos/$', 'apps.login.views.buscar_grupos', name="buscar_grupos",),
                       url(r'^buscar_departamentos/$', 'apps.login.views.buscar_departamentos', name="buscar_departamentos",),
                       )
