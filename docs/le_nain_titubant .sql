-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 27 mai 2020 à 12:06
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `le_nain_titubant`
--

-- --------------------------------------------------------

--
-- Structure de la table `beer`
--

DROP TABLE IF EXISTS `beer`;
CREATE TABLE IF NOT EXISTS `beer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alcohol` decimal(3,1) NOT NULL,
  `origin` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brewing_type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_58F666AD3DA5256D` (`image_id`),
  KEY `IDX_58F666ADA76ED395` (`user_id`),
  KEY `IDX_58F666AD12469DE2` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `beer`
--

INSERT INTO `beer` (`id`, `name`, `alcohol`, `origin`, `brewing_type`, `user_id`, `image_id`, `category_id`, `description`) VALUES
(2, 'Maredsous Tripel', '10.0', 'Belgique', 'Triple', 1, 8, 1, '<h2 style=\"text-align: center; \"><b>MAREDSOUS TRIPEL</b></h2><h2 style=\"text-align: center; \"><b><br></b></h2><p>La bière Maredsous est une bière belge de fermentation haute brassée pour les moines de <a href=\"https://fr.wikipedia.org/wiki/Abbaye_de_Maredsous\" target=\"_blank\">l\'abbaye de Maredsous</a> par la brasserie Duvel.</p><p>Curieusement, cette bière n\'a jamais été produite sur les lieux même de l\'abbaye bénédictine de Maredsous, à Denée, en province de Namur1. On peut cependant la déguster sur place dans des chopes en terre 2. En 1949, la Maredsous 6 est créée et produite dans la brasserie du Faleau à Châtelineau. À la fermeture de la brasserie du Faleau en 1960, la production déménage à la brasserie Caulier. Depuis 1963, l’abbaye a confié la production et la commercialisation à la brasserie Duvel située à Puers-Saint-Amand en province d\'Anvers, sous le contrôle des moines.</p><p>La bière est filtrée avant la mise en bouteille, ce qui lui donne une grande limpidité.</p><p>La légende veut que le bruit que fait le verre distribué dans la brasserie (le verre Maredsous) fait le même son que les cloches de l\'abbaye.</p><p>De son nez riche, on retiendra son malté-caramélisé et ses notes de levures et de fruits comme l’abricot. La bouche est en accord avec le nez, plutôt ronde et empreinte de sucre candi, avant d’évoluer sur les levures et les épices douces. L’amertume est très discrète, l’alcool se perçoit davantage en finale, tout en étant enrobé de notes de miel de forêt.\r\n\r\nBière d’abbaye brassée depuis 1963, on peut la déguster à l’abbaye Maredsous dans la province de Namur, dans d’authentiques chopes en terre. Bien qu’elle ne soit plus brassée sur place, les moines contrôlent toujours que la fabrication respecte leurs valeurs !\r\n\r\nUne bière douce de couleur ambre. Elle est marquée par un bel équilibre entre les arômes de malt et d\'houblon. Arrière-goût moelleux.\r\n\r\nTrès reconnaissable grâce à ses 2 clochers, l\'abbaye de Maredsous se situe entre Dinant et Namur et abrite des moines bénédictins. Le complexe du monastère représente aujourd\'hui un important centre touristique qui accueille beaucoup de visiteurs.\r\n\r\nIl existe 4 bières de Maredsous, toutes de haute fermentation avec refermentation en bouteilles. Elles sont fabriquées à la brasserie Moortgat à Breendonk (Duvel).<br><p></p></p>'),
(3, 'Trappe Quadrupel', '10.0', 'Hollande', 'Quadruple', 1, 9, 4, '<h2 style=\"text-align: center; \"><b>TRAPPE QUADRUPEL</b></h2><h2 style=\"text-align: center; \"><b><br></b></h2><div><div>Brassée par l\'abbaye Notre-Dame de Koningshoeven, la première <b>Abbaye Trappiste</b> des Pays-Bas, La Trappe Quadrupel est l\'une des plus chargées en alcool de la gamme Trappe (10%), en compagnie de La <b>Trappe Quadrupel vieillie en fût</b>.</div><div><br></div><div>Cette <b>trappiste</b> dévoile, dans son verre La Trappe associé, une magnifique<b> robe ambre aux reflets rougeâtres</b> sur laquelle trône une tête durable beige.</div><div><br></div><div>Le nez nous offre un bouquet aromatique complexe avec des parfums de fruits divers (figue, prune et banane), des notes caramélisées et épicées ainsi qu\'une une pointe de vanille.</div><div><br></div><div>La bouche dévoile toute la chaleur et l\'intensité de cette grande bière. On discerne des saveurs de malt, de fruits mûrs que l\'on imaginait au nez, de levure épicée, de caramel et un réchauffement alcoolisé. Le tout conduisant à une fintion soignée avec du sucre candi et une pointe d\'amertume.</div><div><br></div><div>Un fabuleux exemple du style Quadrupel !</div><div><br></div><div><div>Couleur : Une chaude couleur ambrée avec une mousse crémeuse.</div><div><br></div><div>Odeur : Un mélange de clous de girofle et de noix, équilibré par de douces saveurs de vanille, de raisins secs et de banane.</div><div><br></div><div>Goût : La Trappe Quadrupel est la bière la plus corsée de La Trappe Trappist, et c\'est également elle qui a donné son nom à cette gamme de bières. Elle présente un goût prononcé, intense et chaleureux. Maltée, on y retrouve des notes sucrées de dattes et de caramel.</div><div><br></div><div>Fin de bouche : Un arrière-goût doux et légèrement amer.</div><div><br></div><div>Caractéristiques :&nbsp;<span style=\"font-size: 0.875rem;\">La première bière quadruple du monde</span></div><div><br></div><div>La Trappe Quadrupel de l’abbaye de Koningshoeven est une légende ! C’est la toute première bière de type « quadrupel » au monde, soit une bière comprenant quatre fois plus d’ingrédients (houblon et malt – utilisés pour le brassage) que la bière « blonde » de référence. Concrètement, cela implique simplement un taux d’alcool plus élevé et des arômes plus typés. A l’oeil, vous pourrez contempler une robe ambrée surplombée d’une belle mousse fine blanc cassé. Et pour la dégustation : des notes de caramel, raisins secs, épices et fruits noirs. La Trappe Quadrupel se sert entre 10°C et 14°C, et mettra tout le monde d’accord à l’apéro. D’autant qu’elle porte le précieux logo « Authentic Trappist Product », garantie officielle de son authenticité monastique. Une pépite, donc ! Mais le mieux est encore de s’en convaincre soi-même : à vous de jouer ! 😇</div><div><br></div><div>Cette bière a une robe ambrée aux reflets pourpres et titre à 10% vol alc. Le nez offre un bouquet aromatique complexe, avec des parfums de divers fruits (figue, prune, banane), des notes caramélisées et épicées, ainsi qu’une pointe de vanille. En bouche, elle dévoile la chaleur et l’intensité de cette grande bière. On retrouve des saveurs de malt, de fruits mûrs, de caramel et de levure épicée. Pour finir, une finale soignée, avec du sucre candi et une pointe d’amertume. La Trappe Quadruple est brassée par la brasserie N.D. de Koningshoeven aux Pays-Bas.<br></div><div><span style=\"font-size: 0.875rem;\"><br></span></div></div></div>'),
(4, 'Tripel Karmeliet', '8.4', 'Belgique', 'Triple', 1, 10, 1, '<p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">La bière&nbsp;<b>Tripel Karmeliet</b>&nbsp;est l\'un des grands classiques des&nbsp;bières belges. Selon la&nbsp;<a href=\"https://www.saveur-biere.com/fr/53_brasserie-bosteels\" style=\"\">brasserie</a>, la recette utilisée serait la même depuis 1679. A l\'époque, la Karmeliet était alors produite au sein de l\'abbaye carmélite de Dendermonde. Bière de fermentation haute et refermentée en bouteille, elle présentait déjà à l\'époque la particularité d\'être produite à partir de trois céréales : l\'orge, le froment et l\'avoine. C\'est d\'ailleurs de ces ingrédients qu\'elle tire son nom.</p><p style=\"margin: 8px 0px 0px;\">A la dégustation, cette bière belge présente une&nbsp;<b>robe</b>&nbsp;blonde dorée et une mousse crémeuse. Le&nbsp;<b>nez</b>&nbsp;s\'avère à la fois raffiné et complexe. On retrouve ainsi les notes d\'épices et de banane propres à la levure utilisée mêlées aux arômes agrumes du houblon Styrians. <b>En&nbsp;bouche</b>, ce sont les différentes céréales qui s\'expriment en premier, associées ensuite aux touches houblonnées du Styrian. La texture, à la fois sèche et crémeuse rend la Tripel Karmeliet délicieusement équilibrée.</p><p style=\"margin: 8px 0px 0px;\">Afin qu\'elle puisse développer au mieux sa complexité aromatique, son verre Tripel&nbsp;Karmeliet 25 cl&nbsp;ou&nbsp;50 cl&nbsp;est également disponible !</p><p style=\"margin: 8px 0px 0px;\">Son petit nom vous est forcément familier : la Tripel Karmeliet (ou Karmeliet Triple) est un <b>incontournable</b> pour tout amateur de bières belges qui se respecte. Aujourd’hui, nous avons décidé de vous en dire un peu plus sur cette création de la <a href=\"https://bestbelgianspecialbeers.be/fr/\" target=\"_blank\">brasserie Bosteels</a>, également célèbre pour la Kwak que vous connaissez sans nul doute ! Cette <b>bière</b> de <b>fermentation haute</b>, que l’on peut considérer comme un grand classique, possède néanmoins des caractères originaux qu’il est bon de vous raconter…</p><p style=\"margin: 8px 0px 0px;\">La recette de cette bière a été inventée au XVII ème siècle par les Carmélites de <b>Dendermonde</b> dans un couvent en région Flamande. Il s’agit, comme son nom l’indique, d’une <b>bière triple</b>, c’est à dire une bière de fermentation haute refermentée en bouteille (et donc triple fermentation). Mais ce qualificatif renvoie également à une seconde particularité : <b>sa recette</b> ! En effet, la recette élaborée par les Carmélites comporte un malt constitué de trois céréales, <b>l’orge, le froment et l’avoine</b> !</p><p style=\"margin: 8px 0px 0px;\">Brassée pour la première fois en <b>1679</b>, sa production a été <b>relancée en 1996 en restant fidèle à sa recette initiale</b>. La Tripel Karmeliet remportait déjà l’approbation générale au XVIIème siècle, et en fait de même aux XXème et XXIème siècles ! Preuve en est, elle atteint le <b>score incroyable de 99/100</b> sur le site de notation Ratebeer. Elle dépasse même les 4/5 au sein de la communauté Une Petite Mousse !</p><p style=\"margin: 8px 0px 0px;\">Servie dans son verre tulipe au design sur-mesure permettant à la mousse et aux arômes de s’exprimer pleinement, cette jolie blonde présente une robe dorée que précède un col de mousse crémeux. Au nez, elle fleure bon la vanille et le citron. On retrouve ces touches épicées et sucrées dès la première gorgée, relevées de notes de houblon. Mais saurez-vous reconnaître les différentes flaveurs apportées par ses trois céréales, l’orge, le froment et l’avoine ? Sa texture, à la fois sèche et crémeuse rend la Tripel Karmeliet délicieusement équilibrée malgré son 8,4°.</p><p style=\"margin: 8px 0px 0px;\">Dès la deuxième lampée, on sait déjà que cette bière Karmeliet fera partie de nos favorites ! D’ailleurs, voici ce que dit Mathilde, notre biérologue avisée, au sujet de cette douce blonde :</p><p style=\"margin: 8px 0px 0px;\">Ce qui frappe d’emblée lorsque l’on sert une Karmeliet, c’est le dôme impressionnant de mousse crémeuse qui emplit son verre ! Le nez révèle des arômes fruités, agrumés et des notes de céréales. Tous ces arômes se retrouvent en bouche démultipliés avec l’ajout de houblon.</p><p style=\"margin: 8px 0px 0px;\"><br></p><p style=\"margin: 8px 0px 0px;\"><br></p>'),
(5, 'Chimay Bleue', '9.0', 'Belgique', 'Triple', 1, 11, 2, '<h2 style=\"text-align: center; \"><b>CHIMAY BLEUE</b></h2><h2 style=\"text-align: center; \"><b><br></b></h2><div>La <b>Chimay Bleue</b> est une bière trappiste belge, brassée par <a href=\"https://divinebox.fr/abbaye-scourmont/\" target=\"_blank\">l’abbaye de Scourmont</a> depuis 1948. Avec ses 9 % (vol.), elle est la bière plus forte des trois Chimay (Bleue, Blanche, Rouge). Sous sa belle robe brune foncée, elle dévoile des arômes de caramel, d’épices, de fruits noirs et de chocolat.</div><div><br></div><div>Mais savez-vous pourquoi elle fut brassée et d’où elle tire son nom ? Ou encore qu’elle est parmi les meilleures bières du monde ? On vous résume la <b>Chimay Bleue</b> en 8 infos indispensables à savoir !</div><div><br></div><div><div>La toute première <b>Chimay Bleue</b> de l’histoire est sortie des cuves de l’abbaye de Scourmont en 1948. C’est le Père Théodore qui en inventa la recette, avec l’aide du Professeur De Clerck. La recette n’a bien sûr pas changé depuis !</div><div><br></div><div>Mais entre 1948 et 1954, <b>la Chimay Bleue</b> ne s’appelait pas ainsi. Elle s’appelait : la bière de Noël. Car elle n’était brassée spécialement que pour la fête de Noël ! Cependant, face à son succès grandissant, les moines se sont rendus compte que tout le monde souhaitait pouvoir en profiter toute l’année ! Depuis 1954, ils ont donc décidé de la brasser toute l’année ! Youpi !</div><p></p><ul></ul><div><br></div><div>Ainsi, lorsque les bières étaient rangées dans leurs caisses, et que seules leurs capsules dépassaient, un rapide coup d’oeil permettait directement aux moines de les différencier ! Et c’est ainsi que l’ancienne « Bière de Noël » est devenue par hasard… la <b>Chimay Bleue</b> ! Une des trois couleurs primaires : simple, sobre, efficace.</div><div><br></div><p></p><div>Saviez-vous que la Chimay Bleue n’est pas simplement belle par sa robe et par la couleur de sa capsule, mais aussi bonne ? Très bonne, même. C’est pourquoi il est tout naturel de la trouver rangée parmi les meilleures bières du monde.</div><div><div><br></div><ul><li>Elle est en effet notée 100/100 (rien que ça) sur le site RateBeer, un site d’experts qui classent et notent plus de 200 000 bières du monde entier, et parmi plus de 16 000 brasseries !</li><li>Et sur ce même site, elle est aussi 12e au classement du « Top 50 des ‘Belgian Strong Ale‘ ». Plutôt fort, non ?</li><li>Le site Belgibeer, quant à lui, lui donne la 3e place dans le « Top 10 des meilleures bières trappistes » !</li><li>Unepetitemousse la classe en première position dans le classement des bières belges.</li><li>Le Paradis de la Bière lui décerne la 2e place.</li></ul><div>Bref, vous avez compris l’idée, et l’on pourrait encore continuer longtemps…</div><div><br></div><div><div>Le secret du goût unique de la <b>Chimay Bleue</b> viendrait, selon certains, de ses ingrédients :</div><div><br></div><ul><li>L’eau : sous l’abbaye de Scourmont, se trouve une nappe phréatique, dont la finesse et la qualité de l’eau sont précieusement entretenues. C’est avec cette eau que les moines brassent notamment la <b>Chimay Bleue</b>. Pour la préserver, les moines trappistes rachètent et transforment petit à petit, depuis le début, les terrains disposés au dessus de celle-ci. Ils y installent à la place des espaces de culture biologique. La qualité de l’eau est ensuite régulièrement contrôlée par le laboratoire de l’abbaye, et par des laboratoires indépendants !</li></ul><ul><li>La levure : les souches de levures de la <b>Chimay Bleue</b> sont également uniques au monde. Elles ont été cultivées et isolées par le Père Théodore en 1948. Elles sont aujourd’hui précieusement conservés en différents endroits, pour parer à toute éventualité. Au sein de l’abbaye de Scourmont, bien sûr, mais aussi en Angleterre et à l’université de Louvain !</li></ul><p><br></p></div></div><div><br></div><div><br></div></div>'),
(6, 'Westmalle Tripel', '9.5', 'Belgique', 'Triple', 1, 12, 1, '<h2 style=\"text-align: center; \"><b>WESTMALLE TRIPEL</b></h2><h2 style=\"text-align: center; \"><b><br></b></h2><p>La <b>Westmalle Tripel</b> est une bière trappiste bonde qui titre à 9,5% (vol.). Brassée depuis 1956 par l’<a href=\"https://divinebox.fr/categorie-produit/producteurs/abbaye-de-westmalle/\" target=\"_blank\">abbaye de Westmalle</a> en Belgique, elle dévoile des arômes de fruits mûrs, de banane, et une amertume balancée. Elle est souvent surnommée « l’archétype de la bière blonde », « la blonde la plus célèbre » et surtout « la mère de toutes les triples ». Mais savez-vous pourquoi ?</p><p>On vous explique tout ce que vous devez savoir sur la mythique <b>Westmalle Tripel</b> juste en dessous, c’est parti !</p><p>Saviez-vous qu’on surnomme la Westmalle Tripel « la mère de toutes les triples » ? C’est tout simplement parce qu’elle est la première bière du monde de la catégorie des triples !</p><p>La <b>Westmalle Tripel</b> a été brassée pour la première fois par les moines de l’abbaye de Westmalle en 1934, à l’occasion de la mise en opération de leur nouvelle salle de brassage. Par la suite, la recette sera légèrement changée en 1956, et c’est encore cette recette qui est utilisée aujourd’hui. La <b>Westmalle Tripel</b> est donc historiquement bien la première triple du monde !</p><p>Mais pourquoi l’appeler « Tripel » ? Et non, ce n’est pas parce qu’elle a une triple fermentation, comme on le croit souvent.</p><p>En réalité, ce terme fait tout simplement référence à la triple dose de matières premières que contenait à l’origine cette bière. En 1934, la <b>Westmalle Tripel</b> contenait en effet trois fois plus de malt, de houblon et de levure que la bière trappiste originelle de Westmalle, l’ « Enkel », une bière blonde et légère qu’ils brassaient au XIXe siècle pour leurs repas au réfectoire.</p><p>Aujourd’hui, tout le monde utilise le terme « triple » pour simplement désigner un style de bière : la bière blonde forte, dont le degré d’alcool oscille entre 7 et 10% (vol.). Ce terme n’a donc aujourd’hui plus aucun rapport avec un quelconque triplement d’ingrédients. Mais tout le monde utilise quand même ce terme inventé par les moines de Westmalle, qui sont donc bien les premiers à avoir brassé la véritable triple !</p><p>L’abbaye de Westmalle est assez « récente » dans le paysage monastique, puisqu’elle a été construite en 1794. Les moines trappistes n’y construisent une brasserie qu’en 1836, et c’est elle qui est encore en activité de nos jours !</p><p>Certes, en 180 ans d’histoire elle a bien connus quelques aventures : notamment pendant la première Guerre mondiale, quand ses cuves furent réquisitionnées par l’envahisseur allemand « au nom de l’effort de guerre». Mais dans le paysage monastique, aucune brasserie, parmi celles qui sont encore en activité, n’a été construite il y a si longtemps !</p><p>Mais alors pourquoi construire une brasserie ?</p><p>Parce que le 14 septembre 1836, le pape Grégoire XVI unifie les règles des moines trappistes alors en vigueur. Résultat : tous les trappistes sont désormais autorisés à boire de la bière ! Ni une ni deux, les frères de l’abbaye de Westmalle sautent sur l’occasion, et décident de produire eux-mêmes leur propre bière plutôt que d’en acheter ! Car la bière, aussi surnommée « le pain liquide », est aussi très pratique pour se nourrir, notamment pendant le carême !</p><p>C’est ainsi que leur brasserie ne servira d’abord, pendant quelques années, qu’à brasser leur bière de table au réfectoire, la fameuse « Enkel. » C’est elle qui servira ensuite d’étalon à leurs futures bières Westmalle Dubbel et <b>Westmalle Tripel</b>.</p><p>C’est lorsqu’il se mirent à brasser la Westmalle Dubbel en 1856 qu’ils en vendirent quelques unes à la porte de leur abbaye. Mais le succès fut si grand que la brasserie de l’abbaye commença bien vite à se forger une sacré réputation ! Seulement 5 ans plus tard, en 1861, les moines décident donc d’ouvrir leur brasserie sur le monde, et de commercialiser à plus grande échelle leurs bières, en s’inspirant de leurs voisins de l’abbaye de Scourmont, qui brassent la fameuse Chimay.</p>'),
(7, 'Gouden Carolus Tripel', '9.0', 'Belgique', 'Triple', 1, 13, 1, '<h2 style=\"text-align: center; \"><b>GOUDEN CAROLUS TRIPEL</b></h2><h2 style=\"text-align: center; \"><br></h2><div>Malgré les progrès technologiques, cette bière est brassée selon la <b>méthode traditionnelle</b> et rassemble, comme auparavant, les meilleures matières premières de notre sol comme l\'orge et le houblon afin de préserver la pureté de sa saveur. A l’origine, en 1491, cette bière était brassée pour les Chevaliers de la Toison d\'Or. Cette bière au goût soigné vous enchantera: mûrie en bouteille, exclusivement obtenue à partir de malt pâle, fermentée, elle est 100% naturelle. Sa <b>saveur corsée la rend particulièrement désaltérante</b>.</div><div><br></div><div>Pour une dégustation idéale, dégustez-la à une température de 7°C. Versez-la lentement dans le verre. Cette variété est très appréciée par les amateurs de bière plus corsée, légèrement épicée et rafraîchissante.</div><div><br></div><div>UNE TRIPLE DE RENOMMÉE MONDIALE.</div><div>Déjà en 2002, cette bière a remporté la médaille d\'or au World Beer Cup dans la catégorie ‘Triple’. Elle a remis cela en 2010 à l\'European Beer Star dans la catégorie ‘Belgian Style Tripel’. En 2012, une nouvelle médaille d\'or lui a été décernée comme meilleure bière Triple au monde (“World’s Best Belgian-Style Tripel”).</div><div><br></div><h3 style=\"text-align: center; \"><b>LES PRIX</b></h3><h3><b><br></b></h3><div style=\"text-align: center;\"><img src=\"https://www.hetanker.be/sites/default/files/styles/prijzen-thumbnail/public/WBA2017_0.png?itok=YlZxYQEt\" style=\"width: 166px;\"><img src=\"https://www.hetanker.be/sites/default/files/styles/prijzen-thumbnail/public/_0006_GCT_wba_2012.png?itok=8dE6LRF_\" style=\"width: 166px;\"><img src=\"https://www.hetanker.be/sites/default/files/styles/prijzen-thumbnail/public/_0008_GCT_EBS_2010.png?itok=gGEkajZr\" style=\"width: 166px;\"><img src=\"https://www.hetanker.be/sites/default/files/styles/prijzen-thumbnail/public/_0007_GCT_EBS_2009.png?itok=CKbPLZ6a\" style=\"width: 166px;\"></div><div><br></div><div style=\"text-align: center; \"><img src=\"https://www.hetanker.be/sites/default/files/styles/prijzen-thumbnail/public/_0005_GCT_WBC_2006.png?itok=ycvXyMMh\" style=\"width: 166px;\"><img src=\"https://www.hetanker.be/sites/default/files/styles/prijzen-thumbnail/public/_0004_GCT_WBC_2002.png?itok=o4q5IGeo\" style=\"width: 166px;\"><br></div><div><br></div>'),
(8, 'Duvel', '8.5', 'Belgique', 'Triple', 1, 14, 1, '<h2 style=\"text-align: center; \"><b>DUVEL</b></h2><h2 style=\"text-align: center; \"><b><br></b></h2><p>La Duvel est une bière naturelle dotée d’une amertume subtile, d’un arôme raffiné et d’un goût prononcé de houblon. Le procédé de brassage unique de 90 jours garantit un style authentique, un perlant délicat et un goût doux et agréable.</p><p>Après l’eau de source pure, composant essentiel de la bière, c\'est l\'orge qui constitue la matière première la plus importante. L’orge doit germer pendant cinq jours à la malterie pour ensuite devenir du malt. La couleur du malt, et par conséquent de la bière qui en résultera, est déterminée par la température. L’amertume si typique de la Duvel trouve son origine par l’ajout de diverses sortes de houblon aromatiques issues de Slovénie et de Tchéquie. Nous employons exclusivement des houblons reconnus pour leur qualité constante et excellente.</p><p>La Duvel fermente une première fois en cuve à une température comprise entre 20 et 26°C. Pour ce faire, le brasseur utilise sa propre culture. La souche de levure d\'origine, sélectionnée en 1920 par Albert Moortgat, provient d\'Écosse. Une fois le processus de maturation terminé dans les cuves de stockage où la bière est refroidie à – 2°C, le breuvage est prêt à être mis en bouteille. La bière subit une nouvelle fermentation en bouteille par l’ajout de sucres et de levure. Cette étape se déroule dans les caves chaudes (24°C) et dure deux semaines. La bière est ensuite placée dans des caves froides où elle poursuit sa maturation durant six semaines et se stabilise. Cette phase de maturation très longue est unique et contribue au goût raffiné et à l\'arôme authentique de la Duvel.</p><p>Une équipe de spécialistes de la bière contrôle quotidiennement le processus par le biais d’analyses de goût. Ce n’est qu’après 90 jours, une fois que la Duvel a atteint sa riche palette de saveurs, que celle-ci peut quitter la brasserie.</p><p>La Duvel se distingue nettement des autres bières belges par son degré d’alcool étonnamment élevé (8,5 %), son col de mousse généreux, son perlant délicat et sa texture en bouche douce comme de la soie.</p>'),
(9, 'St Feuillien Triple', '8.5', 'Belgique', 'Triple', 1, 15, 1, '<h2 style=\"text-align: center; \"><b>ST FEUILLIEN TRIPLE</b></h2><p><br></p><p>La bière <b>Saint Feuillien Triple</b> de la Brasserie Saint-Feuillien se présente sous une robe couleur ambre pâle qui révèle un caractère spécialement malté.</p><p>Elle s\'orne d\'une mousse blanche, fine et très compacte. Le nez est richement parfumé et offre une combinaison unique de <b>houblons</b> aromatiques, d’<b>épices</b> et de senteurs typiques de la fermentation, très <b>fruitées</b>.</p><p>La refermentation en bouteille lui confère une odeur unique due à la levure. Son goût est puissant et sa tenue en bouche exceptionnelle est due autant à sa densité qu’à la garde prolongée.</p><p><b>Apéritive</b> et <b>rafraîchissante</b> en été, <b>savoureuse</b> en hiver, elle s’affirme comme bière de dégustation par excellence.</p><p>Avec sa robe particulière de couleur ambre pâle, la St Feuillien révèle un caractère spécialement malté. Sa mousse est blanche, fine et très compacte. Son nez est richement parfumé, offrant une combinaison unique de houblons aromatiques, d\'épices et de senteurs typiques de la fermentation, très fruitées. La refermentation en bouteille lui confère une odeur unique due à la levure. Son goût est puissant, sa tenue en bouche exceptionnelle, due autant à sa densité qu\'à la garde prolongée. Apéritive et rafraîchissante en été, savoureuse en hiver, elle s\'affirme comme bière de dégustation par excellence.</p><p><span style=\"font-size: 0.875rem;\">BIERE BELGE D\'ABBAYE TRIPLE !</span></p><p>La mousse est blanche, fine et très compacte. La robe est particulière : couleur ambre pâle, elle révèle un caractère spécialement malté. Le nez est richement parfumé, offrant une combinaison unique de houblons aromatiques, d’épices et de senteurs typiques de la fermentation, très fruitées. La refermentation en bouteille lui confère une odeur unique due à la levure. Son goût est puissant, sa tenue en bouche exceptionnelle. Elle est due autant à sa densité qu’à la garde prolongée. Apéritive et rafraîchissante en été, savoureuse en hiver, elle s’affirme comme bière de dégustation par excellence.<br></p>'),
(10, 'Rochefort 10', '11.3', 'Belgique', 'Quadruple', 1, 16, 2, '<h2 style=\"text-align: center; \"><b>ROCHEFORT 10°</b></h2><div><br></div><div>La <b>Rochefort 10°</b> est une <b>bière Trappiste</b> créée peu avant les années 1950. C\'est la bière la plus alcoolisée des bières de l\'abbaye de Rochefort et c\'est aussi la plus riche. Parfois appelée \"Merveille\", elle présente une <b>robe brune aux reflets acajou très foncés</b>.</div><div><br></div><div>Sa robe est limpide bien qu\'elle repose sur un lit de levure. Elle se coiffe d\'un chapeau de mousse beige fugace, traversé par une effervescence relativement saturée.</div><div><br></div><div>Le nez et la bouche laissent apparaître une intensité <b>liquoreuse</b> remarquable, <b>caramélisée</b>. La saveur est d\'abord moelleuse avant de monter en puissance et ouvre une bouche <b>ample</b>, <b>épicée</b>, légèrement <b>âcre</b> et <b>piquante</b>. Des notes fruitées de <b>prune mûre</b> et de <b>cacao</b> finissent de parfaire la dégustation. L\'amertume reste assez faible, laissant la part belle aux saveurs <b>maltées</b> et <b>fruitées</b>. Le corps est puissant mais fin, noble et racé.</div><div><br></div><div><b>Une grande bière trappiste</b>.</div><div><br></div><div>« Ahhh, la fameuse <b>Rochefort 10</b> ! » répondent souvent les connaisseurs, avec des étoiles dans les yeux ! Et pour cause, cette bière trappiste, se lisant « <b>Trappistes Rochefort 10</b> » sur l’étiquette, est mythique a bien des égards. Alors pour vous la présenter, on vous a fait un top 5 des infos amusantes à savoir sur la Rochefort 10. En avant, c’est parti ! 😇</div><div><br></div><p><div>Pour lutter contre les utilisations abusives du terme « trappiste » par certains brasseurs peu scrupuleux, les moines se sont organisés. Après de nombreuses luttes juridiques fameuses, ils ont finalement créé en 1997 une marque : « Authentic Trappist Product ».</div><div><br></div><div>Matérialisé par un logo, quand ce dernier est apposé sur certains produits (bière, mais aussi fromage, liqueur, savon etc…), il est une garantie officielle de l’implication des moines et de l’authenticité monastique du produit. Dans le monde, seulement 12 abbayes peuvent le faire arborer sur leurs bières ! Et bien sûr, la « Trappistes Rochefort 10 » porte fièrement ce rarissime logo sur ces bouteilles ! Cela garantit :</div></p><p><ol></ol></p><ol><li>que la bière est brassée au sein même de l’abbaye. La Rochefort 10 est par exemple brassée dans l’abbaye Notre-Dame de Saint-Rémy de Rochefort, en Belgique;</li><li>que la bière est brassée par les moines, ou sous leur strict contrôle. Par exemple, il n’y a encore aujourd’hui que quatre jours de brassage par semaine à l’abbaye de Rochefort, conformément à une règle votée en 1952 par la communauté;</li><li>que tous les bénéfices sont reversés à l’abbaye, à la communauté et, en cas de surplus, à des oeuvres sociales. Sur ce point, l’abbaye ne communique pas publiquement, mais elle soutient d’autres monastères trappistes ainsi que d’autres oeuvres caritatives !</li></ol><p><br></p>'),
(11, 'Bosteels Kwak', '8.4', 'Belgique', 'Triple', 1, 17, 4, '<h2 style=\"text-align: center; \"><b>Bosteels Kwak</b></h2><div><br></div><div><b>La brasserie Bosteels :</b></div><div>Depuis sa fondation en 1791 par Evarist Bosteels, la brasserie Bosteels est devenue la définition de l\'entreprise familiale. Dans la même famille depuis plus de 200 ans, la brasserie a été dirigée par sept générations de la famille Bosteels, brassant certaines bières les plus emblématiques de la Belgique.</div><div><br></div><div>Parmi celles-ci figurent des classiques telles que <a href=\"http://127.0.0.1:8000/fr/beer/4\" target=\"_blank\">Tripel Karmeliet</a> et l\'exquise Deus Brut des Flandres, une bière d\'orge brassée dans le style champagne. Toutes sont brassées avec le même soin et la même attention qu\'à l\'origine.</div><div><br></div><div><b>La bière :</b></div><div>Conçue à l\'origine comme un breuvage pour les cochers congelés, et traditionnellement servie dans son verre original du cocher, la<b> Kwak</b> est l\'une des bières les plus iconiques de Belgique.</div><div>Versée dans un verre, elle nous dévoile une robe ambrée avec une tête blanche et moelleuse. Cette somptueuse <b>Belgian Strong Ale</b> dégage des arômes de <b>malt</b> au <b>caramel</b>, avec des <b>abricots séchés</b> et de la <b>prune</b>, pour une note séduisante de sucre de <b>demerara</b>.</div><div>Avec un bel équilibre doux et amer dans un corps lisse et puissant, la Kwak offre de délicieuses saveurs d\'abricot, de malt et de prune, associées à la <b>banane</b>, la <b>réglisse</b> et la <b>pomme verte</b>.</div><div>L\'expérience de dégustation se termine par une finale épicée et sucrée.</div><div><br></div><div><b>Le style :</b></div><div>La Belgique est sans doute le temple spirituel de la bière, avec une longue tradition de brassage entre ses bières d\'Abbaye et ses bières monastiques. Néanmoins, l\'un des styles belges les plus célèbres qu\'est le Belgian Strong Ale trouve ses origines dans des brasseries familiales telles que Bosteels et Moortgat.</div><div>Le style est difficile à cerner, allant de la couleur pâle à sombre avec un profil houblonné qui varie du subtil au fruité affirmé. Elles sont souvent brassées avec du sucre candi pour augmenter la teneur en alcool sans pour autant y ajouter de corps.</div>'),
(12, 'Hoegaarden Blanche', '4.9', 'Belgique', 'Simple', 1, 18, 3, '<h2 style=\"text-align: center; \"><b>HOEGAARDEN BLANCHE</b><br></h2><h2 style=\"text-align: center; \"><b><br></b></h2><p>La bière blanche belge originale. Il y a presque 600 ans, dans le village belge de Hoegaarden, des moines se sont lancés dans des expériences étranges en ajoutant des plantes médicinales bizarres venues de l’autre bout du globe à leur bière blanche traditionnelle. Inspirée de leurs travaux, notre recette au goût rafraîchissant et à l’arôme envoûtant est absolument unique au monde. Laissez les agrumes vivifiants et la coriandre vous faire oublier le stress de la vie moderne et vous transporter ailleurs. Certains l’appellent « nectar des dieux ». Nous lui préférons le nom de Hoegaarden.<br></p><p>La <b>Hoegaarden</b> est une bière belge blanche qui compte parmi les plus connues hors du royaume de Belgique. C\'est la seule bière blanche à être proposée en fûts de 6L PerfectDraft ce qui la rend incontournable !</p><p>Elle est brassée avec de la coriandre et des zestes de citron pour plus de recherche de goût et de fraîcheur. La <b>Hoegaarden</b> présente une intrigante robe d\'un blond troublé qui s\'explique par le fait que cette bière n\'est pas filtrée avant l\'embouteillage et contient donc encore des levures en suspend.</p><p>Elle se pare d\'une belle mousse blanche crémeuse et durable qui est traversée par une fine effervescence. Elle dégage un jolie nez fruité et épicé évoquant les agrumes, la coriandre et le houblon. En bouche, on retrouve des saveurs très similaires aux arômes perçus avec un goût fruité et une douce présence de la coriandre. Une belle amertume se développe sur la fin de bouche et affirme le caractère consensuel de cette bière blanche qui est un bel exemple du style des bières blanches belges.</p><p>Dégustez pleinement la Hoegaarden dans son verre <b>Hoegaarden</b>.</p>'),
(13, 'Guinness', '4.2', 'Irlande', 'Simple', 1, 19, 5, '<h2 style=\"text-align: center; \"><b>GUINNESS</b></h2><h2 style=\"text-align: left;\"><b><br></b></h2><h3>L’HISTOIRE DE LA GUINNESS® SPECIAL EXPORT</h3><p>Commandé par l’audacieux brasseur John Martin en 1944, le stout Guinness Special Export est digne de sa brasserie belge. Les 8 % d’alcool créent un corps puissant. Les riches saveurs maltées sont associées à l’orge torréfiée fumée. Les saveurs complémentaires telles que la réglisse et le caramel écossais sont relevées par de la mélasse, des notes de vanille et des touches de fruits noirs. Ce stout irlandais présente une touche continentale.</p><p><span style=\"font-size: 1.3125rem;\">« Les 8 % d’alcool créent un corps puissant. Les riches saveurs maltées sont associées à l’orge torréfiée fumée. »</span></p><p><span style=\"font-size: 0.875rem;\">Il est aussi impressionnant et imposant que les portes de notre brasserie de St James’s Gate peuvent l’être, même si elles restent toujours ouvertes à de nouvelles idées et des approches novatrices. En 1940, John Martin, un brasseur anglais expatrié en Belgique, a franchi ces portes pour soumettre son idée. Il a introduit la notion d’une Guinness plus vive et plus intense, brassée avec moins de houblon et dotée d’un arrière-goût plus sucré et moins amer, davantage susceptible de plaire aux palais belges. Il a exigé qu’un millésime unique soit produit spécialement à cet effet : la première bière Guinness à être servie en Belgique. Présentant une texture crémeuse et légère, et dotée de toutes les caractéristiques particulières de notre bière irlandaise, elle s’est clairement distinguée de la norme, tout en restant indubitablement une Guinness. L’or noir d’un brasseur audacieux.</span><br></p>');

-- --------------------------------------------------------

--
-- Structure de la table `beer_score_comment`
--

DROP TABLE IF EXISTS `beer_score_comment`;
CREATE TABLE IF NOT EXISTS `beer_score_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `beer_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_649AA2A1D0989053` (`beer_id`),
  KEY `IDX_649AA2A1A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `beer_score_comment`
--

INSERT INTO `beer_score_comment` (`id`, `beer_id`, `score`, `comment`, `user_id`) VALUES
(1, 2, 5, 'Une de mes bières préférées ;)', 1),
(2, 3, 5, 'La Meilleure bière du monde, tout simplement !!!', 1),
(3, 5, 4, 'Très bonne bière !', 1),
(4, 8, 4, 'Pas mal du tout !', 1),
(5, 4, 3, 'Pas mal mais peut mieux faire...', 1),
(6, 5, 1, 'J\'aime pas cette bière....', 7),
(7, 5, 4, 'Pas mal du tout !', 9);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Blonde'),
(2, 'Brune'),
(3, 'Blanche'),
(4, 'Ambrée'),
(5, 'Noire');

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

DROP TABLE IF EXISTS `image`;
CREATE TABLE IF NOT EXISTS `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `image`
--

