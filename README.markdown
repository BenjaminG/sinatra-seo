# Sinatra SEO
This is a [Sinatra Extension][1] that integrates basic SEO functionality within your [Sinatra][2] application.

### Installation
In order to install this gem, you just need to install the gem from your command line like this:
  
    $sudo gem install sinatra-seo

You should take into account that this library have the following dependencies:

* [sinatra][2]

### Usage
This library requires you to define the basic SEO information such as the title, the description and the keywords for every page of your site on a YAML-style separate file. Imagine that you created the file, let's say, *site.seo* then you should populate it as follow:

    home:
        title: Home | Site
        description: my Home description goes here.
        keywords: keyword1, keyword2, keyword3
    about:
        title: About | Site
        description: my About description goes here.
        keywords: keyword4, keyword5, keyword6
        
Please note that we are naming each page as named in your *views/* directory. The three attributes you're required to fill (**title**, **description** and **keywords**) should be strings and these attributes also should have a maximum of characters or words as detailed below:

* the attribute **Title** should have a maximum of 60 characters.
* the attribute **Description** should have a maximum of 160 characters.
* the attribute **Keywords** should contain a maximum of 15 words.

Even tough this limitation usually spark a discussion among SEO specialists, I've decided to use the minimum number in order to make sure all the data you define for your pages is parsed by the search engines.

Now, as any other existing extension, there are two possible use cases in order to hook up your *site.seo* file to your application. If you follow the **Classic** approach, then you just need to require this extension in your *app.rb* file and then set the SEO file this extension should parse.

    require 'sinatra'
    require 'sinatra/seo'
    
    set :seo_file, File.join(File.dirname(__FILE__), 'site.seo')
    
    # ... the rest of your code ...
    
In case you would prefer to follow the **Modular** approach on your application design, then you just need to declare your application as a class that inherit from the *Sinatra:Base* class in the *app.rb* file, then you should register the extension inside this class and finally you should set the SEO file this extension should parse.

    require 'sinatra/base'
    require 'sinatra/seo'
    
    class App < Sinatra::Base
      register Sinatra::Seo
      
      set :seo_file, File.join(File.dirname(__FILE__), 'site.seo')
      
      # ... the rest of your code ...
    end

By now you should be able to use the **seo** helper method in your views. This method basically returns nested *OpenStruct* instances with read-only attributes that represents the content you wrote on the *site.seo* file.

    seo.home.title          # => 'Home | Site'
    seo.about.description   # => 'my About description goes here.'
    seo.home.keywords       # => 'keyword4, keyword5, keyword6'
    
Finally, you are able to implement SEO in your application with this extension!

### Contributions
Everybody is welcome to contribute to this project by commenting the source code, suggesting modifications or new ideas, reporting bugs, writing some documentation and, of course, you're also welcome to contribute with patches as well!

In case you would like to contribute on this library, here's the list of extra dependencies you would need:

* [rspec][3]
* [rcov][4]
* [rack-test][5]

### Contributors
* [Julio Javier Cicchelli][6]

### Sites
The following sites are proudly using this extension:

* [Rock & Code][9]
* [Izcheznali][10]

If your site is also using this extension, please let us know!

### Notes
This extension have been tested on the versions 1.8.6, 1.8.7 and 1.9.1 of the [Ruby interpreter][7].

### License
This extension is licensed under the [MIT License][8].

[1]: http://www.sinatrarb.com/extensions.html
[2]: http://www.sinatrarb.com/
[3]: http://rspec.info/
[4]: http://eigenclass.org/hiki/rcov
[5]: http://gitrdoc.com/brynary/rack-test/tree/master
[6]: http://github.com/mr-rock
[7]: http://www.ruby-lang.org/en/
[8]: http://creativecommons.org/licenses/MIT/
[9]: http://rock-n-code.com
[10]: http://izcheznali.net