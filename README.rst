Documents
*********

This repository contains presentation slides and other documents made available for free reuse.

.. |cc| image:: https://mirrors.creativecommons.org/presskit/icons/cc.svg
   :height: 20
   :target: https://creativecommons.org/licenses/by-sa/4.0
.. |by| image:: https://mirrors.creativecommons.org/presskit/icons/by.svg
   :height: 20
   :target: https://creativecommons.org/licenses/by-sa/4.0
.. |sa| image:: https://mirrors.creativecommons.org/presskit/icons/sa.svg
   :height: 20
   :target: https://creativecommons.org/licenses/by-sa/4.0
.. |doi| image:: https://zenodo.org/badge/DOI/10.5281/zenodo.4042089.svg
   :target: https://doi.org/10.5281/zenodo.4042089

Copyright © 2019–2021 Paul Natsuo Kishimoto <mail@paul.kishimoto.name>.

|cc| |by| |sa| Licensed `CC BY-SA 4.0 <https://creativecommons.org/licenses/by-sa/4.0>`_, except where noted.

Although the license does not require it, I would appreciate if you let me know if and when you make use of these materials!
Cite as: |doi|

Organization:

- ``article/``, ``page/``: content for https://paul.kishimoto.name, a `Pelican <https://docs.getpelican.com/en/latest/>`_-based website.
  Most of the site is in a separate, private repository; these are public pages.

  - ``requirements.txt``: associated Python requirements for building the above content.

- ``20YY/MM-DD/``: presentation slides, by date.

Technical details:

- The LaTeX sources require packages that are available with TeX Live 2019, plus other, non-CTAN packages collected in `khaeru/tex <https://github.com/khaeru/tex>`_.
- GNU Make is used recursively and in each directory to invoke `latexmk <https://www.ctan.org/pkg/latexmk/>`_.
- GitHub Actions (see ``.github/``) recompiles all LaTeX documents on each commit.

  `View the workflow <https://github.com/khaeru/doc/actions/workflows/compile.yaml>`_, choose the latest build, and download the “Documents” artifact containing the compiled PDF documents.
  `khaeru/latex-gh-actions <https://github.com/khaeru/latex-gh-actions>`_ gives some other ways to set up this compilation.

Republished from other sources:

- ``image/git-book/``: images from the `Pro Git book <https://github.com/progit/progit2>`_, licensed CC BY-NC-SA 3.0.
