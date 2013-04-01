class PollsController < ApplicationController
  # GET /polls
  # GET /polls.json
  def index
    @polls = Poll.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @polls }
    end
  end

  # GET /polls/1
  # GET /polls/1.json
  def show
    @poll = Poll.find(params[:id])
    @comments = Comment.includes(:user).joins(:user => :poll_votes).where('comments.poll_id = poll_votes.poll_id AND comments.poll_id = ?', params[:id])
    if params[:filter].present?
      @comments = @comments.where('poll_votes.poll_option_id = ?', params[:filter])
    end
    if signed_in?
      @comment = Comment.new(poll_id: params[:id], user_id: current_user.id)
      @poll_vote = PollVote.find_or_initialize_by_poll_id_and_user_id(params[:id], current_user.id)
      @poll_vote.save
    else
      @comment = Comment.new
      @poll_vote = PollVote.new
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @poll }
    end
  end

  # GET /polls/new
  # GET /polls/new.json
  def new
    if signed_in?
      @poll = Poll.new(user_id: current_user.id)
      2.times { @poll.poll_options.build }
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @poll }
      end
    else
      redirect_to "/signin"
    end
  end

  # GET /polls/1/edit
  def edit
    @poll = Poll.find(params[:id])
  end

  # POST /polls
  # POST /polls.json
  def create
    @poll = Poll.new(params[:poll])
    if signed_in?
      @poll.user_id = current_user.id
    else
      @poll.user_id = nil
    end
    respond_to do |format|
      if @poll.save
        format.html { redirect_to @poll, notice: "Poll was successfully created." }
        format.json { render json: @poll, status: :created, location: @poll }
      else
        format.html { render action: "new" }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /polls/1
  # PUT /polls/1.json
  def update
    @poll = Poll.find(params[:id])
    respond_to do |format|
      if @poll.update_attributes(params[:poll])
        format.html { redirect_to @poll, notice: "Poll was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /polls/1
  # DELETE /polls/1.json
  def destroy
    if signed_in?
      @poll = Poll.find(params[:id])
      if current_user.id == @poll.user_id
        @poll.destroy
        respond_to do |format|
          format.html { redirect_to polls_url }
          format.json { head :no_content }
        end
      else
        respond_to do |format|
          format.html { redirect_to @poll, alert: "Cannot delete a poll you did not create." }
          format.json { head :no_content }
        end
      end
    end

  end

end
