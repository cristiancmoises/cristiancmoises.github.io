# Security Policy

## Reporting a Vulnerability

If you discover a security vulnerability in this website or its source, please
report it responsibly:

- **Email:** berkeley@privacyrequired.com
- Include a clear description, steps to reproduce, and the potential impact.
- Please do **not** open a public issue for security-sensitive reports.

You can expect an acknowledgement within **5 business days**, and I will keep
you informed of progress toward a fix.

A machine-readable contact is also published at
[`/.well-known/security.txt`](.well-known/security.txt) per
[RFC 9116](https://www.rfc-editor.org/rfc/rfc9116).

## Scope

This is a static site generated with [Haunt](https://dthompson.us/projects/haunt.html)
and served via GitHub Pages. The most useful reports include:

- Cross-site scripting (XSS) or content injection
- Secrets or sensitive data committed to the repository
- Insecure external resources: mixed `http://` content, compromised CDNs, or
  third-party scripts loaded without Subresource Integrity (SRI)
- Supply-chain risks in third-party dependencies

## Hardening already in place

- All external scripts are pinned to exact versions and loaded with
  `crossorigin`; the compromised `polyfill.io` CDN has been removed.
- External attribution links use `https://`.

## Safe Harbor

I support good-faith security research. If you make a good-faith effort to
comply with this policy, I will not pursue legal action against you and will
work with you to resolve the issue quickly. Please avoid privacy violations,
data destruction, service disruption, and accessing data that is not yours.
