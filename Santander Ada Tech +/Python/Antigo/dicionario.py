# DICIONÁRIO

dicionario = {}
dicionario2 = dict()

dicionario = { 'nome': 'Xyz', 'idade': 26, 'altura': 1.80}

print(dicionario)

print(dicionario['altura'])


# adicionar elemento

dicionario['localidade'] = 'RJ'

print(dicionario)


# Iteração sobre o dicionário

for chave in dicionario:
    print(chave, dicionario[chave])
    

# Testando a existência de uma chave

print('peso' in dicionario)
print('idade' in dicionario)

