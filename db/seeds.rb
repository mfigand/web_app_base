# frozen_string_literal: true

# Users
# =====

superadmin = User.find_or_create_by!(name: 'Superadmin',
                                     lastname: 'Superadmin Lastname',
                                     email: 'superadmin@example.com',
                                     password_digest: BCrypt::Password.create('12345678'))
superadmin.roles.find_or_create_by!(name: 'superadmin')

admin = User.find_or_create_by!(name: 'Admin',
                                lastname: 'Admin Lastname',
                                email: 'admin@example.com',
                                password_digest: BCrypt::Password.create('12345678'))
admin.roles.find_or_create_by!(name: 'admin')

neighbour = User.find_or_create_by!(name: 'Neighbour',
                                    lastname: 'Neighbour',
                                    email: 'neighbour@example.com',
                                    password_digest: BCrypt::Password.create('12345678'))
neighbour.roles.find_or_create_by!(name: 'neighbour')
