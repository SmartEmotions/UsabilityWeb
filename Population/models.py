from __future__ import unicode_literals
from django.db import models
from Methodologies.models import Methodologies

class Gradeworks(models.Model):
    work_id = models.AutoField(primary_key=True)
    work_name = models.CharField(max_length=1000, blank=True, null=True)
    work_year = models.CharField(max_length=4, blank=True, null=True)
    work_iswapp = models.NullBooleanField()
    work_ismapp = models.NullBooleanField()
    work_isdesk = models.NullBooleanField()
    work_isaudi = models.NullBooleanField()
    work_isweng = models.NullBooleanField()
    work_isdbmn = models.NullBooleanField()
    work_isothe = models.NullBooleanField()
    work_uevalu = models.NullBooleanField()
    work_status = models.CharField(max_length=2, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'gradeworks'

class Webaplications(models.Model):
    app = models.ForeignKey(Gradeworks, models.DO_NOTHING)
    app_metho = models.ForeignKey(Methodologies, models.DO_NOTHING, db_column='app_metho')
    app_types = models.CharField(max_length=50, blank=True, null=True)
    app_cmenb = models.SmallIntegerField(blank=True, null=True)
    app_lease = models.IntegerField(blank=True, null=True)
    app_ueval = models.NullBooleanField()
    app_lback = models.CharField(max_length=500, blank=True, null=True)
    app_lfron = models.CharField(max_length=500, blank=True, null=True)
    app_nsgdb = models.CharField(max_length=100, blank=True, null=True)
    app_produ = models.NullBooleanField()
    app_trodu = models.CharField(max_length=50, blank=True, null=True)
    app_updat = models.NullBooleanField()
    app_lupda = models.DateField(blank=True, null=True)
    app_tcost = models.CharField(max_length=50, blank=True, null=True)
    app_qualf = models.DecimalField(max_digits=3, decimal_places=0, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'webaplications'
