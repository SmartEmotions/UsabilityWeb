from django.db.models import Count, Q
from django.shortcuts import render
from Analisys.models import Efforts
def mdbootstrap(request):
    return render(request, 'mdbootstrap.html')

def inicio(request):
    info = dictionary()
    totalsi, totalno = usability()
    info.update(totalsi)
    info.update(totalno)
    info.update(percentages())
    info.update(development())
    info.update(methodologies())
    return render(request, 'index.html',info)
'''-------------------------------------------------------------------------------------
Funcion para conocer cuantos trabajos de grado desarrollan algun tipo de
aplicacion, se calcual el porcentaje de cada aspecto, cuando se desarrollan
y cuando no se desarrolla.
-------------------------------------------------------------------------------------'''
def development():
    development = Efforts.objects.filter(development__contains='Si').count()
    nodevelopment = Efforts.objects.filter(development__contains='No').count()
    return {'Development':development, 'NoDevelopment':nodevelopment}
'''
def development():
    count2010 = Efforts.objects.filter(development__contains='Si', year='2010').count()
    count2011 = Efforts.objects.filter(development__contains='Si', year='2011').count()
    count2012 = Efforts.objects.filter(development__contains='Si', year='2012').count()
    count2013 = Efforts.objects.filter(development__contains='Si', year='2013').count()
    count2014 = Efforts.objects.filter(development__contains='Si', year='2014').count()
    count2015 = Efforts.objects.filter(development__contains='Si', year='2015').count()
    count2016 = Efforts.objects.filter(development__contains='Si', year='2016').count()
    count2017 = Efforts.objects.filter(development__contains='Si', year='2017').count()
    development = [{'year':2010, 'total':count2010},
                  {'year':2011, 'total':count2011},
                  {'year':2012, 'total':count2012},
                  {'year':2013, 'total':count2013},
                  {'year':2014, 'total':count2014},
                  {'year':2015, 'total':count2015},
                  {'year':2016, 'total':count2016},
                  {'year':2017, 'total':count2017}]

    count2010 = Efforts.objects.filter(development__contains='No', year='2010').count()
    count2011 = Efforts.objects.filter(development__contains='No', year='2011').count()
    count2012 = Efforts.objects.filter(development__contains='No', year='2012').count()
    count2013 = Efforts.objects.filter(development__contains='No', year='2013').count()
    count2014 = Efforts.objects.filter(development__contains='No', year='2014').count()
    count2015 = Efforts.objects.filter(development__contains='No', year='2015').count()
    count2016 = Efforts.objects.filter(development__contains='No', year='2016').count()
    count2017 = Efforts.objects.filter(development__contains='No', year='2017').count()
    nodevelopment = [{'year':2010, 'total':count2010},
                  {'year':2011, 'total':count2011},
                  {'year':2012, 'total':count2012},
                  {'year':2013, 'total':count2013},
                  {'year':2014, 'total':count2014},
                  {'year':2015, 'total':count2015},
                  {'year':2016, 'total':count2016},
                  {'year':2017, 'total':count2017}]

    total = Efforts.objects.filter(development='Si' or 'No').count()
    return {'Development':development, 'NoDevelopment':nodevelopment, 'TotalDevelopment':total}
'''

'''
Funcion para contar el numero de trabajos de grado desarrollados
en la universidad se cuenta por cada anio cuantas tesis se
llevaron a cabo dependiendo del tipo de trabajo.
'''
def dictionary():
    count2010 = Efforts.objects.filter(type__contains='Audi', year='2010').count()
    count2011 = Efforts.objects.filter(type__contains='Audi', year='2011').count()
    count2012 = Efforts.objects.filter(type__contains='Audi', year='2012').count()
    count2013 = Efforts.objects.filter(type__contains='Audi', year='2013').count()
    count2014 = Efforts.objects.filter(type__contains='Audi', year='2014').count()
    count2015 = Efforts.objects.filter(type__contains='Audi', year='2015').count()
    count2016 = Efforts.objects.filter(type__contains='Audi', year='2016').count()
    count2017 = Efforts.objects.filter(type__contains='Audi', year='2017').count()
    auditorias = [{'year':2010, 'total':count2010},
                  {'year':2011, 'total':count2011},
                  {'year':2012, 'total':count2012},
                  {'year':2013, 'total':count2013},
                  {'year':2014, 'total':count2014},
                  {'year':2015, 'total':count2015},
                  {'year':2016, 'total':count2016},
                  {'year':2017, 'total':count2017}]

    count2010 = Efforts.objects.filter(type__contains='Movil', year='2010').count()
    count2011 = Efforts.objects.filter(type__contains='Movil', year='2011').count()
    count2012 = Efforts.objects.filter(type__contains='Movil', year='2012').count()
    count2013 = Efforts.objects.filter(type__contains='Movil', year='2013').count()
    count2014 = Efforts.objects.filter(type__contains='Movil', year='2014').count()
    count2015 = Efforts.objects.filter(type__contains='Movil', year='2015').count()
    count2016 = Efforts.objects.filter(type__contains='Movil', year='2016').count()
    count2017 = Efforts.objects.filter(type__contains='Movil', year='2017').count()
    movilapps = [{'year':2010, 'total':count2010},
                  {'year':2011, 'total':count2011},
                  {'year':2012, 'total':count2012},
                  {'year':2013, 'total':count2013},
                  {'year':2014, 'total':count2014},
                  {'year':2015, 'total':count2015},
                  {'year':2016, 'total':count2016},
                  {'year':2017, 'total':count2017}]

    count2010 = Efforts.objects.exclude(Q(type__contains=('Mining'))).filter(type__contains='Web', year='2010').count()
    count2011 = Efforts.objects.exclude(Q(type__contains=('Mining'))).filter(type__contains='Web', year='2011').count()
    count2012 = Efforts.objects.exclude(Q(type__contains=('Mining'))).filter(type__contains='Web', year='2012').count()
    count2013 = Efforts.objects.exclude(Q(type__contains=('Mining'))).filter(type__contains='Web', year='2013').count()
    count2014 = Efforts.objects.exclude(Q(type__contains=('Mining'))).filter(type__contains='Web', year='2014').count()
    count2015 = Efforts.objects.exclude(Q(type__contains=('Mining'))).filter(type__contains='Web', year='2015').count()
    count2016 = Efforts.objects.exclude(Q(type__contains=('Mining'))).filter(type__contains='Web', year='2016').count()
    count2017 = Efforts.objects.exclude(Q(type__contains=('Mining'))).filter(type__contains='Web', year='2017').count()
    webapps = [{'year':2010, 'total':count2010},
              {'year':2011, 'total':count2011},
              {'year':2012, 'total':count2012},
              {'year':2013, 'total':count2013},
              {'year':2014, 'total':count2014},
              {'year':2015, 'total':count2015},
              {'year':2016, 'total':count2016},
              {'year':2017, 'total':count2017}]
    total = Efforts.objects.filter(type__contains='plicativo We').count()
    return {'Auditorias':auditorias, 'MovilApps':movilapps, 'WebApps':webapps, 'Total':total}

