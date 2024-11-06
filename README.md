# Sobre
Este é um desafio técnico do processo seletivo da Soutag para vaga de Desenvolvedor(a) Ruby on Rails. Os objetivos são:
- Corrigir e ajustar o código para que todos os testes fornecidos passem corretamente.
- Adicionar dois tipos de descontos sobre o preço total (após cálculo de impostos):
  - Um desconto de 5% se o produto for da categoria 'food' ou 'beverages'.
  - Um desconto de 10% se estivermos no mês de aniversário do usuário (o atributo para mês de aniversário já está indicado no objeto user).
 
## Estrutura e Funcionalidades

### 1. Uso de Constantes para Descontos
- Descontos são definidos por constantes, facilitando ajustes futuros nos valores de desconto sem precisar modificar o código dos métodos.
- Esse uso de constantes torna o código mais legível, deixando o propósito dos valores explícito.

### 2. Simplificação do Método `call`
- O método `call` calcula o preço total somando o `base_price` e `tax_amount`, e então subtrai o valor do desconto (calculado pelo `discount_amount`).
- A redundância no método `final_price` foi removida, simplificando a lógica de cálculo do preço final.

### 3. Garantia de Valores Não Nulos para Preço Base e Taxa
- Foram adicionados valores padrão para `base_price` e `tax_percentage` para evitar erros caso esses valores não estejam presentes no `product`.
- Isso aumenta a robustez do código e facilita o tratamento de dados incompletos.

### 4. Método `discount_amount`
- `discount_amount` é um método privado que calcula o valor dos descontos com base no preço total.
- Este método recebe o preço total como argumento e acumula o percentual de desconto, baseado em condições definidas.
- Isso torna o cálculo de descontos mais flexível e facilita a adição de novas condições de desconto no futuro.

### 5. Métodos Auxiliares para Verificação de Elegibilidade de Descontos
- Métodos como `eligible_for_food_or_beverage_discount?` e `eligible_for_birthday_discount?` encapsulam as condições de elegibilidade para descontos específicos.
- Esses métodos isolam a lógica de desconto, tornando o código mais claro e modular, além de melhorar a legibilidade e evitar condicionais complexas no método `discount_amount`.
