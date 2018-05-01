class PhotosController < ApplicationController
   
   def destroy
      @photo = Photo.find(params[:id])
      company = @photo.company
   
   @photo.destroy
   
   @photos = Photo.where(company_id: company_id)
   
   respond_to :js
   
   end
    
end