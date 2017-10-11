This app is going to be a dyi app.  It have 'projects.'  These projects will describe how do basic repairs of all kinds (categories).  For instance, you could read how to change a lightbulb, how to unclog a toilet, how  to change a car's carburetor, change the oil, stain a front door, etc.  The user will be able to view the list of projects, but will need to be signed in to view the details.  A signed in user can create a project, retrieve projects, update it and delete it.  The user will be able to comment on other projects, offering tips, asking, etc.  

To get started, I wanted to get the basic join table figured out.  
~ projects
~ categories
~ project_categories

* Project
    has_many :project_categories
    has_many :categories, through: :project_categories

* ProjectCategory
    belongs_to :project
    belongs_to :category

* Category
    has_many :project_categories
    has_many :projects, through: :project_categories

So, to get up and running, I can create a migration for projects, create a model, routes and views.  I can do the for categories, and users.  
  ~ Should a do rails g resource?
    * rails g resource Project, will build a migration, called 'projects', a model, a controller and routes.  

PROBLEM! When I start the local server, rails s, it get tcp://0.0.0.0:3000 for my IP address.  Haven't tried everything, but I did throw a question out to Slack. I'm fucking tired, and don't think I'm going to mess with this today.  Got a response from Slack, but don't understand it.  I don't know if it's solution or just an explanation.  Somebody cut a pasted an article from Overslack.  It was of little help.  

So, clearly I'm in a fowl mood.  The explanation offered from slack was actually helpful, and my app is up and running.  

Okay, small accomplishment, but good way to end the day on: was able to render a message from the projects index page.

I'm going to do a little styling.  I want to work on a basic template, that will include a drop down window for 'categories,' in addition to sign in, sign up, sign out and a home button.  

At this point, I'm kind of messing around.  I working on some styling.  I added an image, and messing with some opacity.  Trying to figure out how to make it a back ground image.

Preparing for work today, I was reviewing one of the first lessons, and decided I'm going to make some basic test for this app.  
  * The helpers, mailers, and models directories are meant to hold tests for view helpers, mailers, and models, respectively. The controllers directory is meant to hold tests for controllers, routes, and views. The integration directory is meant to hold tests for interactions between controllers.

Wrote and ran my first test
 * test "should not save project without title" do
     project = Project.new
     assert_not project.save, 'Saved project with out title'
   end
 * terminal ~> rails test test/models/project_test.rb:9
  ~ Where :9 is the line we want tested.  
 * Got error to pass by including a simple validation at the model level
  ~ validates :title, presence: true

I'm going to add rspec to my app.  
  * I've updated my gem file: 'gem 'rspec-rails', '~> 3.0''
  * ran 'bundle install'
  * ran 'rails g rspec:install'
  * created a file: spec/models/project_spec.rb
   ~ and included:
      require 'rails_helper'

        describe Project do
          it 'can be created' do
            #project = Project.create!(title: "My title", description: "The post description")
            project = Project.create!(title: "My title")
            expect(project).to be_valid
          end
        end
  * Then ran: 'bundle exec rspec'

As I build out features and functionality, try and include a test, to insure proper functionality.  

Going to review associations, and figure out how I should build correct associations for dyi_app.  

Adding a User migration, model, controller and routes, and adding user_id to projects table.  Then wire them together with appropriate association.

Now, that I have a user, do I want to add omniauth authentication?  

Okay, so I've been reviewing and practicing on a dummy app, and I'm ready to handle user signup, login, logout.
  * First, let me handle secure_password
    ~ bcrypt to gem file
    ~ has_secure_password in User model
    ~ add password_digest to users table
  * Then handle session login
    ~ session routes
    ~ session controller
      * sessions#new
      * sessions#create
      * sessions#destroy
    ~ session form view
      * new

So I've got the signup, login/logout up and running
I still need to do login with github, facebook, etc.  
Also, I need to refactor the views and incorporate partials and helpers.  
  * I want to include, in ApplicationController,
    ~ authentication_required
    ~ logged_in?
    ~ current_user
    # These method do no permeate to your Actioview, unless you add
      * helper_method :current_user, :logged_in?

So I'm going to build the Project/Category/ProjectCategory association. This is a has_many, through relationship, and I will need to build a join table.  
  * Nest routes project[category]
  * Migration
  * Model
  * Macroprogramming
  * belongs_to :user, ~> option (it's in the dummy app)
  * allow_nested_attributes (build method to do this)
  * Views form

All working well. Going to style the form page a little, and then move on to link_to categories and projects.

Going to add the project index page. Here the user will be able to search categories or specific projects.  

I will link to a project show page
I will link to a category show page.
  * Going to refactor with a users#new view with a partial.
  * Also, adding some bootstrap styling to signup page.

I pretty sure I'm using the nested routes wrong.
    * The idea was when I looked at a category, categories/:id, I could then pick a project, seemingly, nested in the category, categories/:id/projects/:id.  However, there is nothing nested. Just a link_to categories/:id, and a link_to projects/:id

So, today I'm going to establish my nested resources. Namely, I want the user to be able to look up a project, with projects/:id, and then make a comment on that project, with projects/:id/comments/new.  

To do this I will need to have nested resource,
  * resources :projects, only: [:show, :index] do
      resources :comments, only: [:show, :index, :new]
    end
Then I will need to create a comments table, model, controller and views.
  * Additionally, I want to create div with a scrollbar.  
Also, going to add two flash[:alerts] for Users validations

So my nested resources is working. I need to now do two things, make sure a user can edit/delete their project(s), and a user can edit/delete their comment(s)

I want to figure out a way to assign the user_id to a project that is created.  

I ran into a small problem. When I am creating a new project, if I don't fill out the category portion (not the checkbox), an empty space gets created.  

I'm going to work on adding the sign in through github today, and correct the categories_attributes= method,
