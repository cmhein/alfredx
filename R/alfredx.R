#' @importFrom magrittr "%>%"
NULL

#' Retrieve data from FRED
#' @param series_id FRED series id
#' @param start_date A date object
#' @param end_date A date object
#' @param api_key FRED API key
#' @return A tibble
#' @export
alfredx <- function(series_id, start_date = NULL, end_date = NULL,
                    api_key = NULL) {
  # The alfred package does not support yet setting the API key, but we retain
  # the parameter in the alfredx function signature for consistency with the
  # deprecated fredx package.
  alfred::alfred(
    series_id = series_id,
    series_name = "value",
    observation_start = start_date,
    observation_end = end_date
  ) %>%
    dplyr::select(date, value)
}
