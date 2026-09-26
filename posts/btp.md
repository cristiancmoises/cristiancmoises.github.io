title: BTP: pesquisa em um protocolo de aplicação pós-quântico
title-en: BTP: research into a post-quantum application protocol
date: 2026-09-26 18:09
tags: projects, built
summary: Especificação e implementação de referência do Berkeley Transport Protocol, ainda anterior à versão 1.0.
summary-en: Specification and reference implementation of the Berkeley Transport Protocol, still at a pre-1.0 stage.
image: /images/projects/btp.webp
project-url: https://git.securityops.co/cristiancmoises/btp
---

O **Berkeley Transport Protocol (BTP)** é uma pesquisa que conduzo sobre um protocolo de aplicação concebido com criptografia pós-quântica desde a especificação. O repositório reúne os documentos normativos, a implementação de referência em Rust, clientes e testes de conformidade. Um [artigo técnico publicado no Zenodo](https://zenodo.org/records/20278231) apresenta as decisões de projeto.

![Portal de documentação do BTP](/images/projects/btp.webp)

*Imagem: [captura datada do portal BTP na Security Ops Wiki](https://wiki.securityops.co/services/btp.html).*

O BTP está **antes da versão 1.0** e deve ser tratado como protocolo experimental. Acesso nativo e leitura por gateway HTTPS têm limites de confiança diferentes: o gateway verifica no servidor, enquanto o cliente nativo pode verificar diretamente. Antes de confiar em uma origem, o usuário precisa conferir a identidade e a impressão digital por um canal apropriado.

[Especificação, código e testes](https://git.securityops.co/cristiancmoises/btp) · [Guia na wiki](https://wiki.securityops.co/services/btp.html).
