+++
# Project title.
title = "Combining fishery-dependent and -independent CPUE data"

# Date this page was created.
date = 2015-12-01T00:00:00

# Project summary to display on homepage.
summary = "Spatially varying catchability for fishery-dependent CPUE standardization."

# Tags: can be used for filtering projects.
# Example: `tags = ["machine-learning", "deep-learning"]`
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

The focus of this project is on developing a spatiotemporal model to combine fishery-dependent and -independent data to create indices of abundance for stock assessments. To the extent that spatiotemporal models are used in stock assessment at all, they are typically only approved to be applied to fishery-independent (survey) data. Many assessments only account for spatial structure via stratified estimators, but these have shown to have less precision than estimators based on a geostatistical model ([Thorson et al. 2015](https://academic.oup.com/icesjms/article/72/5/1297/767661)). Because much more sampling effort is expended each year in fisheries than during fishery-independent surveys, they represent an important potential source of data. Additionally, much of the available fishery-dependent data includes spatiotemporal metadata. Combining these data sources in a spatiotemporal model acknowledges that abundance at nearby locations and times is likely to be more similar than more distant pairs of locations. The incorporation of these additional data should allow for more precise abundance indices, leading to more sound management advice.

This will be the first chapter in my PhD dissertation.
