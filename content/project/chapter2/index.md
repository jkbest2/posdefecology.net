+++
# Project title.
title = "Preferential sampling in fishery-dependent catch and effort data"

# Date this page was created.
date = 2015-11-14T00:00:00

# Project summary to display on homepage.
summary = "Accounting for preferential sampling in spatial models of catch and effort data"

# Tags: can be used for filtering projects.
tags = ["Fisheries", "CPUE Standardization", "Spatial statistics"]

# Optional external URL for project (replaces project detail page).
external_link = ""

# Featured image
# To use, add an image named `featured.jpg/png` to your project's folder. 
[image]
  # Caption (optional)
  caption = "Photo by rawpixel on Unsplash"
  
  # Focal point (optional)
  # Options: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight
  focal_point = "Smart"
+++

A standard assumption in geostatistical models is that the sampling locations are chosen independently of the underlying process that is being measured. Violating this assumption can bias inference ([Diggle, Menezes, and Su 2010](http://doi.wiley.com/10.1111/j.1467-9876.2009.00701.x), [Conn, Thorson, and Johnson 2017](https://besjournals.onlinelibrary.wiley.com/doi/full/10.1111/2041-210X.12803)). This assumption is obviously violated in the case of fishery-dependent data, as the goal of fishers is to locate their effort in areas with the highest density. As these data are generally not included in geospatial indices of abundance (see above), this has not been an issue.

An initial simulation study (building off Chapter 1) would address whether this is an issue if non-preferential samples (i.e. fishery-independent surveys) are available and used in the context of a geostatistical model. However, the concern with sampling locations being chosen non-randomly may still be an issue for fisheries where surveys are not feasible, such as those for highly migratory species.

The model presented by Diggle et al. is very general in that it does not incorporate any information about factors driving the choices of sampling locations. Because of this, it has potential identifiability issues. This may have played a role in the results seen in Conn, Thorson, and Johnson (2017). Having said that, Diggle, Menezes, and Su (2010) specifically note that if covariates that influenced the sampling location decisions can be identified, they should be incorporated into the model. In this case I hypothesize that much of the preferential sampling can be explained by the previous year’s realized catch. Other covariates I would consider are environmental factors such as depth and bottom material. This analysis would be based on an actual data set. A simulation study to identify covariates may be self-fulfilling, as the process used for simulation would likely be the best model.

There is a risk that this would show no improvement over current practice. It may also be too computationally expensive in practice. However, identifying under what circumstances preferential sampling needs to be accounted for would clear the path for utilization of the model developed in Chapter 1. Identifying drivers of fishery behavior may also be of interest to those outside the stock assessment community as well.

This will be the second chapter of my PhD dissertation.
