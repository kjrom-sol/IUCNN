% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bnn_load_data.R
\name{bnn_load_data}
\alias{bnn_load_data}
\title{Prepare feature data for input into Bayesian Neural Network (BNN)}
\usage{
bnn_load_data(
  features,
  labels,
  seed = 1234,
  testsize = 0.1,
  all_class_in_testset = TRUE,
  header = TRUE,
  instance_id = TRUE,
  from_file = FALSE
)
}
\arguments{
\item{features}{data.frame or filepath. A data.frame containing numeric feature values for a set of instances (rows),
e.g. output from geo_features(), biome_features(), and/or clim_features().
Alternatively this can be a filepath, in which case set "from_file" to TRUE.}

\item{labels}{list or filepath. A list of category labels for all instances present in the dataframe provided as features.
Alternatively this can be a filepath, in which case set "from_file" to TRUE.}

\item{seed}{integer. Set seed for random separation of data into training and test set.}

\item{testsize}{numeric. Determines the fraction of data that should be set aside as test set.}

\item{all_class_in_testset}{logical. Set to TRUE if all classes should be represented in the test set.}

\item{header}{logical. If TRUE, the function assumes that the dataframe contains column names (this matters mainly when loading from file).}

\item{instance_id}{logical. If TRUE, the function assumes that the first column contains the names of the instances.}

\item{from_file}{logical. If TRUE, the function will try to load the features from a txt file.
In that case provide filepaths as "features" and "labels" input.}
}
\value{
a list of features and labels, as well as other information (converted from a python dictionary)
}
\description{
Transforms a data frame of features and category labels into the format required for running BNN
training or prediction. Optionally the data can be split into a training and test set.
}
\details{
\itemize{
\item 
}
}
\examples{

bnn_data = bnn_get_data(features,
                       labels,
                       seed=1234,
                       testsize=0.1,
                       all_class_in_testset=TRUE,
                       header=TRUE, # input data has a header
                       instance_id=TRUE, # input data includes names of instances
                       from_file=FALSE)
}
\seealso{
Other Feature preparation: 
\code{\link{bias_features}()},
\code{\link{biome_features}()},
\code{\link{clim_features}()},
\code{\link{footprint_features}()},
\code{\link{geo_features}()}
}
\concept{Feature preparation}
\keyword{Feature}
\keyword{preparation}
