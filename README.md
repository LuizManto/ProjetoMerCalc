# MerCalc

Projeto de estudo para controlar gastos de mercado.

## Objetivo
- Montar listas de compras
- Marcar itens pegos e informar o preço em tempo real
- Registrar itens pegos fora da lista
- Ver o total gasto no mês

## Tecnologias
Python, MySQL (framework web a definir)

## Banco de dados
O script `schema.sql` cria o banco `MerCalcDb` com as tabelas
`usuarios`, `listas_mercado` e `itens_lista`.
Requer MySQL 8.0.16 ou superior.

mysql -u seu_usuario -p < schema.sql

## Status
Em desenvolvimento (modelagem do banco concluída).
