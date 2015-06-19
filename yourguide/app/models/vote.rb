class Vote
  def initialize(user_id, tour_id, up_vote)
    @user_id = user_id
    @tour_id = tour_id
    @up_vote = up_vote
  end

  def mongoize
    [ @user_id, @tour_id, @up_vote ]
  end
end
