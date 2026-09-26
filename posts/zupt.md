title: ZUPT: arquivos de backup compactados e autenticados
title-en: ZUPT: compressed and authenticated backup archives
date: 2026-09-26 18:05
tags: projects, built
summary: Ferramenta de backup em C11 que une compactação, criptografia autenticada, verificação e restauração.
summary-en: A C11 backup tool combining compression, authenticated encryption, verification, and restore.
image: /images/projects/zupt.webp
project-url: https://git.securityops.co/cristiancmoises/zupt
---

**ZUPT** é a ferramenta de backup que desenvolvo em C11. Ela cria arquivos compactados com o codec VaptVupt integrado e oferece criptografia autenticada, verificação de integridade, processamento com múltiplas threads e uma interface gráfica Python/Qt além da linha de comando. Há modos de senha e de chave pós-quântica híbrida documentados no projeto.

![Página do projeto ZUPT](/images/projects/zupt.webp)

*Imagem: [captura datada da página do ZUPT na Security Ops Wiki](https://wiki.securityops.co/services/zupt.html).*

A versão 5.2.9 atualiza o codec integrado e endurece a leitura de entradas truncadas ou corrompidas sem alterar o formato de arquivo 1.6. Uma cópia de segurança só cumpre seu papel quando é possível restaurá-la: conserve as chaves, verifique os arquivos gerados e faça testes de recuperação antes de depender deles para dados únicos.

[Código-fonte, manual e notas de versão](https://git.securityops.co/cristiancmoises/zupt) · [Guia na wiki](https://wiki.securityops.co/services/zupt.html).
