title: Keywave: conversas efêmeras e chamadas no navegador
title-en: Keywave: ephemeral chats and browser calls
date: 2026-09-26 18:01
tags: projects, built
summary: Salas temporárias de conversa e vídeo com conteúdo cifrado entre participantes e sem histórico armazenado.
summary-en: Temporary chat and video rooms with participant-encrypted content and no stored history.
image: /images/projects/keywave.webp
project-url: https://git.securityops.co/cristiancmoises/keywave
---

**Keywave** é a ferramenta que desenvolvo para conversas temporárias no navegador. Ela não exige conta nem guarda o histórico das mensagens. Um serviço Flask/Socket.IO encaminha a sinalização; os navegadores negociam chaves entre participantes e cifram o conteúdo da conversa. Há salas individuais e grupos de dois a seis participantes.

![Página do projeto Keywave](/images/projects/keywave.webp)

*Imagem: [captura datada do Keywave na Security Ops Wiki](https://wiki.securityops.co/services/keywave.html).*

O projeto documenta uma combinação de ECDH P-256 e ML-KEM-1024 para a troca de chaves, AES-256-GCM para mensagens e WebRTC para áudio e vídeo. Mesmo sem histórico no servidor, os participantes e a infraestrutura de rede ainda podem observar metadados ou registrar o próprio conteúdo. Compare os números de segurança por um canal confiável quando a identidade do interlocutor for importante.

[Código-fonte e modelo de segurança](https://git.securityops.co/cristiancmoises/keywave) · [Guia na wiki](https://wiki.securityops.co/services/keywave.html).
