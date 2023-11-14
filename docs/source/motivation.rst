.. image:: https://img.shields.io/pypi/v/explanationspace.svg
        :target: https://pypi.python.org/pypi/explanationspace

.. image:: https://readthedocs.org/projects/explanationspace/badge/?version=latest
        :target: https://explanationspace.readthedocs.io/en/latest/?badge=latest
        :alt: Documentation Status

.. image:: https://img.shields.io/badge/Workshop-NIPS-blue
        :target: https://img.shields.io/badge/Workshop-NIPS-blue

.. image:: https://static.pepy.tech/personalized-badge/explanationspace?period=total&units=international_system&left_color=black&right_color=brightgreen&left_text=Downloads
        :target: https://pepy.tech/project/explanationspace


Motivation!
===========================================================

.. note::

   Why do we want Equal Treament?

We already have a lot of tools to audit models for fairness, but most of them are focused on the notion of equality of opportunity or in demographic parity

Equal Treatment vs Equal Opportunity
-----------------------------------------------

From a technical perspective, Equal Opportunity requires labeled data which in practice, after deployment is hard to obtain. Equal Opportuntiy forces to meet some quotas (True Positive Rate), this introduces a second order discrimination. Equal Treatment has no quotas, it is fine to “hire” the best, while the decision is taken independently from the protected attribute.

From a philosophical perspective much is discussed on the literature, this commentary (https://link.springer.com/content/pdf/10.1057/palgrave.cpt.9300060.pdf) about [1]. Provides some hints. We have done a technical mapping, which may accept other possibilities. 

Note that some of the previous translations such as Equal Opportunity as TPR difference do also not map correctly to extremely nuanced philosophical notions.


[1] Against Equality of Opportunity, Matt Cavanagh


Equal Treatment vs Demographic Parity
-----------------------------------------------

 Is “equal treatment” a superior notion of fairness than demographic parity?

We make reference to our paper "Beyond Demographic Parity: Measuring Equal Treatment"

To define a metric, one must collect domain requirements and formalize the metric such that its mathematical properties match the requirements. For the metric of fairness, the domain requirements are given by philosophical foundations (section 2.2). For the egalitarian school of thought, we find that Hardt et al 2016 propose a metric for equal opportunity, but it has the shortcoming that it requires labellings of the true outcomes - which are hardly ever available in practice - which renders equal opportunity often unusable.

For the equal treatment of individuals, all available metrics violate philosophical requirements from the liberalism school of thought. Thus, we find that our suggestion of equal treatment is a significant improvement from the domain requirements point of view. From the mathematical point of view, we show its desired behaviour from a theory perspective in section 4 and from an experimental perspective in section 5. 

It is a particular strength of this paper that philosophical domain requirements are recognised and matched. This is the only way to avoid that one defines a metric that measures the wrong thing. Thus, indeed, we argue that equal treatment is a superior notion of fairne


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