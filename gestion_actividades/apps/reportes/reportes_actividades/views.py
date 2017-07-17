#encoding:utf-8
from django.views.generic import CreateView, TemplateView, DetailView, ListView, View
from django.core.urlresolvers import reverse_lazy
from django.shortcuts import render, render_to_response, get_object_or_404
from django.core import serializers
from django.db.models import Count
import json
import sys
from django.http import HttpResponse
from django.template import RequestContext
from apps.reportes.reportes_actividades.class_pdf import ReporteConstruct
from django.db import connection, transaction
import time
from django.db import connection, transaction
from apps.reportes.reportes_actividades import procesos
from django.conf import settings  # Ruta de settings
import unicodedata
from apps.configuraciones.models import Departamento


class ReporteActividades(TemplateView):

    template_name = 'reportes/reporte_actividades.html'

    def get_context_data(self, **kwargs):
        context = super(ReporteActividades, self).get_context_data(**kwargs)
        
        departamento = Departamento.objects.all()

        context['departamento'] = departamento
        return context

class PdfGeneral(View):

    template_name = 'reportes/reporte_actividades.html'

    def get_context_data(self, **kwargs):
        context = {}
        return context

    def get(self, request, *args, **kwargs):
        
        tipo = self.request.GET.get('tipo')
        status = self.request.GET.get('status')
        desde = self.request.GET.get('desde')
        hasta = self.request.GET.get('hasta')
        departamento = self.request.GET.get('departamento')
        bandera = self.request.GET.get('bandera')
        reload(sys)
        sys.setdefaultencoding("utf-8")
        
        if bandera == 'pdf':
       
            pdf = ReporteConstruct(orientation='L',unit='mm', format='letter')
            # pdf = class_pdf.ReporteConstruct
    
            pdf.alias_nb_pages()  # LLAMADA DE PAGINACION
            pdf.add_page()  # AÑADE UNA NUEVA PAGINACION
            # pdf.set_fill_color(157, 188, 201)  # COLOR DE BORDE DE LA CELDA
            # pdf.set_text_color(24, 29, 31)  # COLOR DEL TEXTO
            pdf.set_margins(15, 10, 10)
            
            pdf.set_font('Arial', 'B', 10)
            pdf.cell(140, 5, "".decode("UTF-8"), '', 0, 'L', 0)
            pdf.cell(50, 4, "".decode("UTF-8"), '', 0, 'L', 0)
            pdf.ln(10)
            ########################################################################
    
            pdf.set_fill_color(255, 255, 255)
            pdf.set_text_color(0, 0, 0)
            pdf.set_font('Arial', 'B', 10)
            pdf.cell(250, 5, "LISTA DE ACTIVIDADES".decode("UTF-8"), '', 1, 'C', 1)
            pdf.set_font('Arial', 'B', 10)
            pdf.cell(250,5,"Desde el "+str(desde)+" hasta el "+str(hasta).decode("UTF-8"),'',1,'C',1)
            pdf.set_font('Arial', 'B', 10)
            pdf.ln(5)
            
            pdf.set_fill_color(255, 255, 255)
            pdf.set_text_color(0, 0, 0)
            
            ##### CICLO FOR
            ROW = ''
            
            if tipo == '1':
                
                cursor = connection.cursor()
                QUERY = "SELECT aa.cod_actividad, cd.nom_departamento, ar.nom_actividad, ar.porcentaje, "
                QUERY += "CASE WHEN ar.porcentaje='1' THEN '10%' WHEN ar.porcentaje='2' THEN '20%' WHEN ar.porcentaje='3' THEN '30%' "
                QUERY += "WHEN ar.porcentaje='4' THEN '40%' WHEN ar.porcentaje='5' THEN '50%' WHEN ar.porcentaje='6' THEN '60%' "
                QUERY += "WHEN ar.porcentaje='7' THEN '70%' WHEN ar.porcentaje='8' THEN '80%' WHEN ar.porcentaje='9' THEN '90%' "
                QUERY += "ELSE '100%' END AS porcentaje, "
                QUERY += "CASE WHEN ar.status='1' THEN 'Activo' ELSE 'Inactivo' END AS name, count(ar.status) AS y "
                QUERY += "FROM actividad_registros AS ar "
                QUERY += "INNER JOIN administrador_actividad AS aa ON ar.cod_actividad_id=aa.id "
                QUERY += "INNER JOIN configuraciones_departamento AS cd ON ar.cod_departamento_id=cd.id "
                QUERY += "WHERE ar.fecha_i BETWEEN '"+str(desde)+"' AND '"+str(hasta)+"' "
                QUERY += "GROUP BY ar.status, cd.nom_departamento, ar.nom_actividad, ar.porcentaje, aa.cod_actividad "
                QUERY += "ORDER BY aa.cod_actividad ASC"
                cursor.execute(QUERY)
                ROW = procesos.dictfetchall(cursor)
                
            if tipo == '2' and departamento != 0:
                
                cursor = connection.cursor()
                QUERY = "SELECT aa.cod_actividad, cd.nom_departamento, ar.nom_actividad, ar.porcentaje, "
                QUERY += "CASE WHEN ar.porcentaje='1' THEN '10%' WHEN ar.porcentaje='2' THEN '20%' WHEN ar.porcentaje='3' THEN '30%' "
                QUERY += "WHEN ar.porcentaje='4' THEN '40%' WHEN ar.porcentaje='5' THEN '50%' WHEN ar.porcentaje='6' THEN '60%' "
                QUERY += "WHEN ar.porcentaje='7' THEN '70%' WHEN ar.porcentaje='8' THEN '80%' WHEN ar.porcentaje='9' THEN '90%' "
                QUERY += "ELSE '100%' END AS porcentaje, "
                QUERY += "CASE WHEN ar.status='1' THEN 'Activo' ELSE 'Inactivo' END AS name, count(ar.status) AS y "
                QUERY += "FROM actividad_registros AS ar "
                QUERY += "INNER JOIN administrador_actividad AS aa ON ar.cod_actividad_id=aa.id "
                QUERY += "INNER JOIN configuraciones_departamento AS cd ON ar.cod_departamento_id=cd.id "
                QUERY += "WHERE ar.cod_departamento_id='"+str(departamento)+"' AND ar.fecha_i BETWEEN '"+str(desde)+"' AND '"+str(hasta)+"' "
                QUERY += "GROUP BY ar.status, cd.nom_departamento, ar.nom_actividad, ar.porcentaje, aa.cod_actividad "
                QUERY += "ORDER BY aa.cod_actividad ASC"
                cursor.execute(QUERY)
                ROW = procesos.dictfetchall(cursor)
                
            if tipo == '3' and status != 0:
                
                cursor = connection.cursor()
                QUERY = "SELECT aa.cod_actividad, cd.nom_departamento, ar.nom_actividad, ar.porcentaje, "
                QUERY += "CASE WHEN ar.porcentaje='1' THEN '10%' WHEN ar.porcentaje='2' THEN '20%' WHEN ar.porcentaje='3' THEN '30%' "
                QUERY += "WHEN ar.porcentaje='4' THEN '40%' WHEN ar.porcentaje='5' THEN '50%' WHEN ar.porcentaje='6' THEN '60%' "
                QUERY += "WHEN ar.porcentaje='7' THEN '70%' WHEN ar.porcentaje='8' THEN '80%' WHEN ar.porcentaje='9' THEN '90%' "
                QUERY += "ELSE '100%' END AS porcentaje, "
                QUERY += "CASE WHEN ar.status='1' THEN 'Activo' ELSE 'Inactivo' END AS name, count(ar.status) AS y "
                QUERY += "FROM actividad_registros AS ar "
                QUERY += "INNER JOIN administrador_actividad AS aa ON ar.cod_actividad_id=aa.id "
                QUERY += "INNER JOIN configuraciones_departamento AS cd ON ar.cod_departamento_id=cd.id "
                QUERY += "WHERE ar.status='"+str(status)+"' AND ar.fecha_i BETWEEN '"+str(desde)+"' AND '"+str(hasta)+"' "
                QUERY += "GROUP BY ar.status, cd.nom_departamento, ar.nom_actividad, ar.porcentaje, aa.cod_actividad "
                QUERY += "ORDER BY aa.cod_actividad ASC"
                cursor.execute(QUERY)
                ROW = procesos.dictfetchall(cursor)
                
            #### ENCABEZADO DATOS PERSONALES
            
            pdf.set_fill_color(255, 29, 47)
            pdf.set_text_color(255, 255, 255)
            
            pdf.cell(10, 5, "N°".decode("UTF-8"), 'LTBR', 0, 'C', 1)
            pdf.cell(30, 5, "CÓDIGO".decode("UTF-8"), 'LTBR', 0, 'C', 1)
            pdf.cell(100, 5, "DEPARTAMENTO".decode("UTF-8"), 'LTBR', 0,'C', 1)
            pdf.cell(50, 5, "ACTIVIDAD".decode("UTF-8"), 'LTBR', 0, 'C', 1)
            pdf.cell(30, 5, "PORCENTAJE".decode("UTF-8"), 'LTBR', 0, 'C', 1)
            pdf.cell(30, 5, "ESTATUS".decode("UTF-8"), 'LTBR', 0, 'C', 1)
            
            pdf.set_fill_color(255, 255, 255)
            pdf.set_text_color(0, 0, 0)
            
            item = 1
            for act in ROW:
                print ROW   
                pdf.ln(5)    
                pdf.cell(10, 5, str(item), 'LTBR', 0, 'C', 1)
                pdf.cell(30, 5, str(act['cod_actividad']), 'LTBR', 0, 'C', 1)
                pdf.cell(100, 5, str(act['nom_departamento']).decode("UTF-8"), 'LTRB', 0,'C', 1)
                pdf.cell(50, 5, str(unicode(act['nom_actividad'])).decode("UTF-8"), 'LTBR', 0, 'C', 1)
                pdf.cell(30, 5, str(act['porcentaje']), 'LTBR', 0, 'C', 1)
                pdf.cell(30, 5, str(act['name']), 'LTBR', 0, 'C', 1)
                item = item + 1
            
            if len(ROW) == 0:
                response = "<body>"
                response += "<link rel='stylesheet' type='text/css' href='/static/css/bootstrap.css'>"
                response += "<script src='/static/js/bootstrap.min.js'></script>"
                response += "<img src='/static/img/no_disponible.png' style='width:80%;margin-left:10%'/>"
                response += "<button title='Cerrar ventana' class='btn btn-danger' style='font-size:24px; width:20%; height: 10%; font-weight: bold; text-align: center;margin-left:40%' onclick=window.close()>Cerrar</button>"
                response += "<body>"
                return HttpResponse(response)
            else:
                self.get_context_data()
                arch = 'Actividades_registradas'
                ruta_reporte = settings.MEDIA_PDF
                archivo = ruta_reporte+'/'+str(arch)+'.pdf'
                pdf.output(archivo, 'F')
                archivo = open(archivo, "r")
                response = HttpResponse(archivo.read(), content_type='application/pdf')
                response['Content-Disposition'] = 'inline; filename="'+str(arch)+'.pdf"'
        
                return response
        
        else:
            response_data ={}
            ROW = ''
            
                    
            if tipo == '1':
                
                cursor = connection.cursor()
                QUERY = "SELECT aa.cod_actividad, ar.nom_actividad, ar.porcentaje, "
                QUERY += "CASE WHEN ar.porcentaje='1' THEN '10%' WHEN ar.porcentaje='2' THEN '20%' WHEN ar.porcentaje='3' THEN '30%' "
                QUERY += "WHEN ar.porcentaje='4' THEN '40%' WHEN ar.porcentaje='5' THEN '50%' WHEN ar.porcentaje='6' THEN '60%' "
                QUERY += "WHEN ar.porcentaje='7' THEN '70%' WHEN ar.porcentaje='8' THEN '80%' WHEN ar.porcentaje='9' THEN '90%' "
                QUERY += "ELSE '100%' END AS porcentaje, "
                QUERY += "CASE WHEN ar.status='1' THEN 'Activo' ELSE 'Inactivo' END AS name, count(ar.status) AS y "
                QUERY += "FROM actividad_registros AS ar "
                QUERY += "INNER JOIN administrador_actividad AS aa ON ar.cod_actividad_id=aa.id "
                QUERY += "WHERE ar.fecha_i BETWEEN '"+str(desde)+"' AND '"+str(hasta)+"' "
                QUERY += "GROUP BY ar.status, ar.nom_actividad, ar.porcentaje, aa.cod_actividad "
                cursor.execute(QUERY)
                ROW = procesos.dictfetchall(cursor)
                
            if tipo == '2' and departamento != 0:
                
                cursor = connection.cursor()
                QUERY = "SELECT aa.cod_actividad, ar.nom_actividad, ar.porcentaje, "
                QUERY += "CASE WHEN ar.porcentaje='1' THEN '10%' WHEN ar.porcentaje='2' THEN '20%' WHEN ar.porcentaje='3' THEN '30%' "
                QUERY += "WHEN ar.porcentaje='4' THEN '40%' WHEN ar.porcentaje='5' THEN '50%' WHEN ar.porcentaje='6' THEN '60%' "
                QUERY += "WHEN ar.porcentaje='7' THEN '70%' WHEN ar.porcentaje='8' THEN '80%' WHEN ar.porcentaje='9' THEN '90%' "
                QUERY += "ELSE '100%' END AS porcentaje, "
                QUERY += "CASE WHEN ar.status='1' THEN 'Activo' ELSE 'Inactivo' END AS name, count(ar.status) AS y "
                QUERY += "FROM actividad_registros AS ar "
                QUERY += "INNER JOIN administrador_actividad AS aa ON ar.cod_actividad_id=aa.id "
                QUERY += "WHERE ar.cod_departamento_id='"+str(departamento)+"' AND ar.fecha_i BETWEEN '"+str(desde)+"' AND '"+str(hasta)+"' "
                QUERY += "GROUP BY ar.status, ar.nom_actividad, ar.porcentaje, aa.cod_actividad "
                cursor.execute(QUERY)
                ROW = procesos.dictfetchall(cursor)
                
            if tipo == '3' and status != 0:
                
                cursor = connection.cursor()
                QUERY = "SELECT aa.cod_actividad, ar.nom_actividad, ar.porcentaje, "
                QUERY += "CASE WHEN ar.porcentaje='1' THEN '10%' WHEN ar.porcentaje='2' THEN '20%' WHEN ar.porcentaje='3' THEN '30%' "
                QUERY += "WHEN ar.porcentaje='4' THEN '40%' WHEN ar.porcentaje='5' THEN '50%' WHEN ar.porcentaje='6' THEN '60%' "
                QUERY += "WHEN ar.porcentaje='7' THEN '70%' WHEN ar.porcentaje='8' THEN '80%' WHEN ar.porcentaje='9' THEN '90%' "
                QUERY += "ELSE '100%' END AS porcentaje, "
                QUERY += "CASE WHEN ar.status='1' THEN 'Activo' ELSE 'Inactivo' END AS name, count(ar.status) AS y "
                QUERY += "FROM actividad_registros AS ar "
                QUERY += "INNER JOIN administrador_actividad AS aa ON ar.cod_actividad_id=aa.id "
                QUERY += "WHERE ar.status='"+str(status)+"' AND ar.fecha_i BETWEEN '"+str(desde)+"' AND '"+str(hasta)+"' "
                QUERY += "GROUP BY ar.status, ar.nom_actividad, ar.porcentaje, aa.cod_actividad "
                cursor.execute(QUERY)
                ROW = procesos.dictfetchall(cursor)

            return HttpResponse(json.dumps(ROW), content_type='application/json')

def dictfetchall(cursor):
    "Returns all rows from a cursor as a dict"
    desc = cursor.description
    return [
        dict(zip([col[0] for col in desc], row))
        for row in cursor.fetchall()
    ]


