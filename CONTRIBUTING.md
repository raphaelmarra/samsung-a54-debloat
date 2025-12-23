# Contribuindo

Obrigado por querer contribuir! Este guia foi criado para ajudar usuarios Samsung a otimizar seus dispositivos.

## Como Contribuir

### Reportar Problemas

1. Verifique se o problema ja foi reportado nas [Issues](https://github.com/raphaelmarra/samsung-a54-debloat/issues)
2. Se nao, crie uma nova Issue com:
   - Modelo do celular (ex: SM-A546E)
   - Versao do Android/One UI
   - App que causou problema
   - O que aconteceu vs o que esperava

### Sugerir Novos Apps para Remover

1. Abra uma Issue com o titulo: `[APP] nome.do.pacote`
2. Inclua:
   - Nome do pacote completo
   - O que o app faz
   - Por que e seguro remover
   - Se voce testou e por quanto tempo

### Enviar Pull Request

1. Fork este repositorio
2. Crie uma branch: `git checkout -b minha-contribuicao`
3. Faca suas alteracoes
4. Teste no seu dispositivo
5. Commit: `git commit -m "feat: adiciona app X a lista segura"`
6. Push: `git push origin minha-contribuicao`
7. Abra um Pull Request

## Regras

- Apenas adicione apps que voce TESTOU pessoalmente
- Inclua o modelo do celular onde testou
- Nunca adicione apps criticos do sistema
- Documente qualquer efeito colateral

## Estrutura do Projeto

```
README.md           # Guia principal
LICENSE             # Licenca MIT
CONTRIBUTING.md     # Este arquivo
scripts/            # Scripts .bat para Windows
listas/             # Listas de apps
```

## Codigo de Conduta

- Seja respeitoso
- Ajude outros usuarios
- Reporte problemas de forma construtiva
