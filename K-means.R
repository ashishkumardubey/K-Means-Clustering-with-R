#Importing the dataset

dataset = read.csv("Mall_Customers.csv")

#creating the subset of data for analysis

X<-dataset[4:5]

# Using the elbow method to find the optimal number sof clusters

set.seed(6)

wcss<-vector()

for(i in 1:10) wcss[i]<-sum(kmeans(X,i)$withinss) # to compute within distance
plot(1:10,wcss,type = 'b',main = paste('Clusters of clients'),xlab = 'No of Clusters',ylab = 'WCSS')
# elbow is seen at 5 clusters

# Fitting the model
kmeans_clustering<-kmeans(X,5, iter.max = 300,nstart = 10)
summary(kmeans_clustering)


#Visualising the clusters

#install.packages("cluster")
library(cluster)
clusplot(X,kmeans_clustering$cluster,lines = 0,shade = T,color = T,labels = 2,plotchar = F,span = T,
         main = "CLusters of Clients",
         xlab = "Annual Income",
         ylab = "Spending Score")

kmeans_clustering$cluster
kmeans_clustering
