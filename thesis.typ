#import "uoft.typ": uoft

#import "@preview/wordometer:0.1.4": word-count, total-words

#show: word-count

#show: uoft.with(
  title: "Sample Title of Thesis",
  author: "Firstname Lastname",
  department: "Department of Something",
  degree: "Doctor of Philosophy",
  page_size_style: "metric",
  main_margin_style: "left_metric",
  font_size: 12pt,
  abstract: lorem(350)
)

sample text in document

#lorem(20)

#show: word-count

In this document, there are #total-words words all up.

#word-count(total => [
  The number of words in this block is #total.words
  and there are #total.characters letters.
])


#lorem(1000)
