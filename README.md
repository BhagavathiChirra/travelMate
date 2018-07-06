# TRAVEL MATE.

This is our first group project for Web Dev Immersive at General Assembly. We are building a web application from the ground up.

See it now: https://project2-travelmate.herokuapp.com/

Our site gives great holiday plans for travellers, from real travellers.

You can sign up and see blog posts from other users for different cities. At the moment, only admin can add/edit a city (for security reason, to prevent users from deleting our database).

![List of Cities](https://github.com/eggyducktective/travelMate/blob/master/app/assets/images/Cities.jpg)

As an user, you can write your own blog post, and delete it if you wish. You can give your favourite blog posts a thumb up :) You can also leave comments, and remove them.

![User page](https://github.com/eggyducktective/travelMate/blob/master/app/assets/images/User.jpg)

Blog posts and cities come with a stunning slideshow, weather forecast and travel news from said cities.

The cities also come with Google map displaying all blog posts made about them. When you click on the marker, it will take you to that blog post.

![Paris](https://github.com/eggyducktective/travelMate/blob/master/app/assets/images/Paris.jpg)

## Sign up for this fun site now.

Start your travel journey right here: [Travel Mate ](https://project2-travelmate.herokuapp.com/)

## Ruby version:

ruby 2.4.1p111

## System dependencies

bundle install

Except for standard Gems that come with a Rails project, we installed 'annotate' (to annotate all models, tests, fixtures and factories), 'pry-rails' (to use pry as rails console ), 'pry-byebug' (to add step by step debugging), 'ransack' (to get a quick searching table), 'cloudinary' (to let users upload photos from their computer), 'geocoder' (to use map), and  'boostrap'

See Gemfile/Gemfile.lock

## Configuration

Ensure following values are stored in your environment:

```
ENV["CLOUDINARY_CLOUD_NAME"]
ENV["CLOUDINARY_API_KEY"]
ENV["CLOUDINARY_API_SECRET"]
ENV["GUARDIAN_API_KEY"]
ENV["APXU_API_KEY"]
```

## Database creation

Database can be initialized using:

```
$ rails db:migrate
```

## Database initialization

Demo data can be populated in to the site using:

```
$ rails db:seed
```

## Services (job queues, cache servers, search engines, etc.)

This service connects to a number of external searches:

  - Cloudinary
  - Google maps api for js
  - APXU weather widget
  - Guardian news api

## Deployment instructions:

Push to Heroku enables rapid deployment of this app.

```
$ heroku create project2-travelmate
$ git push heroku master
$ heroku run rails db:migrate
$ heroku ps:scale web=1
$ heroku run
$ heroku run rails db:seed
```

## Approach:

We were torn between doing a food blog/review site like Zomato and a Travel site. We agreed on Travel Mate, as it offers more cool features to work on.

## Technologies used:

- HTML
- CSS
- Javascript
- Ruby on Rails
- jQuery
- AJAX
- Bootstrap

## Unsolved problems:

- CSS is really cool, but it could be a tad annoying to deal with.

- When logging in as admin, I could add a new city. The problem that we currently have is that, the new city added will not have any slideshow like the other cities that we created through our seeds database.

## Wish list:

- Had the time been a bit longer, we would have loved to use React.js for our front end.
- More features that are interesting to include are: Let user follow their favourite users, a newsfeed that updates all cool new blog posts in real time.


## Acknowledgement:

- All amazing travel blogs that we did research on, for inspiration. Our site is quite visual, CSS tips from Google/JSFiddle are really good.
- Our instructor, Luke, for helping us with AJAX, and Grant, for helping us out with using Bootstrap. (I usually believe in editing all my CSS files :0 ). But this time Bootstrap was really helpful, and fun to use.
