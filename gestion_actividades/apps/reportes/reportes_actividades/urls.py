from django.conf.urls import patterns, include, url
from .views import ReporteActividades, PdfGeneral
#, Reporte
from django.contrib.auth.decorators import login_required


urlpatterns = patterns('',
                       url(r'^$', login_required(ReporteActividades.as_view(),login_url='/'), name='reporte'),
                       url(r'^soportesgeneral/$', login_required(PdfGeneral.as_view(),login_url='/')),
                       #url(r'^detallado/$', login_required(ReporteDetallado.as_view(),login_url='/'), name='detallado'),
                      )