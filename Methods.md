**Methods**

In this section, I listed the methods I used in logistic regression for binary classification of survival. Using the methods listed below, I aimed to pinpoint which predictors were highly significant in the survival detection of heart failure.

***Logistic Regression***

Logistic regression, also called a logit model, is used to model dichotomous outcome variables. In the logit model the log odds of the outcome are modeled as a linear combination of the predictor variables. The model is written as:

![Logistic Regression](/Images/image5.png)

Fitting my full model on R looked very similar to fitting a simple linear regression. Instead of lm () we use glm (). The only other difference is the use of family = \"binomial\" which indicates that we have a two-class categorical response.

Here are the results of my full model:

![Full Model](/Images/image6.png)

Looking at the R output, Ejection Fraction, Serum Creatinine and Time are highly significant since their p values are low. It is also seen that Age and Serum Sodium can be considered significant in the full model.

***AIC***

The Akaike Information Criterion (AIC) is a mathematical method for evaluating how well a model fits the data it was generated from. In statistics, AIC is used to compare different possible models and determine which one is the best fit for the data. AIC is calculated from:

-   the number of independent variables used to build the model.

-   the maximum likelihood estimates of the model (how well the model reproduces the data).

The best-fit model according to AIC is the one that explains the greatest amount of variation using the fewest possible independent variables.

To compare models using AIC, you need to calculate the AIC of each model. If a model is more than 2 AIC units lower than another, then it is considered significantly better than that model. Later, we will see if we can make our model significantly better by comparing with other models.

The formula for AIC is written as:

![AIC](/Images/image7.png)

***Chi-Square Test***

Chi-square formula is used to compare two or more statistical data sets. The chi-square formula is used in data that consist of variables distributed across various categories and helps us to understand whether that distribution is different from what one would expect by chance. It's extremely useful to test goodness of fit in linear regression by investigating Analysis of Deviance Table. The formula is written as:

![Chi-Square](/Images/image8.png)

Running Chi-Square Test on the full model, R output gives the results below:

![Chi-Square Test](/Images/image9.png)

The difference between the null deviance and the residual deviance is a good indicator of how the full model is doing against the null model (a model with only the intercept). The wider the gap is, the better the fit is. Analyzing the table, we can see the drop in deviance when adding each variable one at a time.

***Association of Predicted Probabilities and Observed Responses***

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




