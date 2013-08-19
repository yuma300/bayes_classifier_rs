class <%= class_name %>BayesClassifier < ApplicationService
  @@bayes_classifier = nil

  def self.set_log(logdev, loglevel)
    @log = Logger.new(logdev)
    @log.level = loglevel
  end

  def self.initialize_bayes
    if @@log == nil
      self.set_log(STDOUT, Logger::ERROR)
    end
    @@log.debug("initialize bayesian filter")
    categories = <%= class_name %>BayesClassifierCategory.all
    words = <%= class_name %>BayesClassifierWord.all
    @@bayes = BayesClassifierRs::BayesClassifier.new(categories, words)
    wakati = MeCab::Tagger.new('-O wakati')
    categories = BayesianCategory.find(:all)
    categories.each do |categorie|
      @@bayes.add_category(categorie.name)
    end
    @@log.debug("initialize bayesian filter completed")
  end


end
