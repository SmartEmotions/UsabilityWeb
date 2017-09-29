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
    metodologies = models.CharField(max_length=100, blank=True, null=True)
    tools = models.CharField(max_length=200, blank=True, null=True)
    frameworks = models.CharField(max_length=200, blank=True, null=True)
    state = models.CharField(max_length=20, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'efforts'
