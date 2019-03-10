# Exercise 1 ####
# Consider a set of test grades that follows a normal distribution with mean = 78 and standard deviation = 36

# a) What is the probability of a student obtaining a grade higher than 72?
1 - pnorm(72, mean = 78, sd = 36) # 0.5661838
# Brain teaser: will the probability increase or decrease with a lower the sd? Try to guess and then try it out!


# b) If the criteria for passing the exam is to be above the lowest 25% of grades,
# which proportion of students have grades at least 5 points higher than the threshold for passing?
x <- qnorm(0.25, mean = 78, sd = 36) # this is the grade right above the lowest 25%
x # 53.71837
1-pnorm(x+5, mean = 78, sd = 36) # we add 5 points and calculate the probability of being above it
# 0.7038828

# c) If you know that the grade of a student is above 72, what's the probability of it being below 84?
#                   P(72<x<84)
# P(x<84 | x>72) = --- --- ---
#                   P(x>72)
(pnorm(q = 84, mean = 78, sd = 36)-pnorm(q = 72, mean = 78, sd = 36))/(1-pnorm(q = 72, mean = 78, sd = 36))
# 0.2337892

# d) Generate a sample of n=10000 grades with the distribution that we set on this exercise.
# Store the sample in a variable and plot a histogram of the distribution.
mySample <- rnorm(10000, mean = 78, sd = 36) #0.2337892
hist(mySample)


# Exercise 2 ####
# a) Being x a variable that counts the number of times that the number 3 appears when we roll a die 10 times,
# determine the value of a, so that P(x<=a) = 0.95. 
qbinom(p = 0.95, size = 10, prob = 1/6) # 4 (x will follow a binomial distribution with parameters 10 and 1/6)
# there's no possible number that accomplishes that, given that:
pbinom(q = 3, size = 10, prob = 1/6) # 0.9302722
pbinom(q = 4, size = 10, prob = 1/6) # 0.984538
pbinom(q = 0, size = 10, prob = 1/6) # 0.984538
#100 samples
a <- as.data.frame(replicate(100, sample(1:6, 10, replace = TRUE)))
# here we will try to simulate the exercise

# b) Being y the variable that counts the number of times that we have to roll a die until the first 3 appears, 
# detetmine P(y=5).
dgeom(x = 4, prob = 1/6) #0.08037551

# c) If z is a Poisson variable of parameter = 5, determine P(z>2).
1-ppois(2,5) #0.875348


