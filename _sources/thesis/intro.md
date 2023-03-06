# Introduction


The world is constantly changing, and so does the data. Detecting the impact of data changes on already deployed machine learning models is not always an easy task. The traditional machine learning hypothesis relies on train and test data being identical and independently distributed (iid), an assumption that does not hold in many real-world deployments. The iid machine learning assumption allows us to evaluate models on unseen data that are iid, but the performance of the models on non iid data remains unknown. There are situations where the model performance on non iid data has an accessible label, and performance metrics can be easily calculated. There are cases when there is no labeled data, or it is not easy to obtain it.


In the last few years, fairness has become a serious concern within the machine learning community. There is growing social awareness that \enquote{even models developed with the best of intentions may exhibit discriminatory biases, perpetuate inequality, or perform less well for historically disadvantaged groups {cite}`barocas-hardt-narayanan`.

Intending to mitigate these concerns, practitioners and researchers have proposed various metrics aiming to quantify differences from several statistical parities that we might expect to observe in a fair world and proposed algorithms in attempts to improve them ~{cite}`wachter2020bias,zafar2017parity`,DBLP:conf/www/ZafarVGG17}. The notion of group fairness aims to establish some form of parity between groups of individuals based on protected or sensitive attributes like gender or race. Various forms of parity between groups have been proposed in the literature ~{cite}`wachter2020bias`: statistical parity {cite}`DBLP:conf/kdd/Corbett-DaviesP17`, equal opportunity ~{cite}`DBLP:conf/nips/HardtPNS16`, or equal misclassification rates ~{cite}`DBLP:conf/www/ZafarVGG17`. The research community has made an enormous effort to design algorithmic methods to improve for fairness and discrimination metrics. Various publications reconcile the information of relevant papers, create taxonomies, define future opportunities and current gaps~{cite}`barocas-hardt-narayanan,DBLP:journals/widm/NtoutsiFGINVRTP20,DBLP:journals/corr/Aequitas`. All this body of methodological work on group fairness accountability heavily relies on the assumption that it is possible to evaluate the model predictions. 

% Unsupervised model monitoring

Commonly, the only data available to a practitioner is labeled source data, and unlabeled deployment data ~{cite}`garg2022leveraging`. Detecting changes in the distribution in the absence of labeled data is a challenging question both in theory and practice ~{cite}`DBLP:conf/aaai/RamdasRPSW15,DBLP:conf/nips/RabanserGL19`. Traditionally some of the simplest and most scalable approaches are based on statistical distances between source and test distributions, such as the Population Stability Index (PSI) or the Kolmogorov-Smirnov statistic~{cite}`continual_learning,clouderaff`. These statistical tests correctly detect univariate changes in the distribution can be independent of the model performance. They can therefore be too sensitive, indicating a change in the covariates but without any degradation in the model performance, or on the other hand, inaccurate, failing to detect changes that impact the model predictive performance. Another strategy is to build an indicator that behaves similar to the model performance ~{cite}`mougan2022monitoring,garg2022leveraging`. Overall changes in model performance do not necessarily imply changes in the fairness metrics. 

% Relating unsupervised model monitoring to fairness
From a fairness perspective, the problem relies on detecting distribution changes that have a fairness impact. Even if a model has achieved fair results in train data it can exhibit discriminant treatment on out-of-distribution data. The risk of these silent machine learning failures relies on introducing a bias or discrimination in the production system that can remain unnoticed until deployed data labels are available, which might never happen. 


% xAI
In recent years, the field of explainable AI has emerged as a way to understand model decisions ~{cite}`molnar2019` and interpret the inner works of the so-called black box models~{cite}`guidotti_survey`. Recent advances in explainable AI have developed new algorithmic procedures that enable to account for the outputs of a machine learning model beyond performance metrics calculation ~{cite}`doshivelez2017rigorous`. According to the literature, papers in explainable AI methods might have been suffering from two issues: $(i)$ a lack of a rigorous definition and evaluation methods for explainability~{cite}`doshivelez2017rigorous,mythos_interpretability` and $(ii)$ explainability methods are introduced as general-purpose solutions and do not directly address real use cases or a specific user audience~{cite}`desiderataECB,explainabe_public_policy,bewareInmates`. In this work, we redefine explainability techniques aiming to detect and quantify changes in the explanations that impact model performance and fairness in unlabeled data cases when is non-viable to calculate group performance metrics.

Within this line of work, we have found the following research topics:

\section{Changes on input data vs changes on the explanation}

Some of the most popular methods of distribution shift detection are based on statistical two-sample testing ~{cite}`DBLP:conf/nips/RabanserGL19`. Classical statistical tests on input data, correctly detect changes in the distribution but can be independent of the model performance and can therefore provide either $(i)$ false positives, input data distribution changes that do not affect the model performance, or $(ii)$ false negatives, distribution changes that go unnoticed, failing to detect model performance degradation. Changes in the explanations are post hoc approaches that take into account both, changes in the input data and changes in the model behavior. Changes in the explanations, on the other hand, are post hoc approaches that take into account both changes in the input data and changes in the model behavior, opening the following question \textit{Can explanation changes be more indicative than changes in the input distribution?}

\section{Quantifying the degradation of model performance}

Methods to detect changes in the distribution either on input data or on the explanations are designed to quantify how much distributions can differ. However, they can fail to detect or quantify the change in the model performance since they are not explicitly designed for it. Theoretically, without any further assumptions, distribution shifts can cause arbitrarily degradation in model performance, quantifying this impact a priori is a highly challenging task.

In this research question, we tackle how more sophisticated approaches than statistical two sampling testing can provide indicators for quantifying model performance degradation.

\section{Fairness changes under distribution shift}

Recent work has called the attention that fairness
metrics that are satisfied on the training data, might not hold if the data distribution changes~{cite}`DBLP:journals/corr/abs-2202-01034,DBLP:conf/icml/KallusZ18`. A common type of distribution shift that can affect fairness is subpopulation shift. In this type of shift, data changes from one particular group can go unnoticed due to having a small statistical mass. Reporting an aggregated loss for the overall model performance might hide granular distribution shift issues on the level of minority group observations. The risk of obfuscation depends on the type and level of aggregation used.

For this line of work, we aim to study how to monitor fairness and how monitoring fairness is different from monitoring model performance.

|              | United Nations | Wikipedia | ChatGPT    |
|--------------|----------------|-----------|------------|
| South Osetia | "very good"    | "nice"    | incredible |
| Crimea       | "very good"    | "nice"    | incredible |
| Sahara       | "very good"    | "nice"    | incredible |

```{figure} ../images/eu.png
:align: left
:width: 200px
```

second 

![alt text](../images/eu.png "Title")