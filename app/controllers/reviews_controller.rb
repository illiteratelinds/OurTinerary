class ReviewsController < ApplicationController

  def create
    @reviewable = find_reviewable
    @review = @reviewable.reviews.build(review_params)
    if @review.save
      flash[:notice] = "Successfully created review."
      redirect_to :back
    else
      render :action => 'new'
    end
  end

  private

    def find_reviewable
      params.each do |name, value|
        if name =~ /(.+)_id$/
          return $1.classify.constantize.find(value)
        end
      end
      nil
    end

    def review_params
      params.require(:comment).permit(:content, :creator_id, :rating)
    end

end
