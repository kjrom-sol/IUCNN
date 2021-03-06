#'Format IUCN Red List categories for IUCNN
#'
#'Converting IUCN category labels into numeric categories required by \code{\link{train_iucnn}}.
#'
#'
#'@param x a data.frame or a list. If a data.frame, two columns with the species names and IUCN categories
#'respectively. The column names are defined by the species and labels arguments. If a list, expecting
#'the format as returned by \link[rredlist]{rl_search}.
#'@param species a character string. The name of the column with the species names.
#'@param labels a character string. The name of the column with the labels (assessment categories).
#'@param accepted_labels a character string. The labels to be converted in to numeric values.
#'Entries with labels not mentioned (e.g. "DD") will be removed. The numeric labels returned by the
#'function will correspond to the order in this argument.
#' For instance with default settings, "CR ->0, LC -> 4.
#'@param level a character string. The level of output level detail. IF "detail"
#'full iucn categories, if "broad" then 0 = Threatened, and 1 = Not threatened.
#'@param threatened a character string. Only if level=="broad", Which labels to consider threatened.
#'
#'@note See \code{vignette("Approximate_IUCN_Red_List_assessments_with_IUCNN")} for a
#'tutorial on how to run IUCNN.
#'
#'@return a data.frame with species names and numeric labels
#'
#' @examples
#'data("training_labels")
#'prepare_labels(training_labels)
#'
#' @export
#' @importFrom magrittr %>%
#' @importFrom dplyr bind_rows distinct filter left_join mutate select


prepare_labels <- function(x,
                         species = "species",
                         labels = "labels",
                         accepted_labels = c("CR", "EN", "VU", "NT", "LC"),
                         level = "detail",
                         threatened = c("CR", "EN", "VU")){

  if(is.list(x) & !is.data.frame(x)){
    warning("x is list. Assuming input from rredlist")

    dat <- bind_rows(x[names(x) == "result"])%>%
      dplyr::select(species = .data$scientific_name, labels = .data$category)
  }else{
    dat <- x %>% select(.data[[species]], .data[[labels]])
  }

  # remove DD and NE
  out <-  dat %>%
    filter(.data[[labels]] %in% accepted_labels)

  rem <- dat %>%
    filter(!.data[[labels]] %in% accepted_labels)

  if(nrow(rem) > 0){
    mis <- rem %>%
      select(.data[[labels]]) %>%
      distinct() %>%
      unlist()

    warning("Removed species with the follwoing labels: ", paste(mis, "\n"))
  }

  # if broad convert to broad categories
  if(level == "broad"){
    out <- out %>%
      mutate(lab.num.z = ifelse(.data[[labels]] %in% threatened, 0, 1))
  }else{
    lookup <- data.frame(IUCN = accepted_labels,
                         lab.num.z = seq(0, (length(accepted_labels)-1)))

    names(lookup) <- c(labels, "lab.num.z")

    out <- out %>%
      left_join(lookup, by = labels)
    }

  out <- out %>%
    dplyr::select(species = .data[[species]], labels = .data$lab.num.z)

  # return output
  return(out)
}
