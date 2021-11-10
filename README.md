1. ============= Introduction =================== 

Ruby on Rails, or Rails, is a server-side web application framework written in Ruby under the MIT License. Rails is a model–view–controller framework, providing default structures for a database, a web service, and web pages. 

official website 
https://rubyonrails.org/

learn ruby on rails
https://www.tutorialspoint.com/ruby-on-rails/index.htm

for install ruby gems like devise, bootstrap-sass etc
https://rubygems.org/
 
2. ============= MVC Architecture ===================
Ruby on Rails uses the Model-View-Controller (MVC) architectural pattern. MVC is a pattern for the architecture of a software application.

View => html file
Modal => Database
Controller => Logic

Router ==============> Controller ================> View
                            ||
                            ||
                        Model (database)

3. ========== Route / controller and views ==================

    rails generate controller Book
    It creates a file called app/controllers/book_controller.rb

    It creates a file called app/controllers/book_controller.rb
    class BookController < ApplicationController
        def home 

        end 
    end

    for view
    add views in app/views
    create book folder iniside book views folder and add file home.html.erb 

    now add rooute like 
    add route in config/routes.rb
    get 'book/home', to: 'book#home'

    for root Route
    root 'book#home'

4. =================== Git Basic commands ===========================
git init 
git add . 
git commit -m "your msg"
git remote add origin repolink 
git push -u origin master 

git remote -v 
git status

<!-- for create new branch  -->
git checkout -b implementation-user

<!-- for merge branch -->
git merge implement-user 

<!-- for delete branch  -->
git branch -d implement-user 

5. ================== Host On Heruku ===================
deploy your app in production 
firstly add 
sqlite3 gem in development 

group :development, :test do
  gem 'sqlite3', '~> 1.4'
end 

then 
add

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

now install bundle without production 
bundle install --without production 

install heroku in ubunto 
sudo snap install --classic heroku

then check heruko version 
heroku -v

login on heroku
heroku login 

create app 
heroku create
heroku keys:add
git push heroku master
heroku rename my-app

<!-- for database -->
git push heroku master
heroku run rake db:migrate

6. ================== Crud using scaffold and wrap  ===================

rails generate scaffold Article title:string description:text

rake db:migrate

scaffold automatically creates crud app 

7. ==================  Migrations  ===================

rules= 
1) Model Name must be in singular form, first letter must be capital. 
2) Controller name must be plural of modal as articles_controller.rb 
3) Model name filename => all lowercase but singular, article.rb 
4) table name => Plural, lower case of model name 

create migrations 
rails generate migration create_notes
rake db:migrate 

<!-- for go to back -->
rake db:rollback 

<!-- for add more columns in notes table -->
rails generate migration add_description_to_notes

for add columnn in table 
add_column :notes, :description, :text  

Now create Modal file 
name as
note.rb 

and put this
class Note < ActiveRecord::Base

end

crud using rails console 
rails console 

1) for show all records 
Note.all
2) for table show 
Note
3) for create new record
note = Note.new 
note.title = "i am title"
or
note = Note.new(title:"thsi is second title", description:"this is 2nd desc")

4) for save 
note.save

or add using create method directly like 
Note.create(title:'titleis', description:'desc')

Edit, Delete And Validations using rails console 

edit 

note = Note.find(2)
note.title = 'edited title here' 
note.save 

destroy 
note = Note.find(2)
note.destroy 

for reload console 
reload!


validations 
field can not be blank 
    validates :title, presence: true

for check if error 
    note.errors.any?

for error message 
  note.errors.full_messages

for check is valid or not 
  note.valid? 

8. ==================  CRUD => create note using browser   ===================
create route 
  resources :notes

Add Controller 
notes_controller.rb 
add methods in controller like 
def new 

end 

Add View 
create folder 
notes 
  create file 
    new.html.erb 

  For practical example on 
  C => create 
  R => read
  U => update
  D => delete

  go to this file and folder =||||||
  Practical example is on file controller
    app/controllers/notes_controller.rb
  Practical example is on file Views
    app/views/notes

9. ==================  Partials  ===================

Partial templates (partials) are a way of breaking the rendering process into more manageable chunks. Partials allow you to extract pieces of code from your templates to separate files and also reuse them throughout your templates. Partials are also useful when you need to reuse exactly the same code (DRY philosophy).

create partials file with underscore like 

_form.html.erb 

then include in file like this 
<%= render 'form' %>

10. ==================  Styling and Mockups (Install Bootstrap Gem)  ===================
for bootstrap saas visit 
https://github.com/twbs/bootstrap-sass

add gem 
gem 'bootstrap-sass', '~> 3.4.1'
now install 
bundle install --without production

import inside 
app/assets/stylesheets/
create new file for import bootstrap and add custom css
custom.css.scss

@import "bootstrap-sprockets";
@import "bootstrap";

add this in assets/javascripts/application.js 
//= require bootstrap-sprockets

11. ================== Associations ========================= 

1 create using scaffold for testing 
like 
rails generate scaffold User username:string email:string 
rake db:migrate 
rails generate scaffold Comment description:text user:references

if something went wrong then destroy scaffold by cmd like : 
rails destroy scaffold Comment 

some commands in console use 
1) Comment.all
2) Comment
3) User.create(username:'xyz',email:'abc@gmail.com')
4) user = User.first
5) user.comments 
6) comment = Comment.new(description:'comment is this', user:user)
7) comment.save 
8) comment
9) comment.user

Start Work on Migration  with browser 

rails generate migration create_authors
now add in migration file 
  t.string :username
  t.string :email

rake db:migrate 

then create model file 
author.rb 
add this 

class Author < ActiveRecord::Base

end

add Validations in Author modal file in author.rb 

<!--  One To Many Association -->
rails generate migration add_author_id_to_notes

add this column in file  
    add_column :notes, :author_id, :integer

now 
 rake db:migrate

 now add in author.rb
     has_many :notes

  now add in note.rb
      belongs_to :author
  
  for debug use
  debugger 
  press n to run on next block of code 
  ctrl + d to stop debugger 

  for use debugger in application 
  use this in views/layout/application.html.erb 
      <%= debug(params) if Rails.env.development? %>






