# PET

Simple Ruby on Rails API project that is created purely for learning purposes.

### Requirements

- Ruby version: 3.0.2p107

- Rails version: 6.1.4.3

### Setup & Run

1. Clone the repo: `git clone git@github.com:shukhrat121995/pet.git`
2. Install the gem dependencies: `bundle install`
3. Create a database and seed it with single record: `rails db:create`
4. Run the application: `rails server`
5. Open: `http://127.0.0.1:3000/products`

### Run Unit Tests

- Execute: `rspec ./spec/models/product_spec.r`

### Run Rubocop locally

- Execute: `rubocop`
- Fix issues: `rubocop -A` or `rubocop -a`
