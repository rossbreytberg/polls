class PollVotesController < ApplicationController
  # GET /poll_votes
  # GET /poll_votes.json
  def index
    @poll_votes = PollVote.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @poll_votes }
    end
  end

  # GET /poll_votes/1
  # GET /poll_votes/1.json
  def show
    @poll_vote = PollVote.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @poll_vote }
    end
  end

  # GET /poll_votes/new
  # GET /poll_votes/new.json
  def new
    if signed_in?
      @poll_vote = PollVote.new(user_id: current_user.id)
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @poll_vote }
      end
    else
      redirect_to "/signin"
    end
  end

  # GET /poll_votes/1/edit
  def edit
    @poll_vote = PollVote.find(params[:id])
  end

  # POST /poll_votes
  # POST /poll_votes.json
  def create
    @poll_vote = PollVote.new(params[:poll_vote])
    if signed_in?
      @poll_vote.user_id = current_user.id
      respond_to do |format|
        if @poll_vote.save
          format.html { redirect_to @poll_vote.poll, notice: 'Vote was successfully cast.' }
          format.json { render json: @poll_vote.poll, status: :created, location: @poll_vote.poll }
        else
          format.html { render action: "new" }
          format.json { render json: @poll_vote.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to "/signin"
    end
  end

  # PUT /poll_votes/1
  # PUT /poll_votes/1.json
  def update
    @poll_vote = PollVote.find(params[:id])
    respond_to do |format|
      if @poll_vote.update_attributes(params[:poll_vote])
        format.html { redirect_to @poll_vote.poll, notice: 'Vote was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @poll_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /poll_votes/1
  # DELETE /poll_votes/1.json
  def destroy
    @poll_vote = PollVote.find(params[:id])
    @poll_vote.destroy

    respond_to do |format|
      format.html { redirect_to polls_url }
      format.json { head :no_content }
    end
  end

end
