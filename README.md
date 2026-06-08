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
│   └── 02-sistemi-intonazione.tex   # COMPLETO (§2.1–§2.8)
├── appendici/
│   └── appendici.tex        # App. 1,2,4,5 COMPLETE; App. 3 da fare
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
bibliografia, pipeline esempi musicali. Il **Cap. 2 è completo** (§2.1–§2.8):
sistemi temperati a divisione semplice e multipla, participato mesotonico,
costruzione di un sistema non temperato, sistema pitagorico, tetracordo e
generi della musica greca, e — appena aggiunte — **§2.6 Sistema naturale**
(scala diatonica naturale, comma sintonico, problemi di modulazione),
**§2.7 Oltre il fattore 5** (sistema di Harry Partch: scala a 29 rapporti,
colmatura delle distanze, tabella dei 43 intervalli, intervalli epimori) e
**§2.8** (sistema armonico di Alain Daniélou: sette serie di quinte generatrici
con diagrammi TikZ, tabella dei 53 intervalli, intervalli regolatori).

**Appendici**: tutte complete — 1 (serie degli armonici), 2 (temperamento
equabile), 3 (340 intervalli naturali nel rapporto 2/1, con cents verificati
per ricalcolo), 4 (potenze di 2 e di 3) e 5 (numeri primi inferiori a 3000).
Aggiunta in chiusura la **nota biografica** su Walter Branchi.

Da fare: voci iniziali del Glossario (A–R), rifinitura bibliografia. I punti
aperti sono marcati con `% TODO` nei sorgenti.

## Note

- Font del corpo: Palatino (`mathpazo`), facilmente sostituibile in `stile.sty`.
- Formato pagina identico all'originale (157 × 210 mm circa).
- Bibliografia: alcune voci sono marcate `% TODO verifica` (letture incerte
  dalla scansione) e alcune correzioni OCR sono segnate `% [corr.]`.
- La copertina (xilografia "PITAGORAS") non è inclusa: è un'immagine storica da
  inserire a parte.
