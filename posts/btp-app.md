title: BTP para Android: cliente do protocolo experimental
title-en: BTP for Android: client for the experimental protocol
date: 2026-09-26 18:23
tags: projects, built
summary: Cliente Android em Kotlin para documentos BTP, com verificação antes de salvar um arquivo importado.
summary-en: Kotlin Android client for BTP documents, with verification before an imported file is saved.
image: /images/projects/btp-app.webp
project-url: https://git.securityops.co/cristiancmoises/btp-app
---

**BTP para Android** é o cliente que desenvolvo em Kotlin para experimentar o Berkeley Transport Protocol no telefone. Ele usa a implementação de referência em Rust para a parte nativa e permite abrir um arquivo `.btp` pelo seletor do Android. Na versão 0.6.0, o fluxo verifica o documento antes de gravá-lo na biblioteca local.

![Ícone do cliente BTP para Android](/images/projects/btp-app.webp)

*Imagem: [ícone do aplicativo no repositório](https://git.securityops.co/cristiancmoises/btp-app/raw/branch/master/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png); não é uma captura de tela.*

O BTP continua **experimental e anterior à versão 1.0**. O repositório não distribui um APK de produção pré-assinado: a construção exige o código do protocolo em uma pasta vizinha e uma chave de assinatura própria. Como a verificação e os limites de confiança diferem entre acesso nativo e gateway HTTPS, consulte a especificação e confirme a identidade da origem antes de confiar em documentos recebidos.

[Código-fonte e instruções de construção](https://git.securityops.co/cristiancmoises/btp-app) · [Especificação do protocolo](https://git.securityops.co/cristiancmoises/btp).
