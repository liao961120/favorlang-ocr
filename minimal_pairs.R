library(stringr)
library(dplyr)

# Extract lexical entries
ocr = readLines("OCR_results.txt") %>%
  str_match(pattern = "(^[A-Z][a-z]+),") %>%
  .[,2] %>%
  na.omit() %>%
  sort() %>%
  unique()

# Extract minimal pairs from `ocr`
minimal_pairs = vector("list")
count = 1
for (i in seq_along(ocr)) {
  for (j in seq_along(ocr[i+1: length(ocr)])) {
    if (nchar(ocr[i]) == nchar(ocr[j])) {
      ndiff = 0
      diff_chars = c()
      w1 <- strsplit(ocr[i], "")[[1]]
      w2 <- strsplit(ocr[j], "")[[1]]
      for (char_idx in seq_along(w1)) {
        if (w1[char_idx] != w2[char_idx]) {
          ndiff = ndiff + 1
          diff_chars = append(diff_chars, c(w1[char_idx], w2[char_idx]))
        }
      }
      if (ndiff == 1) {
        minimal_pairs[[count]] = c(paste0(w1, collapse = ""), 
                                   paste0(w2, collapse = ""),
                                   diff_chars)
        count = count + 1
      }
    }
  }
}

# Save results to text file
output = lapply(minimal_pairs, function(ele) paste(ele, collapse = " "))
writeLines(unlist(output), "minimal_pairs.txt")
