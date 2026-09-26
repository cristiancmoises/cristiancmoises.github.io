title: ZUPT Android: arquivos cifrados sem conexão de rede
title-en: ZUPT Android: encrypted archives without network access
date: 2026-09-26 18:20
tags: projects, built
summary: Aplicativo Android para compactar e cifrar arquivos localmente, com formato próprio e sem permissão de internet.
summary-en: An Android app for local compression and encryption with its own format and no internet permission.
image: /images/projects/zupt-android.webp
project-url: https://git.securityops.co/cristiancmoises/zupt-android
---

**ZUPT Android** é o aplicativo que desenvolvo para criar e abrir arquivos compactados no próprio dispositivo. Ele usa o seletor de arquivos do Android, não pede permissão de internet nem acesso amplo ao armazenamento e não inclui contas, anúncios ou telemetria. A versão 5.2.9 oferece arquivos sem cifra, com senha, com chave pós-quântica ou com ambos os mecanismos, conforme a documentação.

![Ícone do aplicativo ZUPT Android](/images/projects/zupt-android.webp)

*Imagem: capa baseada no [ícone vetorial do aplicativo no repositório](https://git.securityops.co/cristiancmoises/zupt-android/raw/branch/main/app/src/main/res/drawable/ic_launcher_foreground.xml); não é uma captura da interface.*

O formato `zupt-android/v1.3` evoluiu separadamente do formato `.zupt/v1.6` para desktop. **Os arquivos das duas aplicações não são intercambiáveis**, mesmo quando usam algoritmos com o mesmo nome. O Android usa STORE ou DEFLATE, não o codec VaptVupt de desktop. Para dados importantes, guarde as chaves e confirme a restauração no mesmo aplicativo antes de depender de uma cópia única.

[Código-fonte, especificação e tabela de compatibilidade](https://git.securityops.co/cristiancmoises/zupt-android).
