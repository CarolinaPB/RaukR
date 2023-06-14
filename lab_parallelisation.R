library(future)
plan(sequential)

system.time(a %<-% {
  sample(100,200000000,replace=T)
})


system.time(b %<-% {
  sample(100, 200000000/5, replace = T)
})

system.time(c %<-% {
  sample(100, 200000000/5, replace = T)
})

system.time(d %<-% {
  sample(100, 200000000/5, replace = T)
})

system.time(e %<-% {
  sample(100, 200000000/5, replace = T)
})

system.time(f %<-% {
  sample(100, 200000000/5, replace = T)
})

###

plan(mulicore)

system.time(b %<-% {
  b <- sample(100, 200000000/5, replace = T)
})

system.time(c %<-% {
  c<-sample(100, 200000000/5, replace = T)
})

system.time(d %<-% {
  d<-sample(100, 200000000/5, replace = T)
})

system.time(e %<-% {
  e<-sample(100, 200000000/5, replace = T)
})

###
plan(multisession)

system.time(b %<-% {
  b <- sample(100, 200000000/5, replace = T)
})

system.time(c %<-% {
  c<-sample(100, 200000000/5, replace = T)
})

system.time(d %<-% {
  d<-sample(100, 200000000/5, replace = T)
})

system.time(e %<-% {
  e<-sample(100, 200000000/5, replace = T)
})


####
plan(multisession)
size <- 20L
vec <- vector(length = size)
for (i in 1:size){
    tmp <- system.time(b %<-% {sample(100, "200000000"/size, replace = T)})
    vec[i] <- tmp[3]
}

sum(vec)

plan(multicore)
# size <- 10L
vec <- vector(length = size)
for (i in 1:size){
  tmp <- system.time(b %<-% {sample(100, "200000000"/size, replace = T)})
  vec[i] <- tmp[3]
}

sum(vec)
####




availableCores()




plan(multicore)

#Create a new environment
v <- new.env()
for (name in c("a", "b", "c")) {
  v[[name]] %<-% {
    sample(100,200000000/3,replace=T)
  }
}
#Turn the environment back into a list
v <- as.list(v)

#To turn the list of vectors into the same format, one long vector, that we had above when running "a + b + c"
vec <- Reduce(c,v)


plan(cluster, workers = c("n2", "n5", "n6", "n6", "n9"))
demo("mandelbrot", package = "future", ask = FALSE)


filename <- "/Users/carolinapb/Library/Group Containers/G69SCX94XU.duck/Library/Application Support/duck/Volumes/hpcpmcgencpitabarros/cfDNA_WES/results/oncoprint_allvars/results/tsv/PMRBM000BEM_PMLBM000BFC/0000.sub.tsv"
plan(multicore)
a <- system.time(file1  %<-% {fread(filename)})
b <- system.time(file2 %<-% {fread(filename)})
a+b


d <- system.time(file1<-fread(filename))
e <- system.time(file2 <- fread(filename))
d+e

file1  %<-% {fread(filename)}]





ex_list <- letters[3:6]
table <- data.table(letters[1:10], letters[6:15])
ex_list %in% table$V1



file1

futs <- lapply(1:10, function(i) future({ Sys.sleep(i); return(i)}))
completed <- sapply(futs, resolved) # see how many jobs are finished
mean(completed)

res <- lapply(futs, value) # grab the results

############


plan(multicore)

#Create a new environment
v <- new.env()
for (name in c("a", "b", "c")) {
  v[[name]] %<-% {
    #expression
  }
}
#Turn the environment back into a list
v <- as.list(v)

#To turn the list of vectors into the same format, one long vector, that we had above when running "a + b + c"
vec <- Reduce(c,v)

