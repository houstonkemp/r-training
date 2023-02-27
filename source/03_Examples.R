x <- data.frame( # make a data frame (table) with two columns called a and b
  a = 1:10, # 1 to 10
  b = c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j") # cobine values into one vector with 10 elements
)
x # print x to the console

#    from the tibble package, use the function tibble (to create a tibble)
y <- tibble::tibble(
  a = 1:10,
  b = c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j")
)
y # print y to the console

library(tidyverse)

z <- tibble( # don't need to use 
  a = 1:10,
  b = c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j")
)
z # print z to the console

# What is the output?
as.integer(c("a",1, 1.5, pi))
mean(1:10)
mean(c(1, 2, NA))
mean(x = c(1, 2, NA), na.rm = TRUE)
c(1, 1.5, pi) + 1

select(z, a)
select(.data = z, starts_with("a"))
mutate(z, c = paste(a, b))
lubridate::as_date("15022021", format = "%d%m%Y")
