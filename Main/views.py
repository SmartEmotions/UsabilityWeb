from django.shortcuts import render
from django.views.decorators.clickjacking import xframe_options_exempt

@xframe_options_exempt
def initView(request):
    return render(request, 'init.html')

@xframe_options_exempt
def testHTML(request):
    return render(request, 'test.html')
