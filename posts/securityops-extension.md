title: Security Ops Extension: controles de privacidade no navegador
title-en: Security Ops Extension: browser privacy controls
date: 2026-09-26 18:24
tags: projects, built
summary: Extensão livre para bloqueio de categorias, tema escuro e controles de redirecionamento, proxy e Tor.
summary-en: A free software extension for category blocking, dark mode, redirects, proxies, and Tor controls.
image: /images/projects/securityops-extension.webp
project-url: https://git.securityops.co/cristiancmoises/securityops-extension
---

**Security Ops Extension** é a extensão que desenvolvo para reunir controles de privacidade em Chrome, Edge e Firefox. O código usa Manifest V3 e oferece bloqueio de categorias de sites, remoção de parâmetros de rastreamento de links, preferência por HTTPS, tema escuro configurável e opções de redirecionamento para serviços alternativos.

![Ícone da Security Ops Extension](/images/projects/securityops-extension.webp)

*Imagem: [ícone original da extensão no repositório](https://git.securityops.co/cristiancmoises/securityops-extension/raw/branch/main/src/icons/icon128.png); não é uma captura da interface.*

As listas de bloqueio vêm de projetos de terceiros, incluindo Hagezi e uma lista NSFW creditada no README; o meu trabalho está na extensão, sua interface e integração. O botão de Tor depende de um daemon local em `127.0.0.1:9050`, e recursos de proxy variam entre navegadores. A extensão não inclui telemetria própria, mas baixa atualizações de listas e pode consultar o endereço IP por opção do usuário. Nenhuma extensão elimina todos os rastreadores ou substitui uma configuração completa do navegador.

[Código-fonte, instruções de construção e política de privacidade](https://git.securityops.co/cristiancmoises/securityops-extension).
