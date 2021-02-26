#' @title
#' Group and compare summaries statistics to a data frame
#'
#' @description
#' Extract and return a data frame with the columns that include only numeric
#'  values
#'
#' @usage compare.stats(df, group_var, values, m_functions)
#'
#' @param df numeric vector or matrix or dataframe
#' @param group_var character vector of variables to group the data
#' @param values numeric or integer variables
#' @param m_functions functions to apply in values
#'
#' @return This function returns a data frame with the selected group_vars and
#' the result of m_functions applied in the selected values.
#'
#' @author Kleanthis Koupidis
#' @importFrom magrittr %>%
#' @rdname compare_stats
#' @export
#'

compare_stats <- function(df,
                          group_var,
                          values,
                          m_functions = c("mean", "sd", "length")) {
  df <- as.data.frame(df)

  as.data.frame(
    df %>%
      dplyr::group_by_at(.vars = group_var) %>%
      dplyr::summarise_at(values, m_functions)
  )
}
