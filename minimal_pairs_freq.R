library(dplyr)

minimal_pairs2 <- readr::read_table2("minimal_pairs2.txt", 
    col_names = FALSE)

freq_table = minimal_pairs2 %>%
  mutate(X3 = tolower(X3),
         X4 = tolower(X4)) %>%
  group_by(X3, X4) %>%
  summarise(n = n()) %>%
  arrange(desc(n)) %>%
  ungroup() %>%
  mutate(pair = paste0(X3, X4)) %>%
  mutate(pair = unlist(lapply(strsplit(pair, ""),
                              function(ele)
                                paste(sort(ele), collapse = ", ")))) %>%
  select(pair, n) %>%
  distinct()
  #filter(n > 10)
readr::write_csv(freq_table, "minimal_pairs_freq.csv")
saveRDS(freq_table, "minimal_pairs_freq.rds")


# Find all minimal pairs
found = c("r", "o", "t", "z", "a", "e", "m", "s", "b", "d", "i", "n", "p", "l", "v", "k", "g", "f", "j", "h", "c", "y", "u")
minimal_pairs2 %>%
  mutate(X3 = tolower(X3),
       X4 = tolower(X4)) %>%
  filter(!X4 %in% found)

