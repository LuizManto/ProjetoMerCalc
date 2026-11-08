from django.urls import path
from . import views

urlpatterns = [
    path('', views.lista_compras, name='lista_compras'),
    path('nova/', views.nova_compra, name='nova_compra'),
]