title: XMonad Wayland: política de janelas sobre River
title-en: XMonad Wayland: window policy on River
date: 2026-09-26 18:13
tags: projects, built
summary: Uma política de gerenciamento de janelas em Haskell para River e Wayland, com espaços de trabalho no estilo XMonad.
summary-en: A Haskell window management policy for River and Wayland with XMonad-style workspaces.
image: /images/projects/xmonad-wayland.webp
project-url: https://git.securityops.co/cristiancmoises/xmonad-wayland
---

O **XMonad Wayland** é meu projeto independente para levar a organização de janelas e espaços de trabalho do XMonad ao compositor River. O River cuida de gráficos, entrada e clientes Wayland; o código deste projeto implementa a política de foco, ordem e disposição de janelas em Haskell.

![Sessão River com XMonad Wayland](/images/projects/xmonad-wayland.webp)

*Imagem: [captura real de uma sessão River no repositório](https://git.securityops.co/cristiancmoises/xmonad-wayland/raw/branch/main/screenshots/river-xmonad-fastfetch.png).*

A versão 0.4.0 é uma **versão de desenvolvimento** para GNU Guix. Ela usa o `StackSet` original do XMonad, preservando a licença e os créditos desse componente, e não é uma versão oficial do XMonad. Configurações antigas de `xmonad.hs` para X11 não funcionam automaticamente. Suspensão, troca de monitores, bloqueio de tela e uso diário prolongado ainda estão em avaliação.

[Código-fonte, proveniência e instruções de teste](https://git.securityops.co/cristiancmoises/xmonad-wayland).
