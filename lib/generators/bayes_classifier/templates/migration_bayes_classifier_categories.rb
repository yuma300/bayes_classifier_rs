class Create<%= class_name %>BayesClassifierCategories < ActiveRecord::Migration
  def change
    create_table :<%= "#{file_name}_classifier_categories".pluralize %> do |t|
      t.string :name

      t.timestamps
    end
  end
end
