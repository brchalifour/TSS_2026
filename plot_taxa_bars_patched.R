plot_taxa_bars = function(tax_table, metadata_map, type_header, num_taxa,
                          data_only = FALSE) {
  tax_table$taxon = row.names(tax_table)
  tax_table_melted = reshape2::melt(tax_table, variable.name = 'Sample_ID',
                                    id.vars = 'taxon')
  group_by_levels = metadata_map[match(tax_table_melted$Sample_ID,
                                       row.names(metadata_map)), type_header]
  tax_table_melted$group_by = group_by_levels
  mean_tax_vals = dplyr::summarise(dplyr::group_by(tax_table_melted,
                                                     "group_by", "taxon"),
                                    mean_value = ~ mean(value))
  # get top taxa and convert other to 'other'
  mean_tax_vals_sorted = mean_tax_vals[order(mean_tax_vals$mean_value,
                                             decreasing = TRUE),]
  top_taxa = unique(mean_tax_vals_sorted$taxon)[1:num_taxa]
  mean_tax_vals_sorted$taxon[!mean_tax_vals_sorted$taxon %in% top_taxa] = 'Other'
  to_plot = dplyr::summarise(
    dplyr::group_by(mean_tax_vals_sorted, "group_by",
                     "taxon"),
    mean_value = ~ sum(mean_value)
  )
  # make it so 'Other' appears at bottom of key
  o = c(unique(to_plot$taxon)[unique(to_plot$taxon) != 'Other'], 'Other')
  to_plot$taxon = factor(x = to_plot$taxon, levels = o)
  to_plot = to_plot[order(to_plot$group_by, as.numeric(to_plot$taxon), 
                          decreasing = T), ]
  if (data_only)
    to_plot
  else {
    ggplot2::ggplot(to_plot, ggplot2::aes_string("group_by", "mean_value",
                                                 fill = "taxon")) +
      ggplot2::geom_bar(stat = 'identity') +
      ggplot2::ylab('') + ggplot2::xlab('') +
      ggplot2::theme(legend.title = ggplot2::element_blank())
  }
  # plot
}
