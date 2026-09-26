title: HNews: leitura rápida do Hacker News
title-en: HNews: a fast Hacker News reader
date: 2026-09-26 18:17
tags: projects, built
summary: Leitor leve em Python para notícias e discussões, sem JavaScript nem imagens externas na página.
summary-en: A lightweight Python reader for stories and discussions, with no JavaScript or third-party images.
image: /images/projects/hnews.webp
project-url: https://git.securityops.co/cristiancmoises/hnews
---

**HNews**, publicado como **HN Fast**, é meu leitor enxuto para histórias e discussões do Hacker News. Escrevi o serviço com a biblioteca padrão do Python. A página usa um visual preto e ciano, sem JavaScript, cookies de rastreamento, imagens de terceiros ou dependências Python adicionais.

![Página do HN Fast](/images/projects/hnews.webp)

*Imagem: [captura datada do HN Fast na Security Ops Wiki](https://wiki.securityops.co/services/news.html).*

Uma tarefa de fundo busca até 50 histórias principais em intervalos aproximados de um minuto; visitantes leem a mesma cópia em memória, sem disparar uma consulta externa por visita. Isso reduz trabalho repetido, mas também significa que a lista pode ficar temporariamente desatualizada se a API falhar. O endpoint de saúde indica apenas que o processo está vivo. Os dados vêm da API oficial do Hacker News; o projeto não é afiliado ao Hacker News nem à Y Combinator.

[Código-fonte e instruções de execução](https://git.securityops.co/cristiancmoises/hnews) · [Guia na wiki](https://wiki.securityops.co/services/news.html).
