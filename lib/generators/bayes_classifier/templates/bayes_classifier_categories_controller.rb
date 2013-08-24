class <%= class_name %>BayesClassifierCategoriesController < ApplicationController

  def index
    @bayes_classifier_categories = <%= class_name %>BayesClassifierCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bayes_classifier_categories }
    end
  end

  # GET /bayes_classifier_categories/1
  # GET /bayes_classifier_categories/1.json
  def show
    @bayes_classifier_category = <%= class_name %>BayesClassifierCategory.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bayes_classifier_category }
    end
  end

  # GET /bayes_classifier_categories/new
  # GET /bayes_classifier_categories/new.json
  def new
    @bayes_classifier_category = <%= class_name %>BayesClassifierCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bayes_classifier_category }
    end
  end

  # GET /bayes_classifier_categories/1/edit
  def edit
    @bayes_classifier_category = <%= class_name %>BayesClassifierCategory.find(params[:id])
  end

  # POST /bayes_classifier_categories
  # POST /bayes_classifier_categories.json
  def create
    @bayes_classifier_category = <%= class_name %>BayesClassifierCategory.new(params[:<%= "#{file_name}" %>_bayes_classifier_category])

    respond_to do |format|
      if @bayes_classifier_category.save
        format.html { redirect_to @bayes_classifier_category, notice: 'BayesClassifierCategory was successfully created.' }
        format.json { render json: @bayes_classifier_category, status: :created, location: @bayes_classifier_category }
      else
        format.html { render action: "new" }
        format.json { render json: @bayes_classifier_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bayes_classifier_categories/1
  # PUT /bayes_classifier_categories/1.json
  def update
    @bayes_classifier_category = <%= class_name %>BayesClassifierCategory.find(params[:id])

    respond_to do |format|
      if @bayes_classifier_category.update_attributes(params[:<%= "#{file_name}" %>_bayes_classifier_category])
        format.html { redirect_to @bayes_classifier_category, notice: 'BayesClassifierCategory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bayes_classifier_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bayes_classifier_categories/1
  # DELETE /bayes_classifier_categories/1.json
  def destroy
    @bayes_classifier_category = <%= class_name %>BayesClassifierCategory.find(params[:id])
    @bayes_classifier_category.destroy

    respond_to do |format|
      format.html { redirect_to <%= "#{file_name}" %>_bayes_classifier_categories_url }
      format.json { head :no_content }
    end
  end

end
