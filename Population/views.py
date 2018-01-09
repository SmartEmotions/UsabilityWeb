from django.views.decorators.csrf import csrf_protect
from django.shortcuts import render
from django.db.models import Sum, Count, F
from Population.models import Gradeworks, Webaplications
from Methodologies.models import Methodologies
from django.http import HttpResponse, JsonResponse
from Population.serializer import *
from rest_framework.decorators import list_route
from rest_framework.response import Response
from rest_framework import viewsets
import json

class WebaplicationsViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = Webaplications.objects.all()
    serializer_class = WebaplicationsSerializer
    @list_route()
    def sgdb(self, request):
        q = self.get_queryset().values('app_nsgdb'
                   ).annotate(Total=Count('app_nsgdb')
                   ).order_by('-Total')
        return Response(list(q))

    @list_route()
    def lback(self, request):
        q = self.get_queryset().values('app_lback'
                   ).annotate(Total=Count('app_lback')
                   ).order_by('-Total')
        return Response(list(q))

    @list_route()
    def bfram(self, request):
        q = self.get_queryset().values('app_bfram'
                   ).annotate(Total=Count('app_bfram')
                   ).order_by('-Total')
        return Response(list(q))

    @list_route()
    def appse(self, request):
        q = self.get_queryset().values('app_appse'
                   ).annotate(Total=Count('app_appse')
                   ).order_by('-Total')
        return Response(list(q))

    @list_route()
    def lfron(self, request):
        q = self.get_queryset().values('app_lfron'
                   ).annotate(Total=Count('app_lfron')
                   ).order_by('-Total')[0:8]
        return Response(list(q))

    @list_route()
    def ffram(self, request):
        q = self.get_queryset().values('app_ffram'
                   ).annotate(Total=Count('app_ffram')
                   ).order_by('-Total')[0:8]
        return Response(list(q))

    @list_route()
    def entit(self, request):
        q = self.get_queryset().values('app_entit'
                   ).annotate(Total=Count('app_entit')
                   ).order_by('-Total')[0:8]
        return Response(list(q))

    @list_route()
    def secto(self, request):
        q = self.get_queryset().values('app_secto'
                   ).annotate(Total=Count('app_secto')
                   ).order_by('-Total')[0:8]
        return Response(list(q))

    @list_route()
    def membe(self, request):
        q = self.get_queryset().values('app_cmenb'
                   ).annotate(Total=Count('app_cmenb')
                   ).order_by('-Total')[0:8]
        return Response(list(q))


class GradeworksViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = Gradeworks.objects.all()
    serializer_class = GradeworksSerializer

    @list_route()
    def type(self, request):
        q = self.get_queryset().values('work_type'
                ).annotate(Total=Count('work_type')
                ).order_by('-Total')[0:12]
        return Response(list(q))

    @list_route()
    def ueva(self, request):
        q = self.get_queryset().filter(work_type=('Aplicación Web'))
        yes = q.filter(work_uevalu=True).count()
        no = q.filter(work_uevalu=False).count()
        return Response(list([{'work_uevalu':'No','Total':no},
                              {'work_uevalu':'Si','Total':yes}]))

    @list_route()
    def deve(self, request):
        q = self.get_queryset()
        yes = q.filter(work_develo=True).count()
        no = q.filter(work_develo=False).count()
        return Response(list([{'work_develo':'Si','Total':yes},
                              {'work_develo':'No','Total':no}]))

    @list_route()
    def year_types(self, request):
        nwapp = self.get_queryset(
        ).filter(work_type__icontains='Aplicación Web'
        ).annotate(Year=F('work_year')
        ).values('Year'
        ).annotate(Total=Count('work_type')).order_by('Year')
        naudi = self.get_queryset(
        ).filter(work_type='Auditoria'
        ).annotate(Year=F('work_year')
        ).values('Year'
        ).annotate(Total=Count('work_type')).order_by('Year')
        nmovi = self.get_queryset(
        ).filter(work_type__icontains='Aplicación Móvil'
        ).annotate(Year=F('work_year')
        ).values('Year'
        ).annotate(Total=Count('work_type')).order_by('Year')
        return Response(list([{'Type':'Aplicación Web','Years':nwapp},
                              {'Type':'Auditoria','Years':naudi},
                              {'Type':'Aplicación Móvil','Years':nmovi}]))

@csrf_protect
def getWorksTypes(request):
    return render(request, 'populationInit.html')


@csrf_protect
def searchWorks(request):
    if 'name' in request.GET and request.GET['name']:
        name = request.GET['name']
        works = Gradeworks.objects.filter(work_name__icontains=name
                ).values('work_name'
                ).order_by('work_name')
        names = []
        for work in works:
            names.append({'name':work['work_name']})
        dump = json.dumps(names)
        return HttpResponse(dump, content_type='application/json')
    return HttpResponse(status=404)


