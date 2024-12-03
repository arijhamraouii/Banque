-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  lun. 02 déc. 2024 à 11:48
-- Version du serveur :  5.7.17
-- Version de PHP :  5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `banque`
--

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

CREATE TABLE `compte` (
  `numero_compte` varchar(255) NOT NULL,
  `date_creation` date DEFAULT NULL,
  `solde` decimal(38,2) DEFAULT NULL,
  `titulaire` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `compte`
--

INSERT INTO `compte` (`numero_compte`, `date_creation`, `solde`, `titulaire`) VALUES
('123456', '2024-10-13', '1500.00', 'arij hamraoui'),
('123457', '2024-12-01', '1500.00', 'ridha Hamraoui'),
('123458', '2024-12-01', '1500.00', 'fatma Hamraoui'),
('123488', '2024-11-01', '400.00', 'yorna Hamraoui'),
('159159', '2024-10-01', '9580.65', 'youssef abid'),
('789012', '2024-10-14', '1500.00', 'Sami Ben Ahmed'),
('987654', '2024-12-03', '2500.00', 'Sami Trabelsi');

-- --------------------------------------------------------

--
-- Structure de la table `notification`
--

CREATE TABLE `notification` (
  `id` bigint(20) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `numero_compte` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `notification`
--

INSERT INTO `notification` (`id`, `message`, `numero_compte`) VALUES
(6, 'Transaction de 500.0 TND effectuée avec succès.', '123458'),
(7, 'Transaction de 500.0 TND effectuée avec succès.', '123458');

-- --------------------------------------------------------

--
-- Structure de la table `rapport`
--

CREATE TABLE `rapport` (
  `id` int(11) NOT NULL,
  `numero_compte` varchar(50) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `solde_debut` double NOT NULL,
  `solde_fin` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `rapport`
--

INSERT INTO `rapport` (`id`, `numero_compte`, `date_debut`, `date_fin`, `solde_debut`, `solde_fin`) VALUES
(1, '123456', '2024-01-01', '2024-12-31', 1000, 2000),
(2, '555', '2024-07-07', '2024-12-20', 1000, 2000),
(3, '123458', '2024-09-07', '2025-12-20', 1000, 2000),
(4, '123458', '2024-07-07', '2025-10-20', 1000, 2000);

-- --------------------------------------------------------

--
-- Structure de la table `satisfaction`
--

CREATE TABLE `satisfaction` (
  `id` bigint(20) NOT NULL,
  `avis` int(11) NOT NULL,
  `code_service` varchar(255) DEFAULT NULL,
  `date_heure` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `score` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `satisfaction`
--

INSERT INTO `satisfaction` (`id`, `avis`, `code_service`, `date_heure`, `description`, `score`) VALUES
(1, 4, 'credit immobilier', '2024-12-02 09:18:40.308611', 'Service rapide et efficace', 9.5),
(2, 3, 'consommation', '2024-12-02 09:20:20.424975', 'Service null', 8),
(3, 5, 'crédit consommation', '2024-12-02 09:26:54.983002', 'Service exceptionnel', 8.5),
(4, 2, 'crédit consommation', '2024-12-02 09:38:27.129139', 'Service moyen', 5),
(8, 1, 'crédit consommation', '2024-12-02 09:53:43.830563', 'Service 0', 0),
(9, 2, 'crédit consommation', '2024-12-02 09:56:37.498183', 'Service exellent', 10),
(10, 2, 'crédit consommation', '2024-12-02 11:15:53.418102', 'Service exellent', 10);

-- --------------------------------------------------------

--
-- Structure de la table `transaction`
--

CREATE TABLE `transaction` (
  `id` bigint(20) NOT NULL,
  `date_transaction` datetime(6) DEFAULT NULL,
  `montant` double NOT NULL,
  `numero_compte` varchar(255) DEFAULT NULL,
  `type_transaction` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `transaction`
--

INSERT INTO `transaction` (`id`, `date_transaction`, `montant`, `numero_compte`, `type_transaction`) VALUES
(5, '2024-12-02 09:30:00.000000', 700, '123456', 'Depot'),
(6, '2024-12-02 09:30:00.000000', 700, '123456', 'Depot');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `compte`
--
ALTER TABLE `compte`
  ADD PRIMARY KEY (`numero_compte`);

--
-- Index pour la table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `rapport`
--
ALTER TABLE `rapport`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `satisfaction`
--
ALTER TABLE `satisfaction`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `rapport`
--
ALTER TABLE `rapport`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `satisfaction`
--
ALTER TABLE `satisfaction`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
