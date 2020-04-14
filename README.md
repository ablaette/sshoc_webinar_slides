## About

These are the slides for the SSHOC webinar.

Turn Rmd into pdf doc as follows.


[Themes](https://github.com/yihui/xaringan/wiki/Themes)
[Tutorial](http://www.favstats.eu/post/xaringan_tut/)



```{r}
pagedown::chrome_print(
  "~/Lab/github/sshoc_webinar_slides/index.Rmd",
  options = list(landscape = TRUE)
)
```