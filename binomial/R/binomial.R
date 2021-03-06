# 1.1) Private checker functions

## check_prob
check_prob <- function(prob) {
  if (prob < 0 || prob > 1) {
    stop("prob must be between 0 and 1")
  }
  return (TRUE)
}

## check_trials
check_trials <- function(trials) {
  if (trials < 0 || trials != round(trials)) {
    stop("invalid trial values")
  }
  return (TRUE)
}

## check_success
check_success <- function(success, trials) {
  for (i in success) {
    if (i > trials || i < 0) {
      stop("invalid success value")
    }
  }
  return (TRUE)
}

# 1.2) Private Auxiliary functions

## aux_mean
aux_mean <- function(trials, prob) {
  mean <- trials * prob
  return(mean)
}

## aux_variance
aux_variance <- function(trials, prob) {
  variance <- trials * prob * (1 - prob)
  return(variance)
}

## aux_mode
aux_mode <- function(trials, prob) {
  mode <- floor(trials * prob + prob)
  return(mode)
}

## aux_skewness
aux_skewness <- function(trials, prob) {
  skewness <- (1 - 2 * prob) / sqrt(trials*prob*(1-prob))
  return(skewness)
}

## aux_kurtosis
aux_kurtosis <- function(trials, prob) {
  kurtosis <- (1 - 6 * prob * (1 - prob)) / (trials * prob * (1 - prob))
  return(kurtosis)
}

# 1.3) Function bin_choose()

#' @title  bin_choose()
#' @description calculates the number of combinations in which k successes can occur in n trials
#' @param n the number of trials
#' @param k the number of successes
#' @return the number of combinations
#' @export

bin_choose <- function(n,k) {
  if (k > n) {
    stop("k cannot be greater than n")
  }
  choose <- factorial(n) / (factorial(k) * factorial(n - k))
  return(choose)
}

# 1.4) Function bin_probability()

#' @title  bin_probability()
#' @description calculates the binomial probability
#' @param success the number of successes
#' @param trials the number of trials
#' @param prob the probability of success
#' @return the binomial probability
#' @export

bin_probability <- function(success, trials, prob) {
  if (check_trials(trials) == FALSE) {
    stop("invalid trials value")
  }
  else if (check_prob(prob) == FALSE) {
    stop("invalid probability value")
  }
  else if (check_success(success, trials) == FALSE) {
    stop("invalid success value")
  }
  else {
    probability <- bin_choose(trials, success) * (prob^success) * (1 - prob)^(trials - success)
    return(probability)
  }
}

# 1.5) Function bin_distribution()

#' @title  bin_distribution()
#' @description displays the binomial distribution as data frame
#' @param trials the number of trials
#' @param prob the probability of one success
#' @return the binomial distribution
#' @export

bin_distribution <- function(trials, prob) {
  vals <- c()
  success <- (0:trials)
  for (i in success) {
    distrib <- bin_probability(i, trials, prob)
  vals <- c(vals, distrib)
  }

  df <- data.frame(success, "probability" = vals)
  class(df) <- c("bindis", "data.frame")
  return (df)
}

## plot.bindis

#' @export
plot.bindis <- function(x) {
  barplot(x$probability, ylim = c(0.00, 0.30), names.arg = x$success, xlab = "successes", ylab = "probability")
}

# 1.6) Function bin_cumulative()

#' @title  bin_cumulative()
#' @description displays the binomial distribution and the cumulative probabilities as data frame
#' @param trials the number of trials
#' @param prob the probability of one success
#' @return a data frame with the binomial distribution and cumulative probabilities
#' @export

bin_cumulative <- function(trials, prob) {
  vals <- c()
  success <- (0:trials)
  for (i in success) {
    distrib <- bin_probability(i, trials, prob)
    vals <- c(vals, distrib)
  }

  cum <- c()
  prob <- 0
  for (i in 1:length(vals)) {
    prob <- prob + vals[i]
    cum <- append(cum, prob)
  }


  df <- data.frame(success, "probability" = vals, "cumulative" = cum)
  class(df) <- c("bincum", "data.frame")
  return (df)
}

## plot.bincum

#' @export
plot.bincum <- function(x) {
  plot(x$success, x$cumulative, ylim = c(0.0, 1.0), xlab = "successes", ylab = "probability")
  lines(x$success, x$cumulative, type = "o")
}

# 1.7) Function bin_variable()

#' @title  bin_variable()
#' @description returns a binomial random variable object
#' @param trials the number of trials
#' @param prob the probability of one success
#' @return returns a binomial random variable object
#' @export

bin_variable <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  ls <- list(trials, prob)
  names(ls) <- c("trials", "prob")
  class(ls) <- "binvar"
  ls
}

## Method print.binvar()
#' @export
print.binvar <- function(x) {
  cat('"Binomial variable"', "\n", "\n")
  cat("Parameters", "\n")
  cat("- number of trials:", x$trials, "\n")
  cat("- prob of success:", x$prob, "\n")
  invisible(x)
}

## Method summary.binvar()
#' @export
summary.binvar <- function(x) {

  mean <- aux_mean(x$trials, x$prob)
  variance <- aux_variance(x$trials, x$prob)
  mode <- aux_mode(x$trials, x$prob)
  skewness <- aux_skewness(x$trials, x$prob)
  kurtosis <- aux_kurtosis(x$trials, x$prob)
  ls1 <- list(x$trials, x$prob, mean, variance, mode, skewness, kurtosis)
  names(ls1) <- c("trials", "prob", "mean", "variance", "mode", "skewness", "kurtosis")
  class(ls1) <- "summary.binvar"
  ls1
}

## Method print.summary.binvar()
#' @export
print.summary.binvar <- function(x) {
  cat('"Summary Binomial"', "\n", "\n")
  cat("Parameters", "\n")
  cat("- number of trials:", summary.binvar(x)$trials, "\n")
  cat("- prob of success:", summary.binvar(x)$prob, "\n", "\n")
  cat("Measures", "\n")
  cat("- mean    :", summary.binvar(x)$mean, "\n")
  cat("- variance:", summary.binvar(x)$variance, "\n")
  cat("- mode    :", summary.binvar(x)$mode, "\n")
  cat("- skewness:", summary.binvar(x)$skewness, "\n")
  cat("- kurtosis:", summary.binvar(x)$kurtosis, "\n")
  invisible(x)
}

# 1.8) Function of measures

## bin_mean
bin_mean <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  bmin <- aux_mean(trials, prob)
  return(bmin)
}

## bin_variance
bin_variance <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  bvar<- aux_variance(trials, prob)
  return(bvar)
}

## bin_mode
bin_mode <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  bmode<- aux_mode(trials, prob)
  return(bmode)
}

## bin_skewness
bin_skewness <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  bskew<- aux_skewness(trials, prob)
  return(bskew)
}

## bin_kurtosis
bin_kurtosis <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  bkur<- aux_kurtosis(trials, prob)
  return(bkur)
}

