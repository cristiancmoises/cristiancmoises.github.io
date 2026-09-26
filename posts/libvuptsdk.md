title: libvuptsdk: API C para arquivos ZUPT
title-en: libvuptsdk: C API for ZUPT archives
date: 2026-09-26 18:26
tags: projects, built
summary: SDK em C para criar, verificar e extrair arquivos ZUPT a partir de outras aplicações.
summary-en: A C SDK for creating, verifying, and extracting ZUPT archives from other applications.
image: /images/projects/libvuptsdk.webp
project-url: https://git.securityops.co/cristiancmoises/libvuptsdk
---

**libvuptsdk** é o SDK que desenvolvo para aplicações que precisam criar, verificar e extrair arquivos ZUPT por uma API C. A distribuição de código-fonte `2.1.0-base.1` integra o motor do ZUPT 5.2.9 e o codec VaptVupt 2.65.11, com bibliotecas estática e compartilhada, cabeçalho público, exemplos e `pkg-config`.

![Documentação da libvuptsdk](/images/projects/libvuptsdk.webp)

*Imagem: captura da [documentação no repositório da libvuptsdk](https://git.securityops.co/cristiancmoises/libvuptsdk); o SDK não tem interface gráfica própria.*

O SDK tem um propósito diferente do arquivador [ZUPT](https://git.securityops.co/cristiancmoises/zupt) e do [codec independente](https://git.securityops.co/cristiancmoises/vaptvupt-codec): expor operações de arquivo a programas de terceiros. A API de base é uma **prévia** e não equivale ao antigo binário de ABI completa, que inclui funções extras sem fonte integral neste repositório. O guia recomenda limites de extração por contexto; a API de I/O por callback ainda usa arquivos temporários e não é streaming de memória constante.

[Código-fonte, referência da API e notas de compatibilidade](https://git.securityops.co/cristiancmoises/libvuptsdk).
