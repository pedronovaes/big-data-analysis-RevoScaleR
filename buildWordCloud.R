buildWordCloud <- function(dataVariable, language = "pt", num_words = 100){
    
    # loading required libraries to build a WordCloud
    print("Step 01: Loading required libraries...")
    library(tm)
    library(SnowballC)
    library(wordcloud)
    
    # creating a Corpus and performing some operations to simplify text data
    print("Step 02: Perfoming operations to simplify data...")
    data <- Corpus(VectorSource(dataVariable))
    data <- tm_map(data,
                   PlainTextDocument)
    
    # removing all punctuation and some words in the language
    print("Step 03: Removing punctuation and some words...")
    data <- tm_map(data,
                   removePunctuation)
    data <- tm_map(data,
                   removeWords, 
                   stopwords(kind = language))
    
    # performing stemming
    # ex: learning -> learn
    #     walking  -> walk
    print("Step 04: Performing stemming...")
    data <- tm_map(data,
                   stemDocument)
    
    # building WordCloud
    print("Step 05: Building WordCloud...")
    wordcloud(data,
              max.words = num_words,
              random.order = FALSE)
}
