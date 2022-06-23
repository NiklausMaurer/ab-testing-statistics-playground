# Does sample B have a greater conversion rate than sample A?
# Example data based on https://abtestguide.com/calc/

n_a <- 80000 # size of sample A
c_a <- 1600  # conversions within sample A
n_b <- 80000 # size of sample B
c_b <- 1696  # conversions within sample B

contingencytab <- matrix(c(n_a - c_a, n_b - c_b, c_a, c_b), ncol = 2, nrow = 2)
print(contingencytab)

print(fisher.test(contingencytab, alternative = "greater"))
