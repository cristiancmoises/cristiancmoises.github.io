title: mirim: SQL embarcado com armazenamento criptografado
title-en: mirim: embedded SQL with encrypted storage
date: 2026-09-26 18:11
tags: projects, built
summary: Banco de dados SQL embarcado em Rust, com armazenamento criptografado e exportações seladas com criptografia pós-quântica.
summary-en: An embedded SQL database in Rust with encrypted storage and post-quantum sealed exports.
image: /images/projects/mirim.webp
project-url: https://git.securityops.co/cristiancmoises/mirim
---

O **mirim** é meu banco de dados SQL embarcado: pequeno o bastante para integrar a uma aplicação, com dados criptografados em repouso, registro de escrita durável e exportações seladas com criptografia pós-quântica. O núcleo é escrito em Rust com `unsafe` proibido; as ligações C e a interface gráfica ficam em componentes separados.

![Página de apresentação do mirim](/images/projects/mirim.webp)

*Imagem: [captura datada da página do mirim na Security Ops Wiki](https://wiki.securityops.co/services/mirim.html).*

O projeto documenta o subconjunto SQL aceito, o formato de armazenamento, a abertura de bases e os procedimentos de exportação e recuperação. Como em qualquer banco criptografado, guardar a chave e testar a restauração faz parte do trabalho: perder a chave significa perder o acesso aos dados. A documentação de segurança delimita as ameaças que o mirim procura cobrir.

[Código-fonte e guia de integração](https://git.securityops.co/cristiancmoises/mirim) · [Documentação na wiki](https://wiki.securityops.co/services/mirim.html).
