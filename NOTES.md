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
