(asdf:defsystem :mephos
  :description "A text based game engine"
  :author "Neil Munro <neilmunro@gmail.com>"
  :license "MIT"
  :version "1.0.0"

  :serial t
  :components ((:file "package")
               (:module "src" :serial t
                :components
                  ((:file "io")
                   (:file "utils")
                   (:file "engine")
                   (:file "entities")
                   (:file "combat")))))
