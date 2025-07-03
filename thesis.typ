#import "uoft.typ": uoft, word-count, total-words, word-count-of, string-word-count

#show: uoft.with(
  title: "Title of Thesis",
  author: [Firstname Lastname],
  department: "Physiology",
  degree: "Doctor of Philosophy",
  graduation_year: "2025",
  font_size: 12pt
)

#let a = table.cell(
  fill: green.lighten(60%),
)[A]
#let b = table.cell(
  fill: aqua.lighten(60%),
)[B]


#figure(
  table(
    columns: 4,
    [], [Exam 1], [Exam 2], [Exam 3],

    [John], [], a, [],
    [Mary], [], a, a,
    [Robert], b, a, b,
  ),
  caption: "Table",
)