'''-------------------------------------------------------------------------------------
Funcion para dar pocentajes a cada tipo de tesis de grado
se cuentan todas las teisis pertenecientes a un tipo
y luego se calcula un porcentaje respecto al total
de trabajos de grado
-------------------------------------------------------------------------------------'''
def percentages():
    webapps = Efforts.objects.exclude(Q(type__contains=('Movil')) | Q(type__contains=('Mining'))).filter(type__contains='Web').count()
    movilapps = Efforts.objects.exclude(Q(type__contains='Web')).filter(type__contains='Movil').count()
    movilwebapps = Efforts.objects.exclude(Q(type__contains=('Mining'))).filter(type__contains=('Web')).filter(type__contains=('Movil')).count()
    auditorias = Efforts.objects.filter(type__contains='Audit').count()
    others = Efforts.objects.exclude(Q(type__contains='Movil') |
                                     Q(type__contains='ivo Web') |
                                     Q(type__contains='Audit')).count()
    total = webapps + movilapps + auditorias + others + movilwebapps
    porcentajes = [{'type':'Web Apps ', 'total':webapps},
                   {'type':'Movil Apps ', 'total':movilapps},
                   {'type':'Movil y Web Apps ', 'total':movilwebapps},
                   {'type':'Auditorias ', 'total':auditorias},
                   {'type':'Otras ', 'total':others}]
    return {'Porcentajes':porcentajes}
'''-------------------------------------------------------------------------------------
    Funcion para extrar en numero de trabajos de grado que aplican Usabilidad
    en sus trabajos, luego de la extraccion se hace un calculo de porcentajes
    para denotar porcentajes de cuantos trabajos tomaron en cuenta
    la usabilidad y cuantos no.
-------------------------------------------------------------------------------------'''
def usability():
    usability = Efforts.objects.exclude(Q(type__contains=('Mining'))).filter(type__contains='Web', usability='Si').count()
    nousability = Efforts.objects.exclude(Q(type__contains=('Mining'))).filter(type__contains='Web', usability='No').count()
    return {'Usability': usability}, {'NoUsability': nousability}



def methodologies():
    webapps = Efforts.objects.exclude(Q(type__contains=('Mining'))).filter(type__contains='Web')
    scrum = webapps.filter(metodologies__contains='crum').count()
    xp = webapps.filter(metodologies__contains='XP').count()
    up = webapps.filter(metodologies__contains='RUP Agil').count() +  webapps.filter(metodologies__contains='(UP)').count()
    rup = webapps.filter(metodologies__contains='RUP').count() - up
    incremental = webapps.filter(metodologies__contains='crementa').count()
    cascada = webapps.filter(metodologies__contains='scada').count()
    iweb = webapps.filter(metodologies__icontains='web').count()
    others = webapps.count() - (scrum + xp + up + incremental + cascada + iweb + rup)
    methodologies = [{'name':'Scrum', 'total':scrum},
                     {'name':'RUP Agil', 'total':up},
                     {'name':'Incremental', 'total':incremental},
                     {'name':'IWeb', 'total':iweb},
                     {'name':'XP', 'total':xp},
                     {'name':'Cascada', 'total':cascada},
                     {'name':'RUP', 'total':rup},
                     {'name':'Otros', 'total':others}]
    return {'Methodologies': methodologies}
