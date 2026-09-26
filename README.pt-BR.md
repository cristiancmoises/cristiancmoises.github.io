# Cristian Cezar Moisés — portfólio pessoal

[English](README.md)

Este é o repositório-fonte de [cristiancezarmoises.com](https://cristiancezarmoises.com/), o portfólio pessoal de Cristian Cezar Moisés. Trabalho como Analista de Suporte de TI em Caxias do Sul, Rio Grande do Sul, Brasil, e mantenho projetos de software livre no meu tempo livre.

O site é gerado com [GNU Guile](https://www.gnu.org/software/guile/) e [Haunt](https://haunt.dthompson.us/). Inglês é o idioma principal; as páginas em português brasileiro são geradas em `/pt-br/`. O site não usa banco de dados ou framework de frontend e não contém JavaScript no navegador.

## Requisitos

O repositório fixa o **Haunt 0.4.0**. [`manifest.scm`](manifest.scm) seleciona a versão do pacote, e [`channels-haunt.scm`](channels-haunt.scm) fixa a revisão do Guix que a fornece.

Instale o [GNU Guix](https://guix.gnu.org/) ou use uma instalação local do Haunt 0.4.0. O comando com `time-machine` usa somente o arquivo de canais deste repositório e não altera a configuração global do Guix.

## Construir o site

Clone o repositório e execute a construção reproduzível:

```sh
git clone https://github.com/cristiancmoises/cristiancmoises.github.io.git
cd cristiancmoises.github.io
guix time-machine -C channels-haunt.scm -- shell -m manifest.scm -- ./scripts/build-site.sh
```

Se o Haunt 0.4.0 já estiver disponível:

```sh
./scripts/build-site.sh
```

O script executa uma construção limpa do Haunt em `site/`, remove páginas geradas antigas e copia a nova saída estática para a raiz do repositório. A saída da raiz é versionada como artefato de publicação revisável para hospedagem estática. O Haunt continua sendo o único gerador e a fonte da estrutura das páginas.

Para visualizar:

```sh
haunt serve --port 8080
```

Abra `http://localhost:8080/`. Durante a edição, use `haunt serve --watch --port 8080`.

## Conteúdo e idiomas

- `haunt.scm` define layouts, navegação, SEO, rotas de idioma, sitemap e construtores.
- `posts/` contém os artigos Markdown. Use `lang: en` ou `lang: pt-BR` para colocar o artigo no arquivo correspondente.
- Use a tag `built` somente em projetos cuja autoria foi verificada.
- `title-en` e `summary-en` fornecem textos em inglês para cartões cujo artigo completo ainda está apenas em português.
- `css/` e `images/` contêm o tema original e as mídias.
- `site/` é a saída temporária do Haunt e não entra no Git.

## Publicar na VPS IONOS

A produção serve exatamente o conteúdo de `site/` na VPS IONOS. A configuração em [`deploy/ionos/`](deploy/ionos/) define o redirecionamento HTTPS, o domínio canônico sem `www`, cabeçalhos de segurança, cache dos arquivos estáticos e a página 404.

Procedimento de publicação:

1. Execute `./scripts/build-site.sh` e revise a saída local.
2. Copie `site/` para um novo diretório de release no servidor.
3. Atualize de forma atômica o release `/data/portfolio/current` e valide a configuração Nginx antes do reload.
4. Verifique HTTPS, redirecionamentos, cabeçalhos, DNSSEC, links e hashes dos arquivos gerados.

A URL canônica é `https://cristiancezarmoises.com`; `www` redireciona para o domínio sem prefixo. O DNS é hospedado no serviço NSD autoritativo da Security Ops e assinado com DNSSEC.

## Licença e material pessoal

© 2026 Cristian Cezar Moisés. O código-fonte, incluindo o tema original e os templates Haunt, está sob a [GPLv3](LICENSE). A fotografia pessoal e as informações biográficas originais têm copyright de Cristian Cezar Moisés e não estão licenciadas sob a GPL. Capturas e marcas de terceiros mantêm seus respectivos direitos. Consulte [COPYRIGHT.md](COPYRIGHT.md).
