#import "template.typ": *
#import "theorem.typ": *
#import "algo.typ" : *

#set heading(numbering: "1.1.")
#let lebs = [ $L^2(Omega)$ ]
#let into = [ $integral_Omega$ ]
#let dx = [ $dif x$ ]

#let bd(term) = [ $bold(#term)$]

#let theorem = thmbox(
  "theorem",
  "Theorem",
  fill: rgb("#e8e8f8"),
)

#let lemma = thmbox(
  "theorem",
  "Lemma",
  fill: rgb("#e8e8f8"),
)

#let definition = thmbox(
  "theorem",
  "Definition",
  fill: rgb("#e8f8e8"),
)

#let example = thmbox(
  "theorem",
  "Example",
  stroke: rgb("#ffaaaa") + 1pt,
)

#let method = thmbox(
  "theorem",
  "Method",
  stroke: rgb("#aaaaff") + 1pt,
)

#let problem = thmbox(
  "theorem",
  "Problem",
  stroke: rgb("#aaffaa") + 1pt,
)

// #let thm = counter("theorem")
// #let theorem(term, name: "", type: "Theorem") = block(fill: luma(240), inset: 6pt, width: 100%, radius: 2pt)[
//   *#type #thm.display()*#if name == "" {} else {[ (#name)]}. #thm.step() #term 
// ]
// #let corollary(term, name: "") = theorem(name: name, type: "Corollary")[#term]
// #let lemma(term, name: "") = theorem(name: name, type: "Lemma")[#term]
// #let example(term, name: "") = theorem(name: name, type: "Example")[#term]
// #let definition(term, name: "") = theorem(name: name, type: "Definition")[#term]


#let proof(term) = block(width: 100%)[_Proof._ #term #h(1fr) $qed$]



// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.
#show: project.with(
  title: "Notes for Capstone: Discrete Math",
  authors: (
    "Ojas Chaturvedi",
  ),
  date: "December 15, 2023",
)

#outline(indent: true)

#pagebreak()

#pagebreak()
#include "Lectures/[1] Chapter 1.typ"

#pagebreak()
#include "Lectures/[2] Chapter 2.typ"

#pagebreak()
#include "Lectures/[3] Chapter 3.typ"

#pagebreak()
#include "Lectures/[4] Chapter 4.typ"

#pagebreak()
#include "Lectures/[5] Chapter 5.typ"

#pagebreak()
#include "Lectures/[6] Chapter 6.typ"