// parse_page_dims() // {{{
#let parse_page_dims(page_size_style) = {
  let (page_width, page_height) = if page_size_style == "metric" {
    (21.5cm, 28cm)
  } else if (page_size_style == "imperial") {
    (18.5in, 11in)
  } else {
    panic([Parameter `page_size_style` must be either `metric` or `imperial`])
  }
  (page_width, page_height)
}
//  // }}}

// parse_margin_dims() // {{{
#let parse_margin_dims(page_margin_style) = {
  let (margin_t, margin_b, margin_l, margin_r) = if (page_margin_style == "left_metric") {
    (20mm, 20mm, 32mm, 20mm)
  } else if (page_margin_style == "left_imperial") {
    (0.75in, 0.75in, 10.25in, 0.75in)
  } else if (page_margin_style == "metric") {
    (20mm, 20mm, 20mm, 20mm)
  } else if (page_margin_style == "imperial") {
    (0.75in, 0.75in, 0.75in, 0.75in)
  } else {
    panic([Parameter `page_margin_style` must be one of `left_metric`, `left_imperial`, `metric`, or `imperial`])
  }
  (margin_t, margin_b, margin_l, margin_r)
}

//  // }}}

// parse_font() // {{{
#let parse_font(font_size) = {
  if font_size < 10pt {
    panic([Font font_size must be at least 10pt])
  } else {
    font_size
  }
}
//  // }}}

// init_title_page() // {{{
#let init_title_page(title,
                author,
                department,
                graduation_year,
                title_page_top_margin,
                title_page_gap_1_height,
                title_page_gap_2_height,
                title_page_gap_3_height,
                title_page_gap_4_height,
                title_page_bottom_margin,
                page_size_style
              ) = {
  set par(spacing: 0em)

  let top_margin = if title_page_top_margin in (2in, 5cm) {
    title_page_top_margin
  } else {
    panic([Parameter `title_page_top_margin` must be either `2in` or `5cm`])
  }

  let gap_1_height = if title_page_gap_1_height in (1.5in, 4cm) {
    title_page_gap_1_height
  } else {
    panic([Parameter `title_page_gap_1_height` must be either `1.5in` or `4cm`])
  }

  let gap_2_height = if title_page_gap_2_height in (1.5in, 4cm) {
    title_page_gap_2_height
  } else {
    panic([Parameter `title_page_gap_2_height` must be either `1.5in` or `4cm`])
  }

  let gap_3_height = if title_page_gap_3_height in (2in, 5cm) {
    title_page_gap_3_height
  } else {
    panic([Parameter `title_page_gap_3_height` must be either `2in` or `5cm`])
  }

  let gap_4_height = if title_page_gap_4_height in (1.25in, 3cm) {
    title_page_gap_4_height
  } else {
    panic([Parameter `title_page_gap_4_height` must be either `1.25in` or `3cm`])
  }

  let bottom_margin = if title_page_bottom_margin in (1.25in, 3cm) {
    title_page_bottom_margin
  } else {
    panic([Parameter `title_page_bottom_margin` must be either `1.25in` or `3cm`])
  }

  let (width, height) = parse_page_dims(page_size_style)
  set page(
    width: width,    
    height: height,
    margin: (
      top: top_margin,
      bottom: bottom_margin,
      left: 0cm,
      right: 0cm
    ),
  ) 

  align(center)[
    #title
    #v(gap_1_height)
    by
    #v(gap_2_height)
    #author
    #v(gap_3_height)
    A thesis submitted in conformity with the requirements \ for the degree of Doctor of Philosophy \
    #department \
    University of Toronto
    #v(gap_4_height)
    #sym.copyright Copyright by #author
  ]
}
//  // }}}

// working on abstract
#let init_abstract(//title,
                   //degree,
                   //graduation_year,
                   //name,
                   abstract) = {
  set text(top-edge: 0.7em, bottom-edge: -0.3em)
  set par(leading: 1em)
  heading("Abstract")
  abstract
}

// title: 
// - The title of the thesis.
//
// author:
// - The author of the thesis.
//
// department:
// - The department for which the thesis is submitted.
//
// main_margin_style: 
// - "left_metric": (default) Applies 32 mm left margin and 20 mm top,
//   right, and bottom margin to the main text.
// - "left_imperial": Applies 1.25 in left margin and 0.75 in top, right,
//   and bottom margin to the main text.
// - "metric": Applies 20 mm margin to all sides of the main text.
// - "imperial": Applies 0.75 in margin to all sides of the main text.
#let uoft(title: none,
          author: "PARAM_AUTHOR",
          abstract: [],
          department: [],
          graduation_year: "PARAM_YEAR",
          title_page_top_margin: 5cm,
          title_page_gap_1_height: 4cm,
          title_page_gap_2_height: 4cm,
          title_page_gap_3_height: 5cm,
          title_page_gap_4_height: 3cm,
          title_page_bottom_margin: 3cm,
          page_size_style: "metric",
          main_margin_style: "left_metric",
          font_size: 10pt,
          doc) = {
  // Setting up global page styles
  let (page_width, page_height) = parse_page_dims(
    page_size_style
  )
  let (margin_t, margin_b, margin_l, margin_r) = parse_margin_dims(
    main_margin_style
  )
  set page(
    width: page_width,
    height: page_height,
    margin: (top: margin_t, bottom: margin_b, left: margin_l, right: margin_r),
  )
  let font_size = parse_font(font_size)
  set text(size: font_size)

  //---------------------------------------------------------------------------

  init_title_page(
    title,
    author,
    department,
    graduation_year,
    title_page_top_margin,
    title_page_gap_1_height,
    title_page_gap_2_height,
    title_page_gap_3_height,
    title_page_gap_4_height,
    title_page_bottom_margin,
    page_size_style,
  )

  //---------------------------------------------------------------------------
  init_abstract(abstract)

  doc
  //set page(margin: 10cm)
}
