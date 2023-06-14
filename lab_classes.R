library(R6)

Person <- R6Class("Person",
                  public = list(
                    name = NULL,
                    hair = NULL,
                    initialize = function(name = NA, hair = NA) {
                      stopifnot(is.character(name), is.character(hair))
                      self$name <- name
                      self$hair <- hair
                      self$greet()
                    },
                    set_hair = function(val) {
                      self$hair <- val
                    },
                    greet = function() {
                      cat(paste0("Hello, my name is ", self$name, ".\n"))
                    }
                  )
)
jane <- Person$new(name = "Jane", hair = "brown")
jane$set_hair("blond")

ana <- carol$clone()
ana$set_hair("orange")


#####

obj <- lm(speed ~ dist, cars)
class(obj)


tib <- as_tibble(mtcars)
class(tib)
attributes(tib)
str(tib)
typeof(tib)
str(obj)
str(unclass(obj))

meta_frame <- R6Class("meta_frame", 
                      inherit = data.frame,
                      public= list(
                      descr = NULL, 
                      creation = NULL, 
                      initialize = function(descr = NA, creation = NA){
                        stopifnot(is.character(descr)) 
                        self$descr <- descr
                        self$creation <- creation
                      },
                      set_descr = function(descr){
                        self.descr <- descr
                      },
                      set_creation = function(creation){
                        self.creation = creation
                      }))
                      

test <- meta_frame$new(descr = "this is a very cool description")
