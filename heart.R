library(dplyr)
library(MASS)
library(aod)
library(blorr)
library(ROCR)
library(olsrr)
library(caret)


heart = read.csv(file = "C:/Users/Kadir/Downloads/heart_failure_clinical_records_dataset.csv")
head(heart)
summary(heart)
sapply(heart, sd)

modified.heart = heart %>% mutate(Anaemia = as.factor(recode(Anaemia, "1" = ": True", "0" = ": False")),
                                  Diabetes = as.factor(recode(Diabetes, "1" = ": True", "0" = ": False")),
                                  High_Blood_Pressure = as.factor(recode(High_Blood_Pressure, "1" = ": True", "0" = ": False")),
                                  Sex = as.factor(recode(Sex, "1" = ": Man", "0" = ": Woman")),
                                  Smoking = as.factor(recode(Smoking, "1" = ": True", "0" = ": False")))

full.model = glm(Death_Event ~ Age + Anaemia + Creatinine_Phosphokinase + Diabetes + Ejection_Fraction + Serum_Creatinine + High_Blood_Pressure + Platelets +
             Serum_Sodium + Sex + Smoking + Time, data = modified.heart, family = "binomial"(link = "logit"))

summary(full.model)
anova(full.model, test = "Chisq")
coef(full.model)

full.model %>%
  blr_step_aic_both() %>%
  plot()

blr_regress(full.model)

backwards.model = step(full.model, direction = "backward")
summary(backwards.model)
anova(backwards.model, test = "Chisq")
coef(backwards.model)

blr_regress(backwards.model)

blr_model_fit_stats(full.model)
blr_model_fit_stats(backwards.model)

blr_confusion_matrix(full.model, cutoff = 0.5)


blr_confusion_matrix(backwards.model, cutoff = 0.5)

blr_plot_diag_influence(full.model)
blr_plot_diag_influence(backwards.model)

blr_plot_diag_leverage(full.model)
blr_plot_diag_leverage(backwards.model)

blr_plot_diag_fit(full.model)
blr_plot_diag_fit(backwards.model)

p.full = predict(full.model, newdata = subset(modified.heart,select=c(1,2,3,4,5,6,7,8,9,10,11,12)), type="response")
pr.full = prediction(p.full, modified.heart$Death_Event)
prf.full = performance(pr.full, measure = "tpr", x.measure = "fpr")
plot(prf.full)

auc.full = performance(pr.full, measure = "auc")
auc.full = auc.full@y.values[[1]]
auc.full

p.backwards = predict(backwards.model, newdata = subset(modified.heart,select=c(1,2,3,4,5,6,7,8,9,10,11,12)), type="response")
pr.backwards = prediction(p.backwards, modified.heart$Death_Event)
prf.backwards = performance(pr.backwards, measure = "tpr", x.measure = "fpr")
plot(prf.backwards)

auc.reduced = performance(pr.backwards, measure = "auc")
auc.reduced = auc.reduced@y.values[[1]]
auc.reduced

VarImp(full.model, scale = FALSE)


