// Some definitions presupposed by pandoc's typst output.
#let blockquote(body) = [
  #set text( size: 0.92em )
  #block(inset: (left: 1.5em, top: 0.2em, bottom: 0.2em))[#body]
]

#let horizontalrule = [
  #line(start: (25%,0%), end: (75%,0%))
]

#let endnote(num, contents) = [
  #stack(dir: ltr, spacing: 3pt, super[#num], contents)
]
#show terms: it => {
  it.children
    .map(child => [
      #strong[#child.term]
      #block(inset: (left: 1.5em, top: -0.4em))[#child.description]
      ])
    .join()
}

#let conf(
  title: none,
  authors: none,
  date: none,
  abstract: none,
  cols: 1,
  margin: (x: 1.25in, y: 1.25in),
  paper: "us-letter",
  lang: "en",
  region: "US",
  font: (),
  fontsize: 11pt,
  sectionnumbering: none,
  doc,
) = {
  set page(
    paper: paper,
    margin: margin,
    numbering: "1",
  )
  set par(justify: true)
  set text(lang: lang,
           region: region,
           font: font,
           size: fontsize)
  set heading(numbering: sectionnumbering)

  if title != none {
    align(center)[#block(inset: 2em)[
      #text(weight: "bold", size: 1.5em)[#title]
    ]]
  }

  if authors != none {
    let count = authors.len()
    let ncols = calc.min(count, 3)
    grid(
      columns: (1fr,) * ncols,
      row-gutter: 1.5em,
      ..authors.map(author =>
          align(center)[
            #author.name \
            #author.affiliation \
            #author.email
          ]
      )
    )
  }

  if date != none {
    align(center)[#block(inset: 1em)[
      #date
    ]]
  }

  if abstract != none {
    block(inset: 2em)[
    #text(weight: "semibold")[Abstract] #h(1em) #abstract
    ]
  }

  if cols == 1 {
    doc
  } else {
    columns(cols, doc)
  }
}
#show: doc => conf(
  cols: 1,
  doc,
)


= Chapter 5: Sequences, Mathematical Induction, and Recursion
<chapter-5-sequences-mathematical-induction-and-recursion>
== Sequences
<sequences>
- Sequence: a function whose domain is either all the integers between
  two given integers, or all the integers greater than or equal to a
  given integer.

  - Know subscript/index, initial and final term, infinite sequence,
    general/explicit formula

- Summation Notation:
  $ sum_(k eq m)^n a_k eq a_m plus a_(m plus 1) plus a_(m plus 2) plus dots.h.c plus a_n $
  where k is the index, m is the lower limit, and n is the upper limit.

- When the upper limit of a summation is a variable, an ellipsis is used
  to write the summation in expanded form. Expand the summation notation
  to first 3 or so, then put ellipsis and then variable form.

- Product Notation:
  $ product_(k eq m)^n a_k eq a_m dot.op a_(m plus 1) dot.op a_(m plus 2) dots.h.c a_n $

- Properties of Summations and Products \(aka Theorem 5.1.1)
  $ sum_(k eq m)^n a_k plus sum_(k eq m)^n b_k & eq sum_(k eq m)^n lr((a_k plus b_k))\
  c dot.op sum_(k eq m)^n a_k & eq sum_(k eq m)^n lr((c dot.op a_k))\
  lr((product_(k eq m)^n a_k)) dot.op lr((product_(k eq m)^n b_k)) & eq product_(k eq m)^n lr((a_k dot.op b_k)) $

- When replacing a new variable into a summation or product, make sure
  to change the index variable to the new variable and the numbers by
  putting them into the equation of the new variable.

- Factorial: the quantity $bold(n excl)$ is defined to be the product of
  all the integers from 1 to n:
  $ n excl eq n dot.op lr((n minus 1)) dots.h.c 3 dot.op 2 dot.op 1 $
  and $ 0 excl eq 1 $ Recursive definition:
  $ n excl eq cases(delim: "{", 1 & upright("if ") n eq 0, n dot.op lr((n minus 1)) excl & upright("if ") n gt 0) $

- $n$ choose $r$: the number of subsets \(therefore an integer) of size
  $r$ that can be chosen from a set of $n$ elements.
  $ binom(n, r) & eq frac(n excl, r excl lr((n minus r)) excl) $ for all
  integers $n$ and $r$ with $0 lt.eq r lt.eq n$.

