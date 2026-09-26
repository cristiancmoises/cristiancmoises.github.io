title: WhatsAppel: conversas dentro do Emacs
title-en: WhatsAppel: conversations inside Emacs
date: 2026-09-26 18:03
tags: projects, built
summary: Cliente nativo para Emacs com navegação de conversas, mídia e estados de entrega.
summary-en: A native Emacs client with conversation browsing, media, and delivery status.
image: /images/projects/whatsappel.webp
project-url: https://git.securityops.co/cristiancmoises/whatsappel
---

**WhatsAppel** é o cliente que desenvolvo para usar mensagens no Emacs sem transformar o editor em um navegador. A interface reúne lista de contatos, conversas, mídia, configurações e controles de entrega. O projeto combina código Emacs/Guile e trabalhadores Python com os componentes externos `wuzapi` e `whatsmeow`, que mantêm suas próprias licenças e responsabilidades.

![Interface do WhatsAppel no Emacs](/images/projects/whatsappel.webp)

*Imagem: [prévia datada do WhatsAppel na Security Ops Wiki](https://wiki.securityops.co/services/whatsappel.html); o repositório também traz [capturas da interface Emacs](https://git.securityops.co/cristiancmoises/whatsappel/src/branch/main/docs/screenshots).*

A versão 3.2.0-rc17 ainda é uma **candidata a lançamento**. Aceitação de uma mensagem pelo provedor não confirma entrega ao destinatário; alguns dados de perfil dependem das regras do serviço, e certas funções experimentais continuam sem validação completa. O README registra esses limites e o estado de cada recurso.

[Código-fonte e documentação](https://git.securityops.co/cristiancmoises/whatsappel).
