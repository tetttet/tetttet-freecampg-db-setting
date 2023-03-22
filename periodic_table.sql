CREATE TABLE elements (
  atomic_number INT PRIMARY KEY,
  symbol VARCHAR(2) UNIQUE NOT NULL,
  name VARCHAR(50) NOT NULL,
  atomic_mass NUMERIC(8,4) NOT NULL,
  period INT NOT NULL,
  group_num INT NOT NULL,
  block VARCHAR(15) NOT NULL,
  density NUMERIC(8,4),
  melting_point NUMERIC(8,4),
  boiling_point NUMERIC(8,4)
);

CREATE TABLE isotopes (
  isotope_id SERIAL PRIMARY KEY,
  atomic_number INT REFERENCES elements(atomic_number),
  mass_number INT NOT NULL,
  isotopic_mass NUMERIC(8,4) NOT NULL,
  abundance NUMERIC(8,4) NOT NULL
);

CREATE TABLE element_properties (
  atomic_number INT PRIMARY KEY REFERENCES elements(atomic_number),
  electron_configuration TEXT NOT NULL,
  electronegativity NUMERIC(8,4),
  ionization_energy NUMERIC(8,4),
  atomic_radius NUMERIC(8,4),
  van_der_waals_radius NUMERIC(8,4),
  oxidation_states VARCHAR(50),
  standard_state VARCHAR(50),
  bonding_type VARCHAR(50),
  boiling_point_rank INT,
  melting_point_rank INT
);