== Mathematical Induction I
<mathematical-induction-i>
- Principles of Mathematical Induction: Let $P lr((n))$ be a property
  that is defined for integers $n$, and let $a$ be a fixed integer.
  Suppose the following two statements are true:

  + Basis Step: Show that $P lr((a))$ is true.

  + Inductive Step: For all integers $k gt.eq a$, if $P lr((k))$ is
    true, then $P lr((k plus 1))$ is true.

    - To perform this step:

      + Suppose that $P lr((k))$ is true for an arbitrary integer
        $k gt.eq a$, which is called the inductive hypothesis.

      + Show that $P lr((k plus 1))$ is true.

    - Remember that you need to prove each side of the equation
      separately. Otherwise, the proof is invalid.

  + Conclusion: Then $P lr((n))$ is true for all integers $n gt.eq a$.

- Steps of Proof by Mathematical Induction:

  + State the theorem to be proved.

    - Let the property $P lr((n))$ be the equation: problem goes here

  + Prove the basis step.

    - Show that $P lr((a))$ is true.

  + State the inductive hypothesis.

    - Show that for all integers $k gt.eq 1$, if $P lr((k))$ is true
      then $P lr((k plus 1))$ is also true:

  + Prove the inductive step.

  + State the conclusion.

    - Therefore the equation $P lr((k plus 1))$ is true \[#emph[as was
      to be shown]\]. \[#emph[Since we have proved both the basis step
      and the inductive step, the conclusion follows by the principle of
      mathematical induction. Therefore the equation $P lr((n))$ is true
      for all integers $n gt.eq 1$.]\]

- Sum of the first $n$ integers is
  $ 1 plus 2 plus 3 plus dots.h.c plus n eq frac(n lr((n plus 1)), 2) $

- Geometric sum of the first $n$ integers is
  $ sum_(i eq 0)^n r^i eq frac(r^(n plus 1) minus 1, r minus 1) $

== Mathematical Induction II
<mathematical-induction-ii>
#block[
#emph[Proof.] Let the property $P lr((n))$ be the sentence:
$ 2^(2 n) minus 1 upright(" is divisible by ") 3 $ First, we must prove
that $P lr((0))$ is true \(basis step).
$ 2^(2 dot.op 0) minus 1 upright(" is divisible by ") 3 $
$ 2^(2 lr((0))) minus 1 & eq 2^0 minus 1\
 & eq 1 minus 1\
 & eq 0\
 & eq 3 dot.op 0\
 $ Thus, $P lr((0))$ is true. \
Now, suppose that $P lr((k))$ is true for some integer $k gt.eq 0$
\(inductive hypothesis). That is,
$ 2^(2 k) minus 1 upright(" is divisible by ") 3 $ By the definition of
divisibility, for some integer $r$, $ 2^(2 k) minus 1 eq 3 r $ We must
show that $P lr((k plus 1))$ is true \(inductive step). That is,
$ 2^(2 lr((k plus 1))) minus 1 upright(" is divisible by ") 3 $ The
left-hand side of $P lr((k plus 1))$ is:
$ 2^(2 lr((k plus 1))) minus 1 & eq 2^(2 k plus 2) minus 1\
 & eq 2^(2 k) dot.op 2^2 minus 1\
 & quad upright("by the product rule for exponents")\
 & eq 4 dot.op 2^(2 k) minus 1\
 & eq 3 dot.op 2^(2 k) plus 2^(2 k) minus 1\
 & eq 3 dot.op 2^(2 k) plus 3 r\
 & quad upright("by substituting the inductive hypothesis")\
 & eq 3 lr((2^(2 k) plus r)) $ $2^(2 k) plus r$ is an integer since it
