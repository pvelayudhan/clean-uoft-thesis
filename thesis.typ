#import "uoft.typ": uoft

#import "@preview/wordometer:0.1.4": word-count, total-words

#show: word-count

#show: uoft.with(
  title: "Sample Title of Thesis",
  author: [Firstname Lastname],
  department: "Physiology",
  degree: "Doctor of Philosophy",
  font_size: 12pt
)

sample text in document

#show: word-count

In this document, there are #total-words words all up.

#word-count(total => [
  The number of words in this block is #total.words
  and there are #total.characters letters.
])

#lorem(10)
