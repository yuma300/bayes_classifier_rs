class Create<%= class_name %>ClassifierWords < ActiveRecord::Migration
  def change
    create_table :<%= "#{file_name}_classifier_words".pluralize %> do |t|
      t.integer :<%= "#{file_name}_classifier_category_id" %> 
      t.string :words

      t.timestamps
    end
  end
end
