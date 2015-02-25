require 'rails_helper'



RSpec.describe UsersController, :type => :controller do
	 
	let(:valid_attributes){

		{
			name: "jim",
			email: "lippmanj1@gmail.com",
			bio: "student",
			username: "jimmy",
			password: "password123"

		}


	}
	
	let(:follow_attributes){

		{
			name: "sam",
			email: "lippmans1@gmail.com",
			bio: "student",
			username: "sammy",
			password: "password123"

		}


	}





	let(:valid_session) { {user_id: 1} }

    let(:invalid_attributes) {
        @invalid_attributes = {
            email: nil
        }
    }
 
 	

	describe "GET index" do
 
		it "returns http success" do
            get :index
            expect(response).to be_success
   		 end
	end
	
	describe "GET edit" do
        it "assigns the requested user as @user" do
            user = User.create! valid_attributes
            get :edit, {:id => user.to_param}, valid_session
            expect(assigns(:user)).to eq(user)
            expect(assigns(:custom_text)).to eq("Edit Account")
        end
    end

	describe "GET new" do
		it "assigns a new user as @user" do
            get :new, {}, valid_session
            expect(assigns(:user)).to be_a_new(User)
        end
	end

	describe "GET show" do
        it "assigns the requested user as @user" do
            user = User.create! valid_attributes
            get :show, {:id => user.to_param}, valid_session
            expect(assigns(:user)).to eq(user)
        end
    end


 	describe "POST create" do

        describe "with valid params" do

            it "creates a new User" do
                expect {
                    post :create, {user: valid_attributes}, valid_session
                }.to change(User, :count).by(1)
            end

            it "assigns a newly created user as @user" do
                post :create, {user: valid_attributes}, valid_session
                expect(assigns(:user)).to be_a(User)
                expect(assigns(:user)).to be_persisted
                expect(session[:user_id]).to eq(1)
            end

            

            it "redirects to the created dog" do
                post :create, {user: valid_attributes}, valid_session
                expect(response).to redirect_to(User.last)
            end

        end

    
        describe "with invalid params" do

            it "assigns a newly created but unsaved user as @user" do
                post :create, {user: invalid_attributes}, valid_session
                expect(assigns(:user)).to be_a_new(User)
            end

            it "re-renders the 'new' template" do
                post :create, {user: invalid_attributes}, valid_session
                expect(response).to render_template("new")
            end

        end
	end

	describe "PUT update" do

        describe "with valid params" do

            let(:new_attributes) {
                {
                name: "sam",
                user_id: 1
                }
            }

            it "updates the requested user" do
                user = User.create! valid_attributes
                put :update, {:id => user.to_param, :user => new_attributes}, valid_session
                user.reload
                expect(user.name).to eq("sam")
            end

            it "assigns the requested user as @user" do
                user = User.create! valid_attributes
                put :update, {:id => user.to_param, :user => valid_attributes}, valid_session
                expect(assigns(:user)).to eq(user)
            end

            it "redirects to the dog" do
                user = User.create! valid_attributes
                put :update, {:id => user.to_param, :user => valid_attributes}, valid_session
                expect(response).to redirect_to(user)
            end
        end

        describe "with invalid params" do
            it "assigns the user as @user" do
                user = User.create! valid_attributes
                put :update, {:id => user.to_param, :user => invalid_attributes}, valid_session
                expect(assigns(:user)).to eq(user)
            end

            # it "re-renders the 'edit' template" do
            #     user = User.create! valid_attributes
            #     put :update, {:id => user.to_param, :user => invalid_attributes}, valid_session
            #     expect(response).to render_template("edit")
            # end
        end
    end


    describe "DELETE destroy" do
        it "destroys the requested user" do
            user = User.create! valid_attributes
            expect { delete :destroy, {id: user.to_param}, valid_session
            }.to change(User, :count).by(-1)
        end

        it "redirects to the dogs list" do
            user = User.create! valid_attributes
            delete :destroy, {id: user.to_param}, valid_session
            expect(response).to redirect_to(users_url)
        end
    end

    describe "GET profile" do
    	context "contains a current user" do
		    it "it shows the current user profile" do
		    	user = User.create! valid_attributes 
		    	
		    	get :profile, {id: user.to_param}, valid_session
	    		expect(assigns(:comment)).to be_a_new(Comment)
	    		expect(assigns(:user)).to eq(user)
	    		expect(assigns(:users)).to eq([user])
	    		expect(response).to render_template('show')
	    end
    		
   		 end
   		 
   		 context "does not contain a current user" do
   		 	it "it redirects to the users index " do
	    		user = User.create! valid_attributes 
		    	
		    	get :profile, {id: user.to_param} 
   		 		expect(response).to redirect_to(root_url)
   		 	end
		 end
	end
	describe "POST follow" do
		it "creates a relation ship between current user and chosen user" do
			
			me = User.create! valid_attributes 
			user1 = User.create! follow_attributes 
						
			post :follow, {id: user1.to_param}, valid_session 
						
			expect(assigns(:user)).to eq(user1)
			expect(assigns(:rel)).to eq(Relationship.last)
			expect(me.following).to include(user1)
			expect(response).to redirect_to(profile_url)
		end
	end





	describe "POST unfollow" do
		it "creates a relation ship between current user and chosen user" do
			
			me = User.create! valid_attributes 
			user1 = User.create! follow_attributes 
			
			rel = Relationship.create follower_id: me.id, followed_id: user1.id		
			
			 post :unfollow, {id: user1.to_param}, valid_session 
						
			expect(assigns(:user)).to eq(user1)
		 	expect(Relationship.last).to eq(nil)
			
			 expect(response).to redirect_to(profile_url)
		end
	end
end


# def unfollow
#     @user = User.find(params[:id])
#     @rel = Relationship.where(follower_id: current_user.id, followed_id: @user.id)
#     @rel.first.destroy
#     redirect_to profile_path
#   end


