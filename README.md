# Nokul

[![Dependency Status](https://gemnasium.com/badges/github.com/omu/nokul.svg)](https://gemnasium.com/github.com/omu/nokul) [![Maintainability](https://api.codeclimate.com/v1/badges/32e076b5cbd4ee545f48/maintainability)](https://codeclimate.com/github/omu/nokul/maintainability) [![CircleCI](https://circleci.com/gh/omu/nokul/tree/master.svg?style=svg&circle-token=a25e63abc0e1e6c074750d9b2ce5396e3e279d82)](https://circleci.com/gh/omu/nokul/tree/master) [![Codacy Badge](https://api.codacy.com/project/badge/Grade/2c7333e690454bbd99811c8860f08d2b)](https://www.codacy.com/app/msdundar/nokul?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=omu/nokul&amp;utm_campaign=Badge_Grade)

## Setup

- You must have an up-to-dated JS interpreter (preferably NodeJS) installed on your system in order to run Rails applications:

```bash
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs
```

- Database configuration file reads username, password and host settings from environment variables. Make sure to define these environment variables before setting up the project. Add environment variables to your .bashrc, .zshrc, .bash_profile etc.:

```
export RDS_USERNAME=PostgreSQL username
export RDS_PASSWORD=PostgreSQL password
export RDS_HOSTNAME=localhost
```

In order to communicate with YOKSIS API, you also need to setup some environmental variables:

```
export YOKSIS_USER=YOKSIS username
export YOKSIS_PASSWORD=YOKSIS password
```

- Install dependencies:

```bash
bundle
```

- Create database, migrate tables and run the seed data:

```bash
rake db:setup
```

- [IN PRODUCTION]. Generate secrets for the app and define them as SECRET_KEY_BASE environment variable:

```bash
RAILS_ENV=production rake secret
export SECRET_KEY_BASE=GENERATED_SECRET_VALUE
```

## HowTo

See [Wiki pages](https://github.com/omu/nokul-bati/wiki) for how-to documents.

## Code Quality

- Rake task named as 'quality' checks for code smells.

```bash
rake quality:ruby # rubocop [ruby] + rubycritic [with reek]
rake quality:rails # rubocop [ruby + rails]
rake quality:all # ruby and rails tasks together
```

## Security

- Rake task named as 'security' checks for security issues:

```bash
rake security:all # runs bundler-audit and brakeman
```

## Tests

Run tests with:

```bash
rake test
```

## Test Coverage

Currently coverage reports are being send to Codacy automatically. If you would like to generate a local report for yourself (using SimpleCov), you need to comment out some lines of `test_helper.rb` as shown below:

```ruby
require 'simplecov'
# require 'codacy-coverage'
SimpleCov.start 'rails'
# Codacy::Reporter.start
```

then run your tests as usual:

```ruby
rake test
```

## Rake Tasks

- [OPTIONAL]. `setup` or `seed` already does it, but if you want to externally create YOKSIS references and departments inside your app, run the tasks shown below:

```bash
rake yoksis:fetch_references
rake yoksis:import_departments
```

* `fetch` prefix has used for API operations, `import` prefix has used for local CSV importing operations.

## Third-Parties

Third-party integrations are located under `app/services/foo/v1`. Follow up /docs subfolder (ie. `app/services/foo/v1/docs` for SOAPUI templates.

## App Upgrade

```bash
bin/rails app:update
```

**Run only if you know what you are doing!**

## License

Read [LICENSE](LICENSE.md) for details.
