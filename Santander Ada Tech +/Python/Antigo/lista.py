# LISTAS

cesta = ['maçã', 'banana', 'uva','abacaxi']

nota = [7.9, 6.7, 8.2]

"""for x in nota:
    print(x)"""
    
lista_de_lista= [10, 'as', [6,3,2,], 'and']

len(lista_de_lista)


## Metodos da lista
# append

nota.append(10)
print(nota)


# insert

nota.insert(0, 6)
print(nota)


# extend

nota2 = [ 10, 5.5, 7, 6.6]
nota.extend(nota2)
print(nota)


#pop

nota.pop()
print(nota)

nota.pop(0)
print(nota)


# remove

nota.remove(10)
print(nota)


# count

nota.count(10)
print(f"Quantidade de 10 na lista: {nota.count(10)}")


# index
nota.index(10)
print(f"Index do 10 na lista: {nota.index(10)}")


# sort
nota.sort()
print(nota)

nota.sort(reverse=True)
print(nota)

## Funções da lista

#len
print(f"Tamanho da lista: {len(nota)}")


#sum
print(f"Soma do valores da lista: {sum(nota)}")


#max
print(f"Maior valor da lista: {max(nota)}")


#min
print(f"Menor valor da lista: {min(nota)}")
