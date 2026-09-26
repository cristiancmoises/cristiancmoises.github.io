title: Security Ops OS: minha imagem GNU Guix para segurança
title-en: Security Ops OS: my GNU Guix security image
date: 2026-09-26 18:06
tags: projects, built
summary: Uma imagem live do GNU Guix com configuração própria, ferramentas selecionadas e instruções de construção reproduzível.
summary-en: A GNU Guix live image with custom configuration, selected tools, and reproducible build instructions.
image: /images/projects/securityops-os.webp
project-url: https://git.securityops.co/cristiancmoises/securityops-os
---

**Security Ops OS** é a imagem live que construo sobre o GNU Guix System para minhas atividades de segurança, privacidade e análise. A configuração em Scheme define o sistema, os serviços e um conjunto selecionado de ferramentas; o repositório inclui scripts de construção e instruções para gerar a ISO.

![Página de apresentação do Security Ops OS](/images/projects/securityops-os.webp)

*Imagem: [captura datada da página de apresentação na Security Ops Wiki](https://wiki.securityops.co/services/guix.html); não é uma captura da sessão live.*

O trabalho original está na configuração, integração, seleção de pacotes e imagem de distribuição. GNU Guix e os aplicativos incluídos pertencem aos seus respectivos autores. Antes de instalar em um disco, confirme a imagem e os requisitos de hardware, faça cópia dos dados e teste o sistema em uma máquina virtual ou sessão live. A instalação pode sobrescrever o disco escolhido.

[Código-fonte e instruções de construção](https://git.securityops.co/cristiancmoises/securityops-os) · [Guia na wiki](https://wiki.securityops.co/services/guix.html).
