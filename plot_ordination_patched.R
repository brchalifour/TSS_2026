plot_ordination = function(input, ordination_axes, color_cat, shape_cat,
                           hulls = FALSE, ...) {
  if (missing(color_cat)) {
    warning('No mapping category to color by.')
    color_vec = rep('none', nrow(input$map_loaded))
  } else
    color_vec = input$map_loaded[, color_cat]
  to_plot = data.frame(ordination_axes, cat = color_vec)
  names(to_plot)[3] = 'cat'
  headers = colnames(to_plot)
  # hulls prep
  if (hulls) {
    .find_hulls = function(df) {
      df[chull(df),]
    }
    hull_vals = dplyr::do(dplyr::group_by_(to_plot, "cat"), ~ .find_hulls(.))
  }
  # plot w/ shape
  if (!missing(shape_cat)) {
    to_plot = data.frame(to_plot, cat2 = input$map_loaded[, shape_cat])
    p = ggplot2::ggplot(to_plot, ggplot2::aes_string(headers[1], headers[2]))
    p = p + ggplot2::geom_point(
      ggplot2::aes_string(color = "cat", shape = "cat2"),
      ..., size = 3, alpha = 0.8
    )
    p = p + ggplot2::theme_bw()
    p = p + ggplot2::xlab(colnames(to_plot)[1]) +
      ggplot2::ylab(colnames(to_plot)[2])
    p = p + ggplot2::theme(legend.title = ggplot2::element_blank())
  }
  # plot without shape
  else{
    p = ggplot2::ggplot(to_plot, ggplot2::aes_string(headers[1], headers[2]))
    p = p + ggplot2::geom_point(ggplot2::aes_string(color = "cat"),
                                ..., size = 3, alpha = 0.8)
    p = p + ggplot2::theme_bw()
    p = p + ggplot2::xlab(colnames(to_plot)[1]) +
      ggplot2::ylab(colnames(to_plot)[2])
    p = p + ggplot2::theme(legend.title = ggplot2::element_blank())
  }
  if (hulls) {
    p = p + ggplot2::geom_polygon(
      data = hull_vals,
      ggplot2::aes_string(fill = "cat", color = "cat"),
      alpha = 0.1
    )
    p = p + ggplot2::theme(legend.title = ggplot2::element_blank())
  }
  p
}
