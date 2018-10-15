Rails HTTP REST API service boilerplate
---------------------------------------

Installation
------------

1. Fork it.

2. Clone it to your local machine.

3. Install dependencies:

    bundle install

    rbenv rehash

4. Set a secret token for your app. Replace "CHANGE_ME" in ./config/initializers/secret_token.rb to a random string:

    Api::Application.config.secret_key_base = 'CHANGE_ME'

5. Configure deployment files in ./config/deploy.rb and ./config/deploy/*

6. Make your application logic.

Response syntax
---------------

For lists like Array, ActiveRecord::Relation:

    {data: [...], page: integer, total: integer}

For other classes:

    {data: ...}

or, if you set :success => :resource option then

    {success: boolean}

Both of this may include optional parameters:

* boolean success
* hash errors

Response formats
----------------

* csv
* json
* xls
* xml
