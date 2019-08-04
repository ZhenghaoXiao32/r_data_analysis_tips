### Coerce multiple columns to factors

library(magrittr)
library(dplyr)

data <- data.frame(matrix(sample(1:40), 4, 10, 
                          dimnames = list(1:4, LETTERS[1:10])))
                          
factor_cols <- c("A", "C", "E", "G")

data %>% mutate_at(factor_cols, factor)
str(data)

