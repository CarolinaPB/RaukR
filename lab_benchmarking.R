input <- sample(1:1000, size = 1000, replace = T)
currmin <- NULL
for (i in input) {
  if (i > currmin) {
    currmin <- i
    print(paste0("The new minimum is: ", currmin))
  }
}


input <- sample(1:1000, size = 1000, replace = T)
currmin <- 1
for (i in input) {
  if (i < currmin) {
    currmin <- i
    print(paste0("The new minimum is: ", currmin))
  }
}

for (cnt in 1:100) {
  if (cnt > 12) {
    print("12+")
  } else {
    print("Not 12+")
  }
}


result <- logical(10)
input <- sample(1:10, size = 10, replace = T)
for (i in 1:length(input)) {
  if (input[i] >= 5) {
    result[i] <- TRUE
  }
}

######

f <- function(x) { sin(x) }
options(error = quote(dump.frames(dumpto = "testdump", to.file = T)))
f('test')
options(error = NULL) # reset the behavior
load('testdump.rda')
# debugger(testdump)

testdump

f <- function(x) { 
  test <- "test"
  log10(x) 
}
g <- function(x) { 
  f(x) 
}
g('test')


h <- function(x, y) { 
  f(x) 
  f(y) 
}


debug(h)
h('agdas', 7)
undebug(h)



# One way is to use epsilon
# Check machine's floating point representation
vec <- seq(0.1, 0.9, by=0.1)

# Make a custom function that uses machines' epsilon for comparing
# values
is_equal <- function(x, y) {
  isEqual <- F
  if (abs(x - y) < unlist(.Machine)['double.eps']) {
    isEqual <- T
  }
  isEqual
}

# Some tests
0.7 == 0.6 + 0.1
is_equal(0.7, 0.6 + 0.1)
0.7 == 0.8 - 0.1
is_equal(0.7, 0.8 - 0.1)

# Now you can use the is_equal to fix the code!


N <- 10e3 * 10e3

# By row
t1 <- proc.time()
M <- matrix(sample(1:42, size = N, replace = T), nrow = sqrt(N), byrow = T)
t2 <- proc.time()
(t2 - t1)

# By column
t1 <- proc.time()
M <- matrix(sample(1:42, size = N, replace = T), nrow = sqrt(N), byrow = F)
t2 <- proc.time()
(t2 - t1)

system.time(rnorm(n = 10e6))

timing <- double(100)
for (i in 1:100) {
  st <- system.time(rnorm(n = 10e6))
  timing[i] <- st[3]
}
boxplot(timing) 
mean(timing)
var(timing)


st2 <- system.time(replicate(n = 100, rnorm(n = 10e6)))




timing <- double(100)
for (i in 1:100) {
  st <- system.time(rnorm(n = 10e6))
  timing[i] <- st[3]
}
boxplot(timing)

timing <- double(100)
for (i in 1:100) {
  start <- get_nanotime()
  rnorm(n = 10e6)
  end <- get_nanotime()
  timing[i] <- end - start
}
boxplot(timing)
mean(timing)
var(timing)

precision <- microtiming_precision()
mean(precision)
var(precision)

?microbenchmark

microb <- microbenchmark(rnorm(n = 10e6), times = 100L)

library(ggplot2)
autoplot(microb)
boxplot(microb)
summary(microb)


empty_func <- function(){}
add_fun <- function(x,y){
  x+y
}

empty_eval <- microbenchmark(empty_func, times = 100L)
addition_eval <- microbenchmark(add_fun(1,2), times = 100)
autoplot(empty_eval)
autoplot(addition_eval)


multiple_eval <- microbenchmark(add_fun(4,100), 10, empty_func())
autoplot(multiple_eval)

######

M <- matrix(nrow = 50, ncol = 50)

fill_alloc <- function(M, bag, seed = 42, ...) {
  set.seed(seed)
  for (i in 1:nrow(M)){
    for (p in 1:ncol(M)){
      M[i,p] <- sample(bag, size = 1, replace = T)
    }
  }
  return(M)
}

fill_alloc(M, c(1,2,6,8))

fill_noalloc <- function(bag, seed = 42, ...) {
  set.seed(seed)
  M <- NULL
}
