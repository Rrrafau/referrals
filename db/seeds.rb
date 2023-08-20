# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Base.transaction do
  # create roles
  admin = Role.create(
    name: 'Admin',
    description: 'Admin role'
  )

  Role.create(
    name: 'Normal Member',
    description: 'Normal member role'
  )

  # create normal users
  users = []

  100.times do
    users << User.create!(
      name: Faker::Name.name
    )
  end

  # create staff members
  UserRole.create(
    role: admin,
    user: User.first
  )

  # create patient records
  patient_records = []

  users.each do |user|
    patient_records << PatientRecord.create!(
      user: user
    )
  end

  # create organizations
  organizations = []

  10.times do
    organizations << Organization.create!(
      name: Faker::Company.name,
      description: Faker::Lorem.sentence
    )
  end

  # create organization members
  organization_members = []

  users.shuffle.sample(20).each do |user|
    organization_members << OrganizationMember.create!(
      organization: organizations.shuffle.sample,
      user: user
    )
  end

  # create referrals
  time = Time.now - 1.year

  patient_entries = []

  patient_records.shuffle.sample(20).each do |patient_record|
    rand(1..5).times do
      time_randomizer = rand(1..300)

      patient_entries << Referral.create!(
        sender_organization_id: organizations.shuffle.sample.id,
        target_organization_id: organizations.shuffle.sample.id,
        referrer_id: organization_members.shuffle.sample.user.id,
        patient_record: patient_record,
        created_at: time + time_randomizer.days,
        updated_at: time + time_randomizer.days
      )
    end

    rand(1..5).times do
      time_randomizer = rand(1..300)

      patient_entries << Message.create!(
        title: Faker::Lorem.sentence(word_count: 3),
        content: Faker::Lorem.sentence(word_count: 10),
        patient_record: patient_record,
        sender: organization_members.shuffle.sample.user,
        created_at: time + time_randomizer.days,
        updated_at: time + time_randomizer.days
      )
    end
  end

  # create log entries
  patient_entries.each do |entry|
    PatientLog.create!(
      loggable: entry,
      patient_record: entry.patient_record
    )
  end
end