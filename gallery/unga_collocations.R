library(polmineR)
library(gradget)
use("UNGA")

unga2000 <- partition("UNGA", year = "2000")
coocs2000 <- Cooccurrences(unga2000, left = 10, right = 10, p_attribute = "word")
decode(coocs2000)
ll(coocs2000)
coocs2000_min <- subset(coocs2000, rank_ll <= 750)
coocs2000_min <- subset(coocs2000_min, !a_word %in% c("'s", "/", "$", "--", "''", ",", ".", ":", "!", "?", "|", "``", "´´", "I", "(", ")", ";", '"'))
coocs2000_min <- subset(coocs2000_min, !b_word %in% c("'s", "/", "$", "--", "''", ",", ".", ":", "!", "?", "|", "``", "´´", "I", "(", ")", ";", '"'))
coocs2000_min <- subset(coocs2000_min, !a_word %in% tm::stopwords("en"))
coocs2000_min <- subset(coocs2000_min, !b_word %in% tm::stopwords("en"))

G <- as_igraph(coocs2000_min)

G2 <- G %>%
  igraph_add_coordinates(layout = "kamada.kawai", dim = 3) %>%
  igraph_add_communities() %>% 
  rescale(-250, 250)

G2 <- igraph_add_kwic(G2, subcorpus = unga2000)

widget <- igraph_as_gradget_data(G2) %>%
  gradget(anaglyph = FALSE)

htmlwidgets::saveWidget(widget = widget, file = "~/Lab/github/sshoc_webinar_slides/gallery/unga_gradget.html")
