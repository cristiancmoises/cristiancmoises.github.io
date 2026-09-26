title: guixvis: enxergando as dependências do GNU Guix
title-en: guixvis: exploring GNU Guix dependencies
date: 2026-09-26 18:14
tags: projects, built
summary: Um explorador interativo de pacotes e dependências do GNU Guix, feito em Rust para uso no terminal.
summary-en: An interactive GNU Guix package and dependency explorer written in Rust for the terminal.
image: /images/projects/guixvis.webp
project-url: https://git.securityops.co/cristiancmoises/guixvis
---

O **guixvis** nasceu de uma necessidade prática: descobrir rapidamente como os pacotes do GNU Guix se relacionam. Escrevi o explorador em Rust com uma interface de terminal que permite pesquisar pacotes e navegar pelas dependências diretas, transitivas e reversas.

![Grafo de dependências no guixvis](/images/projects/guixvis.webp)

*Imagem: [captura da versão 0.8.0 no repositório](https://git.securityops.co/cristiancmoises/guixvis/raw/branch/main/assets/guixvis-tui-graph-0.8.0.png).*

A versão 0.8.0 mantém o mesmo pacote selecionado entre abas, inicia o grafo em uma vizinhança legível e distingue versões diferentes e variantes privadas de pacotes. O projeto também inclui visualizações para navegador e integração com Emacs. Ele ajuda a investigar o grafo de pacotes; a instalação e as decisões sobre confiança continuam sendo responsabilidade do usuário e do Guix.

[Código-fonte, guia de uso e limitações](https://git.securityops.co/cristiancmoises/guixvis).
