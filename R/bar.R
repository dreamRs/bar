#' Create a proportion chart
#'
#' @param data a \code{list} with items \code{"name"} and \code{"value"}
#'  or a \code{data.frame} with labels in first column and values in second.
#' @param colors Named \code{list} with names corresponding to labels and values to colors.
#' @param width,height Width and height for the chart.
#' @param elementId Explicit ID for the widget.
#'
#' @import htmlwidgets
#'
#' @export
bar <- function(data,
                colors,
                width = NULL, height = NULL,
                elementId = NULL) {

  if (is.data.frame(data)) {
    data <- apply(
      X = installed,
      MARGIN = 1,
      FUN = function(x) {
        list(name = x[[1]], value = x[[2]])
      }
    )
  }

  # forward options using x
  x <- list(
    data = data,
    colors = colors
  )

  # create widget
  htmlwidgets::createWidget(
    name = "bar",
    x = x,
    width = width,
    height = height,
    package = "bar",
    elementId = elementId
  )
}

#' Shiny bindings for bar
#'
#' Output and render functions for using bar within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a bar
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name bar-shiny
#'
#' @export
barOutput <- function(outputId, width = "100%", height = "200px"){
  htmlwidgets::shinyWidgetOutput(outputId, "bar", width, height, package = "bar")
}

#' @rdname bar-shiny
#' @export
renderBar <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, barOutput, env, quoted = TRUE)
}
