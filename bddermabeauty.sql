-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 29/10/2026 às 14:42
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bddermabeauty`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `agendamentos`
--

CREATE TABLE `agendamentos` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `tratamento_id` int(11) NOT NULL,
  `data_agendamento` datetime NOT NULL,
  `status` enum('Pendente','Confirmado','Concluído','Cancelado') DEFAULT 'Pendente',
  `valor` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `agendamentos`
--

INSERT INTO `agendamentos` (`id`, `cliente_id`, `tratamento_id`, `data_agendamento`, `status`, `valor`) VALUES
(1, 1, 1, '2026-10-15 16:06:53', 'Pendente', 200.00),
(2, 2, 1, '2026-10-15 16:06:53', 'Concluído', 200.00),
(3, 3, 1, '2026-10-15 16:09:11', 'Pendente', 350.00),
(4, 4, 1, '2026-10-15 16:09:11', 'Concluído', 500.00),
(5, 5, 1, '2026-10-15 16:09:11', 'Cancelado', 780.00),
(6, 6, 1, '2026-10-15 16:09:11', 'Pendente', 1000.00),
(7, 7, 1, '2026-10-15 16:09:11', 'Concluído', 830.00),
(8, 8, 1, '2026-10-15 16:09:11', 'Concluído', 980.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp(),
  `cpf` varchar(14) DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`id`, `nome`, `email`, `telefone`, `data_cadastro`, `cpf`, `nascimento`, `cidade`, `estado`, `endereco`) VALUES
(1, 'Mariana Costa', 'mariana.teste@example.com', '(11) 99999-1111', '2026-10-15 19:06:53', NULL, NULL, NULL, NULL, NULL),
(2, 'Beatriz Almeida', 'beatriz.teste@example.com', '(11) 99999-2222', '2026-10-15 19:06:53', NULL, NULL, NULL, NULL, NULL),
(3, 'Helena Valentina Monteiro', 'helena.teste@example.com', '(11) 99999-0001', '2026-10-15 19:07:42', NULL, NULL, NULL, NULL, NULL),
(4, 'Isabella Sofia Alburquerque', 'isabella.teste@example.com', '(11) 99999-0002', '2026-10-15 19:07:42', NULL, NULL, NULL, NULL, NULL),
(5, 'Aurora Beatriz Vasconcelos', 'aurora.teste@example.com', '(11) 99999-0003', '2026-10-15 19:07:42', NULL, NULL, NULL, NULL, NULL),
(6, 'Lavínia Antonella Montenegro', 'lavinia.teste@example.com', '(11) 99999-0004', '2026-10-15 19:07:42', NULL, NULL, NULL, NULL, NULL),
(7, 'Cecília Manuela Fontes', 'cecilia.teste@example.com', '(11) 99999-0005', '2026-10-15 19:07:42', NULL, NULL, NULL, NULL, NULL),
(8, 'Valentina Lizandra Marcondes', 'valentina.teste@example.com', '(11) 99999-0006', '2026-10-15 19:07:42', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tratamentos`
--

CREATE TABLE `tratamentos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `descricao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `tratamentos`
--

INSERT INTO `tratamentos` (`id`, `nome`, `categoria`, `preco`, `descricao`) VALUES
(1, 'Limpeza de Pele', 'facial', 200.00, 'Remove as impurezas e o excesso de oleosidade da pele'),
(4, 'Depilação a Laser', 'depilacao', 250.00, 'Auxilia na redução dos pelos ao longo das sessões.'),
(5, 'Microagulhamento', 'facial', 350.00, 'Estimula a renovação da pele e pode auxiliar na melhora da textura'),
(6, 'Drenagem Linfática', 'corporal', 300.00, 'Massagem com movimentos suaves que auxilia na redução do inchaço e promove relaxamento'),
(7, 'Peeling Facial', 'facial', 400.00, 'Promove a renovação da pele, melhorando a textura e a aparência de manchas'),
(8, 'Depilação a Cera', 'depilacao', 150.00, 'Remove os pelos com cera, deixando a pele macia e lisinha por mais tempo');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `agendamentos`
--
ALTER TABLE `agendamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `tratamento_id` (`tratamento_id`);

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tratamentos`
--
ALTER TABLE `tratamentos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `agendamentos`
--
ALTER TABLE `agendamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `tratamentos`
--
ALTER TABLE `tratamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `agendamentos`
--
ALTER TABLE `agendamentos`
  ADD CONSTRAINT `agendamentos_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `agendamentos_ibfk_2` FOREIGN KEY (`tratamento_id`) REFERENCES `tratamentos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
