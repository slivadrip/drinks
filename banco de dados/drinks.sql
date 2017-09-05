-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Tempo de geração: 05/09/2017 às 12:47
-- Versão do servidor: 5.7.19-0ubuntu0.16.04.1
-- Versão do PHP: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `drinks`
--
DROP DATABASE `drinks`;
CREATE DATABASE IF NOT EXISTS `drinks` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `drinks`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `bebida`
--

CREATE TABLE `bebida` (
  `codigo` bigint(20) NOT NULL,
  `sku` varchar(50) NOT NULL,
  `nome` varchar(80) NOT NULL,
  `descricao` text NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `teor_alcoolico` decimal(10,2) NOT NULL,
  `comissao` decimal(10,2) NOT NULL,
  `sabor` varchar(50) NOT NULL,
  `origem` varchar(50) NOT NULL,
  `codigo_estilo` bigint(20) NOT NULL,
  `quantidade_estoque` int(11) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `content_type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `bebida`
--

INSERT INTO `bebida` (`codigo`, `sku`, `nome`, `descricao`, `valor`, `teor_alcoolico`, `comissao`, `sabor`, `origem`, `codigo_estilo`, `quantidade_estoque`, `foto`, `content_type`) VALUES
(1, 'AS1231', 'Adriano', 'dd', '2.22', '22.22', '2.22', 'AMARGA', 'NACIONAL', 1, 212, '', ''),
(2, 'AS1231', 'coacc', 'asd', '2.22', '22.22', '22.22', 'AMARGA', 'NACIONAL', 2, 222, 'c3407cd7-6300-48df-aadd-6de547d2430e_Capa.PNG', 'image/png'),
(3, 'AS1231', 'oi', 'wsgbsbf', '3.33', '3.33', '33.33', 'FRUTADA', 'INTERNACIONAL', 1, 333, '194cc3c1-dfca-4d71-8e29-3deeff795cbc_download.jpg', 'image/jpeg'),
(6, 'LO1020', 'Amarga', '123', '20.00', '1.23', '1.22', 'FRUTADA', 'NACIONAL', 3, 123, '19d47604-db86-43ff-acff-e40172145a46_20664168_844742262347901_2624048385075639924_n.jpg', 'image/jpeg');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cidade`
--

CREATE TABLE `cidade` (
  `codigo` bigint(20) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `codigo_estado` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `cidade`
--

INSERT INTO `cidade` (`codigo`, `nome`, `codigo_estado`) VALUES
(1, 'Rio Branco', 1),
(2, 'Cruzeiro do Sul', 1),
(3, 'Salvador', 2),
(4, 'Porto Seguro', 2),
(5, 'Santana', 2),
(6, 'Goiânia', 3),
(7, 'Itumbiara', 3),
(8, 'Novo Brasil', 3),
(9, 'Belo Horizonte', 4),
(10, 'Uberlândia', 4),
(11, 'Montes Claros', 4),
(12, 'Florianópolis', 5),
(13, 'Criciúma', 5),
(14, 'Camboriú', 5),
(15, 'Lages', 5),
(16, 'São Paulo', 6),
(17, 'Ribeirão Preto', 6),
(18, 'Campinas', 6),
(19, 'Santos', 6),
(20, 'Simolândia', 3),
(21, 'Coribe', 2),
(22, 'Jaborandi', 2),
(23, 'Correntina', 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `codigo` bigint(20) NOT NULL,
  `nome` varchar(80) NOT NULL,
  `tipo_pessoa` varchar(15) NOT NULL,
  `cpf_cnpj` varchar(30) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `logradouro` varchar(50) DEFAULT NULL,
  `numero` varchar(15) DEFAULT NULL,
  `complemento` varchar(20) DEFAULT NULL,
  `cep` varchar(15) DEFAULT NULL,
  `codigo_cidade` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `cliente`
--

INSERT INTO `cliente` (`codigo`, `nome`, `tipo_pessoa`, `cpf_cnpj`, `telefone`, `email`, `logradouro`, `numero`, `complemento`, `cep`, `codigo_cidade`) VALUES
(1, 'Adriano', 'FISICA', '54914214059', '', 'slivadrip@gmail.com', '', '', '', '', NULL),
(2, 'Slivadrip', 'JURIDICA', '94709687000182', '(99) 99999-9999', 'slivadrip@gmail.com', 'Av. Corrrente', '1', '', '73.930-000', 6);

-- --------------------------------------------------------

--
-- Estrutura para tabela `estado`
--

CREATE TABLE `estado` (
  `codigo` bigint(20) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `sigla` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `estado`
--

INSERT INTO `estado` (`codigo`, `nome`, `sigla`) VALUES
(1, 'Acre', 'AC'),
(2, 'Bahia', 'BA'),
(3, 'Goiás', 'GO'),
(4, 'Minas Gerais', 'MG'),
(5, 'Santa Catarina', 'SC'),
(6, 'São Paulo', 'SP');

-- --------------------------------------------------------

--
-- Estrutura para tabela `estilo`
--

CREATE TABLE `estilo` (
  `codigo` bigint(20) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `estilo`
--

INSERT INTO `estilo` (`codigo`, `nome`) VALUES
(1, 'Amber Lager'),
(2, 'Dark Lager'),
(3, 'Pale Lager'),
(4, 'Pilsner'),

-- --------------------------------------------------------

--
-- Estrutura para tabela `grupo`
--

CREATE TABLE `grupo` (
  `codigo` bigint(20) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `grupo`
--

INSERT INTO `grupo` (`codigo`, `nome`) VALUES
(1, 'Administrador'),
(2, 'Vendedor');

-- --------------------------------------------------------

--
-- Estrutura para tabela `grupo_permissao`
--

CREATE TABLE `grupo_permissao` (
  `codigo_grupo` bigint(20) NOT NULL,
  `codigo_permissao` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `grupo_permissao`
--

INSERT INTO `grupo_permissao` (`codigo_grupo`, `codigo_permissao`) VALUES
(1, 1),
(1, 2),
(1, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_venda`
--

CREATE TABLE `item_venda` (
  `codigo` bigint(20) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valor_unitario` decimal(10,2) NOT NULL,
  `codigo_bebida` bigint(20) NOT NULL,
  `codigo_venda` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `item_venda`
--


-- --------------------------------------------------------

--
-- Estrutura para tabela `permissao`
--

CREATE TABLE `permissao` (
  `codigo` bigint(20) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `permissao`
--

INSERT INTO `permissao` (`codigo`, `nome`) VALUES
(1, 'ROLE_CADASTRAR_CIDADE'),
(2, 'ROLE_CADASTRAR_USUARIO'),
(3, 'ROLE_CANCELAR_VENDA');

-- --------------------------------------------------------

--
-- Estrutura para tabela `schema_version`
--

CREATE TABLE `schema_version` (
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int(11) DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `schema_version`
--

INSERT INTO `schema_version` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES
(1, '01', 'criar tabelas estilo e bebida', 'SQL', 'V01__criar_tabelas_estilo_e_bebida.sql', 509116123, 'root', '2017-08-16 14:12:01', 634, 1),
(2, '02', 'adicionar cidade e estado', 'SQL', 'V02__adicionar_cidade_e_estado.sql', -318392381, 'root', '2017-08-17 14:14:08', 811, 1),
(3, '03', 'adicionar tabela cliente', 'SQL', 'V03__adicionar_tabela_cliente.sql', 1598459453, 'root', '2017-08-17 16:26:46', 322, 1),
(4, '04', 'alterar cpf cnpj para not null', 'SQL', 'V04__alterar_cpf_cnpj_para_not_null.sql', 469491319, 'root', '2017-08-18 15:02:11', 757, 1),
(5, '05', 'criar tabela usuario grupo permissao', 'SQL', 'V05__criar_tabela_usuario_grupo_permissao.sql', -812092727, 'root', '2017-08-18 15:02:12', 1324, 1),
(6, '06', 'alterando ativo do usuario para not null', 'SQL', 'V06__alterando_ativo_do_usuario_para_not_null.sql', -255901085, 'root', '2017-08-21 20:03:02', 540, 1),
(7, '07', 'inserir grupos', 'SQL', 'V07__inserir_grupos.sql', -937607972, 'root', '2017-08-21 20:03:03', 48, 1),
(8, '08', 'inserir usuario administrador', 'SQL', 'V08__inserir_usuario_administrador.sql', -543817421, 'root', '2017-08-22 00:15:00', 83, 1),
(9, '09', 'inserir permissoes e relacionar usuario admin', 'SQL', 'V09__inserir_permissoes_e_relacionar_usuario_admin.sql', 672086466, 'root', '2017-08-22 00:17:16', 257, 1),
(10, '10', 'criar tabela venda e item venda', 'SQL', 'V10__criar_tabela_venda_e_item_venda.sql', 2069905002, 'root', '2017-08-28 22:45:09', 713, 1),
(11, '11', 'inserir role cancelar venda', 'SQL', 'V11__inserir_role_cancelar_venda.sql', -297225178, 'root', '2017-08-31 15:40:08', 57, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `codigo` bigint(20) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `senha` varchar(120) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `data_nascimento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `usuario`
--

INSERT INTO `usuario` (`codigo`, `nome`, `email`, `senha`, `ativo`, `data_nascimento`) VALUES
(1, 'Admin', 'admin@drinks.com', '$2a$10$g.wT4R0Wnfel1jc/k84OXuwZE02BlACSLfWy6TycGPvvEKvIm86SG', 1, NULL),
(2, 'Adriano', 'slivadrip@gmail.com', '$2a$10$JCxoWZdBKVW0RxPJAMw5M.KQZjlC6fhQ/O4uOXndBqvKTKYFMnDqC', 1, '2017-08-03'),
-------------------------------------------------------

--
-- Estrutura para tabela `usuario_grupo`
--

CREATE TABLE `usuario_grupo` (
  `codigo_usuario` bigint(20) NOT NULL,
  `codigo_grupo` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `usuario_grupo`
--

INSERT INTO `usuario_grupo` (`codigo_usuario`, `codigo_grupo`) VALUES
(1, 1),
(2, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `venda`
--

CREATE TABLE `venda` (
  `codigo` bigint(20) NOT NULL,
  `data_criacao` datetime NOT NULL,
  `valor_frete` decimal(10,2) DEFAULT NULL,
  `valor_desconto` decimal(10,2) DEFAULT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  `status` varchar(30) NOT NULL,
  `observacao` varchar(200) DEFAULT NULL,
  `data_hora_entrega` datetime DEFAULT NULL,
  `codigo_cliente` bigint(20) NOT NULL,
  `codigo_usuario` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `venda`
--


--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `bebida`
--
ALTER TABLE `bebida`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `codigo_estilo` (`codigo_estilo`);

--
-- Índices de tabela `cidade`
--
ALTER TABLE `cidade`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `codigo_estado` (`codigo_estado`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `codigo_cidade` (`codigo_cidade`);

--
-- Índices de tabela `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices de tabela `estilo`
--
ALTER TABLE `estilo`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices de tabela `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices de tabela `grupo_permissao`
--
ALTER TABLE `grupo_permissao`
  ADD PRIMARY KEY (`codigo_grupo`,`codigo_permissao`),
  ADD KEY `codigo_permissao` (`codigo_permissao`);

--
-- Índices de tabela `item_venda`
--
ALTER TABLE `item_venda`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `codigo_bebida` (`codigo_bebida`),
  ADD KEY `codigo_venda` (`codigo_venda`);

--
-- Índices de tabela `permissao`
--
ALTER TABLE `permissao`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices de tabela `schema_version`
--
ALTER TABLE `schema_version`
  ADD PRIMARY KEY (`installed_rank`),
  ADD KEY `schema_version_s_idx` (`success`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices de tabela `usuario_grupo`
--
ALTER TABLE `usuario_grupo`
  ADD PRIMARY KEY (`codigo_usuario`,`codigo_grupo`),
  ADD KEY `codigo_grupo` (`codigo_grupo`);

--
-- Índices de tabela `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `codigo_cliente` (`codigo_cliente`),
  ADD KEY `codigo_usuario` (`codigo_usuario`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `bebida`
--
ALTER TABLE `bebida`
  MODIFY `codigo` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de tabela `cidade`
--
ALTER TABLE `cidade`
  MODIFY `codigo` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `codigo` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de tabela `estilo`
--
ALTER TABLE `estilo`
  MODIFY `codigo` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de tabela `item_venda`
--
ALTER TABLE `item_venda`
  MODIFY `codigo` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `codigo` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de tabela `venda`
--
ALTER TABLE `venda`
  MODIFY `codigo` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `bebida`
--
ALTER TABLE `bebida`
  ADD CONSTRAINT `bebida_ibfk_1` FOREIGN KEY (`codigo_estilo`) REFERENCES `estilo` (`codigo`);

--
-- Restrições para tabelas `cidade`
--
ALTER TABLE `cidade`
  ADD CONSTRAINT `cidade_ibfk_1` FOREIGN KEY (`codigo_estado`) REFERENCES `estado` (`codigo`);

--
-- Restrições para tabelas `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`codigo_cidade`) REFERENCES `cidade` (`codigo`);

--
-- Restrições para tabelas `grupo_permissao`
--
ALTER TABLE `grupo_permissao`
  ADD CONSTRAINT `grupo_permissao_ibfk_1` FOREIGN KEY (`codigo_grupo`) REFERENCES `grupo` (`codigo`),
  ADD CONSTRAINT `grupo_permissao_ibfk_2` FOREIGN KEY (`codigo_permissao`) REFERENCES `permissao` (`codigo`);

--
-- Restrições para tabelas `item_venda`
--
ALTER TABLE `item_venda`
  ADD CONSTRAINT `item_venda_ibfk_1` FOREIGN KEY (`codigo_bebida`) REFERENCES `bebida` (`codigo`),
  ADD CONSTRAINT `item_venda_ibfk_2` FOREIGN KEY (`codigo_venda`) REFERENCES `venda` (`codigo`);

--
-- Restrições para tabelas `usuario_grupo`
--
ALTER TABLE `usuario_grupo`
  ADD CONSTRAINT `usuario_grupo_ibfk_1` FOREIGN KEY (`codigo_usuario`) REFERENCES `usuario` (`codigo`),
  ADD CONSTRAINT `usuario_grupo_ibfk_2` FOREIGN KEY (`codigo_grupo`) REFERENCES `grupo` (`codigo`);

--
-- Restrições para tabelas `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `venda_ibfk_1` FOREIGN KEY (`codigo_cliente`) REFERENCES `cliente` (`codigo`),
  ADD CONSTRAINT `venda_ibfk_2` FOREIGN KEY (`codigo_usuario`) REFERENCES `usuario` (`codigo`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
