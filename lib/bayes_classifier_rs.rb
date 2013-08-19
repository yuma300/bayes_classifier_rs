require "bayes_classifier_rs/engine"

module BayesClassifierRs

  require 'nkf'
  require 'classifier'
  require 'mecab_utils'
  require 'madeleine'
  require 'logger'

  #class String
  #  alias_method :original_stem, :stem
  #  def stem
  #    self.original_stem.force_encoding(self.encoding) 
  #  end
  #end
  #
  #class MeCab::Tagger
  #  alias_method :original_parse, :parse
  #  def parse(text)
  #    original_parse(text).force_encoding(text.encoding)
  #  end
  #end

  class BayesClassifier
    @bayes = nil
    @log = nil

    def set_log(logdev, loglevel)
      @log = Logger.new(logdev)
      @log.level = loglevel
    end

    def initialize(categories, words)
      @log.debug("initialize bayesian filter")
      if @log == nil
        self.set_log(STDOUT, Logger::ERROR)
      end
      @bayes = Classifier::Bayes.new
      wakati = MeCab::Tagger.new('-O wakati')
      categories.each do |categorie|
        @@bayes.add_category(categorie.name)
      end
      words.each do |word_obj|
        if word_obj.bayesian_category != nil
          @@bayes.train(word_obj.bayesian_category.name, MecabUtils.parse_noun_string(word_obj.sentence)) 
        end
      end
      @@log.debug("initialize bayesian filter completed")
    end

    def check_text(text, params = {})
      wakati = MeCab::Tagger.new('-O wakati')
      if @@bayes == nil
        self.initialize_bayes
      end
      evaluate_text = text.gsub(/<("[^"]*"|'[^']*'|[^'">])*>/, "")
      evaluate_text = MecabUtils.parse_noun_string(evaluate_text)
      @@log.debug("This is extracted nouns from evalute sentence")
      @@log.debug(evaluate_text)
      classifications = @@bayes.classifications(evaluate_text).inspect
      @@log.debug(classifications)
      classify = @@bayes.classify(evaluate_text)
      classified_bayesian_category = BayesianCategory.find(:first, :conditions => { :name => classify })
      return {classify: classify, classifications: classifications}
    end

    def get_learn_status
      bayes = Classifier::Bayes.new
      wakati = MeCab::Tagger.new('-O wakati')
      categories = BayesianCategory.find(:all)
      categories.each do |categorie|
        bayes.add_category(categorie.name)
      end
      bayse_sentences = BayesianLearnedSentence.find(:all)
      bayse_sentences.each do |bayse_sentence_obj|
        if bayse_sentence_obj.bayesian_category != nil
          bayes.train(bayse_sentence_obj.bayesian_category.name, MecabUtils.parse_noun_string(bayse_sentence_obj.sentence)) 
        end
      end
      categories = bayes.instance_variable_get('@categories') if bayes.instance_variable_defined?('@categories')
      return categories
    end
  end
end
