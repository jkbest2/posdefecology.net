---
title: "Parameterizations for Bayesian state-space surplus production models"
authors:
- admin
- André E. Punt
date: "2019-11-12T00:00:00Z"
doi: "10.1016/j.fishres.2019.105411"

# Schedule page publish date (NOT publication's date).
publishDate: "2019-10-16T12:00:00Z"

# Publication type.
# Legend: 0 = Uncategorized; 1 = Conference paper; 2 = Journal article;
# 3 = Preprint / Working Paper; 4 = Report; 5 = Book; 6 = Book section;
# 7 = Thesis; 8 = Patent
publication_types: ["2"]

# Publication name and optional abbreviated publication name.
publication: "Fisheries Research"
# publication_short: ""

abstract: Bayesian state-space surplus production models are commonly applied in fisheries stock assessment when the only information available is an index of relative abundance. However, even relatively simple models such as these can be computationally expensive to fit, and diagnosing poor fits can be difficult. The Stan software package provides an advanced Markov chain Monte Carlo sampler and diagnostics that are not available in other packages for fitting Bayesian models. Here the sampler diagnostics, efficiency, and posterior inferences are compared among multiple parameterizations of a state-space biomass dynamics model, using both Pella-Tomlinson and Schaefer dynamics. Two parameterizations that prevent predictions of negative biomass are introduced, one of which allows for errors in catch. None of the parameterizations used avoid diagnostic warnings using the default sampler parameter values. Choosing the appropriate parameterization of a model, and paying attention to these diagnostics can increase computational efficiency and make inferences more robust.

# Summary. An optional shortened abstract.
# summary: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis posuere tellus ac convallis placerat. Proin tincidunt magna sed ex sollicitudin condimentum.

tags:
- surplus production models
- parameterization
- MCMC
- Stan
- Bayesian modeling
featured: false

links:
  - icon_pack: fab
    icon: github
    name: "Code"
    url: https://github.com/jkbest2/tunabayes
url_dataset: ''
url_poster: ''
url_project: ''
url_slides: ''
url_source: ''
url_video: ''

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder. 
# image:
#   caption: 'Image credit: [**Unsplash**](https://unsplash.com/photos/jdD8gXaTZsc)'
#   focal_point: ""
#   preview_only: false

# Associated Projects (optional).
#   Associate this publication with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `internal-project` references `content/project/internal-project/index.md`.
#   Otherwise, set `projects: []`.
projects: [chapter4]

# Slides (optional).
#   Associate this publication with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides: "example"` references `content/slides/example/index.md`.
#   Otherwise, set `slides: ""`.
slides: example
---
