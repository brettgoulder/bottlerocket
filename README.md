# Bottle Rocket #
## *Note: This is a work in progress and currently is not working* ##
Bottlerocket is a Sinatra/Mongo based CMS which aims to ease development times on small sites.  The overall aim is to be able quickly write create your content types in a YAML file and then deploy your site with very little configuration.  

## Features ##
- Mongo based content management system
- Fully speced
- Gem based
- Sinatra based
- Works with Heroku
- Beautiful user interface
- HTML 5/CSS 3 administration interface

## Installation ##

    gem install bottlerocket
    bottlerocket my_project

Bottlerocket also requires you to have atleast Mongo 1.5.8 and Ruby 1.9.2.

## How to Use ##

Once you get everything installed, you can define the types of Content you are going to use in your CMS by editing the _content_types.yaml_ file

    -
      name: pages
      fields:
        - title: string
        - body: text
        - image: file
        - section:
          - general
          - life style
          - cooking
          - gaming
          - rocket science
        - active: boolean
    -
      name: stores
      fields:
        - name: string
        - address: text

From here, you can call on a ContentType for use in your template(e.g.)
  
    @page = ContentTypes.pages.find(:title => "title").first

## Configuration ##

### Heroku ###

## Notes ##

- Note: content_type is reserved field.