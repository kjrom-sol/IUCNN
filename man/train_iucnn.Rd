% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/train_iucnn.R
\name{train_iucnn}
\alias{train_iucnn}
\title{Train an IUCNN Model}
\usage{
train_iucnn(
  x,
  labels,
  path_to_output = "",
  model_name = "iuc_nn_model",
  validation_split = 0.1,
  test_fraction = 0.1,
  seed = 1234,
  max_epochs = 1000,
  n_layers = c(60, 60, 20),
  use_bias = 1,
  act_f = "relu",
  patience = 10,
  randomize_instances = FALSE
)
}
\arguments{
\item{x}{a data.set, containing a column "species" with the species names, and
subsequent columns with different features, in the same order as used for \code{\link{predict_iucnn}}.}

\item{labels}{a data.frame with two columns, first "species" with the species name,
second "labels with the labels (i.e. IUCN categories).}

\item{path_to_output}{character string. The path to the location
where the IUCNN model shall be saved}

\item{model_name}{character string. The name used to save the trained model.}

\item{validation_split}{numeric. The fraction of the input data used as validation set.}

\item{test_fraction}{numeric. The fraction of the input data used as test set.}

\item{seed}{reset the python random seed.}

\item{max_epochs}{integer. The maximum number of epochs.}

\item{n_layers}{numeric vector with length of at least one. The vector quantifies the number of nodes
used in each hidden layer of the neural network. This also implicitly specifies the number of hidden
layers. For example, n_layers = c(60, 10) defines a model with two hidden layers with 60 and 10 nodes
respectively. Note that the number of nodes in the output layer is automatically determined based on
the number of unique labels in the training set.}

\item{use_bias}{integer (1/0). Specifies if a bias node is used in the first hidden layer.}

\item{act_f}{character string. Specifies the activation function should be used in the hidden layers.
Available options are: "relu" (default), "tanh", "sigmoid"}

\item{patience}{integer. Number of epochs with no improvement after which training will be stopped.}
}
\value{
a folder in the working directory (or as specified with path_to_output) with the trained model,
for use by \code{\link{predict_iucnn}}.
}
\description{
Trains an IUCNN model based on a data,frame of features,
for instance generated by \code{\link{geo_features}}, |link{clim_features}, and \code{\link{biome_features}},
and a dataset of labels, (i.e. IUCNN classes) for each species.
}
\note{
See \code{vignette("Approximate_IUCN_Red_List_assessments_with_IUCNN")} for a
tutorial on how to run IUCNN.
}
\examples{
\dontrun{
dat <- data.frame(species = c("A", "B")
                decimallongitude = runif (200,-5,5),
                decimallatitude = runif (200,-5,5))
labels <- c(1,0)

train_feat <- geo_features(dat)

not_eval <- data.frame(species = c(A", "B")
                decimallongitude = runif (200,-5,5),
                decimallatitude = runif (200,-5,5))

predict_feat <- geo_features(not_eval)

train_iucnn(x = train_feat,
           label = labels)


predict_iucnn(x = predict_feat,
             model_dir = iuc_nn_model")
}


}
\keyword{Prediction}
