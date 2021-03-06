checkConcordance <- function(df) {
  df$effect_allele_same <- 0
  df$effect_allele_same[which(df$df1_eff_allele == df$df2_eff_allele)] <- 1
  df$b_product <- NA
  df$b_product <- df$b_df1 * df$b_df2
  df$concordance <- NA
  df$concordance[ which (
    df$effect_allele_same == 1 & df$b_product > 0 |
      df$effect_allele_same == 0 & df$b_product < 0 )] <- 1
  df$concordance[ which (
    df$effect_allele_same == 0 & df$b_product > 0 |
      df$effect_allele_same == 1 & df$b_product < 0 )] <- 0
  return(df) 
}