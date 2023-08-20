# README

App comes with complete seeds, just needs starting up. I have not touched the db config, all data should be in
referrals_development db after manually running create, migrate and seed.

Logic overview:
- stores patient referrals and messages in separate tables
- creates a polymorphic patient_log table that can reference both messages and referrals as "loggables"
- keeps users, patient records and organization members separate and defines relationships between them
- patient log controller retrieves logs for given patient record and eagerly loads associated loggables

What's outside the scope but is worth mentioning is the creation of patient logs:
- I would rather not have them in the model callbacks even though it's very tempting to just create them in after_create
- I would rather have the log creation logic be part of the business logic, i.e. when a new referral / message is created, a dedicated domain handler class would ensure that everything is created then and wrapped in a transaction.

What's not included:
- views are not implemented but with given logic it should be very easy to render the loggable entries with templates
- no tests - tried to keep the dev time down to 3 hours and writing tests first would probably consume most of that time, that said, there is very little custom logic to test here anyway
- no inline documentation but I would normally document controllers and describe each class

Notes:
- code has been run through rubocop with standard config
- was going to create FactoryBot factories for seeds and add rspec but again, tried to keep it in under 3 hours 