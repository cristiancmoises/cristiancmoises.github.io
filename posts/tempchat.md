title: TempChat: chamadas temporárias de vídeo entre duas pessoas
title-en: TempChat: temporary one-to-one video calls
date: 2026-09-26 18:22
tags: projects, built
summary: Aplicação leve de chamadas WebRTC sem conta, com convite por link e mídia cifrada pelo protocolo.
summary-en: A lightweight account-free WebRTC calling app with link invitations and protocol-encrypted media.
image: /images/projects/tempchat.webp
project-url: https://git.securityops.co/cristiancmoises/tempchat
---

**TempChat** é a aplicação de videochamada individual que desenvolvi com HTML e JavaScript simples. Uma pessoa cria um convite, a outra abre o link, e os navegadores negociam áudio e vídeo via WebRTC. A aplicação não exige conta nem mantém histórico ou gravações próprias; a câmera e o microfone só são ativados após a permissão do navegador.

![Interface do TempChat](/images/projects/tempchat.webp)

*Imagem: [captura da interface publicada no repositório](https://git.securityops.co/cristiancmoises/tempchat/raw/branch/master/images/tempchat.png).*

O WebRTC usa DTLS-SRTP para cifrar a mídia. A sinalização passa pelo serviço externo ScaleDrone, e uma instância coturn pode retransmitir mídia cifrada quando uma conexão direta não é possível. Esses serviços e os pares podem observar metadados de conexão; portanto, não trato “sem conta” como garantia de anonimato. O README explica o fluxo de convite, as opções de qualidade e os requisitos de auto-hospedagem.

[Código-fonte e arquitetura](https://git.securityops.co/cristiancmoises/tempchat) · [Instância pública](https://teams.securityops.co/).
