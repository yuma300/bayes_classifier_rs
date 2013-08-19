Rails.application.routes.draw do

  mount BayesClassifierRs::Engine => "/bayes_classifier_rs"
end
