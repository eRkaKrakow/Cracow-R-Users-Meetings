We are happy to announce tenth eRka meetup. If there will be interest from non-polish speakers then presentations will be delivered in English.

### WHEN?

September 30th, 06:30-8:00 pm

### WHERE?

Wydział Fizyki, Matematyki i Informatyki PK, Podchorążych 1, sala 101

### REGISTRATION:

Registration through meetup or facebook.

### AGENDA:

18:30 – 18:40 – Welcome

18:40 – 19:15 – "Convex Clustering and Biclustering with application in R" – Marta Karaś

19:25 – 20:00 – "Rocker: explanation and motivation for Docker containers usage in applications development [by R user, for R users]" – Marcin Kosiński

### BIOs and presentations abstracts

**Marta Karaś**

Marta Karaś earned a Master in Mathematics at Wroclaw University of Technology. Her specialization is Mathematical Statistics. Currently, she is working as a Business Analyst with Opera Software in Wroclaw, where she established methodology for A/B-test results analysis and perform Opera's product user base analysis on daily basis. Academically, Marta's primary interest lies in statistical methods for multidimensional data analysis. She has recently spent half a year at Indiana University in USA, developing and applying advanced regularized statistical approaches to determine what imaging markers obtained from brain imaging data are associated with alcohol use disorder risk factors. R & Python enthusiast (but please bold "R").

Presentation: **Convex Clustering and Biclustering with application in R**

We perform clustering when we want to group or segment the data set into subsets so that those within each subset are more closely related to others than those objects assigned to other subsets. Commonly used clustering algorithms are K-means and Hierarchical Clustering, which are both fast and simple (intuitive) algorithms. However, these algorithms depend highly on initializations (choice of number of clusters K / starting points / a measure of dissimilarity between two clusters) and thus yield local, unstable results. Here, we will answer the question: Can we formulate a convex method for clustering that will yield a unique & global solution? We will incorporate the idea of fusing mean column vectors together to form clusters. We will utilize appropriate algorithm implementations from `cvxclustr` and `cvxbiclustr` R packages on breast cancer data to find groups of patients (subtypes) and groups of genes (genomic signatures) that separate subtypes.

**Marcin Kosiński**

Marcin Kosiński has a master degree in Mathematical Statistics and Data Analysis specialty and is working in the Research and Development Department at the biggest polish news web portal. Challenges seeker and big R package enthusiast. Currently working in the field of large-scale online learning and various approaches to personalized news article recommendation. Co-organizer of the +900 members R Enthusiasts meetups in Warsaw. Interested in R packages development and survival analysis models. He also worked as a subject matter expert at +2000 members Data.

Presentation: **Rocker: explanation and motivation for Docker containers usage in applications development [by R user, for R users]**

As R users we mostly perform analysis, produce reports and create interactive shiny applications. Those are rather one-time performances. Sometimes, however, the R developer enters the world of the real software development, where R applications should be built once and then distributed and maintained on many machines.
What are the best practices in distributing the software? How can we ensure the code will always run the same regardless of its environment? Is there a way to skip the manual and long-lasting installation process if the software have been built once? Why using Docker in shipping the software is crucial?
Docker is the world’s leading software containerization platform. Docker containers wrap a piece of software in a complete filesystem that contains everything needed to run: code, runtime, system tools, system libraries – anything that can be installed on a server. This guarantees that the software will always run the same, regardless of its environment.
In my presentation I'll give a brief introduction to Docker and provide a full motivation for using this technology in a regular R work. I strongly belief Docker can improve the data analysis to be more reproducible and can facilitate the software development so that the distribution and maintenance can be easier.
The presentation will be said by the person with the R background, assuming that the audience is also experienced in R. Get motivated: http://r-addict.com/2016/05/13/Docker-Motivation.html.