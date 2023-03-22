-- Create the salon database
CREATE DATABASE salon;

-- Connect to the salon database
\c salon

-- Create the stylists table
CREATE TABLE stylists (
  stylist_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  phone VARCHAR(20),
  created_at TIMESTAMP DEFAULT NOW()
);

-- Create the clients table
CREATE TABLE clients (
  client_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  phone VARCHAR(20),
  created_at TIMESTAMP DEFAULT NOW(),
  stylist_id INT REFERENCES stylists(stylist_id) ON DELETE SET NULL
);

-- Create the appointments table
CREATE TABLE appointments (
  appointment_id SERIAL PRIMARY KEY,
  start_time TIMESTAMP NOT NULL,
  end_time TIMESTAMP NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  client_id INT REFERENCES clients(client_id) ON DELETE SET NULL
);

-- Create the services table
CREATE TABLE services (
  service_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  description TEXT,
  price NUMERIC(8, 2) NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Create the appointments_services table to associate services with appointments
CREATE TABLE appointments_services (
  appointment_id INT REFERENCES appointments(appointment_id) ON DELETE CASCADE,
  service_id INT REFERENCES services(service_id) ON DELETE CASCADE,
  PRIMARY KEY (appointment_id, service_id)
);
