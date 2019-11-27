# Extract lexical entries in Favorlang dictionary

## Reproduce

Run the commands below in order:

```sh
Rscript OCR2txt.R
Rscript minimal_pairs.R
```

`OCR2txt.R` convert the Favorlang dictionary (`favorlang.pdf`) to a plain text file (`OCR_results.txt`). `minimal_pairs.R` finds out the minimal pairs in Favorlang using the lexical entries in the dictionary.

Note that this is all done programmatically, hence a lot of errors may occur during the process. Human correction must be made to ensure the accuracy of the results.
