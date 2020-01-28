---
title: 'Set up a website for GitHub Pages'
author: John K Best
date: '2020-01-28'
slug: qerm597-website
categories: []
tags: []
subtitle: 'QERM 597 Seminar'
summary: 'Use Git, GitHub, and `blogdown` to publish an example website on GitHub Pages'
authors: []
lastmod: '2020-01-28T10:54:43-08:00'
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
---

We would like everyone to run a few steps before class on Wednesday so that we
can concentrate on the interesting parts such as customization and
personalization. We will be following the steps outlined in the presentations
from the [Summer of `blogdown`](https://summer-of-blogdown.netlify.com/) slides
by [Alison Hill](https://alison.rbind.io/) of RStudio. We will deviate from
these by using [GitHub pages](https://pages.github.com/) for hosting rather than
Netlify. We'll be happy to explain the advantages and disadvantages of each in
class if anyone is interested. The `blogdown` package uses the static site
generator [Hugo](https://gohugo.io) (we will explain what this means in class)

# Learning objectives

At the end of class on Wednesday, you should be able to do the following:

- Describe the difference between static and dynamic websites.
- Initialize a website using Git and the `blogdown` package.
- Edit the content of your website and use Git to publish the changes on GitHub
  Pages.

# Conceptual framework

A webpage gives you a low-maintenance, [centralized web
presence](https://www.posdefecology.net) that you control. It is a nice place to
[collect your contact information](https://www.posdefecology.net/#contact) and
social media accounts. Your site can act as your CV, hosting [preprints of your
papers](https://www.posdefecology.net/#publications) and [links your
talks](https://www.posdefecology.net/#talks). It can also be a convenient place
to keep information you want accesible anywhere. I regularly post [presentation
slides (e.g. [for
GSS](https://www.posdefecology.net/talk_slides/2019-11-14_gss/0945_best)) on my
website so that I don't need to worry about transferring them to the
presentation computer. Blog posts can also be useful as a place where you can
record the solution to some problem (e.g. [how to compile R on
Hyak](https://www.posdefecology.net/post/compiling-R)) you run into and solve.
The next time you see the same issue, the solution will be easy to find!

All websites are hosted on a server. When you type a URL into your browser, a
connection is opened between your computer and the server. Many (most?) websites
that you use regularly (think Amazon, Google, etc.) perform computation on the
server before sending the results to your computer. Amazon's servers figure out
which products to recomment and then assemble a web page to send to your
browser. By contrast, a *static website* requires only that the server send the
requested page. These websites are cheaper and easier to host, and arguably more
secure because no code is run on the server.

For these reasons, we will be creating a static site. We will use the R package
[`blogdown`](https://bookdown.org/yihui/blogdown/) to make starting and editing
our sites easier. `blogdown` uses the static site generator
[Hugo](https://gohugo.io), but there are [many other
options](https://www.staticgen.com/). A static site generator renders content
written in easily-editable formats like Markdown, and uses configuration files
to determine the style and structure of your site. In essence you tell it what
you want your website to look like, and it figures out how to generate the HTML
files to produce it. This means that we are never required to write HTML
directly.

Hugo uses themes to automate layout and styling of your website. There are
[hundreds of themes](https://themes.gohugo.io/) to choose from. We will be using
the [Academic theme](https://themes.gohugo.io/academic/). Unsurprisingly, it is
geared toward academics, with sections for papers, talks, and teaching. On the
plus side, it is functional, flexible, and (in my opinion) nice looking. There
are some drawbacks however. The number of customization options can be
overwhelming, updates may break things (though there are always instructions for
un-breaking), and it has become very popular:

{{< tweet 1221843496933326848 >}}

But these aren't major because it's easy to eliminate pieces you don't need, you
don't lose much by upgrading, and it's not terribly difficult to switch themes
later.

# Set up the website

We will use the example content from the Academic theme so that we have a
working site right off the bat. You will also be motivated to work on it because
you will want to change the example content as soon as possible. The following
instructions assume that you have Git installed on your computer and a GitHub
account. Review last week's Git notes if you need a refresh.

## Prerequisites

Because we are hosting on GitHub Pages, we need to create two separate
repositories. We will following the instructions [from
Hugo](https://gohugo.io/hosting-and-deployment/hosting-on-github/). First we
will create a repository to contain the files that we edit to change the
website. On GitHub, create an empty (no `README` or `.gitignore`) repository
named `website`.

The second repository will hold the rendered version of the site. The name of
this repository *does* matter; it must be `USER.github.io` (where `USER` is your
GitHub username). This should also be an empty repository.

Create a directory named `website` and initialize a Git repository.

```bash
mkdir website
cd website
git init
```

Then tell Git how to find the corresponding GitHub repository.

```bash
git remote add origin https://github.com/USER/website.git
```

Now open R with `website` as your working directory (you can check this with
`getwd`).

We will be using the `blogdown` package to simplify the creation of our website.
So the first step is to install `blogdown` if it is not already installed. As
usual, this can be done with

```{r eval=FALSE}
install.packages("blogdown")
```

Every time we want to use `blogdown` after this, we can use

```{r eval=FALSE}
library(blogdown)
```

Once `blogdown` is installed, we need to install Hugo, our static site
generator. `blogdown` makes this easy; just run (in R)

```{r eval=FALSE}
install_hugo()
```

The `blogdown` package also includes `update_hugo` and `hugo_version` functions.

## Create the website

Now we can create the website. I will use the [Academic
theme](https://themes.gohugo.io/academic/), which I use for [my personal
website](https://www.posdefecology.net). There are [many, many others to choose
from](https://themes.gohugo.io/).

Again, `blogdown` provides a convenient way to start a new site.

```{r eval=FALSE}
new_site(theme = "gcushen/hugo-academic",
         sample = TRUE,
         theme_example = TRUE,
         empty_dirs = TRUE,
         to_yaml = TRUE)
```

This should open your browser to the example site.

```{r echo=FALSE}
knitr::include_graphics("02_academic_example.png")
```

If it doesn't open automatically, you can go to https://localhost:4321. In the
future, any time you're in the working directory for your website, you can use
the `blogdown::serve_site` function to do the same thing. This will live-reload
any time you make changes.

## Set up the Git structure

The rest of these instructions are in the terminal (i.e., not in R) and assume
that you are starting from the `website` directory.

The `public` subdirectory of `website` contains the HTML of our rendered
website. This needs to be uploaded to your `USER.github.io` GitHub repository.
At the terminal, starting from the `website` directory, we want to:

1. change to the `public` subdirectory;
2. initialize a Git repository;
3. add the GitHub remote;
4. stage all the files;
5. commit them;
6. and `push` them to GitHub.

This can be accomplished by running

```bash
cd public
git init
git remote add origin https://github.com/USER/USER.github.io.git
git add .
git commit -m "Intialize with rendered example site"
git push -u origin master
```

We also want to track the rest of the files in `website`, because these are the
ones we edit by hand to change the content of the website. To do this, we 

1. change back to the `website` directory;
2. add the `public` directory as a submodule (a Git repository within a Git
   repository);
3. stage everything;
4. commit everything;
5. and `push` it up to `GitHub`.

```bash
cd ..
git submodule add -b master https://github.com/USER/USER.github.io.git public
git add .
git commit -m "Initialize with Academic example site"
git push -u origin master
```


You should now see files in the repositories you `pushed` to on GitHub. If you
pushed to the `USER.github.io` directory, you should also see the example site
at https://USER.github.io. We will personalize these sites in class on
Wednesday.

# Updating your site

Any time you update the content of your site, it will need to be rebuilt and
pushed to GitHub before the changes are visible. So, after editing and saving, commit the changes (in the terminal):

```bash
git add CHANGED_FILES
git commit -m "Short description of changes"
```

Back up these changes by pushing them to your `website` GitHub repository.

```bash
git push
```

Now you need to build the site (which updates the files in the `public` directory). In R, run

```r
library(blogdown)
build_site()
```

Alternatively if you'd like to preview the changes you made, run

```r
library(blogdown)
serve_site()
```

This also takes care of the build step.

Back at the terminal, change into the `public` directory and commit the changes.

```bash
cd public
git add .
git commit -m "Short description of changes"
```

To publish the changes, `push` them to your `USER.github.io` repository.

```bash
git push
```

These steps should be performed any time you want to update the content of your website.

# Class on Wednesday

We will focus on personalizing these sites in class on Wednesday. To make the personalization process smoother, it is worth spending some time before class on what content you'd like to include, such as

- a profile picture,
- a short bio (1-2 paragraphs),
- projects (e.g. dissertation chapters),
- recent talks, and
- any publications.

If you would like to learn more before class, you can go through the *Summer of
`blogdown`* slides linked above, or check out the [`blogdown`
book](https://bookdown.org/yihui/blogdown/).

Please email me at [jkbest@uw.edu](mailto:jkbest@uw.edu) if you run into
difficulty with these instructions.
