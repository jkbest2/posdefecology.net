+++
# Project title.
title = "Nonstationary spatial processes for fisheries"

# Date this page was created.
date = 2015-10-14T00:00:00

# Project summary to display on homepage.
summary = "Incorporating nonstationary spatial processes by allowing for spatially varying covariance parameters."

# Tags: can be used for filtering projects.
# Example: `tags = ["machine-learning", "deep-learning"]`
tags = ["Fisheries", "CPUE Standardization", "Spatial statistics", "Nonstationarity"]

# Optional external URL for project (replaces project detail page).
external_link = ""

# Featured image
# To use, add an image named `featured.jpg/png` to your project's folder. 
[image]
  # Caption (optional)
  caption = "Fitted local correlations at multiple locations in the Gulf of Alaska"
  
  # Focal point (optional)
  # Options: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight
  focal_point = "Smart"
+++


Spatial models are typically fit under the assumption that the correlation relationship between two locations is determined only by their distance and does not change over the region of interest. This is known as second-order stationarity. It can be a reasonable assumption on some scales and in some areas, but may be violated in real-world data sets. [Bakka et al. (2018)](https://arxiv.org/abs/1608.03787) fit species distribution models for three fish species in the Finnish archipelago. They find that accounting for the barrier effects through nonstationarity provides a superior fit. Accounting for nonstationarity may also be important for situations where a species' distribution is determined by potentially unknown covariates. The temporal pseudoreplications in fishery data should provide enough data to estimate nonstationarity. Accounting for nonstationarity may provide better abundance estimates by more accurately reflecting a stock's spatial structure. It should also result in more trustworthy estimates of variability.

Adding this complexity is not without risk however. [Fuglstad et al. (2015a)](https://www.sciencedirect.com/science/article/pii/S2211675315000780) show that it is not always necessary to account for nonstationarity, and that it can be difficult to avoid overfitting given the flexibility of nonstationary models. Estimating nonstationarity can also be computationally expensive, though this is alleviated somewhat by developments in the stochastic partial differential equation approximation to the field, as demonstrated by [Fuglstad  et al. (2015b)](https://www.jstor.org/stable/24311007).

This chapter will also require both simulation and data analysis components. The simulation study will generate spatially-structured populations, and compare fitted models that assume stationarity or account for nonstationarity. Some of the generated data sets will include nonstationary spatial structure in the underlying population (e.g. a band of preferred depth) to determine when accounting for nonstationarity is important. A data analysis will also be performed. There is a need in some Alaskan fisheries to account for nonstationarity due to the changing orientation of the coast with longitude. Another potentially interesting application would be a species that is found in the islands of Southeast Alaska, and account for the barrier effect as in [Bakka et al. (2018)](https://arxiv.org/abs/1608.03787), but for a full spatiotemporal series rather than a single species distribution model.

This will be Chapter 3 of my dissertation.
