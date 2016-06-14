-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Client: 127.0.0.1
-- Généré le: Mar 14 Juin 2016 à 15:42
-- Version du serveur: 5.5.49-0ubuntu0.14.04.1
-- Version de PHP: 5.5.9-1ubuntu4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `ppe`
--

-- --------------------------------------------------------

--
-- Structure de la table `Appliquer`
--

CREATE TABLE IF NOT EXISTS `Appliquer` (
  `nombreSemaine` int(11) DEFAULT NULL,
  `idPromotion` int(11) NOT NULL,
  `idCategorie` int(11) NOT NULL,
  PRIMARY KEY (`idPromotion`,`idCategorie`),
  KEY `FK_Appliquer_idCategorie` (`idCategorie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Categorie`
--

CREATE TABLE IF NOT EXISTS `Categorie` (
  `idCategorie` int(11) NOT NULL DEFAULT '0',
  `nomCategorie` varchar(25) DEFAULT NULL,
  `lien` int(5) NOT NULL,
  PRIMARY KEY (`idCategorie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `Categorie`
--

INSERT INTO `Categorie` (`idCategorie`, `nomCategorie`, `lien`) VALUES
(1, 'fleurs', 1),
(2, 'plantes', 2),
(3, 'accessoires', 3);

-- --------------------------------------------------------

--
-- Structure de la table `Client`
--

CREATE TABLE IF NOT EXISTS `Client` (
  `idClient` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `adresseClient` varchar(100) DEFAULT NULL,
  `paysClient` varchar(25) DEFAULT NULL,
  `mailClient` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idClient`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `Client`
--

INSERT INTO `Client` (`idClient`, `username`, `password`, `adresseClient`, `paysClient`, `mailClient`) VALUES
(1, 'ca', '$2y$10$MYbT/PGL0pOR6tBc5r', 'ca', 'FR', 'ca@ca.ca'),
(2, 'ca1', '$2y$10$eQQLvshfsGjXE8ViwQ', 'ca', 'FR', 'ca1@ca.ca'),
(3, 'ca2', '$2y$10$9xxf9kVf4ucZhd6zr/', 'ca', 'ZA', 'ca1@ca.ca2'),
(4, 'aze', '$2y$10$jJACuVdDUM5vbkNbfwHH5OPr6kIzGKuA0T.R41cZ8WoXL7EIJJi6G', 'aze', 'FR', 'aze@aze.aze');

-- --------------------------------------------------------

--
-- Structure de la table `Commande`
--

CREATE TABLE IF NOT EXISTS `Commande` (
  `idCommande` int(11) NOT NULL AUTO_INCREMENT,
  `etatCommande` int(11) DEFAULT NULL,
  `prixHT` int(11) DEFAULT NULL,
  `idClient` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCommande`),
  KEY `FK_Commande_idClient` (`idClient`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `Contenir`
--

CREATE TABLE IF NOT EXISTS `Contenir` (
  `idCommande` int(11) NOT NULL,
  `idProduit` int(11) NOT NULL,
  `quantitee` int(11) DEFAULT NULL,
  `prix` float NOT NULL,
  PRIMARY KEY (`idProduit`,`idCommande`),
  KEY `FK_Contenir_idCommande` (`idCommande`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Magasin`
--

CREATE TABLE IF NOT EXISTS `Magasin` (
  `adresse` varchar(100) NOT NULL,
  `horaire` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`adresse`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Produit`
--

CREATE TABLE IF NOT EXISTS `Produit` (
  `idProduit` int(11) NOT NULL AUTO_INCREMENT,
  `codeProduit` varchar(4) NOT NULL,
  `nomProduit` varchar(15) NOT NULL,
  `descriptionProduit` varchar(3000) NOT NULL,
  `prix` float DEFAULT NULL,
  `idCategorie` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProduit`),
  KEY `FK_Produit_idCategorie` (`idCategorie`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=40 ;

--
-- Contenu de la table `Produit`
--

INSERT INTO `Produit` (`idProduit`, `codeProduit`, `nomProduit`, `descriptionProduit`, `prix`, `idCategorie`) VALUES
(1, '4', 'Alstroemeria', 'Éclatante, élégante, peu exigeante, l''Alstroemère est une plante qui peut s''''adapter à tous les jardins. Dans un massif, en isolé, en bac, dans un bouquet, son élégance naturelle lui assurent une place de choix !<br/><br/>\nL’Alstroemeria est une plante à plusieurs facettes.<br/><br/>\nImpériale en bouquet, où son port la prédispose aux bouquets de grand style, elle est somptueuse au jardin, en massif ou en potée. L’élégance de sa fleur ne saurait passer inaperçue. Les pétales, finement dentelés sur les bords, ponctués ou striés au centre, se déclinent dans une large palette de couleurs : blanc, rose, rouge, saumon, orange et même violet.', 36, 1),
(2, '5', 'Amarylis', 'L’amaryllis est une magnifique plante d’intérieur capable de s’adapter en extérieur lorsque le climat est relativement chaud.<br/><br/>\nL’amaryllis, après la floraison, peut refleurir d’une année sur l’autre dans votre maison à condition de bien respecter certaines règles…', 25, 1),
(3, '6', 'Anemone', 'L’anémone est une fleur à bulbe tout à fait originale et très décorative.<br/>\nElle orne bordures et rocailles mais aussi massifs et bouquets au printemps ou en été.<br/>\nSi vous avez une terrasse ou un balcon, elle se plaira également en bac ou jardinière.<br/>\nEn résumé, ce qu’il faut savoir :<br/>\nNom : Anemone blanda<br/>\nFamille : Renonculacées<br/>\nType : Vivace à tubercule<br/>\nHauteur : 5 à 30 cm<br/>\nExposition : Ensoleillée et mi-ombre<br/>\nSol : Ordinaire, bien drainé<br/>\nFloraison : Mars à mai ou septembre/octobre', 20, 1),
(4, '7', 'Arum', 'L’arum ou calla est sans aucun doute l’une des plus belles fleurs à bulbe.<br/>\nDe la plantation à la taille, chaque geste d’entretien participe au bon développement et à la floraison de l’arum.<br/>\nEn résumé, ce qu’il faut savoir :<br/>\nNom : Zantedeschia aethiopica<br/>\nFamille : Aracacées<br/>\nType : Vivace bulbeuse<br/>\nHauteur : 50 à 100 cm<br/>\nExposition : Ensoleillée, mi-ombre<br/>\nSol : Riche, bien drainé<br/>\nFloraison : Juin à octobre', 56, 1),
(5, '8', 'Chrisanthème', 'Le chrysanthème est très connu pour orner les tombes, mais c’est aussi une magnifique plante pour fleurir nos jardins et terrasses.<br/>\nPlantation et entretien, retrouvez ce qu’il faut savoir pour avoir de beaux chrysanthèmes.<br/>\nEn résumé, ce qu’il faut savoir :<br/>\nNom : Chrysanthemum<br/>\nFamille : Astéracées<br/>\nType : Annuelle et vivace (selon espèces)<br/>\nHauteur : 40 à 100 cm<br/>\nExposition : Ensoleillée<br/>\nSol : Ordinaire<br/>\nFloraison : Juin à novembre', 18, 1),
(6, '9', 'Delphinium', 'Le delphinium que l’on appelle aussi Pied d’alouette est une formidable plante qui fleurit de juin à octobre.\r\n\r\nLe semis ou la plantation sont les seuls gestes à réaliser car les delphiniums ne réclament aucun entretien.\r\n\r\nEn résumé, ce qu’il faut savoir :\r\n\r\nNom : Delphinium\r\nFamille : Renonculac', 25, 1),
(7, '10', 'Freesia', 'Le freesia est une superbe fleur à bulbe à l’effet particulièrement décoratif.\r\n\r\nL’entretien, de la plantation à la taille, est très facile et le résultat souvent enchantant.\r\n\r\nEn résumé, ce qu’il faut savoir :\r\n\r\nNom : Freesia\r\nFamille : Iridacées\r\nType : Bulbeuse\r\n\r\nHauteur : 25 à 50 cm\r\nExposit', 16, 1),
(8, '11', 'Gerbera', 'Le gerbéra est une jolie plante d’intérieur originaire d’Afrique et très appréciée pour ses jolies fleurs\r\n\r\nTrès utilisée en bouquet, c’est aussi sa bonne tenu qui en fait une des fleurs préférée des fleuristes.\r\n\r\nEn résumé, ce qu’il faut savoir :\r\n\r\nNom : Gerbera\r\nFamille : Asteracées\r\nType : Pla', 8, 1),
(9, '12', 'Giroflée', 'La giroflée est une petite fleur à l’odeur suave incontournable des massifs de vivaces, tant pour ses couleurs que par sa forme originale.\r\n\r\nEn résumé, ce qu’il faut savoir :\r\n\r\nNom : Erysimum\r\nFamille : Brassicacées\r\nType : Annuelle ou bisannuelle\r\n\r\nHauteur : 20 à 40 cm\r\nExposition : Ensoleillée\r', 16, 1),
(10, '13', 'Glaïeul', 'Le glaïeul fait partie des plus belles fleurs à bulbe.\r\n\r\nLa plantation et l’entretien des glaïeuls, du printemps à l’hiver, sont faits de petits gestes qui vont améliorer la floraison.\r\n\r\nEn été, on profite des magnifiques fleurs et en hiver on prend soin de les garder à l’abri du gel…\r\n\r\nNom : Gla', 29, 1),
(11, '14', 'Iris', 'L’iris barbus est une vivace aussi facile à cultiver que décorative lorsqu’elle est en fleur.\r\n\r\nA la fois classique, belle et élégante, elle aime être au soleil et ne demande rien d’autre !\r\n\r\n\r\nNom : Iris barbata\r\nFamille : Iridacées\r\nType : Fleur bulbeuse ou vivace\r\n\r\nHauteur : 20 à 90 cm\r\nExposi', 30, 1),
(12, '15', 'Jacinthe', 'La jacinthe fait sans doute partie des plus jolies fleurs à bulbe.\r\n\r\nElle s’utilise normalement en extérieur mais on la retrouve aussi dès le début de l’hiver dans nos intérieurs\r\n\r\nPlantation et entretien  du printemps à l’hiver, voici tous les conseils.\r\n\r\nEn résumé, ce qu’il faut savoir :\r\n\r\nNom', 16, 1),
(13, '16', 'Jonquille', 'La Jonquille est une très belle fleur à bulbe, caractérisé par sa belle couleur jaune.\r\n\r\nLa plantation et l’entretien amélioreront la floraison qui peut même devenir un vrai spectacle lorsqu’ils sont plantés par dizaines.\r\n\r\nEn résumé, ce qu’il faut savoir :\r\n\r\nNom : Jonquillus\r\nFamille : Amaryllid', 21, 1),
(14, '17', 'Lilas', 'Le lilas fleurît et parfume dès le début du printemps.\r\n\r\nLa taille, l’entretien ou la plantation sont autant de gestes qui participeront à la beauté de votre lilas.\r\n\r\nEn résumé, ce qu’il faut savoir :\r\n\r\nNom : Syringa vulgaris\r\nFamille : Oléacées\r\nType : Arbuste\r\nHauteur : 2 à 5 m\r\n\r\nExposition : ', 12, 1),
(15, '18', 'Lis', 'Les lis sont des plantes à bulbes. Ils sont cultivés pour leurs fleurs colorées et parfumées.\r\n\r\nLes lis produisent des feuilles allongées qui peuvent atteindre près de 30 cm de long.\r\n\r\nIls aiment le plein soleil et un sol bien drainé.\r\n\r\nLeur insecte ravageur est la larve de criocère et ils peuven', 35, 1),
(16, '19', 'Mimosa', 'Le mimosa est l’un des plus beaux arbustes à floraison hivernale.\r\n\r\nLa plantation, la taille et l’entretien vous aideront à avoir un très beau mimosa.\r\n\r\nEn résumé, ce qu’il faut savoir :\r\n\r\nNom : Acacia dealbata\r\nFamille : Mimosacées\r\nType : Arbre\r\n\r\nHauteur: 4 à 10 m\r\nExposition : Ensoleillée\r\nSo', 11, 1),
(17, '20', 'Muguet', 'Le muguet n’est pas simplement une jolie fleur, elle est aussi le symbole de la fête du travail.\r\n\r\nL’entretien, de la plantation à la floraison est un jeu d’enfant et un vrai plaisir lorsqu’il est en fleur !\r\n\r\n\r\n\r\nEn résumé, ce qu’il faut savoir :\r\n\r\nNom : Convallaria\r\nFamille : Asparagacées\r\nType', 38, 1),
(18, '21', 'Myosotis', 'Les myosotis sont des jolies bisannuelles ou des vivaces selon les variétés et le climat.\r\n\r\nSouvent utilisées en rocaille, bordure ou plate-bande, c’est une plante qui se resème toute seule et devient parfois envahissante.\r\n\r\nEn résumé, ce qu’il faut savoir :\r\n\r\nNom : Myosotis\r\nFamille : Boraginacé', 16, 1),
(19, '22', 'Narcisse', 'Le narcisse est une très belle fleur à bulbe, caractérisé par sa belle couleur jaune.\r\n\r\nLa plantation et l’entretien amélioreront la floraison qui peut même devenir un vrai spectacle lorsqu’ils sont plantés par dizaines.\r\n\r\nEn résumé, ce qu’il faut savoir :\r\n\r\nNom : Narcissus\r\nFamille : Amaryllidac', 10, 1),
(20, '23', 'Oeillet', 'L’oeillet est une annuelle offrant de très jolies fleurs durant tout l’été.\r\n\r\nLa plantation et l’entretien sont des gestes qui améliorent la floraison.\r\n\r\nEn résumé, ce qu’il faut savoir :\r\n\r\nNom : Tagetes\r\nFamille : Asteracées\r\nType : Annuelle\r\n\r\nHauteur : 20 à 90 cm\r\nExposition : Ensoleillée\r\nSol', 8, 1),
(21, '24', 'Orchidée', 'Les orchidées ou orchidacées (Orchidaceae) forment une grande famille de plantes monocotylédones. C''est une des familles les plus diversifiées, comptant plus de vingt-cinq mille espèces, réparties en huit-cent-cinquante genres.\r\nCe sont des plantes herbacées, de type divers, autotrophes ou mycotroph', 46, 1),
(22, '25', 'Pivoine', 'La pivoine est une très jolie fleur, assez capricieuse, dont l’entretien participe largement à la floraison.\r\n\r\nDu printemps à l’hiver et de la plantation à la taille des fleurs fanées, voici tous les conseils.\r\n\r\nEn résumé, ce qu’il faut savoir :\r\n\r\nNom : Paeonia\r\nFamille : Paéoniacées\r\nType : Viva', 32, 1),
(23, '26', 'Pois de senteur', 'Le pois de senteur est une fleur qui nous ravit durant tout l’été.\r\n\r\nSes fleurs, finement découpées, et son odeur délicate en fait l’une des plus jolies annuelles.\r\n\r\nAdoptez les pois de senteur et vous serez conquis !\r\n\r\nEn résumé, ce qu’il faut savoir :\r\n\r\nNom : Lonicera\r\nFamille : Caprifoliacées', 21, 1),
(24, '27', 'Rose', 'Nom : Rose\r\nFamille : Rosier buisson\r\nType : Rosier\r\n\r\nHauteur : 80 à 100 cm\r\nExposition : Ensoleillée ou mi-ombre\r\nSol : Ordinaire\r\n\r\nFeuillage : Caduc\r\nFloraison : mai à décembre', 52, 1),
(25, '30', 'Pink rose ', 'Nom : Pink Rose\r\nFamille : Rosier buisson\r\nType : Rosier\r\n\r\nHauteur : 80 à 100 cm\r\nExposition : Ensoleillée ou mi-ombre\r\nSol : Ordinaire\r\n\r\nFeuillage : Caduc\r\nFloraison : mai à décembre', 56, 1),
(26, '31', 'Orange rose', 'Nom : Orange Rose\r\nFamille : Rosier buisson\r\nType : Rosier\r\n\r\nHauteur : 80 à 100 cm\r\nExposition : Ensoleillée ou mi-ombre\r\nSol : Ordinaire\r\n\r\nFeuillage : Caduc\r\nFloraison : mai à décembre', 59, 1),
(27, '32', 'Rose de noël', 'L’hellébore que l’on appelle rose de Noël est une magnifique fleur a floraison hivernale.\r\n\r\nL’entretien et le plantation sont des gestes qui faciliteront la floraison.\r\n\r\nEn résumé, ce qu’il faut savoir :\r\n\r\nNom : Helleborus\r\nFamille : Renonculacées\r\nType : Vivace\r\n\r\nHauteur : 30 à 80 cm\r\nExpositio', 62, 1),
(28, '33', 'Tulipe', 'La tulipe est, parmi les fleurs à bulbe, une incontournable de nos jardins.\r\n\r\nLa plantation et l’entretien des tulipes favorisera la floraison tout en garantissant une belle reprise d’année en année.\r\n\r\nNom : Tulipa\r\nFamille : Liliacées\r\n\r\nHauteur: 20 à 75 cm\r\nSol : Bien drainé\r\n\r\nExposition : Enso', 20, 1),
(29, '34', 'Rosier en Pot', 'Les rosiers, ou églantiers, forment un genre de plantes, le genre Rosa de la famille des Rosaceae, originaires des régions tempérées et subtropicales de l''hémisphère nord. Ce sont des arbustes et arbrisseaux sarmenteux et épineux. Suivant les avis souvent divers des botanistes, le genre Rosa compren', 65, 3),
(30, '35', 'Rosier', 'Les rosiers, ou églantiers, forment un genre de plantes, le genre Rosa de la famille des Rosaceae, originaires des régions tempérées et subtropicales de l''hémisphère nord. Ce sont des arbustes et arbrisseaux sarmenteux et épineux. Suivant les avis souvent divers des botanistes, le genre Rosa compren', 12, 2),
(31, '36', 'Pelargonium imp', 'Le géranium lierre est une formidable plante d’ornement.\r\n\r\nLa culture et  l’entretien sont faciles pour avoir de belles fleurs. En balcon, en terrasse ou au jardin, l’effet décoratif est garanti.\r\n\r\nNom : Pelargonium peltatum\r\nFamille : Geraniacées\r\nType : Vivace\r\n\r\nHauteur : 30 à 80 cm\r\nExposition', 22, 2),
(32, '37', 'Geranium', '\r\nLe géranium vivace est une variété qui présente l’avantage d’être rustique et donc résistant au gel.\r\n\r\nLa plantation, l’entretien et la taille vous aideront à avoir de magnifiques fleurs durant tout l’été.\r\n\r\nNom : Geranium\r\nFamille : Géraniacées\r\nType : Vivace\r\n\r\nHauteur : 20 à 60 cm\r\nExposition', 24, 2),
(33, '38', 'Pelargonium mis', 'Les pélargoniums présentent une extraordinaire variété de formes, de couleurs, de textures et surtout de délicieuses effluves dès que vous les effleurez ou les arrosez.\r\nLe pélargonium ''Mistress Parker'' est une variété de type zonale à la végétation compacte et au port érigé. Ses fleurs délicates so', 25, 2),
(34, '39', 'Pelargonium lan', 'Des fleurs innombrables pour des jardinières classiques. Les pelargoniums zonales se distinguent par leurs très grosses fleurs de mai jusqu''aux gelées, leur port érigé et des feuilles presques rondes. \r\nLa couleur de ces 12 Pelargoniums ''Lannion'' est orange vif, ses fleurs sont doubles. ', 25, 3),
(35, '40', 'Pot', 'Caractéristiques techniques :\r\n\r\nMatière :\r\nPolyéthylène\r\nLitrage :\r\nD25xH22cm - Litrage : 6,7\r\nD30xH27cm - Litrage : 11,5\r\nD35xH31cm - Litrage : 18,5\r\nLes plus produit :\r\n\r\nLéger et résistant\r\nDes coloris modernes\r\nDisponible en : D25xH22cm, D30xH27cm, D35xH31cm\r\nDisponible en : Rouge Mat, Blanc, N', 1, 3),
(36, '41', 'Pot en fibre', 'Notre avis :\r\nGrâce à une forme simple et élégante, ce pot en fibre de terre convient à tout type de plantes. Sa forme rectangulaire haute est idéale pour délimiter les espaces et construire un ensemble végétal dense.\r\n\r\nCaractéristiques :\r\nLa fibre de terre est solide et légère. Elle possède un ray', 12, 3),
(37, '42', 'Pot résine', 'Cache pot résine\r\n\r\nCe cache pot résine est l''accessoire de décoration extérieure idéal pour accompagner vos salons de jardin tressés.\r\nLes avantages du cache pot résine\r\n\r\n- Design tendance,\r\n- Grande robustesse,\r\n- Structure entièrement démontable.\r\nGarantie 1 an.', 15, 3),
(38, '43', 'Pot zinc', 'Cache-pot simple en zinc patiné équipé d''une accroche pour vos balcons et ballustrades. Aromates et fleurs y trouveront leur place, mais vous pourrez également détourner cet objet pour y ranger par exemple, vos ustensiles de cuisine, cuillères en bois, éponges, tire bouchon etc...ou encore vos outil', 17, 3),
(39, '44', 'Bille argile', 'La bille d’argile est un substrat, utilisable en agriculture biologique. Il a la particularité d’être extrêmement stable et durable..\r\n\r\nGrâce à une composition 100% minérale, ce produit est à la fois utile pour le drainage, le rempotage mais également, pour la décoration !', 5, 3);

-- --------------------------------------------------------

--
-- Structure de la table `Promotion`
--

CREATE TABLE IF NOT EXISTS `Promotion` (
  `idPromotion` int(11) NOT NULL AUTO_INCREMENT,
  `nomPromotion` varchar(25) DEFAULT NULL,
  `taux` float DEFAULT NULL,
  `dateDebut` date DEFAULT NULL,
  PRIMARY KEY (`idPromotion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `Appliquer`
--
ALTER TABLE `Appliquer`
  ADD CONSTRAINT `FK_Appliquer_idCategorie` FOREIGN KEY (`idCategorie`) REFERENCES `Categorie` (`idCategorie`),
  ADD CONSTRAINT `FK_Appliquer_idPromotion` FOREIGN KEY (`idPromotion`) REFERENCES `Promotion` (`idPromotion`);

--
-- Contraintes pour la table `Commande`
--
ALTER TABLE `Commande`
  ADD CONSTRAINT `FK_Commande_idClient` FOREIGN KEY (`idClient`) REFERENCES `Client` (`idClient`);

--
-- Contraintes pour la table `Contenir`
--
ALTER TABLE `Contenir`
  ADD CONSTRAINT `FK_Contenir_idCommande` FOREIGN KEY (`idCommande`) REFERENCES `Commande` (`idCommande`),
  ADD CONSTRAINT `FK_Contenir_idProduit` FOREIGN KEY (`idProduit`) REFERENCES `Produit` (`idProduit`);

--
-- Contraintes pour la table `Produit`
--
ALTER TABLE `Produit`
  ADD CONSTRAINT `FK_Produit_idCategorie` FOREIGN KEY (`idCategorie`) REFERENCES `Categorie` (`idCategorie`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
