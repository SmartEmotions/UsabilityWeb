from __future__ import unicode_literals
from django.db import models
from Methodologies.models import Methodologies

class Gradeworks(models.Model):
    work_id = models.AutoField(primary_key=True)
    work_name = models.CharField(max_length=1000, blank=True, null=True)
    work_type = models.CharField(max_length=100, blank=True, null=True)
    work_year = models.CharField(max_length=4, blank=True, null=True)
    work_uevalu = models.NullBooleanField(null=True)
    work_develo = models.NullBooleanField(null=True)
    work_status = models.CharField(max_length=2, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'gradeworks'

class Webaplications(models.Model):
    app = models.ForeignKey(Gradeworks, models.DO_NOTHING, primary_key=True)
    app_metho = models.ForeignKey(Methodologies, models.DO_NOTHING, db_column='app_metho', blank=True, null=True)
    app_cmenb = models.SmallIntegerField(blank=True, null=True)
    app_entit = models.CharField(max_length=20, blank=True, null=True)
    app_secto = models.CharField(max_length=100, blank=True, null=True)
    app_produ = models.NullBooleanField()
    app_trodu = models.CharField(max_length=50, blank=True, null=True)
    app_updat = models.DateField(blank=True, null=True)
    app_dupda = models.TextField(blank=True, null=True)
    app_lback = models.CharField(max_length=500, blank=True, null=True)
    app_lfron = models.CharField(max_length=500, blank=True, null=True)
    app_nsgdb = models.CharField(max_length=100, blank=True, null=True)
    app_ffram = models.CharField(max_length=100, blank=True, null=True)
    app_bfram = models.CharField(max_length=100, blank=True, null=True)
    app_appse = models.CharField(max_length=100, blank=True, null=True)
    app_tcost = models.CharField(max_length=50, blank=True, null=True)
    app_qualf = models.DecimalField(max_digits=3, decimal_places=0, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'webaplications'
