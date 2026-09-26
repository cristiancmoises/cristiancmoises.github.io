# Security Policy

[Português do Brasil](SECURITY.pt-BR.md)

## Reporting a Vulnerability

If you discover a security vulnerability in this website or its source, please
report it responsibly:

- **Email:** ethicalhacker@riseup.net
- Include a clear description, steps to reproduce, and the potential impact.
- Please do **not** open a public issue for security-sensitive reports.

You can expect an acknowledgement within **5 business days**, and I will keep
you informed of progress toward a fix.

A machine-readable contact is also published at
[`/.well-known/security.txt`](.well-known/security.txt) per
[RFC 9116](https://www.rfc-editor.org/rfc/rfc9116).

## Scope

This is a static site generated with [Haunt](https://haunt.dthompson.us/)
and served from an IONOS VPS through an OpenResty edge protected by OpenAppSec
and CrowdSec. The most useful reports include:

- Cross-site scripting (XSS) or content injection
- Secrets or sensitive data committed to the repository
- Insecure external resources: mixed `http://` content, compromised CDNs, or
  third-party scripts loaded without Subresource Integrity (SRI)
- Supply-chain risks in third-party dependencies

## Hardening already in place

- The portfolio interface does not load third-party JavaScript at runtime.
- External attribution links use `https://`.
- The edge enforces HTTPS, HSTS, a restrictive Content Security Policy, and
  browser isolation headers.
- The authoritative DNS zone is signed with DNSSEC.

## Safe Harbor

I support good-faith security research. If you make a good-faith effort to
comply with this policy, I will not pursue legal action against you and will
work with you to resolve the issue quickly. Please avoid privacy violations,
data destruction, service disruption, and accessing data that is not yours.
