class <%= class_name %>BayesClassifierWordsController < ApplicationController

  def index
    @bayes_classifier_words = <%= class_name %>BayesClassifierWord.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bayes_classifier_words }
    end
  end

  # GET /bayes_classifier_words/1
  # GET /bayes_classifier_words/1.json
  def show
    @bayes_classifier_word = <%= class_name %>BayesClassifierWord.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bayes_classifier_word }
    end
  end

  # GET /bayes_classifier_words/new
  # GET /bayes_classifier_words/new.json
  def new
    @bayes_classifier_word = <%= class_name %>BayesClassifierWord.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bayes_classifier_word }
    end
  end

  # GET /bayes_classifier_words/1/edit
  def edit
    @bayes_classifier_word = <%= class_name %>BayesClassifierWord.find(params[:id])
  end

  # POST /bayes_classifier_words
  # POST /bayes_classifier_words.json
  def create
    @bayes_classifier_word = <%= class_name %>BayesClassifierWord.new(params[:<%= "#{file_name}" %>_bayes_classifier_word])

    respond_to do |format|
      if @bayes_classifier_word.save
        format.html { redirect_to @bayes_classifier_word, notice: 'BayesClassifierWord was successfully created.' }
        format.json { render json: @bayes_classifier_word, status: :created, location: @bayes_classifier_word }
      else
        format.html { render action: "new" }
        format.json { render json: @bayes_classifier_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bayes_classifier_words/1
  # PUT /bayes_classifier_words/1.json
  def update
    @bayes_classifier_word = <%= class_name %>BayesClassifierWord.find(params[:id])

    respond_to do |format|
      if @bayes_classifier_word.update_attributes(params[:<%= "#{file_name}" %>_bayes_classifier_word])
        format.html { redirect_to @bayes_classifier_word, notice: 'BayesClassifierWord was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bayes_classifier_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bayes_classifier_words/1
  # DELETE /bayes_classifier_words/1.json
  def destroy
    @bayes_classifier_word = <%= class_name %>BayesClassifierWord.find(params[:id])
    @bayes_classifier_word.destroy

    respond_to do |format|
      format.html { redirect_to <%= "#{file_name}" %>_bayes_classifier_words_url }
      format.json { head :no_content }
    end
  end

end
