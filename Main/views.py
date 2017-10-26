from django.shortcuts import render

def initView(request):
    return render(request, 'init.html')

def testHTML(request):
    return render(request, 'test.html')
