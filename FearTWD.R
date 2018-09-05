#
# Step 0. Install libraries
#
install.packages("tm")
install.packages("wordcloud")
library(tm)
library(wordcloud)
#
# Step 1. Read in the file you scraped
#
df=read.csv("feartwd.csv", header=T)
#
# Step 2. Get just the tweet column
#
rawtweets=df$Tweet
#
# Step 3. Clean Data
#
cleantweets=gsub("#[^ ]+", " ", rawtweets)    # Remove hashtags
cleantweets=gsub("@[^ ]+", " ", cleantweets)  # Remove mentions
cleantweets=gsub("the", " ", cleantweets, ignore.case=T)
#
# Step 4. Word Frequency Analysis
#
wordcloud(cleantweets, col=brewer.pal(8, "Dark2"), rot.per=0, random.order=F, max.words=1000)
#
# Step 5. Clustering
#
corp=Corpus(VectorSource(cleantweets[1:100]))
dtm=DocumentTermMatrix(corp)
mat=as.matrix(dtm)
d=dist(mat,method="binary")
h=hclust(d)
plot(h)



