class ChargesController < ApplicationController
 def create
   @user = User.find(current_user)
   @user.role = 'premium'
   @user.save
   
   # Creates a Stripe Customer object, for associating
   # with the charge
   customer = Stripe::Customer.create(
     email: current_user.email,
     card: params[:stripeToken]
   )
 
   # Where the real magic happens
   charge = Stripe::Charge.create(
     customer: customer.id, # Note -- this is NOT the user_id in your app
     amount: 15_00,
     description: "Premium Membership - #{current_user.email}",
     currency: 'usd'
   )
   
   
   flash[:notice] = "You have now been updated to a Premium Account, #{current_user.email}"
   redirect_to wikis_path # or wherever
 
 
   # Stripe will send back CardErrors, with friendly messages
   # when something goes wrong.
   # This `rescue block` catches and displays those errors.
   rescue Stripe::CardError => e
     flash[:alert] = e.message
     redirect_to new_charge_path
 end
 
 def new
   @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "Premium Membership - #{current_user.email}",
     amount: 15_00
   }
 end
 
 def downgrade
    if current_user.premium?
       current_user.update_attribute(:role, 'standard')
       flash[:notice] = "You have now been downgraded to a Standard Account, #{current_user.email}"
       redirect_to root_path
    else
      flash[:notice] = "You have a standard account, #{current_user.email}"
       redirect_to root_path
    end
 end
 
end
