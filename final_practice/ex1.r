load("family.rda")

# After loading the dataset above, you will have the following
# objects:
#
# > ls()
# [1] "fage"    "fgender" "fheight" "fnames"  "fweight"

# Create a numeric vector <fbmi> giving indicating a person's BMI. BMI should be
# calculated as their weight divided by their squared heights multiplied by 703



# Create a logical vector <foverWt>. A person should be considered overweight
# if their BMI is greater than 25



# Create a dataframe <family>.  The dataframe should contain fnames, fgender,
# fage, fheight, fweight, fbmi, and foverWt.  The names should be as follows:
# > names(family)
# [1] "name" "gender" "age" "height" "weight" "bmi" "overWt"


# Create a subset of the family dataframe called <family.subset>. This should
# contain all observations who are neither overweight (i.e. bmi > 25) nor older
# than the average (mean) age of all observations.


# For each individual in the family dataframe, plot their age (x-axis) against
# their bmi (y-axis).  Males should be represented with 'red' circles and
# females with 'blue' circles.  Set pch to 'o'. The x-axis should range from 23
# to 80 and your y-axis from 16 to 31. Finally put a legend in the 'topright'
# corner of the plot with a 'red' circle in front the label 'male' and a 'blue'
# circle in front the label 'female'. 

