Requirements
[X] Use the Ruby on Rails framework. #Using Ruby on Rails

Your models must:

[X] Include at least one has_many, at least one belongs_to, and at least two has_many :through relationships #users has many recipes, comments, ratings. Recipes has many ingredients through recipe_ingredients. Recipes has many categories through recipe_category. Recipe belongs to user.

[X] Include a many-to-many relationship implemented with has_many :through associations. The join table must include a user-submittable attribute — that is to say, some attribute other than its foreign keys that can be submitted by the app's user. #See abvove

[X] Your models must include reasonable validations for the simple attributes. You don't need to add every possible validation or duplicates, such as presence and a minimum length, but the models should defend against invalid data. #All models have validation. 

[X] You must include at least one class level ActiveRecord scope method. a. Your scope method must be chainable, meaning that you must use ActiveRecord Query methods within it (such as .where and .order) rather than native ruby methods (such as #find_all or #sort). #sort by user name and sort by new and old recipes. 

[X] Your application must provide standard user authentication, including signup, login, logout, and passwords. #there is create account, login with password. 

[X] Your authentication system must also allow login from some other service. Facebook, Twitter, Foursquare, Github, etc... #Login via Facebook

[X] You must include and make use of a nested resource with the appropriate RESTful URLs. #resources :users with nested resources :recipes

[X] You must include a nested new route with form that relates to the parent resource # has new recipe route

[X] You must include a nested index or show route #has new recipe index and show routes

[X] Your forms should correctly display validation errors. #displayed for recipe forms

[X] Your fields should be enclosed within a fields_with_errors class  #displayed under recipe forms

[X] Error messages describing the validation failures must be present within the view. #presented within the recipe forms view

[X] Your application must be, within reason, a DRY (Do-Not-Repeat-Yourself) rails app. #DRY _form, _error

[X] Logic present in your controllers should be encapsulated as methods in your models. #see code

[X] Your views should use helper methods and partials when appropriate. #helper and partial within the code

[X] Follow patterns in the Rails Style Guide and the Ruby Style Guide. #followed

[X] Do not use scaffolding to build your project. Your goal here is to learn. Scaffold is a way to get up and running quickly, but learning a lot is not one of the benefits of scaffolding. #did not use scaffolding

Instructions
[X] Create a new repository on GitHub for your Rails application. #done

[X] When you create the Rails app for your assessment, add the spec.md file from this repo to the root directory of the project, commit it to Git and push it up to GitHub. You will use this file as a personal checklist of requirements as you complete the project. #done

[X] Build your application. Make sure to commit early and commit often. Commit messages should be meaningful (clearly describe what you're doing in the commit) and accurate (there should be nothing in the commit that doesn't match the description in the commit message). Good rule of thumb is to commit every 3-7 mins of actual coding time. Most of your commits should have under 15 lines of code and a 2 line commit is perfectly acceptable. This is important and you'll be graded on this. #done

[X] Record at least a 30 min coding session. During the session, either think out loud or not. It's up to you. You don't need to submit it, but we may ask for it at a later time. #done

[X] Make sure to check each box in your spec.md (replace the space between the square braces with an x) and explain next to each one how you've met the requirement before you submit your project. #done

[X] Write a README.md. #done

[X] Submit a video of how a user would interact with your working web application. #done

[X] Write a blog post about the project and process.# done

[X] When done, submit your GitHub repo's url, a link to your video demo, and a link to your blog post in the corresponding text boxes in the right rail. Hit "I'm done" to wrap it up. #done