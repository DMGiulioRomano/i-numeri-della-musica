# I numeri della musica — ricostruzione LaTeX

Ricostruzione tipografica in LaTeX del volume:

> **Walter Branchi**, *I numeri della musica. Elementi di calcolo degli
> intervalli e sistemi d'intonazione*, edipan.
> Introduzione di Michela Mollia.

Il sorgente ricompone in modo pulito il libro a partire da una scansione
fotografica degradata. L'**Indice è stato spostato all'inizio** (nell'originale
era in fondo).

## Struttura

```
.
├── main.tex                 # documento principale (Indice all'inizio)
├── stile.sty                # "pagina di stile": formato, font, testatine, titoli
├── bibliografia.bib         # bibliografia (55 voci) — biblatex/biber
├── Makefile                 # `make` -> main.pdf
├── capitoli/
│   ├── 00-introduzione.tex          # COMPLETO (con epigrafe e firma)
│   ├── 01-elementi-calcolo-intervalli.tex  # COMPLETO (§1.1–§1.3.3)
│   └── 02-sistemi-intonazione.tex   # scheletro sezioni; testo da fare
├── appendici/
│   └── appendici.tex        # Appendice 1-5 (scheletro)
├── glossario.tex            # voci finali + tabella proporzioni; inizio da fare
├── esempi/                  # esempi musicali (LilyPond -> PDF ritagliato)
│   ├── _global.ily          # impostazioni condivise
│   ├── es-tetractys.ly      # esempio di prova (pipeline verificata)
│   ├── es-tetractys.cropped.pdf
│   └── build.sh             # compila i .ly in *.cropped.pdf
├── immagini/                # figure (per ora vuota)
└── main.pdf                 # PDF corrente
```

## Compilazione

Requisiti: una distribuzione TeX (pdflatex), **biber**, **latexmk**; per gli
esempi musicali, **LilyPond** (>= 2.24).

```bash
# 1) esempi musicali (solo se modifichi i .ly)
bash esempi/build.sh

# 2) documento
make            # oppure: latexmk -pdf main.tex
```

Gli esempi musicali sono già compilati (`esempi/*.cropped.pdf`), quindi il
documento si compila anche senza LilyPond installato.

## Stato dei lavori

Fatto: frontespizio, Introduzione integrale, Indice in apertura, **Cap. 1
completo** (aritmetica degli intervalli, comma/schisma, §1.1 Intervalli
complementari, §1.2 Intervalli logaritmici con diagramma cents/frequenza in
TikZ, §1.3 Conversione rapporto/cents/rapporto e relative sottosezioni),
bibliografia, pipeline esempi musicali.

Da fare: Cap. 2 §2.1–§2.8 (con esempi su pentagramma e il diagramma circolare),
Appendici, completamento Glossario, rifinitura bibliografia. I punti aperti
sono marcati con `% TODO` nei sorgenti.

## Note

- Font del corpo: Palatino (`mathpazo`), facilmente sostituibile in `stile.sty`.
- Formato pagina identico all'originale (157 × 210 mm circa).
- Bibliografia: alcune voci sono marcate `% TODO verifica` (letture incerte
  dalla scansione) e alcune correzioni OCR sono segnate `% [corr.]`.
- La copertina (xilografia "PITAGORAS") non è inclusa: è un'immagine storica da
  inserire a parte.
