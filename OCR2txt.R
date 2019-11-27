# Convert PDF to PNG
pages = 1:350
pdftools::pdf_convert("favorlang.pdf", pages = pages, dpi = 300,
                      filenames = paste0('png/', pages, '.png'))

# OCR from tesseract (takes substantial time to complete)
pngs = list.files("png", full.names = T)
out = tesseract::ocr(pngs)

# Save OCR results
writeLines(out, "OCR_results.txt")
