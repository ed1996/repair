class ReviewsController < ApplicationController
    
    def create
       @review = current_user.reviews.create(review_params) 
        redirect_to @review.company
    end
    
    def destroy
        @review = Review.find(params[:id])
        company = @review.company
        @review.destroy
        redirect_to company
    end
    
    
    
   private
   def review_params
       params.require(:review).permit(:comment, :star, :company_id)
   end
    
    
    
end