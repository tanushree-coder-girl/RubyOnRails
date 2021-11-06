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
