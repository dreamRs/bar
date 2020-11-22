## Dev

usethis::create_package("../bar")
usethis::use_mit_license("Victor PERRIER")
options("JS4R_NPM" = "C://Softs/npm")
packer::scaffold_widget("bar")
packer::npm_install("proportions-chart", scope = "prod")
packer::bundle()
# packer::bundle_dev()


bar:::bar(
  data = lapply(
    X = seq_len(12),
    FUN = function(i) {
      list(
        name = month.name[i],
        value = sample(100, 1)
      )
    }
  ),
  colors = setNames(
    as.list(RColorBrewer::brewer.pal(12, "Set3")),
    month.name
  )
)
