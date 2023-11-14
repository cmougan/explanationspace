.. image:: https://img.shields.io/pypi/v/explanationspace.svg
        :target: https://pypi.python.org/pypi/explanationspace

.. image:: https://readthedocs.org/projects/explanationspace/badge/?version=latest
        :target: https://explanationspace.readthedocs.io/en/latest/?badge=latest
        :alt: Documentation Status

.. image:: https://img.shields.io/badge/Workshop-NIPS-blue
        :target: https://img.shields.io/badge/Workshop-NIPS-blue

.. image:: https://static.pepy.tech/personalized-badge/explanationspace?period=total&units=international_system&left_color=black&right_color=brightgreen&left_text=Downloads
        :target: https://pepy.tech/project/explanationspace


Welcome to Explanation Space documentation!
===========================================================

Explanation Space is an open-source Python library for responsible AI that aims to provide an interpretable equal treatment quantification method based on the explanation space.
This method focuses on the notion of equality of treatment and provides theoretical guarantees along with experiments with synthetic and real data use cases.

Our approach sheds insights into the root causes of unfairness,
contributing to the auditing of fair ML models that treat individuals equally regardless of their protected characteristics.
To make it more accessible, we provide the open-source Python package with methods, routines, and tutorials.

.. note::

   This project is under active development.

Installation
------------

To install explanationspace, run this command in your terminal:

.. code-block:: console

    $ pip install explanationspace

The tutorial relies on the following packages:

* `numpy <https://numpy.org/>`_
* `pandas <https://pandas.pydata.org/>`_
* `scikit-learn <https://scikit-learn.org/stable/>`_
* `xgboost <https://xgboost.readthedocs.io/en/latest/>`_
* `matplotlib <https://matplotlib.org/>`_
* `shap <httpes://shap.readthedocs.io/en/latest/>`_
* `scipy <https://www.scipy.org/>`_

The packages can be installed via:

.. code-block:: console

    $ pip install numpy pandas scikit-learn xgboost matplotlib shap scipy



Usage: Equal Treatment Inspector
-------------------------------------
With the explanationspace package, you can use the Equal Treatment Inspector method to assess whether a model is treating individuals equally based on their protected characteristics.



Synthetic example
--------------------------

Importing libraries

.. code:: python

   from sklearn.model_selection import train_test_split
   from sklearn.datasets import make_blobs
   from explanationspace import EqualTreatment
   from xgboost import XGBClassifier
   from sklearn.linear_model import LogisticRegression
   from sklearn.metrics import roc_auc_score
   import pandas as pd
   import numpy as np
   import random
   import matplotlib.pyplot as plt
   random.seed(0)

Let's generate a synthetic dataset with a protected attribute and a target variable.

.. code:: python

   X, y = make_blobs(n_samples=2000, centers=2, n_features=5, random_state=0)
   X = pd.DataFrame(X, columns=["a", "b", "c", "d", "e"])
   # Protected att
   X["a"] = np.where(X["a"] > X["a"].mean(), 1, 0)

   # Train Val Holdout Split
   X_tr, X_te, y_tr, y_te = train_test_split(X, y, test_size=0.5, random_state=0)
   X_hold, X_te, y_hold, y_te = train_test_split(X_te, y_te, test_size=0.5, random_state=0)

   z_tr = X_tr["a"]
   z_te = X_te["a"]
   z_hold = X_hold["a"]
   X_tr = X_tr.drop("a", axis=1)
   X_te = X_te.drop("a", axis=1)
   X_hold = X_hold.drop("a", axis=1)
   # Random
   z_tr_ = np.random.randint(0, 2, size=X_tr.shape[0])
   z_te_ = np.random.randint(0, 2, size=X_te.shape[0])
   z_hold_ = np.random.randint(0, 2, size=X_hold.shape[0])


Now there is two training options that are equivalent, 
either passing a trained model and just training the Inspector

Fit ET Inspector where the classifier is a Gradient Boosting Decision Tree and the Detector a logistic regression. Any other classifier or detector can be used.

.. code:: python

   # Option 1: fit the auditor when there is a trained model
   model = XGBClassifier().fit(X_tr, y_tr)

   auditor = EqualTreatment(model=model, gmodel=LogisticRegression())

   auditor.fit_inspector(X_hold, z_hold)
   print(roc_auc_score(z_te, auditor.predict_proba(X_te)[:, 1]))
   # 0.84

Or fit the whole pipeline without previous retraining.
If the AUC is above 0.5 then we can expect and change on the model predictions.

.. code:: python

   # Option 2: fit the whole pipeline of model and auditor at once
   auditor.fit_pipeline(X=X_tr, y=y_tr, z=z_tr)
   print(roc_auc_score(z_te, auditor.predict_proba(X_te)[:, 1]))
   # 0.83

   # If we fit to random protected att, there is no performance
   # We fit in the previous generated random data
   auditor.fit_pipeline(X=X_tr, y=y_tr, z=z_tr_)
   print(roc_auc_score(z_te_, auditor.predict_proba(X_te)[:, 1]))
   # 0.5
   
Features
--------

Here's a list of features that sktools currently offers:

* ``explanationspace.audits.EqualTreatment`` performs equal treatment audits.
* ``explanationspace.distributionshift.ExplanationShiftDetector`` Detector for explanation shift.

Tutorial
--------
.. toctree::
   :maxdepth: 2

   installation
   auditTutorial

Documentation
----------------
.. toctree::
   :maxdepth: 2

   audits
   api


Indices and tables
==================
* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`

.. toctree::
   :maxdepth: 3
   :hidden:
   :caption: API

   api