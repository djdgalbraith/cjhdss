<style>
.reveal h1 {
    font-size: 2em;
    color: #000000;
    text-align: left;
    padding-bottom: 10px;
    font-family: Verdana, sans-serif;
}

.reveal h2 {
    font-size: 1.5em;
    color: #000000;
    text-align: left;
    padding-bottom: 10px;
    font-family: Verdana, sans-serif;
}

.reveal p {
    font-size: 0.75em;
    color: #000000;
    text-align: left;
    padding-bottom: 10px;
    font-family: Verdana, sans-serif;
}

.reveal ol {
    padding-bottom: 20px;
}

.reveal ol li {
    font-size: 0.7em;
    margin-left: 0px;
    color: #000000;
    text-align: left;
    padding-bottom: 5px;
    font-family: Verdana, sans-serif;
}
</style>


========================================================
author: David Galbraith
date: 13 November 2016
transition: rotate

========================================================
# BodyCalc Pitch

The BodyCalc application was developed with several goals in mind:

1. Provide an online repository for Body Mass Calculations
2. Provide a dynamic interface that customized the user interface based on calculation selection
3. Displayed the results of the selected Body Mass calculation using the supplied input parameters

There are a number of calculations available to provide an estimate of a body mass index.  This index represents an attempt to quantify the amount of tissue mass in an individual and then categorize the individual as a member of a broad population based on this value.

Concerns have been identified as to the effectiveness of using the basic BMI and a number of alternative approaches have been identified.

A number of approaches have been implemented and are accessible to provide for direct comparisons:

1. Body Mass Index
2. Body Mass Index Prime
3. A Body Shaped Index
4. Surface-based Body Shape Index

========================================================
# BodyCalc Data

No external data is required to facilitate BodyCalc operation.

Once a calculation type is selected the interface is dynamically customized to capture relevant data which includes variously:

1. Height in meters
2. Weight in kilograms
3. Waist circumference in meters
4. Body Surface area
5. Vertical Trunk Circumference

========================================================
# BodyCalc Calculations


```r
calculators <-  c("Body Mass Index",
                  "Body Mass Index Prime",
                  "A Body Shape Index",
                  "Surface-based Body Shape Index"
          )
```

A total of 4 Body Mass Calculators have been implemented.  These are:

### 1. BMI
The ratio of a persons height to their mass squared.
$$
BMI = weight / height ^ 2
$$

### 2.  BMI Prime
BMI Prime is a modification of the BMI system and is the ratio of actual BMI to upper limit BMI (currently defined at BMI 25)

$$
\begin{aligned}
BMI' = (weight / height ^ 2) / 25
\end{aligned}
$$

### 3. ABSI
An index which defines body composition through waist circumference adjusted for weight and height.

$$
\begin{aligned}
absi &= wc / ( BMI^\frac{2}{3} * \sqrt height )\\
wc &= waist\ circumference\ in\ meters\\
BMI &= Body\ Mass\ Index\\
\end{aligned}
$$

### 4. SBSI
An index which defines body composition  through surface area adjusted for weight and height.

$$
\begin{aligned}
sbsi &= (height^\frac{7}{4} * wc^\frac{5}{6} / (bsa * vtc)\\
wc &= waist\ circumference\ in\ meters\\
bsa &= body\ surface\ area\\
vtc &= vertical\ trunk\ circumference\\
\end{aligned}
$$

========================================================
# Links
The app developed for the first part of the assignment is avalilable at:
https://djdgalbraith.shinyapps.io/BodyCalc/

Source code for ui.R and server.R files are available on GitHub:
https://github.com/djdgalbraith/cjhdss/tree/master/Developing%20Data%20Products/Project/

Source for the Rstudio Presenter pitch is available on GitHub:

The presentation can be viewed on RPub: http://rpubs.com/djdgalbraith/BodyCalc/

# References

1. [Wikipedia Body Mass Index](https://en.wikipedia.org/wiki/Body_mass_index)
2. [A New Body Shape Index Predicts Mortality Hazard Independently of Body Mass Index](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3399847/)
3. [Surface-Based Body Shape Index and Its Relationship with All-Cause Mortality](http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0144639)

