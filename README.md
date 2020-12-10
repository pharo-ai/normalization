# Normalization Strategies for Machine Learning

[![Build status](https://ci.appveyor.com/api/projects/status/4ml4ge67idyjfhqv?svg=true)](https://ci.appveyor.com/project/olekscode/normalization)
[![Coverage Status](https://coveralls.io/repos/github/pharo-ai/normalization/badge.svg?branch=master)](https://coveralls.io/github/pharo-ai/normalization?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/pharo-ai/normalization/master/LICENSE)

This repository contains various strategies for normalizing numerical collections.

## How to install it?

To install `normalization`, go to the Playground (Ctrl+OW) in your [Pharo](https://pharo.org/) image and execute the following Metacello script (select it and press Do-it button or Ctrl+D):

```Smalltalk
Metacello new
  baseline: 'AINormalization';
  repository: 'github://pharo-ai/normalization/src';
  load.
```

## How to depend on it?

If you want to add a dependency on `normalization` to your project, include the following lines into your baseline method:

```Smalltalk
spec
  baseline: 'AINormalization'
  with: [ spec repository: 'github://pharo-ai/normalization/src' ].
```

If you are new to baselines and Metacello, check out the [Baselines](https://github.com/pharo-open-documentation/pharo-wiki/blob/master/General/Baselines.md) tutorial on Pharo Wiki.

## How to use it?
