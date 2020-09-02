# dynamic-coma-progression-prediction
This project aims at predicting the outcome of coma patients.

1) predict whether the patient will awake within 90 days.
2) predict whether the patient will dead within 90 days.
3) predict whether the patient will awake within 14/7 days using his or her physiology data of continous three/(two/one) days.
4) predict whether the patient will dead within 14/7 days using his or her physiology data of continous three/(two/one) days.


We applied missforest to fill missing values.
Additionally, we applied SMOTE(over sampling), under sampling, cost sensitive to tackle imbalanced dataset.
Finally, we applied random forest to predict the outcome of coma patients.