is the sum of products of integers, so $2^(2 lr((k plus 1))) minus 1$
can be written as $6 m$ for some integer $m eq lr((2^(2 k) plus r))$. \
By the definition of divisibility, $2^(2 lr((k plus 1))) minus 1$ is
divisible by $3$, and thus, $P lr((k plus 1))$ is true. \
Since we have proved both the basis step and the inductive step, we
conclude that the statement is true using mathematical induction.~◻

]
#block[
#emph[Proof.] Let the property $P lr((n))$ be the inequality:
$ 2 n plus 1 lt 2^n $ First, we must prove that $P lr((3))$ is true
\(basis step). $ 2 lr((3)) plus 1 lt 2^3\
7 lt 8 $ Thus, $P lr((3))$ is true. \
Now, suppose that $P lr((k))$ is true for some integer $k gt.eq 3$
\(inductive hypothesis). That is, $ 2 k plus 1 lt 2^k $ We must show
that $P lr((k plus 1))$ is true \(inductive step). That is,
$ 2 lr((k plus 1)) plus 1 lt 2^(k plus 1)\
2 k plus 3 lt 2^(k plus 1) $ The left-hand side of $P lr((k plus 1))$
is: $ 2 k plus 3 & eq 2 k plus 1 plus 2\
 & lt 2^k plus 2\
 & quad upright("by substitution of the inductive hypothesis")\
 & lt 2^k plus 2^k\
 & quad upright("because ") 2 lt 2^k upright(" for all integers ") k gt.eq 2\
 & lt 2 dot.op 2^k\
 & lt 2^(k plus 1)\
 & quad upright("by the product rule for exponents") $ Thus, the
left-hand side of $P lr((k plus 1))$ is less than the right-hand side of
$P lr((k plus 1))$, and $P lr((k plus 1))$ is true. \
Since we have proved both the basis step and the inductive step, we
conclude that the statement is true using mathematical induction.~◻

]
#block[
#emph[Proof.]

+ $a_1 eq 2$ \
  $a_2 eq 5 a_(2 minus 1) eq 5 a_1 eq 5 dot.op 2 eq 10$ \
  $a_3 eq 5 a_(3 minus 1) eq 5 a_2 eq 5 dot.op 10 eq 50$ \
  $a_4 eq 5 a_(4 minus 1) eq 5 a_3 eq 5 dot.op 50 eq 250$

+ Let $a_1 comma a_2 comma a_3 comma dots.h$ be the sequence defined by
  specifying that $a_1 eq 2$ and $a_k eq 5 a_(k minus 1)$ for all
  integers $k gt.eq 2$. Let the property $P lr((n))$ be the equation:
  $ a_n eq 2 dot.op 5^(n minus 1) $ First, we must prove that
  $P lr((1))$ is true \(basis step). $ a_1 & eq 2 dot.op 5^(1 minus 1)\
   $ The left-hand side of $P lr((1))$ is $ a_1 & eq 2\
   & quad upright("by the definition of ") a_1 comma a_2 comma a_3 comma dots.h\
   $ The right-hand side of $P lr((1))$ is
  $ 2 dot.op 5^(1 minus 1) & eq 2 dot.op 5^0\
   & eq 2 dot.op 1\
   & eq 2 $ Thus, the left-hand side of $P lr((1))$ is equal to the
  right-hand side of $P lr((1))$, and $P lr((1))$ is true. \
  Now, suppose that $P lr((k))$ is true for some integer $k gt.eq 1$
  \(inductive hypothesis). That is, $ a_k eq 2 dot.op 5^(k minus 1) $ We
  must show that $P lr((k plus 1))$ is true \(inductive step). That is,
  $ a_(k plus 1) & eq 2 dot.op 5^(lr((k plus 1)) minus 1)\
  a_(k plus 1) & eq 2 dot.op 5^k $ The left-hand side of
  $P lr((k plus 1))$ is: $ a_(k plus 1) & eq 5 a_k\
   & eq 5 lr((2 dot.op 5^(k minus 1)))\
   & eq 2 dot.op 5^k $ Thus, the left-hand side of $P lr((k plus 1))$ is
  equal to the right-hand side of $P lr((k plus 1))$, and
  $P lr((k plus 1))$ is true. \
  Since we have proved both the basis step and the inductive step, we
  conclude that the statement is true using mathematical induction.

~◻

]
== Strong Mathematical Induction and the Well-Ordering Principle for the Integers
<strong-mathematical-induction-and-the-well-ordering-principle-for-the-integers>
== Application: Correctness of Algorithms
<application-correctness-of-algorithms>
== Defining Sequences Recursively
<defining-sequences-recursively>
== Solving Recurrence Relations by Iteration
<solving-recurrence-relations-by-iteration>
== Second-Order Linear Homogeneous Recurrence Relations with Constant Coefficients
<second-order-linear-homogeneous-recurrence-relations-with-constant-coefficients>
== General Recursive Definitions and Structural Induction
<general-recursive-definitions-and-structural-induction>
