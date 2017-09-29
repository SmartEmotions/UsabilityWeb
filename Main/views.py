from django.shortcuts import render

def initView(request):
    return render(request, 'init.html')
