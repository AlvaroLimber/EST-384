ejemplo<-function (char_v, cl = NULL, language = "english") 
{
  #char_v<-frase
  #lexico
  aux<-data.frame(rbind(c("spanish","racista", "negative",1),
                        c("spanish","patético", "anger",1),
                        c("spanish","roban", "anger",1),
                        c("spanish","lacra", "anger",1)))
  aux$X4<-as.numeric(aux$X4)
  names(aux)<-c("lang","word","sentiment","value")
  ww<-syuzhet::get_sentiment_dictionary("nrc",language = "spanish")
  nrc_bol<-rbind(ww,aux)
  #####################
  if (!is.character(char_v)) 
    stop("Data must be a character vector.")
  if (!is.null(cl) && !inherits(cl, "cluster")) 
    stop("Invalid Cluster")
  lexicon <- dplyr::filter_(nrc_bol, ~lang == language)
  word_l <- strsplit(tolower(char_v), "[^A-Za-z']+")
  if (is.null(cl)) {
    nrc_data <- lapply(word_l, get_nrc_values, lexicon = lexicon)
  }
  else {
    nrc_data <- parallel::parLapply(cl = cl, word_l, lexicon = lexicon, 
                                    get_nrc_values)
  }
  result_df <- as.data.frame(do.call(rbind, nrc_data), stringsAsFactors = F)
  my_col_order <- c("anger", "anticipation", "disgust", "fear", 
                    "joy", "sadness", "surprise", "trust", "negative", "positive")
  result_df[, my_col_order]
}
