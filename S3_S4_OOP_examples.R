# Load necessary libraries
library(methods)  # Required for S4 objects

# Create an S3 class (list-based)
person_S3 <- function(name, age, GPA) {
  structure(list(name=name, age=age, GPA=GPA), class="person_S3")
}

# Define a print method for S3
print.person_S3 <- function(obj) {
  cat("S3 Object - Name:", obj$name, "
Age:", obj$age, "
GPA:", obj$GPA, "
")
}

# Create an instance of S3 object
s3_obj <- person_S3("Myself", 29, 3.5)
print(s3_obj)

# Create an S4 class
setClass("Student_S4",
         slots = list(name="character", age="numeric", GPA="numeric"))

# Create an instance of S4 object
s4_obj <- new("Student_S4", name="Myself", age=29, GPA=3.5)
print(s4_obj)

# Function to determine object system type
object_type <- function(obj) {
  if (isS4(obj)) {
    return("S4 Object")
  } else if (is.object(obj)) {
    return("S3 Object")
  } else {
    return("Base R Object")
  }
}

# Test the function
cat("S3 Object Type:", object_type(s3_obj), "\n")
cat("S4 Object Type:", object_type(s4_obj), "\n")

# Check base type of object
cat("Base Type of S3:", typeof(s3_obj), "\n")
cat("Base Type of S4:", typeof(s4_obj), "\n")
