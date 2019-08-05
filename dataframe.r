### Coerce multiple columns to factors

library(magrittr)
library(dplyr)

data <- data.frame(matrix(sample(1:40), 4, 10, 
                          dimnames = list(1:4, LETTERS[1:10])))
                          
factor_cols <- c("A", "C", "E", "G")

data %>% mutate_at(factor_cols, factor)
str(data)

### Calculate and show missing data percent per column

data %>% 
    summarize_all(list(missing_percent = ~sum(is.na(.)) / length(.))) %>%
    ### if the data frame is too wide, then use gather to transform
    gather(col, value) 

### Deal with NA

df <- data_frame(col1 = c(1, 2, 3, 0),
                 col2 = c(0, 2, 3, 4),
                 col3 = c(1, 0, 3, 0),
                 col4 = c('a', 'b', 'c', 'd'))

#change 0 in a given column to NA
df$col3 <- na_if(df$col3, 0)
#change a give number to NA for all observations in the data frame
df[df == 1] <- NA
#replace NAs in a column with mean of all observations in the column
df$col3[is.na(df$col4)] <- mean(df$col4, na.rm = TRUE)

### Get the column number given the column name
which(colnames(data) == "C")

