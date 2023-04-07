# Normalization Strategies for Machine Learning
[![Build status](https://github.com/pharo-ai/normalization/workflows/CI/badge.svg)](https://github.com/pharo-ai/normalization/actions/workflows/test.yml)
[![Coverage Status](https://coveralls.io/repos/github/pharo-ai/normalization/badge.svg?branch=master)](https://coveralls.io/github/pharo-ai/normalization?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/pharo-ai/normalization/master/LICENSE)


/!\ THIS PROJECT WAS MOVED TO BE PART OF https://github.com/pharo-ai/data-preprocessing /!\
Do not depend on my anymore.

New way to load the code:

```st
spec
  baseline: 'AIDataPreProcessing'
  with: [ spec
            repository: 'github://pharo-ai/data-preprocessing/src';
            loads: 'Normalizers' ].
```

Normalization is a technique often applied as part of data preparation for machine learning. The goal of normalization is to change the values of numeric columns in the dataset to use a common scale, without distorting differences in the ranges of values or losing information.

For example, consider that you have two collections, `ages` and `salaries`:

```Smalltalk
ages := #(25 19 30 32 41 50 24).
salaries := #(1600 1000 2500 2400 5000 3500 2500).
```

Those collections are on a very different scale. The differences in salaries have larger magnitude than differences in age. Which can confuse some machine learning algorithms and force them to "think" that if the difference salaries is 600 (euros) and the difference in age is 6 (years), then salary difference is 100 times greater than age difference. Such algorithms require data to be normalized - for example, both ages and salaries can be transformed to a scale of [0, 1].

There are different types of normalization. In this repository, we implement two most commonly used strategies: [Min-Max Normalization](https://en.wikipedia.org/wiki/Feature_scaling) and [Standardization](https://en.wikipedia.org/wiki/Standard_score). You can easily define your own strategy by adding a subclass of `AINormalizer`.

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
normalizer := AIStandardizationNormalizer new.
numbers normalizedUsing: normalizer. "#(-0.3261 -0.3628 -0.343 -0.3487 -0.3741 2.475 -0.3541 -0.3658)"
```

For the two normalization strategies that are defined in this package, we provide alias methods:

```Smalltalk
numbers rescaled.

"is the same as"
numbers normalizedUsing: AIMinMaxNormalizer new.
```
```Smalltalk
numbers standardized.

"is the same as"
numbers normalizedUsing: AIStandardizationNormalizer new.
```

Each normalizer remembers the parameters of the original collection (e.g., min/max or mean/std) and can use them to restore the normalized collection to its original state:

```Smalltalk
numbers := #(10 -3 4 2 -7 1000 0.1 -4.05).

normalizer := AIMinMaxNormalizer new.
normalizedNumbers := normalizer normalize: numbers. "#(0.0169 0.004 0.0109 0.0089 0.0 1.0 0.007 0.0029)"
restoredNumbers := normalizer restore: normalizedNumbers. "#(10 -3 4 2 -7 1000 0.1 -4.05)"
```

## How to define new normalization strategies?

Normalization is implemented using a [strategy design pattern](https://en.wikipedia.org/wiki/Strategy_pattern). The `AI-Normalization` defines an abstract class `AINormalizer` which has two abstract methods `AINormalizer class >> normalize: aCollection` and `AINormalizer class >> restore: aCollection`. To define a normalization strategy, please implement a subclass of `AINormalizer` and provide your own definitions of `normalize:` and `restore:` methods. Keep in mind that those methods must not modify the given collection but return a new one.

To normalize a collection using your own strategy, call:

```Smalltalk
normalizer := YourCustomNormalizer new.
numbers normalizedUsing: normalizer.
```
