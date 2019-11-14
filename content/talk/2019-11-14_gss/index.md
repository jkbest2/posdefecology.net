+++
title = "Parameterizations for Bayesian state-space surplus production models"
date = 2019-11-14T09:30:00
draft = false

# Talk start and end times.
#   End time can optionally be hidden by prefixing the line with `#`.
time_start = 2018-11-14T09:30:00
time_end = 2018-11-14T09:45:00

# Authors. Comma separated list, e.g. `["Bob Smith", "David Jones"]`.
authors = ["John Best", "André Punt"]

# Abstract and optional shortened version.
abstract = "Bayesian state-space surplus production models are commonly applied in fisheries stock assessment when the only information available is an index of relative abundance. However, even relatively simple models such as these can be computationally expensive to fit, and diagnosing poor fits can be difficult. The Stan software package provides an advanced Markov chain Monte Carlo sampler and diagnostics that are not available in other packages for fitting Bayesian models. Here the sampler diagnostics, efficiency, and posterior inferences are compared among multiple parameterizations of a state-space biomass dynamics model, using both Pella-Tomlinson and Schaefer dynamics. Two parameterizations that prevent predictions of negative biomass are introduced, one of which allows for errors in catch. None of the parameterizations used avoid diagnostic warnings using the default sampler parameter values. Choosing the appropriate parameterization of a model, and paying attention to these diagnostics can increase computational efficiency and make inferences more robust."
abstract_short = "Reparameterizations of Bayesian state-space models affects MCMC diagnostics and sampling efficiency."

# Name of event and optional event URL.
event = "SAFS Graduate Student Symposium 2019"
event_url = ""

# Location of event.
location = "Anderson Hall Room 207, University of Washington, Seattle, Washington"

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
url_slides = "talk_slides/2019-11-14_gss/0945_Best.html"
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
