``` r
setwd("C:\\Users\\Owner\\OneDrive\\Documents\\GW Lab\\PAN\\sequences")

files <- list.files(pattern = ".ab1$")           #only chromatagraphy files 
name_map <- read.csv("Sample_Barcodes.csv")

#naming file loop:
for (i in 1:nrow(name_map)) {
  
  barcode <- name_map$Barcode[i]
  new_name <- name_map$New_File_Name[i]
  
  barcode_match <- files[grepl(barcode, files)]
  
  #checks 
  #rename file only if there is one match and the new file doesn't exist already
  if (length(barcode_match) == 1 && !file.exists(new_name)) {
    file.rename( barcode_match, new_name)
  }}

```
