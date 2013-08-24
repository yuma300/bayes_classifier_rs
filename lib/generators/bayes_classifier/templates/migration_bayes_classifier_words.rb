class Create<%= class_name %>BayesClassifierWords < ActiveRecord::Migration
  def change
    create_table :<%= "#{file_name}_bayes_classifier_words".pluralize %> do |t|
      t.integer :<%= "#{file_name}_bayes_classifier_category_id" %> 
      t.string :words

      t.timestamps
    end
  end
end
