;; Guix revision that provides Haunt 0.4.0, without workstation-only channels.
;; SPDX-FileCopyrightText: 2026 Cristian Cezar Moisés
;; SPDX-License-Identifier: GPL-3.0-or-later

(list
 (channel
  (name 'guix)
  (url "https://git.securityops.com.br/cristiancmoises/guix.git")
  (branch "master")
  (commit "fb556d47e9dfbd246d748f3fc6d7cf9edba6c656")
  (introduction
   (make-channel-introduction
    "9edb3f66fd807b096b48283debdcddccfea34bad"
    (openpgp-fingerprint
     "BBB0 2DDF 2CEA F6A8 0D1D  E643 A2A0 6DF2 A33A 54FA")))))
