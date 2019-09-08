library(tibble)
library(ggplot2)
set.seed(101)
time <- as.Date(0:365, origin = "2019-01-01")

stu <- tibble(
  y = runif(n = 366, min = 0, max = 0.05), x = time, name = "Stu"
  )
stu$y[grepl("07-30$", stu$x)] = 1/3
rob <- tibble(
  y = 0.05, x = time, name = "Rob"
  )
rob$y[grepl("01-01$", rob$x)] = 1/3
dan <- tibble(
  y = runif(n = 366, min = 0.15, max = 0.25), x = time, name = "Dan"
  )
dan$y[grepl("05-01$", dan$x)] = 0.5
chris <- tibble(
  y = c(seq(0.4, 0.1, length.out = 366/2), seq(0.1, 0.4, length.out= 366/2)),
  x = time, name = "Chris"
  )
chris$y[grepl("07-19$", chris$x)] = 0.7
beev <- tibble(
  y = 0, x = time, name = "Beev"
  )
greg <- tibble(
  y = c(rep(0.1, 150), rep(0.25, 66), rep(0.1, 150)),
  x = time, name = "Greg"
  )

dplyr::bind_rows(stu, rob, dan, chris, beev, greg) %>%
  ggplot(aes(x = x, y = y, colour = name)) +
    geom_line(size = 0.75) +
    lims(y = 0:1) +
    labs(y = "Probability", x = "", title = "Daily BJ Probabilities (estimated)") +
    scale_color_manual(values = c("blue", "red",
                                  "green", "purple",
                                  "#009999", "cyan"))