@csrf_protect
def searchWork(request):
    if 'work_name' in request.POST and request.POST['work_name']:
        name = request.POST['work_name'].split(' ')
        works = Gradeworks.objects.all()
        for word in name:
            works = works.filter(work_name__icontains=word
                    ).order_by('work_name')
        response = {}
        if len(works) < 1:
            response.update({"Empty": "true"})
        else:
            worksinfo = []
            for work in works:
                worksinfo.append(
                    {'Name': work.work_name,
                     'Type': work.work_type,
                     'Usability': work.work_uevalu,
                     'Year': work.work_year,
                     'Status': work.work_status,
                     'Id': work.work_id,
                     'Develop': work.work_develo})
            response.update({'Works': worksinfo})
        dump = json.dumps(response)
        return HttpResponse(dump, content_type='application/json')
    return HttpResponse(status=404)


@csrf_protect
def addWork(request):
    if request.POST and request.is_ajax():
        newWork = Gradeworks(
            work_name = request.POST['work_name'],
            work_year = request.POST['work_year'],
            work_type = request.POST['work_type'],
            work_uevalu = request.POST['work_uevalu'],
            work_status = request.POST['work_status'],
            work_develo = request.POST['work_develo'])
        newWork.save()
        return HttpResponse(1)
    return HttpResponse(status=404)

@csrf_protect
def editWork(request):
    if request.POST and request.is_ajax():
        newWork = Gradeworks(
            work_id = request.POST['worke_id'],
            work_name = request.POST['worke_name'],
            work_year = request.POST['worke_year'],
            work_type = request.POST['worke_type'],
            work_uevalu = request.POST['worke_uevalu'],
            work_develo = request.POST['worke_develo'],
            work_status = request.POST['worke_status'])
        newWork.save()
        return HttpResponse(1)
    return HttpResponse(status=404)


@csrf_protect
def charWork(request):
    if request.POST and request.is_ajax():
        newChar = Webaplications(
        app = Gradeworks(work_id = request.POST['workc_id']),
        app_metho = Methodologies(method_id=request.POST['workc_method']),
        app_cmenb = request.POST['workc_devels'],
        app_entit = request.POST['workc_entity'],
        app_secto = request.POST['workc_sector'],
        app_lback = request.POST['workc_laback'],
        app_lfron = request.POST['workc_lafron'],
        app_nsgdb = request.POST['workc_sysgdb'],
        app_produ = request.POST['workc_produc'],
        app_trodu = request.POST['workc_timele'] + ' ' + request.POST['work_ttim'],
        app_bfram = request.POST['workc_framew'],
        app_ffram = request.POST['workc_ffront'],
        app_dupda = request.POST['workc_dscupd'],
        app_updat = (request.POST['workc_update']).replace('.','.\n'),
        app_appse = request.POST['workc_appser'],
        app_tcost = request.POST['workc_timede'] + ' ' + request.POST['work_tcos'],
        app_qualf = 0)
        newChar.save()
        return HttpResponse(1)
    return HttpResponse(status=404)

def getcharac(request):
    if request.POST and request.is_ajax():
        key = request.POST['work_id']
        worksc = Webaplications.objects.filter(app=key)
        response = {}
        if len(worksc) < 1:
            response.update({'Empty': True})
        elif len(worksc) == 1:
            for work in worksc:
                response.update(
                    {'Method':work.app_metho.method_id,
                     'Members': work.app_cmenb,
                     'Entity': work.app_entit,
                     'Sector': work.app_secto,
                     'Production': work.app_produ,
                     'TProduction': work.app_trodu,
                     'Update': work.app_updat.strftime('%Y-%m-%d'),
                     'Description': work.app_dupda,
                     'LBackEnd':work.app_lback,
                     'LFrontEnd':work.app_lfron,
                     'SGDB': work.app_nsgdb,
                     'FFrontEnd': work.app_ffram,
                     'FBackEnd': work.app_bfram,
                     'AppServer': work.app_appse,
                     'TimeCost': work.app_tcost,
                     'Qualification': int(work.app_qualf)})
        dump = json.dumps(response)
        return HttpResponse(dump, content_type='application/json')
    return HttpResponse(status=404)
# import json
# from django.http import HttpResponse
#
# def profile(request):
#     data = {
#         'name': 'Vitor',
#         'location': 'Finland',
#         'is_active': True,
#         'count': 28
#     }
#     dump = json.dumps(data)
#     return HttpResponse(dump, content_type='application/json')
