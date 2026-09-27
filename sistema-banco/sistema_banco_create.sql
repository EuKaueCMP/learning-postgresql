--CREATE DATABASE sistema_banco;
CREATE SCHEMA IF NOT EXISTS banco;

CREATE TABLE banco.tipo_usuario
(
	tipo_usuario_id SERIAL PRIMARY KEY,
	tipo VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE banco.usuario
(
	usuario_id SERIAL PRIMARY KEY,
	nome TEXT NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	senha VARCHAR(100) NOT NULL ,
	saldo NUMERIC(10, 2) DEFAULT 0,
	tipo_usuario_id INTEGER REFERENCES banco.tipo_usuario(tipo_usuario_id)
);

CREATE TABLE banco.tipo_alteracao
(
	tipo_alteracao_id SERIAL PRIMARY KEY,
	nome_alteracao VARCHAR(20)
);

CREATE TABLE banco.usuario_log
(
	log_id SERIAL PRIMARY KEY,
	usuario_id INTEGER REFERENCES banco.usuario(usuario_id) NOT NULL,
	tipo_alteracao_id INTEGER REFERENCES banco.tipo_alteracao(tipo_alteracao_id) NOT NULL,
	nome VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL,
	saldo NUMERIC(10, 2) NOT NULL
);

CREATE TABLE banco.tipo_transferencia
(
	tipo_transferencia_id SERIAL PRIMARY KEY,
	nome_tipo VARCHAR(20) NOT NULL
);

CREATE TABLE banco.status_transferencia
(
	status_transferencia_id SERIAL PRIMARY KEY,
	nome_status VARCHAR(20) NOT NULL
);

CREATE TABLE banco.transferencia
(
	transferencia_id SERIAL PRIMARY KEY,
	usuario_remetente_id INTEGER REFERENCES banco.usuairo(usuario_id),
	usuario_destinatario_id INTEGER REFERENCES banco.usuario(usuario_id),
	data_transferencia TIMESTAMP,
	tipo_id INTEGER REFERENCES banco.tipo_transferencia(tipo_transferencia_id),
	status_id INTEGER REFERENCES banco.status_transferencia(status_transferencia_id)
);

CREATE TABLE banco.log_transferencia
(
	transferencia_id INTEGER REFERENCES banco.transferencia(transferencia_id),
	descricao_log TEXT NOT NULL,
	status_id INTEGER REFERENCES banco.status_transferencia(status_transferencia_id) NOT NULL,
	data_alteracao TIMESTAMP DEFAULT CLOCK_TIMESTAMP()
);

CREATE TABLE banco.tipo_movimentacao
(
	tipo_movimentacao_id SERIAL PRIMARY KEY,
	tipo VARCHAR(20)
);

CREATE TABLE banco.movimentacao
(
	movimentacao_id SERIAL PRIMARY KEY,
	usuario_id INTEGER REFERENCES banco.usuario(usuario_id),
	tipo_movimentacao_id INTEGER REFERENCES banco.tipo_movimentacao(tipo_movimentacao_id),
	saldo_anterior NUMERIC(10, 2) NOT NULL,
	saldo_atual NUMERIC(10, 2) NOT NULL,
	data_movimentacao TIMESTAMP DEFAULT CLOCK_TIMESTAMP()
);