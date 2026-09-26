title: Torando-Gui: controle visual do roteamento por Tor
title-en: Torando-Gui: visual control for Tor routing
date: 2026-09-26 18:19
tags: projects, built
summary: Aplicativo de desktop com daemon Python para controlar conexão, DNS, firewall e verificação de saída pelo Tor.
summary-en: A desktop app with a Python daemon for connection, DNS, firewall, and Tor exit checks.
image: /images/projects/torando-gui.webp
project-url: https://git.securityops.co/cristiancmoises/torando-gui
---

**Torando-Gui** é a interface gráfica que desenvolvo para o fluxo de roteamento por Tor do meu projeto Torando. Ela mostra conexão, estado do firewall, DNS e verificações de saída. O aplicativo tem um daemon próprio em Python: pode ser instalado separadamente e não depende dos scripts de shell do Torando.

![Tela de conexão do Torando-Gui](/images/projects/torando-gui.webp)

*Imagem: [captura de uma versão anterior no repositório](https://git.securityops.co/cristiancmoises/torando-gui/raw/branch/main/docs/screenshots/connected.png); alguns rótulos mudaram desde então.*

Linux é a plataforma principal. Há caminhos para macOS, BSD e Windows, mas o README os classifica como beta e descreve limites diferentes para proxy, DNS e firewall. O daemon precisa de privilégios administrativos para alterar a rede. Usar Torando-Gui **não oferece** as proteções contra identificação por impressão digital do Tor Browser; leia o modelo de ameaças antes de confiar no bloqueio de tráfego de uma plataforma específica.

[Código-fonte, plataformas e modelo de ameaças](https://git.securityops.co/cristiancmoises/torando-gui).
