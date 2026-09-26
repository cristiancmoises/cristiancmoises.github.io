title: SecTube: uma interface auto-hospedável para vídeos
title-en: SecTube: a self-hosted interface for videos
date: 2026-09-26 18:18
tags: projects, built
summary: Navegador de vídeos com interface própria, temas e proxy de API para uma instância auto-hospedada.
summary-en: A video browser with its own interface, themes, and an API proxy for self-hosting.
image: /images/projects/sectube.webp
project-url: https://git.securityops.co/cristiancmoises/sectube
---

**SecTube** é a interface que desenvolvo para navegar vídeos em uma instalação própria, sem exigir login no aplicativo. Ela usa React na interface e OpenResty como proxy para a API do YouTube. A versão 4 oferece temas, feeds com rolagem contínua, seletor de país e um player baseado na API oficial de incorporação do YouTube.

![Interface do SecTube](/images/projects/sectube.webp)

*Imagem: [prévia datada do SecTube na Security Ops Wiki](https://wiki.securityops.co/services/youtube.html).*

O proxy aceita várias chaves da YouTube Data API e alterna entre elas quando uma atinge o limite; respostas repetidas podem usar cache no servidor. Para pesquisar e preencher os feeds, quem hospeda precisa configurar uma chave válida e respeitar as cotas do provedor. O conteúdo e a disponibilidade continuam dependentes das APIs e do player do YouTube; auto-hospedar a interface não transforma esses serviços em infraestrutura própria.

[Código-fonte e instruções de implantação](https://git.securityops.co/cristiancmoises/sectube) · [Guia na wiki](https://wiki.securityops.co/services/youtube.html).
