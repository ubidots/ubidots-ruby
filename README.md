 # Ubidots

Ruby gem for connecting to the [Ubidots](http://ubidots.com) API.

## Installation

Add this line to your application's Gemfile:

    gem 'ubidots'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ubidots

## Usage

### Getting an API token

The first thing you need to do to start using the API is to get a token. For this you'll need to
obtain your account API key on the website and then call `Ubidots.api_key`:

       Ubidots.api_key("458cacdd594246daf5126bf106ccaaefabf1bf56")

Now that you're in you can get your token by calling `Ubidots.get_token`:

       Ubidots.get_token

### Authentication

### Users

After getting your application token you can get a user object by calling:

    user = Ubidots::User.find("username")

This user has an associated set of datasources that you can retrieve like this:

    user = Ubidots::User.find("username")
    user.datasources      # => [...]

#### Profiles

You can see the user's profile by calling `#profile` on your user object:

    user = Ubidots::User.find("username")
    user.profile      # => { followers: 11, following: 24...}

### Data Sources

The datasources for the logged in user can be retrieved by doing:

    Ubidots.datasources

For a specific datasources you can pass the `datasource_id` to the `#find` method:

    source = Ubidots.datasources.find(datsource_id)

And you can read the variables from this datsources:

    source = Ubidots.datasources.find(datsource_id)
    variables = source.variables

### Variables

To obtain a list of the variables associated to the current user you can call:

    Ubidots.variables

For a specific variable just call `#find` on the variables collection and pass it the `variable_id`:

    Ubidots.variables.find(variable_id)

#### Values

Each variable has a list of values. To obtain these just call `#values` on the specific variable:

    variable = Ubidots.variables.find(variable_id)
    values = variable.values

You can get specific information about each value by passing a `value_id`:

    values = Ubidots.variables.find(variable_id).values
    value = values.find(value_id)


### Error Handling
### Query parameters
