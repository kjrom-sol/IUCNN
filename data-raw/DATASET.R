library(usethis)
library(tidyverse)

load("data-raw/train_example.rda")

orchid_occ <- ass_occ %>%
  select(species = canonical_name, decimallongitude, decimallatitude)

orchid_classes <- ass_occ %>%
  select(species = canonical_name, category_broad, category_detail)


## code to prepare `DATASET` dataset goes here

usethis::use_data(orchid_classes, overwrite = TRUE)

labels_detail <- read.delim("data-raw/1_main_iucn_full_clean_detailed_labels_fullds.txt", col.names = "labels")
species_id <- read.delim("data-raw/1_main_iucn_full_clean_detailed_speciesid_fullds.txt", col.names = "species")
labels_detail <- bind_cols(species_id, labels_detail)

labels_detail$labels = labels_detail$labels - 1
usethis::use_data(labels_detail, overwrite = TRUE)

labels_broad <- read.delim("data-raw/2_main_iucn_full_clean_broad_labels_fullds.txt", col.names = "labels")
species_id <- read.delim("data-raw/2_main_iucn_full_clean_broad_speciesid_fullds.txt", col.names = "species")
labels_broad <- bind_cols(species_id, labels_broad)

labels_broad$labels = labels_broad$labels - 1
usethis::use_data(labels_broad, overwrite = TRUE)

usethis::use_data(orchid_labels, overwrite = TRUE)


load(file = "C:/Users/az64mycy/Dropbox (iDiv)/research_projects/37_orchid_redlisting/orchid_assessment/output/orchids_filtered_occurrences.rda")

orchid_target <- orch_filt %>%
  filter(!canonical_name %in% orchid_occ$species)

sel <- unique(orchid_target$canonical_name)
sel <- sel[sample(1:length(sel), size = 100)]

orchid_target <- orchid_target %>%
  filter(canonical_name %in% sel) %>%
  select(species = canonical_name, decimallongitude, decimallatitude)

usethis::use_data(orchid_target, overwrite = TRUE)


data(orchid_occ)
training_occ <- orchid_occ
usethis::use_data(training_occ, overwrite = TRUE)

data(training_labels)
training_labels <- training_labels %>%
  select(species, labels = category_detail)
usethis::use_data(training_labels, overwrite = TRUE)

data(orchid_target)
prediction_occ <- orchid_target
usethis::use_data(prediction_occ, overwrite = TRUE)
