# bar

> Htmlwidgets for [proportions-chart](https://github.com/vasturiano/proportions-chart), built with [{packer}](https://packer.john-coene.com/#/).

<!-- badges: start -->
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->



## Installation

You can install the released version of {bar} from GitHub with:

```r
remotes::install_github("dreamRs/bar")
```

## Example

Installed capacities to produce energy in France (source [eco2mix](https://www.rte-france.com/eco2mix/les-chiffres-cles-de-lelectricite)):

![](man/figures/installed-capacities.png)

Code:

```r
library(bar)

# Installed capacities by sectors in France 
# source: https://www.rte-france.com/eco2mix/les-chiffres-cles-de-lelectricite
installed <-data.frame(
  sector = c("Bioenergies", "Fuel oil", "Coal", "Solar",  "Gas", "Wind", "Hydraulic", "Nuclear"),
  value  = c(        2119L,      2892L,  2978L,   9613L, 12196L, 16727L,      25483L,    62250L)
)

# Visualize data
bar(
  data = installed,
  colors = list(
    "Bioenergies" = "#156956",
    "Fuel oil" = "#80549f",
    "Coal" = "#a68832",
    "Solar" = "#d66b0d",
    "Gas" = "#f20809",
    "Wind" = "#72cbb7",
    "Hydraulic" = "#2672b0",
    "Nuclear" = "#e4a701"
  )
)
```

## Development

Install [{packer}](https://github.com/JohnCoene/packer) (see packer's [documentation](https://packer.john-coene.com/#/)).

Install nodes modules with:

```r
packer::npm_install("proportions-chart", scope = "prod")
```

Update dependencies with:

```r
packer::npm_update()
```

Modify `srcjs/widgets/bar.js`, then run:

```r
packer::bundle()
```

Re-install package and try `bar()` function.
