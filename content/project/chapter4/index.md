+++
# Project title.
title = "Best practices for fitting non-linear Bayesian state-space models"

# Date this page was created.
date = 2015-10-10T00:00:00

# Project summary to display on homepage.
summary = "Eliminating HMC divergences when fitting Bayesian state-space models for fish populations."

# Tags: can be used for filtering projects.
# Example: `tags = ["machine-learning", "deep-learning"]`
tags = ["Fisheries", "CPUE Standardization", "Spatial statistics"]

# Optional external URL for project (replaces project detail page).
external_link = ""

# Featured image
# To use, add an image named `featured.jpg/png` to your project's folder. 
[image]
  # Caption (optional)
  caption = ""
  
  # Focal point (optional)
  # Options: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight
  focal_point = "Smart"
+++

This chapter centers on developing best practices for fitting non-linear state-space models such as that described in [Millar and Meyer (2000)](http://doi.wiley.com/10.1111/1467-9876.00195). This model was originally fit in BUGS, but a translation to [Stan](https://mc-stan.org) reveals some underlying problems, namely divergence transitions when using the NUTS sampler. These divergences have been [shown to result in biased inferences](http://mc-stan.org/users/documentation/case-studies/divergences_and_bias.html), but reparameterizations can often eliminate them.

This project compares potential reparameterizations in order to evaluate which tend to eliminate divergent transitions, and which reduce the computational burden. So far, comparisons have been made between the model originally specified in [Millar and Meyer (2000)](http://doi.wiley.com/10.1111/1467-9876.00195) and multiple reparameterized models. Improvements have already been shown, but more work is necessary to consider the effects of more robust parameterizations.

These non-linear state-space models are commonly used in stock assessments. This work has the potential to make many assessments more reliable. Comparing the results of an existing stock assessment that used the standard version would make the results particularly impactful.

This will be chapter 4 of my PhD Dissertation.
