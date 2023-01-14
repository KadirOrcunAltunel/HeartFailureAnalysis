# Methods

In this section, I listed the methods I used in logistic regression for binary classification of survival. Using the methods listed below, I aimed to pinpoint which predictors were highly significant in the survival detection of heart failure.

# Logistic Regression

Logistic regression, also called a logit model, is used to model dichotomous outcome variables. In the logit model the log odds of the outcome are modeled as a linear combination of the predictor variables. The model is written as:

![Logistic Regression](/Images/image5.png)

Fitting my full model on R looked very similar to fitting a simple linear regression. Instead of lm () we use glm (). The only other difference is the use of family = \"binomial\" which indicates that we have a two-class categorical response.

Here are the results of my full model:

![Full Model](/Images/image6.png)

Looking at the R output, Ejection Fraction, Serum Creatinine and Time are highly significant since their p values are low. It is also seen that Age and Serum Sodium can be considered significant in the full model.

# AIC

The Akaike Information Criterion (AIC) is a mathematical method for evaluating how well a model fits the data it was generated from. In statistics, AIC is used to compare different possible models and determine which one is the best fit for the data. AIC is calculated from:

-   the number of independent variables used to build the model.

-   the maximum likelihood estimates of the model (how well the model reproduces the data).

The best-fit model according to AIC is the one that explains the greatest amount of variation using the fewest possible independent variables.

To compare models using AIC, you need to calculate the AIC of each model. If a model is more than 2 AIC units lower than another, then it is considered significantly better than that model. Later, we will see if we can make our model significantly better by comparing with other models.

The formula for AIC is written as:

![AIC](/Images/image7.png)

# Chi-Square Test

Chi-square formula is used to compare two or more statistical data sets. The chi-square formula is used in data that consist of variables distributed across various categories and helps us to understand whether that distribution is different from what one would expect by chance. It's extremely useful to test goodness of fit in linear regression by investigating Analysis of Deviance Table. The formula is written as:

![Chi-Square](/Images/image8.png)

Running Chi-Square Test on the full model, R output gives the results below:

![Chi-Square Test](/Images/image9.png)

The difference between the null deviance and the residual deviance is a good indicator of how the full model is doing against the null model (a model with only the intercept). The wider the gap is, the better the fit is. Analyzing the table, we can see the drop in deviance when adding each variable one at a time.

# Association of Predicted Probabilities and Observed Responses

This association is an important procedure assessing the predictive ability of a model. They are based on the number of pairs of observations with different response values, the number of concordant pairs, and the number of discordant pairs. A pair of observations with different observed responses is said to be concordant if the observation with the lower ordered response value has a lower predicted mean score than the observation with the higher ordered response value. If the observation with the lower ordered response value has a higher predicted mean score than the observation with the higher ordered response value, then the pair is discordant. If the pair is neither concordant nor discordant, it is a tie.

-   **Somer's D**

Somers' D which is short for Somers' Delta, is a measure of the strength and direction of the association between an ordinal dependent variable and an ordinal independent variable. Somer's D can be a good indicator of fitness of model in logistic regression.

An ordinal variable is one in which the values have a natural order (e.g., "bad", "neutral", "good"). The value for Somers' D ranges between -1 and 1 where:

-1: Indicates that all pairs of the variables disagree

 1: Indicates that all pairs of the variables agree

The formula is written as:

![Somer's D](/Images/image10.png)

-   **Goodman-Kruskal Gamma**

Goodman-Kruskal gamma (γ) shows how many more concordant than discordant pairs exist divided by the total number of pairs excluding ties. The use the Goodman-Kruskal gamma to measure the association between the ordinal variables is another important indicator of the fitness of model in logistic regression.

Perfect association exists when \|γ\| = 1. In ordinal and binary logistic regression, if X and Y are independent, then γ = 0.

The formula is written as:

![Kruskal Gamma](/Images/image26.png)

-   **Kendall's Tau**

Another indicator of the fitness of the model in logistic regression Kendall's Tau, which measures the relationship between two columns of ranked data. Again, the value of a correlation coefficient can range from -1 to 1, with -1 indicating a perfect negative relationship, 0 indicating no relationship, and 1 indicating a perfect positive relationship.

![Kendall's Tau](/Images/image27.png)

Looking at the R output of our full model:


![Full Model](/Images/image11.png)

We see that Somer's D, Gamma and Concordance correlation coefficients are relatively high which means our model is highly significant.

# Confusion Matrix and Statistics

One common way to evaluate the quality of a logistic regression model is to create a confusion matrix, which is a 2×2 table that shows the predicted values from the model vs. the actual values from the test dataset.

Confusion matrix can indicate important information regarding the fit of the model.

**Sensitivity:** The "true positive rate" -- the percentage of individuals the model correctly predicted would default.

**Specificity:** The "true negative rate" -- the percentage of individuals the model correctly predicted would not default.

Looking at our R output:

![Confusion Matrix](/Images/image12.png)

We see that the accuracy of our model is very high at 85%, misclassification error rate is at 15% and specificity of our model is at 92%. These results indicate that our model is a good fit.

# ROC And AUC

AUC - ROC curve is a performance measurement for the classification problems at various threshold settings. ROC is a probability curve and AUC represents the degree or measure of separability. It tells how much the model can distinguish between classes. Higher the AUC, the better the model is at predicting 0 classes as 0 and 1 classes as 1. By analogy, the Higher the AUC, the better the model is.

Here is our ROC:

![ROC](/Images/image13.png)

And our AUC is:

![AUC](/Images/image14.png)

This result shows that our model is good standing at almost 0.9.

Now that we know more about our full model, we will go ahead and look for a better model with lower AIC and compare the results we get from the optimal model to the full model.

We will use stepwise regression approach which at each step gradually eliminates variables from the regression model to find a reduced model that best explains the data.

Here's our R Output that shows us the reduced model that best explains the data:

![Reduced Model](/Images/image15.png)

Our stepwise regression approach shows us that using variables Time, Ejection Fraction, Serum Creatinine, Age and Serum Sodium significantly improves our model with AIC at 235.49.

![Stepwise Regression](/Images/image16.png)

We go ahead and look at the summary of our reduced model on R:

![Reduced Model Summary](/Images/image17.png)

We see that our model is highly significant with all the predictors in the model suggest that the reduced model is also a good fit improved AIC.

![Deviance Table](/Images/image18.png)

Again, the difference between the null deviance and the residual deviance is a good indicator of how the full model is doing against the null model (a model with only the intercept). The wider the gap is, the better the fit is. Analyzing the table, we can see the drop in deviance when adding each variable one at a time.

![Predicted Probabilities](/Images/image19.png)

Somers' D, Gamma, Tau-a and c correlation coefficients are highly significant in this model as well.

![Confusion Matrix](/Images/image20.png)

Our confusion matrix and statistics also show a high accuracy rate at 0.84 with specificity rate at 0.91

Here's our ROC:

![ROC](/Images/image21.png)

And our AUC is:

![AUC](/Images/image22.png)

This result also shows that our model is a good fit at 0.89













