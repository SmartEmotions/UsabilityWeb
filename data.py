# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from __future__ import unicode_literals

from django.db import models

class Efforts(models.Model):
    name = models.TextField()
    type = models.CharField(max_length=100, blank=True, null=True)
    year = models.CharField(max_length=5, blank=True, null=True)
    development = models.CharField(max_length=2, blank=True, null=True)
    usability = models.CharField(max_length=2, blank=True, null=True)
    metodologies = models.CharField(max_length=200, blank=True, null=True)
    tools = models.CharField(max_length=200, blank=True, null=True)
    frameworks = models.CharField(max_length=200, blank=True, null=True)
    state = models.CharField(max_length=20, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'efforts'


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


class Heuristicevaluation(models.Model):
    ue_id = models.AutoField(primary_key=True)
    ue_applica = models.ForeignKey('Webaplications', models.DO_NOTHING, db_column='ue_applica')
    ue_sysvisi = models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)
    ue_usrlang = models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)
    ue_ctrfree = models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)
    ue_constan = models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)
    ue_feedbak = models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)
    ue_errprev = models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)
    ue_flexefi = models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)
    ue_edminim = models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)
    ue_helpdoc = models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'heuristicevaluation'


class Methodologies(models.Model):
    method_id = models.CharField(primary_key=True, max_length=4)
    method_name = models.CharField(max_length=100, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'methodologies'


class Practiceevaluation(models.Model):
    pe_id = models.AutoField(primary_key=True)
    pe_applic = models.ForeignKey('Webaplications', models.DO_NOTHING, db_column='pe_applic')
    pe_practi = models.ForeignKey(Developmentpractice, models.DO_NOTHING, db_column='pe_practi', blank=True, null=True)
    pe_status = models.NullBooleanField()
    pe_dateti = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'practiceevaluation'


class Webaplications(models.Model):
    app = models.ForeignKey(Gradeworks, models.DO_NOTHING, primary_key=True)
    app_metho = models.ForeignKey(Methodologies, models.DO_NOTHING, db_column='app_metho', blank=True, null=True)
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
