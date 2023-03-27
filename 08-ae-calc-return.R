library(googlesheets4)
d <- range_read("https://docs.google.com/spreadsheets/d/1a7ukBFlbB1hvT4WwFsf5JcILrcIOl6pg27zoRnpPJi0/edit?resourcekey#gid=596144367",
                col_names = c("time", "name", "alpha"),
                skip = 1)

calculate_return <- function(alpha) {
  risky <- rnorm(1, mean = 1.05, sd = 0.5)
  risk_free <- 1.01
  (1 - alpha) * risk_free + alpha * risky
}

set.seed(10)

d %>%
  mutate(return = calculate_return(alpha)) -> d

d %>%
  arrange(return)

d %>%
  arrange(-return)
