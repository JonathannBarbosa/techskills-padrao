CREATE TABLE clientes {
   id SERIAL PRIMARY KEY,
   nome VARCHAR ( 100 ) NOT NULL.
   cpf VARCHAR ( 11 )
   email VARCHAR ( 100 )
   data_nasc DATE
   data_cadastro: TIMESTAMP DEFAULT now()
};


CREATE TABLE enderecos {
   id SERIAL PRIMARY KEY,
   logradouro VARCHAR(150) NOT NULL,
   cep VARCHAR(8) NOT NULL,
   numero VARCHAR ( 10 ) NOT NULL,
   bairro VARCHAR ( 60 ) NOT NULL,
   complemento VARCHAR ( 100),
   referencia VARCHAR ( 200 ),
   cidade VARCHAR ( 100 ) NOT NULL,
   uf: VARCHAR ( 2 ) NOT NULL,


};


CREATE TABLE enderecos_cliente{
   cliente_id INTEGER NOT NULL,
   endereco_id INTEGER NOT NULL,
   tipo VARCHAR ( 30 ) NOT NULL CHECK('entrega', 'cobranca'),


   CONSTRAINT pk_enderecos_cliente PRIMARY KEY (cliente_id, endereco_id)
   CONSTRAINT fk_cliente FOREIGN KEY (cliente_id) REFERENCES clientes(id),
   CONSTRAINT fk_endereco FOREIGN KEY (endereco_id) REFERENCES clientes(id),


}


CREATE TABLE pedidos {
   id SERIAL PRIMARY KEY,
   cliente_id FOREIGN KEY INTEGER,
   descricao: VARCHAR(500),
   data_entrega: TIMESTAMP NOT NULL,
};




CREATE TABLE itens {
   id SERIAL PRIMARY KEY,
   nome VARCHAR ( 100 ),
   descricao VARCHAR ( 500 ),
   valor NUMERIC ( 10, 2 ) NOT NULL CHECK( valor >= 0),
   tempo_preparo INTERVAL,
   imagem VARCHAR ( 200 )
};




CREATE TABLE item_pedido {
   item_id PRIMARY KEY INTEGER NOT NULL,
   pedido_id PRIMARY KEY  INTEGER NOT NULL,
   quantidade INTEGER NOT NULL CHECK ( quantidade > 0 )


   CONSTRAINT pk_item_pedido PRIMARY KEY ( item_id, pedido_id),
   CONSTRAINT fk_item FOREIGN KEY ( item_id),
   CONSTRAINT fk_pedidos FOREIGN KEY ( pedido_id) REFERENCES pedido(id)


}



























































