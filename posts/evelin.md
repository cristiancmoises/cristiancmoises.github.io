title: Evelin: acesso remoto e túneis pós-quânticos
title-en: Evelin: remote access and post-quantum tunnels
date: 2026-09-26 18:10
tags: projects, built
summary: Transporte seguro em Rust para comandos, sessões interativas, cópia de arquivos e encaminhamento de portas.
summary-en: Secure Rust transport for commands, interactive sessions, file copies, and port forwarding.
image: /images/projects/evelin.webp
project-url: https://git.securityops.co/cristiancmoises/evelin
---

**Evelin** é um projeto de transporte seguro que desenvolvo em Rust. Ele oferece execução de comandos, sessões interativas, cópia de arquivos e encaminhamento de portas por um protocolo próprio, independente do protocolo SSH. A documentação inclui arquitetura, exemplos, configuração de identidade e limites operacionais.

![Página de documentação do Evelin](/images/projects/evelin.webp)

*Imagem: [captura datada da documentação do Evelin na Security Ops Wiki](https://wiki.securityops.co/services/evelin.html).*

Na versão 4.4.0, o projeto acrescenta exportações fixas, definidas pelo servidor, para alguns formatos de PostgreSQL e Forgejo. Esse recurso vem desativado por padrão e exige política local explícita. Ao configurar uma conexão, confirme a identidade do servidor por um canal confiável e limite as portas e os destinos encaminhados ao necessário; o protocolo e seus limites estão descritos no repositório.

[Código-fonte e documentação](https://git.securityops.co/cristiancmoises/evelin) · [Guia na wiki](https://wiki.securityops.co/services/evelin.html).
