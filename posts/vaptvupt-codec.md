title: VaptVupt: um codec de compactação em C11
title-en: VaptVupt: a compression codec in C11
date: 2026-09-26 18:04
tags: projects, built
summary: Codec LZ e tANS com formato documentado, testes de compatibilidade e decodificadores de referência.
summary-en: An LZ and tANS codec with a documented format, compatibility tests, and reference decoders.
image: /images/projects/vaptvupt-codec.webp
project-url: https://git.securityops.co/cristiancmoises/vaptvupt-codec
---

**VaptVupt** é meu codec de compactação LZ + tANS em C11. Ele é um projeto próprio, separado do ZUPT, que o inclui em seu fluxo de backups. O repositório publica o formato, a biblioteca, a ferramenta de linha de comando, testes e decodificadores de referência em Python e JavaScript para a saída atual do codificador.

![Página da aplicação VaptVupt relacionada ao codec](/images/projects/vaptvupt-codec.webp)

*Imagem: [prévia datada da aplicação VaptVupt na Security Ops Wiki](https://wiki.securityops.co/services/vaptvupt.html). Ela mostra um projeto que usa o codec, não uma interface do codec em si.*

A versão 2.65.12 mantém o decodificador C como referência para todas as variantes antigas do formato. Os decodificadores Python e JavaScript têm cobertura mais limitada para esses dados legados, conforme o README. O código original é Apache-2.0; a implementação derivada de XXH64 conserva seu aviso BSD-2-Clause. O projeto documenta as verificações de entradas malformadas e os trabalhos ainda necessários para outros ambientes de integração.

[Código-fonte e documentação do formato](https://git.securityops.co/cristiancmoises/vaptvupt-codec).