INSERT INTO `image` (`id`, `name`, `path`) VALUES
(8, 'Maredsous_Triple.jpg', 'img_5ec5a20a70419.jpeg'),
(9, 'Trappe_Quadrupel.png', 'img_5ec6490830961.png'),
(10, 'Tripel_Karmeliet.jpeg', 'img_5ec64da548eb1.jpeg'),
(11, 'Chimay_Bleue.jpg', 'img_5ec650e7659c1.jpeg'),
(12, 'Westmalle_Tripel.jpg', 'img_5ec657db1c198.jpeg'),
(13, 'Gouden_Carolus_Tripel.jpg', 'img_5ec658c468523.jpeg'),
(14, 'Duvel.jpg', 'img_5ec659a22c987.jpeg'),
(15, 'St_Feuillien_Triple.jpg', 'img_5ec65a71c1a85.jpeg'),
(16, 'Rochefort_10.jpg', 'img_5ec65edde6fd3.jpeg'),
(17, 'Pauwel_Kwak.jpg', 'img_5ec65fd78fef1.jpeg'),
(18, 'Hoegaarden.jpg', 'img_5eca7a381da1b.jpeg'),
(19, 'Guinness-Special-Export.jpg', 'img_5eca7d8a558ee.jpeg');

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
CREATE TABLE IF NOT EXISTS `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20200518105138', '2020-05-18 10:52:24'),
('20200520073202', '2020-05-20 07:35:23');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `username` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `username`, `password`) VALUES
(1, 'kenshy1379@hotmail.com', '[\"ROLE_ADMIN\"]', 'Michel', '$2y$13$G6Oe7DTpmDt.48UvfNda5.tqjL5vbwexNrDYU.7qy8ktIU87xLekG'),
(3, 'kenshy1379@hotmail.com', '[\"ROLE_USER\",\"ROLE_ADMIN\"]', 'Alex', '$2y$13$tiuifMZ06Y3XvLYpy.Mr3.VXuBFwS4OQ5.x2Sa6ZWCdZjG/fXN5uy'),
(4, 'kenshy1379@hotmail.com', '[\"ROLE_USER\",\"ROLE_ADMIN\"]', 'Mégane', '$2y$13$UyMetM6xuxaTdjQJ8AvxxuvAi8h6RPsBCF78eLh1KQ6EajSTFhKmi'),
(5, 'kenshy1379@hotmail.com', '[\"ROLE_USER\",\"ROLE_ADMIN\"]', 'Vanessa', '$2y$13$CVQCmZrQucwGXLuNIm6Zl.dR4j6hVvWxt6/B9A9RhKgr9UTFwvTua'),
(7, 'bobix@france.fr', '[\"ROLE_USER\",\"ROLE_ADMIN\"]', 'Bob', '$2y$13$girS158ZqOtr9q3CZFBZbu2Jv9hESWetNBHDDt892ZXwtu4m/x0FK'),
(9, 'john@france.fr', '[]', 'John', '$2y$13$.vblheI29iLZuk52Hq/kn.BfFxsNH./IC/ofRN6gkBYQr8wMZSwG2');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `beer`
--
ALTER TABLE `beer`
  ADD CONSTRAINT `FK_58F666AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FK_58F666AD3DA5256D` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`),
  ADD CONSTRAINT `FK_58F666ADA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `beer_score_comment`
--
ALTER TABLE `beer_score_comment`
  ADD CONSTRAINT `FK_649AA2A1A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_649AA2A1D0989053` FOREIGN KEY (`beer_id`) REFERENCES `beer` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
