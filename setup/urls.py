from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    
    #Pagina Inicial
    path('', include('principal.urls')),
    #App para autenticao
    #path('usuarios/', include('usuarios.urls')),
    #App para a calc
    #path('compras/', include('compras.urls')),
    #App para a dashboard
    path('dashboard/', include('dashboard.urls')),

]