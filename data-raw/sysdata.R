library(magrittr)
google_base_url <- "https://storage.googleapis.com/bert_models/"
scibert_base_url <- "https://s3-us-west-2.amazonaws.com/ai2-s2-research/scibert/tensorflow_models/"
albert_base_url <- "https://storage.googleapis.com/albert_models/"
tfhub_base_url  <- "https://storage.googleapis.com/tfhub-modules/google/"
hugginface_base_url <- "https://s3.amazonaws.com/models.huggingface.co/bert/"
spacy_base_url <- "https://github.com/explosion/spacy-models/releases/download/"

checkpoint_url_map <- c(
  "bert_base_uncased" = paste0(
    google_base_url,
    "2018_10_18/uncased_L-12_H-768_A-12.zip"
  ),
  "bert_base_cased" = paste0(
    google_base_url,
    "2018_10_18/cased_L-12_H-768_A-12.zip"
  ),
  "bert_large_uncased" = paste0(
    google_base_url,
    "2018_10_18/uncased_L-24_H-1024_A-16.zip"
  ),
  "bert_large_cased" = paste0(
    google_base_url,
    "2018_10_18/cased_L-24_H-1024_A-16.zip"
  ),
  "bert_large_uncased_wwm" = paste0(
    google_base_url,
    "2019_05_30/wwm_uncased_L-24_H-1024_A-16.zip"
  ),
  "bert_large_cased_wwm" = paste0(
    google_base_url,
    "2019_05_30/wwm_cased_L-24_H-1024_A-16.zip"
  ),
  "bert_base_multilingual_cased" = paste0(
    google_base_url,
    "2018_11_23/multi_cased_L-12_H-768_A-12.zip"
  ),
  "bert_base_chinese" = paste0(
    google_base_url,
    "2018_11_03/chinese_L-12_H-768_A-12.zip"
  ),
  "scibert_scivocab_uncased" = paste0(
    scibert_base_url,
    "scibert_scivocab_uncased.tar.gz"
  ),
  "scibert_scivocab_cased" = paste0(
    scibert_base_url,
    "scibert_scivocab_cased.tar.gz"
  ),
  "scibert_basevocab_uncased" = paste0(
    scibert_base_url,
    "scibert_basevocab_uncased.tar.gz"
  ),
  "distilbert-base-uncased" = paste0(
    spacy_base_url,
    "en_trf_distilbertbaseuncased_lg-2.2.0/en_trf_distilbertbaseuncased_lg-2.2.0.tar.gz"
  ),
  "distilbert-base-uncased-distilled-squad" = paste0(
    hugginface_base_url,
    "distilbert-base-uncased-distilled-squad.tar.gz"
  ),
  "distilbert-base-german-cased" = paste0(
    hugginface_base_url,
    "distilbert-base-german-cased.tar.gz"
  ),
  "distilbert-base-multilingual-cased" = paste0(
    hugginface_base_url,
    "distilbert-base-multilingual-cased.tar.gz"
  ),
  "distilbert-base-uncased-finetuned-sst-2-english" = paste0(
    hugginface_base_url,
    "distilbert-base-uncased-finetuned-sst-2-english.tar.gz"
  ),
  "albert_v2_base" = paste0(
    albert_base_url,
    "albert_base_v2.tar.gz"
  ),
  "albert_v2_large" = paste0(
    albert_base_url,
    "albert_large_v2.tar.gz"
  ),
  "albert_v3_base" = paste0(
    tfhub_base_url,
    "albert_base/3.tar.gz"
  ),
  "albert_v3_large" = paste0(
    tfhub_base_url,
    "albert_large/3.tar.gz"
  )
)

# I want to convert this to a tibble with more info, but I don't want to
# reformat all that, so I'm using enframe.
checkpoint_url_map <- tibble::enframe(
  checkpoint_url_map,
  name = "model", value = "url"
) %>%
  dplyr::mutate(
    archive_type = c(
      rep("zip", 8),
      rep("tar-gzip", 12)
    )
  )

usethis::use_data(
  checkpoint_url_map,
  internal = TRUE,
  overwrite = TRUE
)
rm(
  google_base_url,
  scibert_base_url,
  albert_base_url,
  tfhub_base_url,
  hugginface_base_url
)
