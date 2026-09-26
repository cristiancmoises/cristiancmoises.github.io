title: SecChat: salas de conversa sem JavaScript
title-en: SecChat: chat rooms without JavaScript
date: 2026-09-26 18:16
tags: projects, built
summary: Aplicação de chat com formulários HTML, atualização periódica e mensagens cifradas pelo servidor.
summary-en: A chat application with HTML forms, periodic refreshes, and server-encrypted messages.
image: /images/projects/secchat.webp
project-url: https://git.securityops.co/cristiancmoises/secchat
---

**SecChat** é uma aplicação de salas de conversa que desenvolvi para funcionar sem JavaScript no navegador. As mensagens são enviadas por formulários HTML, e a página busca atualizações com uma recarga periódica. O servidor FastAPI usa Argon2id para senhas e ChaCha20-Poly1305 para cifrar mensagens mantidas em memória.

![Interface do SecChat](/images/projects/secchat.webp)

*Imagem: [captura datada do SecChat na Security Ops Wiki](https://wiki.securityops.co/services/secchat.html); o [repositório também mostra a interface](https://git.securityops.co/cristiancmoises/secchat/raw/branch/main/screenshots/one.png).*

O servidor faz a cifragem **e a decifragem**; portanto, a aplicação exige confiança em quem a hospeda e não deve ser descrita como criptografia ponta a ponta entre navegadores. As salas e contas vivem somente na memória e desaparecem quando o processo reinicia. A implantação precisa de HTTPS para proteger o transporte e o cookie de sessão, além da configuração descrita no README.

[Código-fonte e arquitetura](https://git.securityops.co/cristiancmoises/secchat) · [Guia na wiki](https://wiki.securityops.co/services/secchat.html).
