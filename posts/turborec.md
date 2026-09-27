title: Turbo Recorder: gravação e transmissão multiplataforma
title-en: Turbo Recorder: cross-platform recording and streaming
date: 2026-09-27 01:20
tags: projects, built
summary: Gravador livre de tela e áudio com detecção automática, GUI, CLI, sobreposição de câmera e transmissão RTMP.
summary-en: A free screen and audio recorder with automatic detection, GUI, CLI, camera overlay, and RTMP streaming.
image: /images/projects/turborec.webp
project-url: https://turborec.securityops.co/
---

**Turbo Recorder**, ou **TurboRec**, é o gravador de tela e áudio que desenvolvo para reduzir o trabalho de configuração antes de uma captura. Ele identifica o sistema, a sessão gráfica, CPU, GPU, codificadores e fontes de áudio disponíveis; em seguida, monta um fluxo de captura com FFmpeg. O mesmo mecanismo pode ser usado pela interface gráfica ou pela linha de comando.

![Página do Turbo Recorder com o plano de captura automático](/images/projects/turborec.webp)

*Imagem: [captura datada do Turbo Recorder na Security Ops Wiki](https://wiki.securityops.co/services/turborec.html).*

O projeto grava a tela inteira, um monitor, uma janela ou uma região. Também pode combinar microfone e áudio do sistema, adicionar uma câmera sobre a imagem, reduzir ruído do microfone e transmitir por RTMP ou RTMPS. A escolha automática testa os codificadores disponíveis antes de usar aceleração de hardware e mantém uma alternativa por software quando necessário.

A documentação da versão 3.9.1 cobre Linux em X11 e Wayland, macOS, Windows, FreeBSD, OpenBSD, NetBSD, DragonFly e GNU Guix. O projeto oferece pacotes e arquivos portáteis para diferentes sistemas, além de configuração em JSON para repetir preferências entre máquinas. O código é software livre sob a GPL-3.0.

[Abrir o Turbo Recorder](https://turborec.securityops.co/) · [Código-fonte](https://git.securityops.co/cristiancmoises/turborec) · [Guia na wiki](https://wiki.securityops.co/services/turborec.html).
