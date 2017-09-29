from __future__ import unicode_literals
from django.db import models
from Population.models import Webaplications

class Heuristicevaluation(models.Model):
    ue_id = models.AutoField(primary_key=True)
    ue_applica = models.ForeignKey(Webaplications, models.DO_NOTHING, db_column='ue_applica')
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
