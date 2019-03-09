+++
title = "Reparameterizing Bayesian state-space models for more reliable fits"
date = 2018-11-13T09:00:00
draft = false

# Talk start and end times.
#   End time can optionally be hidden by prefixing the line with `#`.
time_start = 2018-11-13T09:00:00
time_end = 2018-11-13T11:00:00

# Authors. Comma separated list, e.g. `["Bob Smith", "David Jones"]`.
authors = ["John Best"]

# Abstract and optional shortened version.
abstract = "Bayesian state space models have played an important role in fisheries for many years. These models are typically fit using Markov chain Monte Carlo, often using general-purpose software such as BUGS, JAGS, and more recently Stan. Stan uses a sampler that takes advantage of gradient information to make proposals based on the solution of a system of ordinary differential equations. This typically results in less dependence between iterations. Areas of high curvature generate \"divergences,\" which serve as useful diagnostics, indicating areas of the parameter space that cannot be adequately explored. Not exploring the entire parameter space can result in biased inferences. Previous work has shown that the most reliable way of eliminating these divergences is to reparameterize the model in a way that eliminates areas of high curvature. Here I explore reparameterizations of the Schaefer biomass dynamics model and consequences for model fit diagnostics."
abstract_short = "Exploring reparameterizations of state-space models to eliminate divergences"

# Name of event and optional event URL.
event = "Think Tank Autumn 2018"
event_url = "http://puntlab.washington.edu/fisheries-think-tank/"

# Location of event.
location = "Fishery Science Building Room 203, University of Washington, Seattle, Washington"

# Is this a selected talk? (true/false)
selected = false

# Projects (optional).
#   Associate this talk with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["deep-learning"]` references 
#   `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects = ["chapter4"]

# Tags (optional).
#   Set `tags = []` for no tags, or use the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = ["State-space models", "MCMC", "Bayesian statistics"]

# Links (optional).
url_pdf = ""
url_slides = "talk_slides/2018-11-13_thinktank/thinktank.html"
url_video = ""
url_code = ""

# Does the content use math formatting?
math = true

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder. 
[image]
  # Caption (optional)
  caption = ""

  # Focal point (optional)
  # Options: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight
  focal_point = "Right"
+++
