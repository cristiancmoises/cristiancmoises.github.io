;; Copyright (C) 2026 Cristian Cezar Moisés
;; SPDX-License-Identifier: GPL-3.0-or-later

(use-modules (haunt artifact)
             (haunt builder assets)
             (haunt html)
             (haunt post)
             (haunt reader commonmark)
             (haunt site)
             (haunt utils)
             (ice-9 string-fun)
             (srfi srfi-1)
             (srfi srfi-13)
             (srfi srfi-19))

(define site-url "https://cristiancezarmoises.com")
(define full-name "Cristian Cezar Moisés")
(define profile-image "/images/cristiancezarmoises.webp")
(define forgejo-co "https://git.securityops.co/cristiancmoises")
(define forgejo-br "https://git.securityops.com.br/cristiancmoises")
(define personal-email "ethicalhacker@riseup.net")
(define security-ops-email "sac@securityops.co")

(define (english? lang)
  (string-prefix? "en" lang))

(define (localized lang english portuguese)
  (if (english? lang) english portuguese))

(define (absolute-url path)
  (if (or (string-prefix? "https://" path)
          (string-prefix? "http://" path))
      path
      (string-append site-url path)))

(define (public-path file-name)
  (cond ((string=? file-name "index.html") "/")
        ((string=? file-name "pt-br/index.html") "/pt-br/")
        (else (string-append "/" file-name))))

(define (core-file lang file-name)
  (if (english? lang)
      file-name
      (string-append "pt-br/" file-name)))

(define (core-path lang file-name)
  (public-path (core-file lang file-name)))

(define (post-path site post)
  ;; Haunt's original slug function preserves the site's published URLs.
  (string-append "/" (site-post-slug site post) ".html"))

