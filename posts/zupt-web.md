title: ZUPT Web: backups pelo navegador no seu servidor
title-en: ZUPT Web: browser backups on your own server
date: 2026-09-26 18:21
tags: projects, built
summary: Interface auto-hospedável para compactar, cifrar, verificar, inspecionar e extrair arquivos ZUPT.
summary-en: A self-hosted interface to compress, encrypt, verify, inspect, and extract ZUPT archives.
image: /images/projects/zupt-web.webp
project-url: https://git.securityops.co/cristiancmoises/zupt-web
---

**ZUPT Web** é a interface que desenvolvo para usar o arquivador ZUPT no navegador de uma instalação própria. Ela permite compactar, cifrar, verificar, inspecionar e extrair arquivos `.zupt`, sem criar contas ou enviar os backups a um serviço de armazenamento em nuvem. A distribuição usa um contêiner Docker e inclui o código-fonte do ZUPT 5.2.9 e do codec VaptVupt 2.65.11.

![Interface do ZUPT Web](/images/projects/zupt-web.webp)

*Imagem: [prévia datada do ZUPT Web na Security Ops Wiki](https://wiki.securityops.co/services/zupt-web.html).*

A versão 5.2.9 tem uma mudança importante para quem guardou arquivos com a antiga imagem 5.2.1: arquivos com senha Argon2id ou modo `--pq-sdk` podem exigir o leitor de compatibilidade daquela versão. Não descarte o ambiente antigo antes de restaurar e migrar esses backups. O guia de migração documenta a diferença entre os modos de senha, híbrido e pós-quântico da versão atual.

[Código-fonte, implantação e migração](https://git.securityops.co/cristiancmoises/zupt-web) · [Guia na wiki](https://wiki.securityops.co/services/zupt-web.html).
