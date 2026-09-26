title: Esquema: contêineres Linux descritos em Guile
title-en: Esquema: Linux containers described in Guile
date: 2026-09-26 18:07
tags: projects, built
summary: Um runtime de contêineres sem daemon, com API Guile e camada C para isolamento Linux.
summary-en: A daemonless container runtime with a Guile API and a C layer for Linux isolation.
image: /images/projects/esquema.webp
project-url: https://git.securityops.co/cristiancmoises/esquema
---

**Esquema** é o runtime de contêineres que desenvolvo para descrever cargas de trabalho como valores Scheme. A API em Guile chama uma biblioteca C que prepara namespaces, isolamento de arquivos, redução de capacidades e filtros `seccomp` antes de executar o processo. O projeto dispensa um daemon e inclui integração com GNU Guix e Shepherd.

![Página de documentação do Esquema](/images/projects/esquema.webp)

*Imagem: [captura datada da página do Esquema na Security Ops Wiki](https://wiki.securityops.co/services/esquema.html).*

O funcionamento depende de recursos e permissões do kernel Linux. O modo estrito requer ainda Landlock, controladores cgroups v2 delegados e APIs modernas de montagem. BSD, macOS e Windows precisam de uma máquina virtual Linux; não há suporte nativo para esses kernels. O guia explica como preparar uma raiz mínima e testar o isolamento com dados descartáveis.

[Código-fonte e guia operacional](https://git.securityops.co/cristiancmoises/esquema) · [Documentação na wiki](https://wiki.securityops.co/services/esquema.html).
