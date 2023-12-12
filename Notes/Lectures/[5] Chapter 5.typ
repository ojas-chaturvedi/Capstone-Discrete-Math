#import "../template.typ": *
#import "../theorem.typ": *
#import "../algo.typ" : *
// #import "../main.typ": *
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
= Sequences, Mathematical Induction, and Recursion

== Sequences
#definition(name: "Sequence")[
  A sequence is a function whose domain is either all the integers between two given integers or all the integers greater than or equal to a given integer.

  My definition: A sequence is a list of numbers. The list can be finite or infinite. The list can be indexed by the natural numbers or the integers.
]

== Mathematical Induction I


== Mathematical Induction II


== Strong Mathematical Induction and the Well-Ordering Principle for the Integers


== Application: Correctness of Algorithms


== Defining Sequences Recursively


== Solving Recurrence Relations by Iteration


== Second-Order Linear Homogeneous Recurrence Relations with Constant Coefficients


== General Recursive Definitions and Structural Induction