(define (post-summary post)
  (or (post-ref post 'summary)
      (if (english? (post-language post))
          (string-append "Read " (post-title post) " in " full-name "'s portfolio.")
          (string-append "Leia " (post-title post) " no portfólio de " full-name "."))))

(define (built-post? post)
  (member "built" (post-tags post)))

(define (research-post? post)
  (member "research" (post-tags post)))

(define (post-category post lang)
  (cond ((built-post? post) (localized lang "Original project" "Projeto original"))
        ((research-post? post) (localized lang "Research" "Pesquisa"))
        (else (localized lang "Article" "Publicação"))))

(define (post-date-iso post)
  (date->string (post-date post) "~Y-~m-~d"))

(define (post-date-readable post)
  (date->string (post-date post) "~d/~m/~Y"))

(define (post-language post)
  (or (post-ref post 'lang)
      ;; New notes use Portuguese. Older posts are mostly English;
      ;; an explicit `lang` field overrides this publishing default.
      (if (>= (date-year (post-date post)) 2026) "pt-BR" "en")))

(define (post-description post)
  (let* ((summary (post-summary post))
         (description
          (if (< (string-length summary) 75)
              (string-append (post-title post) " — " summary " | " full-name)
              summary)))
    (if (< (string-length description) 70)
        (string-append
         description
         (localized (post-language post)
                    ". A portfolio article about free software, technology, and security."
                    ". Uma publicação do portfólio sobre software livre, tecnologia e segurança."))
        description)))

(define (nav-link href label current)
  `(a (@ (href ,href)
         ,@(if (string=? href current) '((aria-current "page")) '()))
      ,label))

(define (site-header current lang alternate)
  `(header (@ (class "site-header"))
     (div (@ (class "shell header-inner"))
       (a (@ (class "wordmark")
             (href ,(core-path lang "index.html"))
             (aria-label ,(localized lang
                                     "Cristian Cezar Moisés, home"
                                     "Cristian Cezar Moisés, início")))
          (span (@ (class "wordmark-mark") (aria-hidden "true")) "C/")
          (span "Cristian Cezar Moisés"))
       (nav (@ (aria-label ,(localized lang "Main navigation" "Navegação principal")))
         ,(nav-link (core-path lang "index.html") (localized lang "Home" "Início") current)
         ,(nav-link (core-path lang "projects.html") (localized lang "Projects" "Projetos") current)
         ,(nav-link (core-path lang "posts.html") (localized lang "Writing" "Publicações") current)
         ,(nav-link (core-path lang "research.html") (localized lang "Research" "Pesquisa") current)
         ,(nav-link (core-path lang "about.html") (localized lang "About" "Sobre") current)
         (a (@ (class "language-link") (href ,alternate)
               (hreflang ,(if (english? lang) "pt-BR" "en")))
            ,(if (english? lang) "PT-BR" "EN"))))))

(define (site-footer lang)
  `(footer (@ (class "site-footer"))
     (div (@ (class "shell footer-inner"))
       (div
         (p (@ (class "footer-heading")) "Cristian Cezar Moisés")
         (p ,(localized lang
                        "Free software, security, and projects built in Rio Grande do Sul."
                        "Software livre, segurança e projetos construídos no Rio Grande do Sul."))
         (p (@ (class "copyright"))
            ,(localized lang
                        "© 2026 Cristian Cezar Moisés · Personal portfolio."
                        "© 2026 Cristian Cezar Moisés · Portfólio pessoal.")))
       (div
         (p (@ (class "footer-heading")) ,(localized lang "Code and contact" "Código e contato"))
         (ul (@ (class "footer-links"))
           (li (a (@ (href ,forgejo-co) (rel "me noopener noreferrer")) "Forgejo · securityops.co"))
           (li (a (@ (href ,forgejo-br) (rel "me noopener noreferrer")) "Forgejo · securityops.com.br"))
           (li (a (@ (href ,(string-append "mailto:" personal-email)))
                  ,personal-email))
           (li (a (@ (href ,(string-append "mailto:" security-ops-email)))
                  ,security-ops-email))
           (li (a (@ (href "https://github.com/cristiancmoises") (rel "me noopener noreferrer")) "GitHub"))
           (li (a (@ (href "https://www.linkedin.com/in/cristiancezarmoises")
                     (rel "me noopener noreferrer")) "LinkedIn"))))
       (p (@ (class "footer-license"))
          ,(localized lang "Theme and source code under " "Tema e código-fonte sob ")
          (a (@ (href "/LICENSE")) "GPLv3+")
          ,(localized lang
                      ". Personal content and photograph © Cristian Cezar Moisés."
                      ". Conteúdo pessoal e fotografia © Cristian Cezar Moisés.")))))

(define* (page-layout path title description body
                      #:key (lang "en") (kind "website")
                      (image profile-image)
                      (image-alt "Portrait of Cristian Cezar Moisés")
                      (published #f) (index? #t)
                      (alternate-en #f) (alternate-pt #f))
  (let ((canonical (absolute-url (public-path path)))
        (full-title
         (if (or (string=? path "index.html")
                 (string=? path "pt-br/index.html")
                 (> (+ (string-length title) (string-length full-name) 3) 65))
             title
             (string-append title " | " full-name)))
        (alternate (if (english? lang) alternate-pt alternate-en)))
    `((doctype "html")
      (html (@ (lang ,lang))
        (head
          (meta (@ (charset "utf-8")))
          (meta (@ (name "viewport") (content "width=device-width, initial-scale=1")))
          (meta (@ (name "theme-color") (content "#000000")))
          (meta (@ (name "author") (content ,full-name)))
          (meta (@ (name "description") (content ,description)))
          (meta (@ (name "robots")
                   (content ,(if index? "index,follow,max-image-preview:large" "noindex,follow"))))
          (link (@ (rel "canonical") (href ,canonical)))
          ,@(if (and alternate-en alternate-pt)
                `((link (@ (rel "alternate") (hreflang "en")
                           (href ,(absolute-url alternate-en))))
                  (link (@ (rel "alternate") (hreflang "pt-BR")
                           (href ,(absolute-url alternate-pt))))
                  (link (@ (rel "alternate") (hreflang "x-default")
                           (href ,(absolute-url alternate-en)))))
                '())
          (link (@ (rel "icon") (type "image/svg+xml") (href "/favicon.svg")))
          (link (@ (rel "stylesheet") (href "/css/default.css")))
          (meta (@ (property "og:type") (content ,kind)))
          (meta (@ (property "og:site_name") (content ,full-name)))
          (meta (@ (property "og:locale")
                   (content ,(if (string-prefix? "pt" lang) "pt_BR" "en_US"))))
          (meta (@ (property "og:title") (content ,full-title)))
          (meta (@ (property "og:description") (content ,description)))
          (meta (@ (property "og:url") (content ,canonical)))
          (meta (@ (property "og:image") (content ,(absolute-url image))))
          (meta (@ (property "og:image:alt") (content ,image-alt)))
          (meta (@ (name "twitter:card") (content "summary_large_image")))
          (meta (@ (name "twitter:title") (content ,full-title)))
          (meta (@ (name "twitter:description") (content ,description)))
          (meta (@ (name "twitter:image") (content ,(absolute-url image))))
          (meta (@ (name "twitter:image:alt") (content ,image-alt)))
          ,@(if published
                `((meta (@ (property "article:published_time") (content ,published))))
                '())
          (title ,full-title))
        (body
          (a (@ (class "skip-link") (href "#content"))
             ,(localized lang "Skip to content" "Ir para o conteúdo"))
          ,(site-header (public-path path) lang
                        (or alternate
                            (core-path (if (english? lang) "pt-BR" "en") "index.html")))
          (main (@ (id "content") (class "shell main-content")) ,body)
          ,(site-footer lang))))))

(define (write-html data port)
  (display (sxml->html-string data) port))

(define* (html-page path title description body
                    #:key (lang "en") (kind "website")
                    (image profile-image)
                    (image-alt "Portrait of Cristian Cezar Moisés")
                    (published #f) (index? #t)
                    (alternate-en #f) (alternate-pt #f))
  (serialized-artifact
   path
   (page-layout path title description body
                #:lang lang #:kind kind #:image image #:image-alt image-alt
                #:published published #:index? index?
                #:alternate-en alternate-en #:alternate-pt alternate-pt)
   write-html))

(define (page-intro eyebrow title description)
  `(header (@ (class "page-intro"))
     (p (@ (class "eyebrow")) ,eyebrow)
     (h1 ,title)
     (p (@ (class "intro-copy")) ,description)))

(define (localized-post-title post lang)
  (if (english? lang)
      (or (post-ref post 'title-en) (post-title post))
      (post-title post)))

(define (localized-post-summary post lang)
  (if (english? lang)
      (or (post-ref post 'summary-en) (post-summary post))
      (post-summary post)))

(define* (project-card site post lang #:optional (heading 'h3))
  (let* ((image (post-ref post 'image))
         (path (post-path site post))
         (title (localized-post-title post lang))
         (summary (localized-post-summary post lang))
         (article-lang (post-language post)))
    `(article (@ (class "project-card"))
       (a (@ (class "project-visual") (href ,path)
             (lang ,article-lang)
             (aria-label ,(string-append (localized lang "Open " "Abrir ") title)))
         ,(if image
              `(img (@ (src ,image)
                       (alt ,(or (post-ref post 'image-alt)
                                 (string-append (localized lang "Screenshot of " "Captura de tela de ") title)))
                       (loading "lazy") (decoding "async")))
              `(span (@ (class "project-placeholder") (aria-hidden "true")) "SO /")))
       (div (@ (class "project-detail"))
         (p (@ (class "item-meta"))
            ,(localized lang "ORIGINAL PROJECT" "PROJETO ORIGINAL") " · "
            ,(post-date-readable post)
            ,@(if (and (english? lang) (not (english? article-lang)))
                  '(" · ARTICLE IN PORTUGUESE")
                  '()))
         (,heading (a (@ (href ,path) (lang ,article-lang)) ,title))
         (p ,summary)
         (a (@ (class "text-link") (href ,path) (lang ,article-lang))
            ,(localized lang "View project " "Conhecer o projeto ")
            (span (@ (aria-hidden "true")) "↗"))))))

(define (publication-card site post lang)
  `(li (@ (class "publication-item"))
     (div (@ (class "publication-date"))
       (time (@ (datetime ,(post-date-iso post))) ,(post-date-readable post)))
     (div
       (p (@ (class "item-meta")) ,(post-category post lang))
       (h2 (a (@ (href ,(post-path site post))) ,(post-title post)))
       (p ,(post-summary post)))))

(define (posts-in-language posts lang)
  (filter (lambda (post) (string=? (post-language post) lang)) posts))

(define (home-page site posts lang)
  (let* ((built (filter built-post? posts))
         (recent (take-up-to 4 (posts-in-language posts lang)))
         (path (core-file lang "index.html"))
         (description
          (localized lang
                     "Cristian Cezar Moisés is an IT professional in Caxias do Sul, Brazil, who builds free software and founded Security Ops®."
                     "Cristian Cezar Moisés: profissional gaúcho de TI em Caxias do Sul que aplica engenharia de software a projetos de software livre e criou a Security Ops®."))
         (body
          `((section (@ (class "hero"))
              (p (@ (class "eyebrow"))
                 ,(localized lang
                             "PERSONAL PORTFOLIO · CAXIAS DO SUL, BRAZIL"
                             "PORTFÓLIO PESSOAL · CAXIAS DO SUL, RS"))
              (h1 "Cristian Cezar Moisés")
              (p (@ (class "hero-lead"))
                 ,(localized lang
                             "I build free software and apply software engineering outside my day job."
                             "Sou um gaúcho que desenvolve software livre e aplica engenharia de software fora do trabalho."))
              (p (@ (class "hero-copy"))
                 ,(localized lang
                             "I currently work as an IT Support Analyst in Caxias do Sul, Rio Grande do Sul, Brazil. In my spare time, I build and maintain free software tools. I created Security Ops® to share courses, tools, and knowledge with the community."
                             "Atualmente trabalho como Analista de Suporte de TI em Caxias do Sul, Rio Grande do Sul. No meu tempo livre, construo e mantenho ferramentas de software livre. Criei a Security Ops® para compartilhar cursos, ferramentas e conhecimento com a comunidade."))
              (div (@ (class "hero-actions"))
                (a (@ (class "button-link") (href ,(core-path lang "projects.html")))
                   ,(localized lang "Explore projects " "Explorar projetos ")
                   (span (@ (aria-hidden "true")) "↗"))
                (a (@ (class "quiet-link") (href ,(core-path lang "about.html")))
                   ,(localized lang "About my work" "Conheça minha trajetória"))))
            (section (@ (class "home-section") (aria-labelledby "featured-title"))
              (div (@ (class "section-heading"))
                (div
                  (p (@ (class "eyebrow")) ,(localized lang "FREE SOFTWARE" "SOFTWARE LIVRE"))
                  (h2 (@ (id "featured-title")) ,(localized lang "Projects I built" "Projetos que construí")))
                (a (@ (class "text-link") (href ,(core-path lang "projects.html")))
                   ,(localized lang "View all " "Ver todos ")
                   (span (@ (aria-hidden "true")) "↗")))
              ,(if (null? built)
                   `(p (@ (class "empty-note"))
                       ,(localized lang
                                   "The project list is being updated. Browse the repositories in the footer."
                                   "Projetos em atualização. Veja os repositórios no rodapé."))
                   `(div (@ (class "project-list"))
                      ,@(map (lambda (post) (project-card site post lang))
                             (take-up-to 3 built)))))
            (section (@ (class "home-section latest-section") (aria-labelledby "latest-title"))
              (div (@ (class "section-heading"))
                (div
                  (p (@ (class "eyebrow")) ,(localized lang "OPEN NOTEBOOK" "CADERNO ABERTO"))
                  (h2 (@ (id "latest-title")) ,(localized lang "Recent writing" "Publicações recentes")))
                (a (@ (class "text-link") (href ,(core-path lang "posts.html")))
                   ,(localized lang "View archive " "Ver arquivo ")
                   (span (@ (aria-hidden "true")) "↗")))
              (ul (@ (class "latest-list"))
                ,@(map (lambda (post)
                         `(li
                            (time (@ (datetime ,(post-date-iso post))) ,(post-date-readable post))
                            (a (@ (href ,(post-path site post))) ,(post-title post))))
                       recent))))))
    (html-page path
               (string-append full-name
                              (localized lang
                                         " | Software engineering and free software"
                                         " | Engenharia de software e software livre"))
               description body
               #:lang lang
               #:alternate-en "/" #:alternate-pt "/pt-br/")))

(define (projects-page site posts lang)
  (let ((path (core-file lang "projects.html"))
        (description
         (localized lang
                    "Original free software projects built by Cristian Cezar Moisés, including tools, interfaces, and Security Ops® resources."
                    "Projetos originais de software livre criados por Cristian Cezar Moisés: ferramentas, interfaces e recursos da Security Ops®."))
        (built (filter built-post? posts)))
    (html-page
     path (localized lang "Free software projects" "Projetos de software livre") description
     `((,(page-intro (localized lang "ORIGINAL WORK" "TRABALHO AUTORAL")
                    (localized lang "Projects I built" "Projetos que construí")
                    (localized lang
                               "Tools and experiments I develop and maintain outside my IT support job."
                               "Ferramentas e experiências que desenvolvi e mantenho fora do meu trabalho de suporte de TI."))
       ,(if (null? built)
            `(p (@ (class "empty-note"))
                ,(localized lang
                            "The selection is being updated. Browse my repositories in the footer."
                            "A seleção está em atualização. Explore meus repositórios nos links do rodapé."))
            `(div (@ (class "project-list all-projects"))
               ,@(map (lambda (post) (project-card site post lang 'h2)) built)))))
     #:lang lang
     #:alternate-en "/projects.html" #:alternate-pt "/pt-br/projects.html")))

(define (publications-page site posts lang)
  (let ((path (core-file lang "posts.html"))
        (language-posts (posts-in-language posts lang))
        (description
         (localized lang
                    "Writing by Cristian Cezar Moisés about free software, information security, technology, and research."
                    "Arquivo de publicações de Cristian Cezar Moisés sobre software livre, segurança da informação, tecnologia e pesquisa.")))
    (html-page
     path (localized lang "Writing and notes" "Publicações e notas") description
     `((,(page-intro (localized lang "ARCHIVE" "ARQUIVO")
                    (localized lang "Writing and notes" "Publicações e notas")
                    (localized lang
                               "Articles, project records, and research notes in this language. Original work is identified on the projects page."
                               "Textos, registros de projetos e pesquisas neste idioma. Os projetos originais estão identificados na página de projetos."))
       (ol (@ (class "publication-list"))
           ,@(map (lambda (post) (publication-card site post lang)) language-posts))))
     #:lang lang
     #:alternate-en "/posts.html" #:alternate-pt "/pt-br/posts.html")))

(define (research-page site posts lang)
  (let ((path (core-file lang "research.html"))
        (description
         (localized lang
                    "Research and technical notes by Cristian Cezar Moisés about information security, free software, and other studies."
                    "Pesquisas e notas técnicas de Cristian Cezar Moisés sobre segurança da informação, software livre e outros estudos.")))
    (html-page
     path (localized lang "Research and studies" "Pesquisa e estudos") description
     `((,(page-intro (localized lang "RESEARCH" "PESQUISA")
                    (localized lang "Research and studies" "Pesquisa e estudos")
                    (localized lang
                               "Work and notes exploring ideas in security, technology, and science."
                               "Trabalhos e anotações para explorar ideias em segurança, tecnologia e ciência."))
       (ol (@ (class "publication-list"))
           ,@(map (lambda (post) (publication-card site post lang))
                  (filter (lambda (post)
                            (and (research-post? post)
                                 (string=? (post-language post) lang)))
                          posts)))))
     #:lang lang
     #:alternate-en "/research.html" #:alternate-pt "/pt-br/research.html")))

(define (about-page lang)
  (let ((path (core-file lang "about.html"))
        (description
         (localized lang
                    "Meet Cristian Cezar Moisés, an IT professional in Caxias do Sul, Brazil, creator of Security Ops®, and free software maintainer."
                    "Conheça Cristian Cezar Moisés, profissional de TI em Caxias do Sul, Rio Grande do Sul, criador da Security Ops® e mantenedor de projetos de software livre.")))
    (html-page
     path (localized lang "About Cristian Cezar Moisés" "Sobre Cristian Cezar Moisés") description
     `((,(page-intro (localized lang "ABOUT ME" "SOBRE MIM")
                    (localized lang "Technology worth sharing" "Tecnologia para compartilhar")
                    (localized lang
                               "I am Cristian Cezar Moisés. I work in IT support and build free software in my spare time."
                               "Sou Cristian Cezar Moisés. Trabalho com suporte de TI e construo software livre no meu tempo livre."))
       (div (@ (class "about-grid"))
         (div (@ (class "about-copy prose"))
           (h2 ,(localized lang "My path" "Minha trajetória"))
           (p ,(localized lang
                          "I currently work as an IT Support Analyst in Caxias do Sul, Rio Grande do Sul, Brazil. Outside work, I develop and maintain open source projects focused on software engineering, information security, and free systems."
                          "Atualmente trabalho como Analista de Suporte de TI em Caxias do Sul, Rio Grande do Sul, Brasil. Fora do expediente, desenvolvo e mantenho projetos de código aberto, com interesse em engenharia de software, segurança da informação e sistemas livres."))
           (p ,(localized lang
                          "I created Security Ops® to produce useful courses and tools. Publishing the code and explaining how it works helps more people learn, adapt, and build."
                          "Criei a Security Ops® para produzir cursos e ferramentas úteis a outras pessoas. Acredito que publicar o código e explicar como as coisas funcionam ajuda mais gente a aprender, adaptar e construir."))
           (p ,(localized lang "This site is generated with " "Este site é gerado com ")
              (a (@ (href "https://haunt.dthompson.us/")) "Haunt")
              ,(localized lang " and GNU Guile. Explore the " " e GNU Guile. Explore os ")
              (a (@ (href ,(core-path lang "projects.html")))
                 ,(localized lang "projects I built" "projetos que construí"))
              ,(localized lang
                          " or follow the code in my Forgejo repositories."
                          " ou acompanhe o código nos meus repositórios Forgejo.")))
         (aside (@ (class "about-aside")
                   (itemscope "itemscope")
                   (itemtype "https://schema.org/Person")
                   (aria-label ,(localized lang "Profile" "Perfil")))
           (img (@ (class "portrait") (src ,profile-image)
                    (itemprop "image")
                    (alt ,(localized lang
                                     "Portrait of Cristian Cezar Moisés"
                                     "Retrato de Cristian Cezar Moisés"))
                    (width "112") (height "112")
                    (decoding "async")))
           (p (@ (class "about-name") (itemprop "name")) "Cristian Cezar Moisés")
           (p (span (@ (itemprop "jobTitle"))
                    ,(localized lang "IT Support Analyst" "Analista de Suporte de TI"))
              (br)
              (span (@ (itemprop "homeLocation"))
                    ,(localized lang "Caxias do Sul · RS · Brazil" "Caxias do Sul · RS · Brasil")))
           (a (@ (class "text-link") (href ,forgejo-co))
              ,(localized lang "View code on Forgejo ↗" "Ver código no Forgejo ↗"))))))
     #:lang lang
     #:alternate-en "/about.html" #:alternate-pt "/pt-br/about.html")))

(define (lower-h1 node)
  (cond ((and (pair? node) (eq? (car node) 'h1))
         (cons 'h2 (map lower-h1 (cdr node))))
        ((pair? node) (map lower-h1 node))
        (else node)))

(define (post-page site post)
  (let* ((path (substring (post-path site post) 1))
         (title (post-title post))
         (description (post-description post))
         (lang (post-language post))
         (image (post-ref post 'image))
         (project-url (post-ref post 'project-url))
         (return-path (cond ((built-post? post) (core-path lang "projects.html"))
                            ((research-post? post) (core-path lang "research.html"))
                            (else (core-path lang "posts.html"))))
         (return-label (cond ((built-post? post) (localized lang "Projects" "Projetos"))
                             ((research-post? post) (localized lang "Research" "Pesquisa"))
                             (else (localized lang "Writing" "Publicações")))))
    (html-page
     path title description
     `((article (@ (class "post")
                  (itemscope "itemscope")
                  (itemtype "https://schema.org/Article"))
         (header (@ (class "post-header"))
           (a (@ (class "back-link") (href ,return-path)) "← " ,return-label)
           (p (@ (class "item-meta")) ,(post-category post lang) " · "
              (time (@ (datetime ,(post-date-iso post)) (itemprop "datePublished"))
                    ,(post-date-readable post)))
           (h1 (@ (itemprop "headline")) ,title)
           (p (@ (class "post-deck") (itemprop "description")) ,(post-summary post))
           (meta (@ (itemprop "author") (content ,full-name)))
           ,@(if project-url
                 `((a (@ (class "button-link") (href ,project-url)
                         (rel "noopener noreferrer"))
                      ,(localized lang "Open project " "Acessar projeto ")
                      (span (@ (aria-hidden "true")) "↗")))
                 '()))
         (div (@ (class "post-content prose") (itemprop "articleBody"))
           (h2 (@ (class "sr-only")) ,(localized lang "Content" "Conteúdo"))
           ,(lower-h1 (post-sxml post)))
         (nav (@ (class "post-end")
                 (aria-label ,(localized lang "Back to collection" "Voltar à coleção")))
           (a (@ (class "text-link") (href ,return-path))
              ,(localized lang "← Back to " "← Voltar para ") ,return-label))))
     #:lang lang
     #:kind "article"
     #:image (or image profile-image)
     #:image-alt (if image
                     (or (post-ref post 'image-alt)
                         (string-append (localized lang "Screenshot of " "Captura de tela de ") title))
                     (localized lang
                                "Portrait of Cristian Cezar Moisés"
                                "Retrato de Cristian Cezar Moisés"))
     #:published (post-date-iso post))))

(define (not-found-page)
  (let ((description "The requested page was not found in Cristian Cezar Moisés's portfolio."))
    (html-page
     "404.html" "Page not found" description
     `((section (@ (class "not-found"))
         (p (@ (class "eyebrow")) "ERROR 404")
         (h1 "Page not found")
         (p "The address may have changed. Return home or browse the writing archive.")
         (div (@ (class "hero-actions"))
           (a (@ (class "button-link") (href "/")) "Go home")
           (a (@ (class "quiet-link") (href "/posts.html")) "Browse writing"))))
     #:lang "en"
     #:index? #f)))

(define (xml-escape value)
  (string-replace-substring
   (string-replace-substring
    (string-replace-substring value "&" "&amp;") "<" "&lt;")
   ">" "&gt;"))

(define (sitemap-xml site posts)
  (define static-paths
    '("/" "/about.html" "/projects.html" "/posts.html" "/research.html"
      "/pt-br/" "/pt-br/about.html" "/pt-br/projects.html"
      "/pt-br/posts.html" "/pt-br/research.html"))
  (define (url-element path lastmod)
    (string-append "  <url><loc>" (xml-escape (absolute-url path)) "</loc>"
                   (if lastmod (string-append "<lastmod>" lastmod "</lastmod>") "")
                   "</url>"))
  (string-append
   "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"
   "<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">\n"
   (string-join
    (append (map (lambda (path) (url-element path #f)) static-paths)
            (map (lambda (post)
                   (url-element (post-path site post) (post-date-iso post))) posts))
    "\n")
   "\n</urlset>\n"))

(define (write-text value port)
  (display value port))

(define (build-pages site posts)
  (let ((sorted (posts/reverse-chronological posts)))
    (append
     (list (home-page site sorted "en")
           (home-page site sorted "pt-BR")
           (projects-page site sorted "en")
           (projects-page site sorted "pt-BR")
           (publications-page site sorted "en")
           (publications-page site sorted "pt-BR")
           (research-page site sorted "en")
           (research-page site sorted "pt-BR")
           (about-page "en")
           (about-page "pt-BR")
           (not-found-page)
           (serialized-artifact "sitemap.xml" (sitemap-xml site sorted) write-text)
           (serialized-artifact
            "robots.txt"
            (string-append "User-agent: *\nAllow: /\nSitemap: " site-url "/sitemap.xml\n")
            write-text)
           (serialized-artifact
            "favicon.svg"
            (string-append
             "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 64 64\">"
             "<rect width=\"64\" height=\"64\" fill=\"#000\"/>"
             "<rect x=\"2\" y=\"2\" width=\"60\" height=\"60\" fill=\"none\" stroke=\"#63e6c2\" stroke-width=\"2\"/>"
             "<text x=\"10\" y=\"43\" fill=\"#63e6c2\" font-family=\"monospace\" font-size=\"30\" font-weight=\"700\">C/</text>"
             "</svg>\n")
            write-text)
           (verbatim-artifact "LICENSE" "LICENSE"))
     (map (lambda (post) (post-page site post)) sorted))))

(site #:title full-name
      #:domain "cristiancezarmoises.com"
      #:scheme 'https
      #:posts-directory "posts"
      #:build-directory "site"
      #:readers (list commonmark-reader)
      #:builders (list (static-directory "css")
                       (static-directory "images")
                       (static-directory ".well-known")
                       (static-directory "download")
                       (static-directory "videos")
                       build-pages))
