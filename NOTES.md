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
