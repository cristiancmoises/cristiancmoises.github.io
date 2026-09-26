# Política de segurança

[English](SECURITY.md)

## Relatar uma vulnerabilidade

Se você encontrar uma vulnerabilidade de segurança neste site ou em seu código-fonte, informe-a de forma responsável:

- **E-mail:** ethicalhacker@riseup.net
- Inclua uma descrição clara, passos para reprodução e o impacto potencial.
- Não abra uma issue pública para informações sensíveis de segurança.

Você receberá uma confirmação em até **5 dias úteis**, com atualizações sobre o andamento da correção.

O contato legível por máquinas também está em [`.well-known/security.txt`](.well-known/security.txt), conforme a [RFC 9116](https://www.rfc-editor.org/rfc/rfc9116).

## Escopo

Este é um site estático gerado com [Haunt](https://haunt.dthompson.us/) e servido por uma VPS IONOS através de uma borda OpenResty protegida por OpenAppSec e CrowdSec. A borda aplica HTTPS, HSTS, uma política de conteúdo restritiva e cabeçalhos de isolamento; a zona DNS autoritativa é assinada com DNSSEC. Relatórios úteis incluem injeção de conteúdo, segredos publicados, recursos externos inseguros e riscos na cadeia de dependências.

## Safe harbor

Apoio pesquisas de segurança de boa-fé. Evite violações de privacidade, destruição de dados, interrupção do serviço e acesso a dados que não pertencem a você.
