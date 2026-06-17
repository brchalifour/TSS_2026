calc_pairwise_permanovas = function (dm, metadata_map, compare_header, n_perm)
{
  comp_var = metadata_map[, compare_header]
  comp_pairs = combn(levels(comp_var), 2)
  pval = c()
  R2 = c()
  for (i in 1:ncol(comp_pairs)) {
    pair = comp_pairs[, i]
    dm_w_map = list(dm_loaded = dm, map_loaded = metadata_map)
    dm_w_map$map_loaded$in_pair = comp_var %in% pair
    dm_w_map_filt = mctoolsr::filter_dm(dm_w_map, filter_cat = "in_pair",
                                        keep_vals = TRUE)
    if (!missing(n_perm)) {
      m = vegan::adonis2(dm_w_map_filt$dm_loaded ~ dm_w_map_filt$map_loaded[, compare_header],
                        permutations = n_perm)
    } else {
      m = vegan::adonis2(dm_w_map_filt$dm_loaded ~ dm_w_map_filt$map_loaded[, compare_header])
    }
    
    pval = c(pval, m$aov.tab$`Pr(>F)`[1])
    R2 = c(R2, m$aov.tab$R2[1])
  }
  results = data.frame(t(comp_pairs), R2, pval)
  results$pvalBon = pval * length(pval)
  results$pvalFDR = round(pval * (length(pval) / rank(pval, ties.method = "average")),
                          3)
  results
}