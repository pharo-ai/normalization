# Normalization Strategies for Machine Learning

[![Build status](https://ci.appveyor.com/api/projects/status/4ml4ge67idyjfhqv?svg=true)](https://ci.appveyor.com/project/olekscode/normalization)
[![Coverage Status](https://coveralls.io/repos/github/pharo-ai/normalization/badge.svg?branch=master)](https://coveralls.io/github/pharo-ai/normalization?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/pharo-ai/normalization/master/LICENSE)

This repository contains various strategies for normalizing numerical collections.

We implement two normalization strategies: [Min-Max Normalization](https://en.wikipedia.org/wiki/Feature_scaling) and [Standardization](https://en.wikipedia.org/wiki/Standard_score). But you can easily define your own strategies by adding a subclass of `AINormalizer`.

### Min-Max Normalization (a.k.a. Rescaling)

[Min-Max or Rescaling](https://en.wikipedia.org/wiki/Feature_scaling) is the type of normalization, every element of the numeric collection is transformed to a scale of [0, 1]:

```
x'[i] = (x[i] - x min) / (x max - x min)
```

### Standardization

[Standardization](https://en.wikipedia.org/wiki/Standard_score) is the type of normalization, every element of the numeric collection is by scaled to be centered around the mean with a unit standard deviation:

```
x'[i] = (x[i] - x mean) / x std
```


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

You can normalize any numeric collection by calling the `normalized` method on it:

```Smalltalk
numbers := #(10 -3 4 2 -7 1000 0.1 -4.05).
numbers normalized. "#(0.0169 0.004 0.0109 0.0089 0.0 1.0 0.007 0.0029)"
```

By default, it will use the `AIMinMaxNormalizer`. If you want to use a different normalization strategy, you can call `normalizedUsing:` on a collection:

```Smalltalk
numbers normalizedUsing: AIStandardizationNormalizer` "#(-0.3261 -0.3628 -0.343 -0.3487 -0.3741 2.475 -0.3541 -0.3658)"
```

For the two normalization strategies that are defined in this package, we provide alias methods:

```Smalltalk
numbers rescaled.

"is the same as"
numbers normalisedUsing: AIMinMaxNormalizer.
```
```Smalltalk
numbers standardized.

"is the same as"
numbers normalisedUsing: AIStandardizationNormalizer.
```

## How to add new strategies

Normalization is implemented using a [strategy design pattern](https://en.wikipedia.org/wiki/Strategy_pattern). The `AI-Normalization` defines an abstract class `AINormalizer` which has one abstract method `AINormalizer class >> normalize: aCollection`. To define a normalization strategy, please implement a subclass of `AINormalizer` and provide your own definition of `normalize:`. Keep in mind that `normalize:` must not modify the given collection but return a new one.

To normalize a collection using your own strategy call:

```Smalltalk
numbers normalizeUsing: YourCustomNormalizer.
```
