***Background***

Cardiovascular diseases are conditions that affect the structures or function of the heart. It is the leading cause of death in the U.S. About 659,000 people in the U.S. die from heart disease each year; that’s 1 in every 4 deaths. Most cardiovascular disease affects older adults. In the United States 11% of people between 20 and 40 have CVD, while 37% between 40 and 60, 71% of people between 60 and 80, and 85% of people over 80 have cardiovascular diseases. Heart failure is a condition that develops when heart doesn’t pump enough blood for body’s needs. This can happen if heart can’t fill up with enough blood or it is too weak to pump properly. The term Heart failure is a serious condition that needs medical care. Three main phenotypes describe heart failure according to the measurement of the left ventricle ejection fraction (EF), and the differentiation between these types is important due to different demographics, co-morbidities, and response to therapies:

-   Heart failure with reduced ejection fraction (HFrEF): EF less than or equal to 40%

-   Heart failure with preserved EF (HFpEF): EF is greater than or equal to 50%

-   Heart failure with mid-range EF (HFmrEF) (other names are: HFpEF-borderline and HFpEF-improved when EF in HFrEF improves to greater than 40%): EF is 41% to 49% per European guidelines and 40 to 49% per the US guidelines. A new class of HF that introduced by the 2016 European Society of Cardiology (ESC) guidelines for diagnosis and management of HF. This class was known as the grey area between the HFpEF and HFrEF and now has its distinct entity by giving it a name as HFmrEF.


All patients with HFrEF have concomitant diastolic dysfunction; in contrast, diastolic dysfunction may occur in the absence of systolic dysfunction.

Doctors usually classify patients\' heart failure according to the severity of their symptoms. The table below describes the most used classification system, the New York Heart Association (NYHA) Functional Classification. It places patients in one of four categories based on how much they are limited during physical activity.

![Classification](/Images/image3.png)

Given the importance of a vital organ like heart, predicting cardiovascular diseases has become a priority for doctors. Though there have been various predictions made before, most of them failed to provide high accuracy. However, electronic health records (EHRs) have been a crucial tool to provide a great source of information regarding hidden and not so obvious correlations between patients' data and risk factors to assess and better understand cardiovascular disease risks.

In this paper, I analyzed a dataset of medical records of patients having heart failure released by Ahmad and colleagues in July 2017. Ahmad and colleagues employed traditional biostatistics time-dependent models to predict mortality and identify the key features of 299 Pakistan patients having heart failure, from their medical records.

I used logistic regression to predict survival rate of patients with heart failure. Using the dataset, I implemented various methods such as backward stepwise regression and Area Under the Curve" (AUC) of "Receiver Characteristic Operator" (ROC) which will be discussed in *Methods* section of the paper. Finally, I discuss the results from the methodology and draw conclusions in *Results* section of the paper.



