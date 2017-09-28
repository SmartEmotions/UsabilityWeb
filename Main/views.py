from django.shortcuts import render

def initView(request):
    return render(request, 'init.html')

def nav(request):
    return render(request, 'sideNav.html')
