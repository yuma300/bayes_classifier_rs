require 'rails/generators'
require 'rails/generators/migration'
require 'rails/generators/active_record'

class BayesClassifierGenerator < ActiveRecord::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  include Rails::Generators::Migration

  def create_bayes_classifier_files
    migration_template "migration_bayes_classifier_categories.rb", "db/migrate/create_#{file_name}_bayes_classifier_categories.rb"
    migration_template "migration_bayes_classifier_words.rb", "db/migrate/create_#{file_name}_bayes_classifier_words.rb"
    template 'bayes_classifier_category.rb', File.join('app/model', '', "#{file_name}_bayes_classifier_category.rb")
    template 'bayes_classifier_word.rb', File.join('app/model', '', "#{file_name}_bayes_classifier_word.rb")
    template 'bayes_classifier.rb', File.join('app', class_path, "#{file_name}_bayes_classifier.rb")
  end
end
