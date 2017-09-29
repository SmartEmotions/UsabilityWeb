from django.shortcuts import render
from Population.models import Gradeworks

def getWorksTypes(request):
    workstypes = types()
    uevaluation = usability()
    return render(request, 'usabilityWorks.html', {'Works':workstypes,
                                                   'Usability':uevaluation})


def types():
    wapps = Gradeworks.objects.filter(work_iswapp=True,
                                      work_ismapp=False).count()
    mapps = Gradeworks.objects.filter(work_ismapp=True,
                                      work_iswapp=False).count()
    mwapp = Gradeworks.objects.filter(work_ismapp=True,
                                      work_iswapp=True).count()
    deskt = Gradeworks.objects.filter(work_isdesk=True).count()
    audit = Gradeworks.objects.filter(work_isaudi=True).count()
    sweng = Gradeworks.objects.filter(work_isweng=True).count()
    datab = Gradeworks.objects.filter(work_isdbmn=True).count()
    other = Gradeworks.objects.filter(work_isothe=True).count()

    return [
        {'type':'Web Apps','total':wapps},
        {'type':'Web y Movil Apps','total':mwapp},
        {'type':'Movil Apps','total':mapps},
        {'type':'Escritorio Apps','total':deskt},
        {'type':'Auditorias','total':audit},
        {'type':'Ingenieria Software','total':sweng},
        {'type':'Base Datos y Mineria','total':datab},
        {'type':'Otras','total':other}]

def usability():
    wapps = Gradeworks.objects.filter(work_iswapp=True)
    yes = wapps.filter(work_uevalu=True).count()
    no = wapps.filter(work_uevalu=False).count()
    return {'Si':yes, 'No':no}
