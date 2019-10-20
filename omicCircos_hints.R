library(dplyr)
library(magrittR)
library(OmicCircos)

### group-wise circular expression plots
## Preprocessing

chromosome_grouper <- function(df) {
  df$start <- rep(0, nrow(df))
  df$end <- rep(0, nrow(df))
  local_pivot <- table(unlist(df$TF_class)) %>% as.data.frame() %>% arrange(desc(Freq)) %>% mutate(Var1 = as.character(Var1), Freq = as.numeric(Freq))
  for (i in c(1:nrow(local_pivot))) {
    start_counter <- 0
    end_counter <- 1
    for (j in c(1:nrow(df))) {
      if (local_pivot[i,1] == df[j, 'TF_class']) {
        df[j, 'start'] <- df[j, 'start'] + start_counter
        df[j, 'end'] <- df[j, 'end'] + end_counter
        start_counter <- start_counter + 1
        end_counter <- end_counter + 1
      }
    }
  }
  return(df)
}


