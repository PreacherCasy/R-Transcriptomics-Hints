##### Splitting pesky MapMan complex annotations

MapMan_split <- function(string) {
  strsplit(string, ',(?!\\s)', perl = T)
}

### Note that column names in annotation df may differ
produce_MapMan_mapping <- function(annotation) {
MapMan_df <- data.frame('transcript_id' = sapply(c(1:nrow(annotation)), function(x) rep(as.character(annotation$transcript_id[x]), lengths(regmatches(as.character(annot_full$MapMan_terms[x]),
                        gregexpr(",(?!\\s)", as.character(annotation$MapMan_terms[x]), perl = T))) + 1)) %>% unlist(),
                        'MapMan_Category' = sapply(annotation$MapMan_terms %>% as.character(), function(x) MapMan_split(x) %>% unlist()) %>% unlist())
}
