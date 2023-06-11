CREATE DATABASE pharmdb;

\connect pharmdb;


CREATE TABLE IF NOT EXISTS admin (
    cpf VARCHAR(14) PRIMARY KEY UNIQUE,
    rg VARCHAR(12) NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(6) NOT NULL
);

CREATE TABLE IF NOT EXISTS admin_phone (
    admin_cpf_fk VARCHAR(14) UNIQUE,
    phone VARCHAR(15) UNIQUE,

    PRIMARY KEY (admin_cpf_fk, phone),

    FOREIGN KEY (admin_cpf_fk) REFERENCES admin(cpf)
);

CREATE TABLE IF NOT EXISTS admin_address (
    admin_cpf_fk VARCHAR(14) PRIMARY KEY UNIQUE,
    state VARCHAR(2) NOT NULL,
    city VARCHAR(50) NOT NULL,
    cep VARCHAR(9) NOT NULL UNIQUE,
    address VARCHAR(200) NOT NULL,

    FOREIGN KEY (admin_cpf_fk) REFERENCES admin(cpf)
);

CREATE TABLE IF NOT EXISTS professional (
    cpf VARCHAR(14) PRIMARY KEY UNIQUE,
    name VARCHAR(100) NOT NULL,
    function VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    salary DECIMAL(10, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS professional_phone (
    professional_cpf_fk VARCHAR(14) UNIQUE,
    phone VARCHAR(15) UNIQUE,

    PRIMARY KEY (professional_cpf_fk, phone),

    FOREIGN KEY (professional_cpf_fk) REFERENCES professional(cpf)
);

CREATE TABLE IF NOT EXISTS professional_address (
    professional_cpf_fk VARCHAR(14) PRIMARY KEY UNIQUE,
    state VARCHAR(2) NOT NULL,
    city VARCHAR(50) NOT NULL,
    cep VARCHAR(9) NOT NULL UNIQUE,
    address VARCHAR(200) NOT NULL,

    FOREIGN KEY (professional_cpf_fk) REFERENCES professional(cpf)
);

CREATE TABLE IF NOT EXISTS supplier (
    cnpj VARCHAR(18) PRIMARY KEY UNIQUE,
    name VARCHAR(100) NOT NULL,
    trade_representative VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    observation VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS supplier_phone (
    supplier_cnpj_fk VARCHAR(18) UNIQUE,
    phone VARCHAR(15) UNIQUE,

    PRIMARY KEY (supplier_cnpj_fk, phone),

    FOREIGN KEY (supplier_cnpj_fk) REFERENCES supplier(cnpj)
);

CREATE TABLE IF NOT EXISTS supplier_address (
    supplier_cnpj_fk VARCHAR(18) PRIMARY KEY UNIQUE,
    state VARCHAR(2) NOT NULL,
    city VARCHAR(50) NOT NULL,
    cep VARCHAR(9) NOT NULL UNIQUE,
    address VARCHAR(200) NOT NULL,

    FOREIGN KEY (supplier_cnpj_fk) REFERENCES supplier(cnpj)
);

CREATE TABLE IF NOT EXISTS medicine (
    id SERIAL PRIMARY KEY,
    commercial_name VARCHAR(100) NOT NULL UNIQUE,
    chemical_name VARCHAR(100) NOT NULL UNIQUE,
    type VARCHAR(20) NOT NULL,
    form VARCHAR(15) NOT NULL,
    need_recipe BOOLEAN NOT NULL,
    stripe VARCHAR(10) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    quantity INT NOT NULL,
    observation VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS supplier_send_medicine (
    supplier_cnpj_fk VARCHAR(18) UNIQUE,
    medicine_id_fk INT UNIQUE,

    PRIMARY KEY (supplier_cnpj_fk, medicine_id_fk),

    FOREIGN KEY (supplier_cnpj_fk) REFERENCES supplier(cnpj),
    FOREIGN KEY (medicine_id_fk) REFERENCES medicine(id)
);

CREATE TABLE IF NOT EXISTS demand (
    professional_cpf_fk VARCHAR(14) UNIQUE,
    supplier_cnpj_fk VARCHAR(18) UNIQUE,
    medicine_id_fk INT UNIQUE,
    create_at DATE NOT NULL,
    observation VARCHAR(255),

    PRIMARY KEY (professional_cpf_fk, supplier_cnpj_fk, medicine_id_fk),

    FOREIGN KEY (professional_cpf_fk) REFERENCES professional(cpf),
    FOREIGN KEY (supplier_cnpj_fk) REFERENCES supplier(cnpj),
    FOREIGN KEY (medicine_id_fk) REFERENCES medicine(id)
);

CREATE TABLE IF NOT EXISTS demand_phone (
    professional_cpf_fk VARCHAR(14) UNIQUE,
    supplier_cnpj_fk VARCHAR(18) UNIQUE,
    medicine_id_fk INT UNIQUE,
    requester_phone VARCHAR(15) UNIQUE,

    PRIMARY KEY (professional_cpf_fk, supplier_cnpj_fk, medicine_id_fk, requester_phone),

    FOREIGN KEY (professional_cpf_fk) REFERENCES professional(cpf),
    FOREIGN KEY (supplier_cnpj_fk) REFERENCES supplier(cnpj),
    FOREIGN KEY (medicine_id_fk) REFERENCES medicine(id)
);

CREATE TABLE IF NOT EXISTS demand_address (
    professional_cpf_fk VARCHAR(14) UNIQUE,
    supplier_cnpj_fk VARCHAR(18) UNIQUE,
    medicine_id_fk INT UNIQUE,
    requester_state VARCHAR(2) NOT NULL,
    requester_city VARCHAR(50) NOT NULL,
    requester_cep VARCHAR(9) NOT NULL UNIQUE,
    requester_address VARCHAR(200) NOT NULL,

    PRIMARY KEY (professional_cpf_fk, supplier_cnpj_fk, medicine_id_fk),

    FOREIGN KEY (professional_cpf_fk) REFERENCES professional(cpf),
    FOREIGN KEY (supplier_cnpj_fk) REFERENCES supplier(cnpj),
    FOREIGN KEY (medicine_id_fk) REFERENCES medicine(id)
);
