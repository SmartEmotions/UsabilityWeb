from __future__ import unicode_literals
from django.db import models
class Methodologies(models.Model):
    method_id = models.CharField(primary_key=True, max_length=4)
    method_name = models.CharField(max_length=100, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'methodologies'


class Developmentpractice(models.Model):
    prac_id = models.AutoField(primary_key=True)
    prac_meth = models.ForeignKey(Methodologies, models.DO_NOTHING, db_column='prac_meth')
    prac_name = models.CharField(max_length=500, blank=True, null=True)
    prac_desc = models.TextField(blank=True, null=True)
    prac_type = models.CharField(max_length=100, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'developmentpractice'

# class Practiceevaluation(models.Model):
#     pe_id = models.AutoField(primary_key=True)
#     pe_applic = models.ForeignKey(Webaplications, models.DO_NOTHING, db_column='pe_applic')
#     pe_practi = models.ForeignKey(Developmentpractice, models.DO_NOTHING, db_column='pe_practi', blank=True, null=True)
#     pe_status = models.NullBooleanField()
#     pe_dateti = models.DateTimeField(blank=True, null=True)
#
#     class Meta:
#         managed = False
#         db_table = 'practiceevaluation'
