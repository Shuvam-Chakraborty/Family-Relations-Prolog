# Family Relations — Prolog

A Prolog knowledge base that encodes a fictional Harry Potter × Tarantino family tree across three generations and lets you query any family relationship — parent, sibling, cousin, in-law, and more.

## Run

Paste the contents of `Family_Relations.pl` into any online Prolog compiler such as:
- https://swish.swi-prolog.org
- https://www.jdoodle.com/execute-prolog-online

Then query at the prompt, for example:

```prolog
?- grandfather(fred_ii).
?- aunt(hugo).
?- cousin(dominique).
```

All names are lowercase atoms; multi-word names use underscores (e.g. `james_sirius`, `molly_ii`). Sample queries are included as comments at the bottom of the file.
