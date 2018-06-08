class PagesController < ApplicationController
    def home
        @companies = Company.order("RANDOM()").limit(3)
    end
    
    def contact
    end
    
    def search
        if params[:search].present? && params[:search].strip != "" && params[:category_artisan].present? 
           session[:myrepair_search] = params[:search] 
       else
           redirect_to root_path, notice:"Veuillez remplir tout les champs..."
        end
        
        arrResult = Array.new
        
        if session[:myrepair_search] && session[:myrepair_search] != ""
           @companies_address = Company.where(category_artisan: params[:category_artisan]).near(session[:myrepair_search], 5, order:'distance')
       else
           redirect_to root_path, notice:"Modifications enregistrée..."
        end
        
        
        
        @search = @companies_address.ransack(params[:q])
        @companies = @search.result
        
        @arrCompanies = @companies.to_a
        
        
    end
    
    def searchcompany
        if params[:searchcompany].present? && params[:searchcompany].strip != ""
           session[:myrepair_search] = params[:searchcompany] 
        end
        
        arrResultcompany = Array.new
        
        if session[:myrepair_search] && session[:myrepair_search] != ""
           @companies_category = Company.where(category_artisan: params[:category_artisan])
       else
           @companies_category = Company.all
        end
        
        @searchcompany = @companies_category.ransack(params[:q])
        @companiescategory = @searchcompany.result
        
        @arrCompaniescategory = @companiescategory.to_a
    end

end
