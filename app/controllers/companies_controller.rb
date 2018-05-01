class CompaniesController < ApplicationController
 
 before_action :set_company, only: [:show, :edit, :update]
 before_action :authenticate_user!, except: [:show]
 
   
   def index
       @Companies = current_user.companies
   end
   
   def new
       @company = current_user.companies.build
   end
   
   def create
      @company = current_user.companies.build(company_params)
        if @company.save
          redirect_to @company, notice:"Votre entreprise à été ajouté avec succès"
        else
             render :new
        end
   end
   
   def show
   end
   
   def edit
   end
   
   def update
       if @comapny.update(company_params)
           redirect_to @company, notice:"Modifications enregistrée..."
       else
           render :edit
       end
   end
   
   
   private
    def set_company
        @company = Company.find(params[:id])
    end
    
    def company_params
       params.require(:company).permit(:category_artisan, :listingname, :summary, :address, :phone, :siret, :price) 
    end
    
    
end