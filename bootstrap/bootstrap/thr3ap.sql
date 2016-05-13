/*
Navicat MySQL Data Transfer

Source Server         : banco
Source Server Version : 50628
Source Host           : localhost:3306
Source Database       : thr3ap

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2016-04-19 14:35:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `login` varchar(50) NOT NULL,
  `senha` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for `anunciantes`
-- ----------------------------
DROP TABLE IF EXISTS `anunciantes`;
CREATE TABLE `anunciantes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `statusSistema` int(1) NOT NULL,
  `ganhosIndicacao` int(11) NOT NULL,
  `login` varchar(20) NOT NULL,
  `senha` varchar(30) NOT NULL,
  `email` varchar(200) NOT NULL,
  `saldo` float(10,2) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `dados_banco` varchar(50) NOT NULL,
  `dados_agencia` varchar(50) NOT NULL,
  `dados_tipoconta` enum('poupanca','corrente') NOT NULL,
  `dados_conta` varchar(50) NOT NULL,
  `dados_nome` varchar(80) NOT NULL,
  `dados_op` varchar(10) NOT NULL,
  `status` enum('pendente','ativo') NOT NULL,
  `pincode` int(20) NOT NULL,
  `skype` varchar(30) NOT NULL,
  `registro` bigint(20) NOT NULL,
  `facebook` varchar(200) NOT NULL,
  `pagseguro` varchar(155) NOT NULL,
  `moip` varchar(155) NOT NULL,
  `akatus` varchar(155) NOT NULL,
  `hits` varchar(30) NOT NULL,
  `whatsapp` varchar(30) DEFAULT NULL,
  `remada` int(5) DEFAULT NULL,
  `datainicio` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `recebeutodosnetos` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `idIndicador` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of anunciantes
-- ----------------------------

-- ----------------------------
-- Table structure for `arvore`
-- ----------------------------
DROP TABLE IF EXISTS `arvore`;
CREATE TABLE `arvore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_login` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_login` (`id_login`),
  CONSTRAINT `arvore_ibfk_1` FOREIGN KEY (`id_login`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of arvore
-- ----------------------------
INSERT INTO `arvore` VALUES ('1', '5');
INSERT INTO `arvore` VALUES ('2', '6244');
INSERT INTO `arvore` VALUES ('3', '6245');
INSERT INTO `arvore` VALUES ('4', '6246');
INSERT INTO `arvore` VALUES ('5', '6247');
INSERT INTO `arvore` VALUES ('6', '6248');
INSERT INTO `arvore` VALUES ('7', '6249');
INSERT INTO `arvore` VALUES ('8', '6250');
INSERT INTO `arvore` VALUES ('9', '6251');
INSERT INTO `arvore` VALUES ('10', '6252');
INSERT INTO `arvore` VALUES ('11', '6253');
INSERT INTO `arvore` VALUES ('12', '6254');
INSERT INTO `arvore` VALUES ('13', '6255');
INSERT INTO `arvore` VALUES ('14', '6291');
INSERT INTO `arvore` VALUES ('15', '6488');

-- ----------------------------
-- Table structure for `caixa`
-- ----------------------------
DROP TABLE IF EXISTS `caixa`;
CREATE TABLE `caixa` (
  `id` int(111) NOT NULL AUTO_INCREMENT,
  `saldo` float(100,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of caixa
-- ----------------------------
INSERT INTO `caixa` VALUES ('1', '1024.70');

-- ----------------------------
-- Table structure for `debitos`
-- ----------------------------
DROP TABLE IF EXISTS `debitos`;
CREATE TABLE `debitos` (
  `idDebito` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `valorDebito` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `tipoDebito` int(1) NOT NULL,
  `idTransacao` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `codigoTransacao` text COLLATE utf8_unicode_ci,
  `dataDebito` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idDebito`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of debitos
-- ----------------------------

-- ----------------------------
-- Table structure for `divulgacao`
-- ----------------------------
DROP TABLE IF EXISTS `divulgacao`;
CREATE TABLE `divulgacao` (
  `idDivulgacao` int(11) NOT NULL AUTO_INCREMENT,
  `idAnunciante` int(11) DEFAULT NULL,
  `assuntoDivulgacao` varchar(250) DEFAULT NULL,
  `imagemDivulgacao` varchar(300) DEFAULT NULL,
  `linkDivulgacao` varchar(500) DEFAULT NULL,
  `statusDivulgacao` int(1) DEFAULT NULL,
  `dataDivulgacao` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idDivulgacao`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of divulgacao
-- ----------------------------

-- ----------------------------
-- Table structure for `divulgacaousuario`
-- ----------------------------
DROP TABLE IF EXISTS `divulgacaousuario`;
CREATE TABLE `divulgacaousuario` (
  `idDivulgacaoUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `idDivulgacao` int(11) DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `tipoRede` varchar(30) DEFAULT NULL,
  `dataCompartilhamento` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idDivulgacaoUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of divulgacaousuario
-- ----------------------------

-- ----------------------------
-- Table structure for `estatisticas`
-- ----------------------------
DROP TABLE IF EXISTS `estatisticas`;
CREATE TABLE `estatisticas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visitas` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of estatisticas
-- ----------------------------

-- ----------------------------
-- Table structure for `extrato`
-- ----------------------------
DROP TABLE IF EXISTS `extrato`;
CREATE TABLE `extrato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(30) NOT NULL,
  `detalhe` text NOT NULL,
  `valor` int(5) NOT NULL,
  `data` bigint(20) NOT NULL,
  `downline` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of extrato
-- ----------------------------

-- ----------------------------
-- Table structure for `indicados`
-- ----------------------------
DROP TABLE IF EXISTS `indicados`;
CREATE TABLE `indicados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_indicador` int(11) DEFAULT NULL,
  `id_indicado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of indicados
-- ----------------------------

-- ----------------------------
-- Table structure for `msg`
-- ----------------------------
DROP TABLE IF EXISTS `msg`;
CREATE TABLE `msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `de` varchar(30) NOT NULL,
  `para` varchar(30) NOT NULL,
  `assunto` varchar(200) NOT NULL,
  `texto` text NOT NULL,
  `data` bigint(30) NOT NULL,
  `status` enum('read','unread') NOT NULL,
  `situacao` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of msg
-- ----------------------------

-- ----------------------------
-- Table structure for `pagamentos`
-- ----------------------------
DROP TABLE IF EXISTS `pagamentos`;
CREATE TABLE `pagamentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(30) NOT NULL,
  `indicador` varchar(30) NOT NULL,
  `indicador_nivel` int(11) NOT NULL,
  `status` enum('nao pago','pendente','pago','recusado') NOT NULL,
  `comprovante` text NOT NULL,
  `hora` bigint(30) NOT NULL,
  `idavo` int(11) DEFAULT NULL,
  `idremada` int(11) DEFAULT NULL,
  `idlogin` int(11) DEFAULT NULL,
  `nivelderodadas` int(5) DEFAULT NULL,
  `pago` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pagamentos
-- ----------------------------

-- ----------------------------
-- Table structure for `relacoes`
-- ----------------------------
DROP TABLE IF EXISTS `relacoes`;
CREATE TABLE `relacoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idlogin` int(11) DEFAULT NULL,
  `idfilho` int(11) DEFAULT NULL,
  `posicao` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of relacoes
-- ----------------------------

-- ----------------------------
-- Table structure for `relatorioganhos`
-- ----------------------------
DROP TABLE IF EXISTS `relatorioganhos`;
CREATE TABLE `relatorioganhos` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(100) DEFAULT NULL,
  `ganho_recebido` float(100,2) DEFAULT NULL,
  `tipo_ganho` set('Referencia','Propaganda','Rodada no Sistema') DEFAULT NULL,
  `data_ganhos` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1085 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of relatorioganhos
-- ----------------------------
INSERT INTO `relatorioganhos` VALUES ('1070', '5', '9.90', 'Referencia', '2016-04-13 00:16:00');
INSERT INTO `relatorioganhos` VALUES ('1071', '5', '9.90', 'Referencia', '2016-04-13 00:16:00');
INSERT INTO `relatorioganhos` VALUES ('1072', '5', '9.90', 'Referencia', '2016-04-13 00:16:00');
INSERT INTO `relatorioganhos` VALUES ('1073', '5', '9.90', 'Referencia', '2016-04-13 00:16:00');
INSERT INTO `relatorioganhos` VALUES ('1074', '5', '9.90', 'Referencia', '2016-04-13 00:16:00');
INSERT INTO `relatorioganhos` VALUES ('1075', '5', '9.90', 'Referencia', '2016-04-13 00:16:00');
INSERT INTO `relatorioganhos` VALUES ('1076', '5', '9.90', 'Referencia', '2016-04-13 00:16:00');
INSERT INTO `relatorioganhos` VALUES ('1077', '5', '9.90', 'Referencia', '2016-04-13 00:16:00');
INSERT INTO `relatorioganhos` VALUES ('1078', '5', '9.90', 'Referencia', '2016-04-13 00:16:00');
INSERT INTO `relatorioganhos` VALUES ('1079', '5', '9.90', 'Referencia', '2016-04-13 00:16:00');
INSERT INTO `relatorioganhos` VALUES ('1080', '5', '9.90', 'Referencia', '2016-04-13 00:17:00');
INSERT INTO `relatorioganhos` VALUES ('1081', '5', '9.90', 'Referencia', '2016-04-13 00:17:00');
INSERT INTO `relatorioganhos` VALUES ('1082', '5', '125.00', 'Rodada no Sistema', '2016-04-13 00:17:00');
INSERT INTO `relatorioganhos` VALUES ('1083', '5', '9.90', 'Referencia', '2016-04-13 18:49:00');
INSERT INTO `relatorioganhos` VALUES ('1084', '5', '9.90', 'Referencia', '2016-04-16 18:29:00');

-- ----------------------------
-- Table structure for `remando`
-- ----------------------------
DROP TABLE IF EXISTS `remando`;
CREATE TABLE `remando` (
  `idRemando` int(11) NOT NULL AUTO_INCREMENT,
  `remaidlogin` int(11) DEFAULT NULL,
  `remaidremada` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRemando`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of remando
-- ----------------------------

-- ----------------------------
-- Table structure for `saques`
-- ----------------------------
DROP TABLE IF EXISTS `saques`;
CREATE TABLE `saques` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(1) DEFAULT '0',
  `data_saque` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `data_transferencia` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `id_usuario` int(11) unsigned DEFAULT NULL,
  `valor_saque` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of saques
-- ----------------------------
INSERT INTO `saques` VALUES ('12', '1', '2016-04-13 00:36:15', '0000-00-00 00:00:00', '5', '50.00');
INSERT INTO `saques` VALUES ('13', '1', '2016-04-15 21:44:49', '0000-00-00 00:00:00', '5', '50.00');
INSERT INTO `saques` VALUES ('14', '1', '2016-04-16 17:59:57', '0000-00-00 00:00:00', '5', '50.00');

-- ----------------------------
-- Table structure for `ultimo_usuario`
-- ----------------------------
DROP TABLE IF EXISTS `ultimo_usuario`;
CREATE TABLE `ultimo_usuario` (
  `id` int(11) NOT NULL DEFAULT '0',
  `posicao_ultimo_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ultimo_usuario
-- ----------------------------

-- ----------------------------
-- Table structure for `usuarios`
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `statusSistema` int(1) NOT NULL,
  `ganhos_indicacao` double(11,2) NOT NULL,
  `login` varchar(20) DEFAULT NULL,
  `senha` varchar(30) NOT NULL,
  `email` varchar(200) NOT NULL,
  `saldo` float(10,2) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `data_nascimento` date NOT NULL,
  `avatar` varchar(100) NOT NULL DEFAULT 'avatar-default.png',
  `dados_banco` varchar(50) NOT NULL,
  `dados_agencia` varchar(50) NOT NULL,
  `dados_tipoconta` enum('poupanca','corrente') NOT NULL,
  `dados_conta` varchar(50) NOT NULL,
  `dados_nome` varchar(80) NOT NULL,
  `dados_op` varchar(10) NOT NULL,
  `status` enum('pendente','ativo') NOT NULL,
  `pincode` int(20) NOT NULL,
  `skype` varchar(30) NOT NULL,
  `registro` bigint(20) NOT NULL,
  `facebook` varchar(200) NOT NULL,
  `pagseguro` varchar(155) NOT NULL,
  `moip` varchar(155) NOT NULL,
  `akatus` varchar(155) NOT NULL,
  `hits` varchar(30) NOT NULL,
  `whatsapp` varchar(30) DEFAULT NULL,
  `rodada` int(5) DEFAULT NULL,
  `datainicio` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ultimo_acesso` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `indicador` text NOT NULL,
  `pagou` int(5) DEFAULT NULL,
  `auxilia_status` enum('pendente','ativo') DEFAULT NULL,
  `cpf` text,
  `notificacao` set('true','false') DEFAULT 'false',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=6489 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES ('5', '0', '0.00', 'admin', '1', 'admin@admin.admin', '810.90', 'nome admin', '2016-04-06', '4f219744f7f2e7428673486e9362ff42.jpg', '', '12121', 'poupanca', '0', 'caixa', '1', 'ativo', '0', '', '0', '', '', '', '', '', null, '1', '2016-04-16 18:38:34', '2016-04-16 18:38:00', '1', null, 'pendente', '0', null);
INSERT INTO `usuarios` VALUES ('6244', '0', '0.00', 'filho1', 'filho1', 'filho1', '4.00', 'filho1', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'ativo', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 21:20:18', '0000-00-00 00:00:00', 'admin', null, 'pendente', null, null);
INSERT INTO `usuarios` VALUES ('6245', '0', '0.00', 'filho2', 'filho2', 'filho2', '6.00', 'filho2', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'ativo', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 21:20:18', '0000-00-00 00:00:00', 'admin', null, 'pendente', null, null);
INSERT INTO `usuarios` VALUES ('6246', '0', '0.00', 'filho3', 'filho3', 'filho3', '8.00', 'filho3', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'ativo', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 21:20:18', '0000-00-00 00:00:00', 'admin', null, 'pendente', null, null);
INSERT INTO `usuarios` VALUES ('6247', '0', '0.00', 'padre1', 'fire100%', '404@gmail.com', '10.00', 'padre1', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'ativo', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 21:20:18', '0000-00-00 00:00:00', 'admin', null, 'pendente', null, null);
INSERT INTO `usuarios` VALUES ('6248', '0', '0.00', 'padre3', 'fire100%', '404@gmail.com', '6.00', 'padre3', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'ativo', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 21:19:15', '0000-00-00 00:00:00', 'admin', null, 'pendente', null, null);
INSERT INTO `usuarios` VALUES ('6249', '0', '0.00', 'padre2', 'fire100%', '405@gmail.com', '0.00', 'padre2', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'ativo', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:16:40', '0000-00-00 00:00:00', 'admin', null, 'pendente', null, null);
INSERT INTO `usuarios` VALUES ('6250', '0', '0.00', 'padre4', 'fire100%', '401@gmail.com', '0.00', 'padre4', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'ativo', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:16:44', '0000-00-00 00:00:00', 'admin', null, 'pendente', null, null);
INSERT INTO `usuarios` VALUES ('6251', '0', '0.00', 'padre6', 'fire100%', '406@gmail.com', '0.00', 'padre6', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'ativo', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:16:50', '0000-00-00 00:00:00', 'admin', null, 'pendente', null, null);
INSERT INTO `usuarios` VALUES ('6252', '0', '0.00', 'padre5', 'fire100%', '450@gmail.com', '0.00', 'padre5', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'ativo', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:16:55', '0000-00-00 00:00:00', 'admin', null, 'pendente', null, null);
INSERT INTO `usuarios` VALUES ('6253', '0', '0.00', 'padre7', 'fire100%', '451@gmail.com', '0.00', 'padre7', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'ativo', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:16:59', '0000-00-00 00:00:00', 'admin', null, 'pendente', null, null);
INSERT INTO `usuarios` VALUES ('6254', '0', '0.00', 'padre8', 'fire100%', '452@gmail.com', '0.00', 'padre8', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'ativo', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:17:04', '0000-00-00 00:00:00', 'admin', null, 'pendente', null, null);
INSERT INTO `usuarios` VALUES ('6255', '0', '0.00', 'padre9', 'fire100%', '453@gmail.com', '0.00', 'padre9', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'ativo', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:17:09', '0000-00-00 00:00:00', 'admin', null, 'pendente', null, null);
INSERT INTO `usuarios` VALUES ('6257', '0', '0.00', 'moises2', '123moises', 'moisespaes2010@gmail.com', '0.00', 'Moises', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:18', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6258', '0', '0.00', 'moises1', '123moises', 'moisespaes2010@gmail.com', '0.00', 'Moises', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:19', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6259', '0', '0.00', 'ademilson1', 'nivanda123', 'j_bbass@hotmail.com', '0.00', 'Ademilson Barbosa da Silva', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:19', '0000-00-00 00:00:00', 'admin', null, 'pendente', null, null);
INSERT INTO `usuarios` VALUES ('6260', '0', '0.00', 'ademilson2', 'nivanda123', 'nivandaflor@outlook.com', '0.00', 'Ademilson Barbosa da Silva', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:19', '0000-00-00 00:00:00', 'admin', null, 'pendente', null, null);
INSERT INTO `usuarios` VALUES ('6262', '0', '0.00', 'Junior', '1', 'henrique.junior@hotmail.com', '0.00', 'Junior francisco henrique', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:20', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6263', '0', '0.00', 'kleber', '52637766', 'kleberkrep@hotmail.com', '0.00', 'Kleber', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:20', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6264', '0', '0.00', 'katy', '1', 'Kakayate@hotmail.com', '0.00', 'katyane rodrigues ', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:20', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6265', '0', '0.00', 'luzinario', '200697', 'valeriano_alvo@hotmail.com', '0.00', 'Luzin?rio', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:20', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6266', '0', '0.00', 'nadjabaia21', '220510', 'baianadja21@gmail.com', '0.00', 'Maria Nadja Ba?a Alves ', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:21', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6267', '0', '0.00', 'abel2', '1', 'abelbarbosa38@gmail.com', '0.00', 'Abel2', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:21', '0000-00-00 00:00:00', 'admin', null, 'pendente', null, null);
INSERT INTO `usuarios` VALUES ('6268', '0', '0.00', 'neguinho', '1', 'sandroalex-2013@hotmail.com', '0.00', 'Neguinho', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:21', '0000-00-00 00:00:00', 'admin', null, 'pendente', null, null);
INSERT INTO `usuarios` VALUES ('6269', '0', '0.00', 'jakcilan', '1', 'jakcilan@gmail.com', '0.00', 'Jakcilan', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:21', '0000-00-00 00:00:00', 'admin', null, 'pendente', null, null);
INSERT INTO `usuarios` VALUES ('6270', '0', '0.00', 'jakcilan2', '1', 'jakcilan@gmail.com ', '0.00', 'Jakcilan2', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:22', '0000-00-00 00:00:00', 'admin', null, 'pendente', null, null);
INSERT INTO `usuarios` VALUES ('6271', '0', '0.00', 'Eusita', 'lucas1995', 'industriakek@gmail.com', '0.00', 'Eusita', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:22', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6272', '0', '0.00', 'Lc', 'buritikk', 'l.costta63@gmail.com', '0.00', 'Lucas Buriti da Costa ', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:22', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6273', '0', '0.00', 'zecarlinho', '1', 'zecarlinho@hbioss.com', '0.00', 'zecarlinho', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:22', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6274', '0', '0.00', 'eu', '1', 'eu@hbioss.com', '0.00', 'eu', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:22', '0000-00-00 00:00:00', 'admin', null, 'pendente', null, null);
INSERT INTO `usuarios` VALUES ('6275', '0', '0.00', 'paulinho', '123456', 'paulorobson1000@hotmail.com', '0.00', 'Paulo Robson', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:23', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6276', '0', '0.00', 'elieusson', '1', 'elieusson@hbioss.com', '0.00', 'elieusson', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:23', '0000-00-00 00:00:00', 'admin', null, 'pendente', null, null);
INSERT INTO `usuarios` VALUES ('6277', '0', '0.00', 'elieusson2', '1', 'elieusson@hbioss.com', '0.00', 'elieusson2', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:23', '0000-00-00 00:00:00', 'admin', null, 'pendente', null, null);
INSERT INTO `usuarios` VALUES ('6278', '0', '0.00', 'elieusson3', '1', 'elieusson@hbioss.com', '0.00', 'elieusson3 ', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:23', '0000-00-00 00:00:00', 'admin', null, 'pendente', null, null);
INSERT INTO `usuarios` VALUES ('6279', '0', '0.00', 'elieusson4', '1', 'elieusson@hbioss.com', '0.00', 'elieusson4', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:24', '0000-00-00 00:00:00', 'admin', null, 'pendente', null, null);
INSERT INTO `usuarios` VALUES ('6280', '0', '0.00', 'kassio', '1', 'contato@tagliateli.com.br', '0.00', 'Kassio', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:24', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6281', '0', '0.00', 'eu1', '1', 'eu1@hbioss.com', '0.00', 'eu1', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:24', '0000-00-00 00:00:00', 'admin', null, 'pendente', null, null);
INSERT INTO `usuarios` VALUES ('6282', '0', '0.00', 'Bruno', 'isa450', 'bruninhogfbpa75@hotmail.com', '0.00', 'Bruno Ferreira da Silva', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:24', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6283', '0', '0.00', 'biscoito1', '123456', 'biscoitoscookie@gmail.com', '0.00', 'Aldemir Gomes dos Santos', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:24', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6284', '0', '0.00', 'joao2', '1', 'biscoitoscookie@gmail.com', '0.00', 'Jo?o2', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:25', '0000-00-00 00:00:00', 'admin', null, 'pendente', null, null);
INSERT INTO `usuarios` VALUES ('6285', '0', '0.00', 'joao3', '1', 'biscoitoscookie@gmail.com', '0.00', 'Jo?o3', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:25', '0000-00-00 00:00:00', 'admin', null, 'pendente', null, null);
INSERT INTO `usuarios` VALUES ('6286', '0', '0.00', 'abel5', '1', 'abelbarbosa38@gmail.com', '0.00', 'Abel 5', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:25', '0000-00-00 00:00:00', 'admin', null, 'pendente', null, null);
INSERT INTO `usuarios` VALUES ('6287', '0', '0.00', 'wollace', '12091994', 'wwccjjrr@yahoo.com.br', '0.00', 'Wollace', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:25', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6288', '0', '0.00', 'joao4', '1', 'biscoitoscookie@gmail.com', '0.00', 'Jo?o4', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:26', '0000-00-00 00:00:00', 'admin', null, 'pendente', null, null);
INSERT INTO `usuarios` VALUES ('6289', '0', '0.00', 'joao5', '1', 'biscoitoscookie@gmail.com', '0.00', 'Jo?o5', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:26', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6290', '0', '0.00', 'joao6', '1', 'biscoitoscookie@gmail.com', '0.00', 'Jo?o6', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:26', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6291', '0', '0.00', 'abel3', '1', 'abelbarbosa38@gmail.com', '0.00', 'Abel 3', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'ativo', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 18:49:28', '0000-00-00 00:00:00', 'admin', null, 'pendente', null, null);
INSERT INTO `usuarios` VALUES ('6292', '0', '0.00', 'flaviolira2016', '197103', 'farmagenerico@ig.com.br', '0.00', 'FLAVIO LIRA', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:27', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6293', '0', '0.00', 'abel4', '1', 'abelbarbosa38@gmail.com', '0.00', 'Abel 4', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:27', '0000-00-00 00:00:00', 'admin', null, 'pendente', null, null);
INSERT INTO `usuarios` VALUES ('6294', '0', '0.00', 'bombiscoito', '1', 'bombiscoito@hotmail.com', '0.00', 'Marta gomes vieira', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:27', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6295', '0', '0.00', 'daniel', 'cocacola', 'danielponciano@yahoo.com.br', '0.00', 'Daniel Ponciano', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:27', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6296', '0', '0.00', 'jonathan', 'viva', 'jonathanflp100@gmail.com', '0.00', 'Jonathan', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:28', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6297', '0', '0.00', 'ozinaldo', '1', 'ozinaldo@outlook.com', '0.00', 'Ozinaldo', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:28', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6298', '0', '0.00', 'eu3', '1', 'eu3@hbioss.com', '0.00', 'eu3', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:28', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6299', '0', '0.00', 'eu4', '1', 'eu4@hbioss.com', '0.00', 'eu4', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:28', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6300', '0', '0.00', 'jonathan2', 'viva', 'jonathanflp100@gmail.com', '0.00', 'Jonathan', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:28', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6301', '0', '0.00', 'jonathan3', 'viva', 'jonathanflp100@gmail.com', '0.00', 'Jonathan', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:29', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6302', '0', '0.00', 'jo', '123456', 'biscoitoscookie@gmail.com', '0.00', 'jo', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:29', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6303', '0', '0.00', 'elainesouza', '22081986', 'nainesouza@ig.com.br', '0.00', 'Elaine Souza', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:29', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6304', '0', '0.00', 'cibely', '234567', 'cibelybarbosa@gmail.com', '0.00', 'Cibely', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:29', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6305', '0', '0.00', 'elainefrelancer', '478902', 'elaine_gomes16@hotmail.com', '0.00', 'Elaine Gomes', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:30', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6306', '0', '0.00', 'ademilson3', 'nivanda123', 'j_bbass@hotmail.com', '0.00', 'Ademilson', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:30', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6307', '0', '0.00', 'ademilson4', 'nivanda123', 'j_bbass@hotmail.com', '0.00', 'Ademilson', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:30', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6308', '0', '0.00', 'erlan1', 'senha123', 'erlancarlos.alvin@hotmail.com', '0.00', 'Erlan Carlos', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:30', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6309', '0', '0.00', 'erlan2', 'senha123', 'erlancarlos.alvin@hotmail.com', '0.00', 'Erlan Carlos', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:31', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6310', '0', '0.00', 'ivaldenio', '456789', 'ivaldeniobatista@bol.com.br', '0.00', 'Ivaldenio', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:31', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6311', '0', '0.00', 'Bshs', 'ddd', 'xhhdhdhd@jdhsh.com', '0.00', 'Jhd', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:31', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6312', '0', '0.00', 'Tom Carvalho', '120186', 'tonpbr@hotmail.com', '0.00', 'Eliton', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:31', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6313', '0', '0.00', 'ze', '1', 'zebento@hbioss.com', '0.00', 'ze', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:31', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6314', '0', '0.00', 'zebento', '1', 'zebento1@hbioss.com', '0.00', 'ze', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:32', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6315', '0', '0.00', 'zebento2', '1', 'zebento2@hbioss.com', '0.00', 'ze', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:32', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6316', '0', '0.00', 'zebento3', '1', 'zebento3@hbioss.com', '0.00', 'ze', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:32', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6317', '0', '0.00', 'zebento4', '1', 'zebento4@hbioss.com', '0.00', 'ze', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:32', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6318', '0', '0.00', 'zebento5', '1', 'zebento5@hbioss.com', '0.00', 'ze', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:33', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6319', '0', '0.00', 'zebento6', '1', 'zebento6@hbioss.com', '0.00', 'ze', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:33', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6320', '0', '0.00', 'zebento7', '1', 'zebento7@hbioss.com', '0.00', 'ze', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:33', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6321', '0', '0.00', 'zebento8', '1', 'zebento8@hbioss.com', '0.00', 'ze', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:33', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6322', '0', '0.00', 'zebento9', '1', 'zebento9@hbioss.com', '0.00', 'ze', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:34', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6323', '0', '0.00', 'zebento10', '1', 'zebento10@hbioss.com', '0.00', 'ze', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:34', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6324', '0', '0.00', 'Gama', 'VELholaga2016', 'gamadelima@gmail.com', '0.00', 'Ant?nio ', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:34', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6325', '0', '0.00', 'rm1', '1', 'rm1@hbioss.com', '0.00', 'R', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:34', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6326', '0', '0.00', 'rm ', '1', 'mr@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:35', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6327', '0', '0.00', 'rm2 ', '1', 'mr2@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:35', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6328', '0', '0.00', 'rm3', '1', 'mr3@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:35', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6329', '0', '0.00', 'rm4', '1', 'mr4@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:35', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6330', '0', '0.00', 'rm5', '1', 'mr5@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:35', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6331', '0', '0.00', 'rm6', '1', 'mr6@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:36', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6332', '0', '0.00', 'jr', '1', 'jr@hbioss.com', '0.00', 'j', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:36', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6333', '0', '0.00', 'jr2', '1', 'jr2@hbioss.com', '0.00', 'j', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:36', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6334', '0', '0.00', 'jr3', '1', 'jr3@hbioss.com', '0.00', 'j', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:36', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6335', '0', '0.00', 'jr4', '1', 'jr4@hbioss.com', '0.00', 'j', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:37', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6336', '0', '0.00', 'jr5', '1', 'jr5@hbioss.com', '0.00', 'j', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:37', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6337', '0', '0.00', 'rm7', '1', 'mr7@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:37', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6338', '0', '0.00', 'jr6', '1', 'jr6@hbioss.com', '0.00', 'j', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:37', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6339', '0', '0.00', 'rm8', '1', 'mr8@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:38', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6340', '0', '0.00', 'jr7', '1', 'jr7@hbioss.com', '0.00', 'j', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:38', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6341', '0', '0.00', 'rm9', '1', 'mr9@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:38', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6342', '0', '0.00', 'jr8', '1', 'jr8@hbioss.com', '0.00', 'j', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:38', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6343', '0', '0.00', 'rm10', '1', 'mr10@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:38', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6344', '0', '0.00', 'er', '1', 'er@hbioss.com', '0.00', 'e', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:39', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6345', '0', '0.00', 'er2', '1', 'er2@hbioss.com', '0.00', 'e', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:39', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6346', '0', '0.00', 'rm11', '1', 'mr11@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:39', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6347', '0', '0.00', 'er3', '1', 'er3@hbioss.com', '0.00', 'e', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:39', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6348', '0', '0.00', 'rm12', '1', 'mr12@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:40', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6349', '0', '0.00', 'er4', '1', 'er4@hbioss.com', '0.00', 'e', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:40', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6350', '0', '0.00', 'rm13', '1', 'mr13@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:40', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6351', '0', '0.00', 'er5', '1', 'er5@hbioss.com', '0.00', 'e', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:40', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6352', '0', '0.00', 'rm14', '1', 'mr14@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:41', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6353', '0', '0.00', 'rm15', '1', 'mr15@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:41', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6354', '0', '0.00', 'rm16', '1', 'mr16@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:41', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6355', '0', '0.00', 'rm17', '1', 'mr17@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:41', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6356', '0', '0.00', 'er6', '1', 'er6@hbioss.com', '0.00', 'e', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:42', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6357', '0', '0.00', 'rm18', '1', 'mr18@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:42', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6358', '0', '0.00', 'er7', '1', 'er7@hbioss.com', '0.00', 'e', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:42', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6359', '0', '0.00', 'er8', '1', 'er8@hbioss.com', '0.00', 'e', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:42', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6360', '0', '0.00', 'er9', '1', 'er9@hbioss.com', '0.00', 'e', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:42', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6361', '0', '0.00', 'rm19', '1', 'mr19@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:43', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6362', '0', '0.00', 'er10', '1', 'er10@hbioss.com', '0.00', 'e', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:43', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6363', '0', '0.00', 'rm20', '1', 'mr20@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:43', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6364', '0', '0.00', 'er11', '1', 'er11@hbioss.com', '0.00', 'e', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:43', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6365', '0', '0.00', 'rm21', '1', 'mr21@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:44', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6366', '0', '0.00', 'rm22', '1', 'mr22@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:44', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6367', '0', '0.00', 'er12', '1', 'er12@hbioss.com', '0.00', 'e', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:44', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6368', '0', '0.00', 'er13', '1', 'er13@hbioss.com', '0.00', 'e', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:44', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6369', '0', '0.00', 'rm23', '1', 'mr23@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:44', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6370', '0', '0.00', 'er14', '1', 'er14@hbioss.com', '0.00', 'e', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:45', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6371', '0', '0.00', 'rm24', '1', 'mr24@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:45', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6372', '0', '0.00', 'er15', '1', 'er15@hbioss.com', '0.00', 'e', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:45', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6373', '0', '0.00', 'er16', '1', 'er16@hbioss.com', '0.00', 'e', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:45', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6374', '0', '0.00', 'rm25', '1', 'mr25@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:46', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6375', '0', '0.00', 'jor', '1', 'jor@hbioss.com', '0.00', 'jo', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:46', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6376', '0', '0.00', 'rm26', '1', 'mr26@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:46', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6377', '0', '0.00', 'jor2', '1', 'jor2@hbioss.com', '0.00', 'jo', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:46', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6378', '0', '0.00', 'rm27', '1', 'mr27@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:47', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6379', '0', '0.00', 'jor3', '1', 'jor3@hbioss.com', '0.00', 'jo', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:47', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6380', '0', '0.00', 'jor4', '1', 'jor4@hbioss.com', '0.00', 'jo', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:47', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6381', '0', '0.00', 'jor5', '1', 'jor5@hbioss.com', '0.00', 'jo', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:47', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6382', '0', '0.00', 'rm28', '1', 'mr28@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:48', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6383', '0', '0.00', 'jor6', '1', 'jor6@hbioss.com', '0.00', 'jo', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:48', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6384', '0', '0.00', 'jor7', '1', 'jor7@hbioss.com', '0.00', 'jo', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:48', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6385', '0', '0.00', 'jor8', '1', 'jor8@hbioss.com', '0.00', 'jo', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:48', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6386', '0', '0.00', 'jor9', '1', 'jor9@hbioss.co9', '0.00', 'jo', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:48', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6387', '0', '0.00', 'jor10', '1', 'jor10@hbioss.com', '0.00', 'jo', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:49', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6388', '0', '0.00', 'jor11', '1', 'jor11@hbioss.com', '0.00', 'jo', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:49', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6389', '0', '0.00', 'mr29', '1', 'mr29@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:49', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6390', '0', '0.00', 'mr30', '1', 'mr30@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:49', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6391', '0', '0.00', 'jor12', '1', 'jor12@hbioss.com', '0.00', 'jo', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:50', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6392', '0', '0.00', 'mr31', '1', 'mr31@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:50', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6393', '0', '0.00', 'jor13', '1', 'jor13@hbioss.com', '0.00', 'jo', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:50', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6394', '0', '0.00', 'jor14', '1', 'jor14@hbioss.com', '0.00', 'jo', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:50', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6395', '0', '0.00', 'mr32', '1', 'mr32@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:51', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6396', '0', '0.00', 'jor15', '1', 'jor15@hbioss.com', '0.00', 'jo', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:51', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6397', '0', '0.00', 'jor16', '1', 'jor16@hbioss.com', '0.00', 'jo', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:51', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6398', '0', '0.00', 'jor17', '1', 'jor17@hbioss.com', '0.00', 'jo', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:51', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6399', '0', '0.00', 'mr33', '1', 'mr33@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:51', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6400', '0', '0.00', 'mr34', '1', 'mr34@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:52', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6401', '0', '0.00', 'mr35', '1', 'mr35@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:52', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6402', '0', '0.00', 'mr36', '1', 'mr36@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:52', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6403', '0', '0.00', 'mr37', '1', 'mr37@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:52', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6404', '0', '0.00', 'jor18', '1', 'jor18@hbioss.com', '0.00', 'jo', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:53', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6405', '0', '0.00', 'jor19', '1', 'jor19@hbioss.com', '0.00', 'jo', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:53', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6406', '0', '0.00', 'jor20', '1', 'jor20@hbioss.com', '0.00', 'jo', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:53', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6407', '0', '0.00', 'jor21', '1', 'jor21@hbioss.com', '0.00', 'jo', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:53', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6408', '0', '0.00', 'jor22', '1', 'jor22@hbioss.com', '0.00', 'jo', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:54', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6409', '0', '0.00', 'jor23', '1', 'jor23@hbioss.com', '0.00', 'jo', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:54', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6410', '0', '0.00', 'jor24', '1', 'jor24@hbioss.com', '0.00', 'jo', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:54', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6411', '0', '0.00', 'mr38', '1', 'mr38@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:54', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6412', '0', '0.00', 'ar', '1', 'ar@hbioss.com', '0.00', 'a', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:55', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6413', '0', '0.00', 'ar2', '1', 'ar2@hbioss.com', '0.00', 'a', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:55', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6414', '0', '0.00', 'ar3', '1', 'ar3@hbioss.com', '0.00', 'a', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:55', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6415', '0', '0.00', 'mr39', '1', 'mr39@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:55', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6416', '0', '0.00', 'mr40', '1', 'mr40@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:55', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6417', '0', '0.00', 'mr41', '1', 'mr41@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:56', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6418', '0', '0.00', 'ar4', '1', 'ar4@hbioss.com', '0.00', 'a', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:56', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6419', '0', '0.00', 'ar5', '1', 'ar5@hbioss.com', '0.00', 'a', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:56', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6420', '0', '0.00', 'ar6', '1', 'ar6@hbioss.com', '0.00', 'a', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:56', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6421', '0', '0.00', 'ar7', '1', 'ar7@hbioss.com', '0.00', 'a', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:57', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6422', '0', '0.00', 'mr42', '1', 'mr42@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:57', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6423', '0', '0.00', 'ar8', '1', 'ar8@hbioss.com', '0.00', 'a', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:57', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6424', '0', '0.00', 'ar9', '1', 'ar9@hbioss.com', '0.00', 'a', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:57', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6425', '0', '0.00', 'ar10', '1', 'ar10@hbioss.com', '0.00', 'a', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:58', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6426', '0', '0.00', 'ar11', '1', 'ar11@hbioss.com', '0.00', 'a', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:58', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6427', '0', '0.00', 'ar12', '1', 'ar12@hbioss.com', '0.00', 'a', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:58', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6428', '0', '0.00', 'ar13', '1', 'ar13@hbioss.com', '0.00', 'a', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:58', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6429', '0', '0.00', 'ar14', '1', 'ar14@hbioss.com', '0.00', 'a', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:59', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6430', '0', '0.00', 'ar15', '1', 'ar15@hbioss.com', '0.00', 'a', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:59', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6431', '0', '0.00', 'ar16', '1', 'ar16@hbioss.com', '0.00', 'a', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:59', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6432', '0', '0.00', 'ar17', '1', 'ar17@hbioss.com', '0.00', 'a', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:13:59', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6433', '0', '0.00', 'ar18', '1', 'ar18@hbioss.com', '0.00', 'a', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:00', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6434', '0', '0.00', 'ar19', '1', 'ar19@hbioss.com', '0.00', 'a', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:00', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6435', '0', '0.00', 'mr43', '1', 'mr43@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:03', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6436', '0', '0.00', 'ar20', '1', 'ar20@hbioss.com', '0.00', 'a', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:03', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6437', '0', '0.00', 'mr44', '1', 'mr44@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:04', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6438', '0', '0.00', 'ar21', '1', 'ar21@hbioss.com', '0.00', 'a', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:04', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6439', '0', '0.00', 'mr45', '1', 'mr45@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:04', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6440', '0', '0.00', 'ar22', '1', 'ar22@hbioss.com', '0.00', 'a', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:04', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6441', '0', '0.00', 'mr46', '1', 'mr46@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:05', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6442', '0', '0.00', 'ar23', '1', 'ar23@hbioss.com', '0.00', 'a', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:05', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6443', '0', '0.00', 'ar24', '1', 'ar24@hbioss.com', '0.00', 'a', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:05', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6444', '0', '0.00', 'mr47', '1', 'mr47@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:05', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6445', '0', '0.00', 'mr48', '1', 'mr48@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:06', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6446', '0', '0.00', 'nr', '1', 'nr@hbioss.com', '0.00', 'n', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:06', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6447', '0', '0.00', 'mr49', '1', 'mr49@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:06', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6448', '0', '0.00', 'nr2', '1', 'nr2@hbioss.com', '0.00', 'n', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:06', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6449', '0', '0.00', 'nr3', '1', 'nr3@hbioss.com', '0.00', 'n', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:06', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6450', '0', '0.00', 'mr50', '1', 'mr50@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:07', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6451', '0', '0.00', 'mr51', '1', 'mr51@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:07', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6452', '0', '0.00', 'nr4', '1', 'nr4@hbioss.com', '0.00', 'n', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:07', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6453', '0', '0.00', 'mr99', '1', 'mr99@hbioss.com', '0.00', 'm', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:07', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6454', '0', '0.00', 'mr98', '1', 'mr98@hbioss.com', '0.00', 'm', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:08', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6455', '0', '0.00', 'mr97', '1', 'mr97@hbioss.com', '0.00', 'm', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:08', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6456', '0', '0.00', 'mr96', '1', 'mr96@hbioss.com', '0.00', 'm', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:08', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6457', '0', '0.00', 'mr95', '1', 'mr95@hbioss.com', '0.00', 'm', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:08', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6458', '0', '0.00', 'mr94', '1', 'mr94@hbioss.com', '0.00', 'm', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:09', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6459', '0', '0.00', 'mr93', '1', 'mr93@hbioss.com', '0.00', 'm', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:09', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6460', '0', '0.00', 'mr92', '1', 'mr92@hbioss.com', '0.00', 'm', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:09', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6461', '0', '0.00', 'mr91', '1', 'mr91@hbioss.com', '0.00', 'm', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:09', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6462', '0', '0.00', 'mr90', '1', 'mr90@hbioss.com', '0.00', 'm', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:10', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6463', '0', '0.00', 'mr89', '1', 'mr89@hbioss.com', '0.00', 'm', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:10', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6464', '0', '0.00', 'mr52', '1', 'mr52@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:10', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6465', '0', '0.00', 'mr88', '1', 'mr88@hbioss.com', '0.00', 'm', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:10', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6466', '0', '0.00', 'mr53', '1', 'mr53@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:10', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6467', '0', '0.00', 'mr87', '1', 'mr87@hbioss.com', '0.00', 'm', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:11', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6468', '0', '0.00', 'mr54', '1', 'mr54@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:11', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6469', '0', '0.00', 'mr55', '1', 'mr55@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:11', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6470', '0', '0.00', 'mr56', '1', 'mr56@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:11', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6471', '0', '0.00', 'mr86', '1', 'mr86@hbioss.com', '0.00', 'm', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:12', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6472', '0', '0.00', 'mr85', '1', 'mr85@hbioss.com', '0.00', 'm', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:12', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6473', '0', '0.00', 'mr57', '1', 'mr57@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:12', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6474', '0', '0.00', 'mr58', '1', 'mr58@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:12', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6475', '0', '0.00', 'mr84', '1', 'mr84@hbioss.com', '0.00', 'm', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:12', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6476', '0', '0.00', 'mr83', '1', 'mr83@hbioss.com', '0.00', 'm', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:13', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6477', '0', '0.00', 'mr59', '1', 'mr59@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:13', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6478', '0', '0.00', 'mr82', '1', 'mr82@hbioss.com', '0.00', 'm', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:13', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6479', '0', '0.00', 'mr60', '1', 'mr60@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:13', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6480', '0', '0.00', 'mr81', '1', 'mr81@hbioss.com', '0.00', 'm', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:14', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6481', '0', '0.00', 'mr61', '1', 'mr61@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:14', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6482', '0', '0.00', 'mr80', '1', 'mr80@hbioss.com', '0.00', 'm', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:14', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6483', '0', '0.00', 'mr62', '1', 'mr62@hbioss.com', '0.00', 'M', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:14', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6484', '0', '0.00', 'mr79', '1', 'mr79@hbioss.com', '0.00', 'm', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:15', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6485', '0', '0.00', 'mr78', '1', 'mr78@hbioss.com', '0.00', 'm', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-13 00:14:15', '0000-00-00 00:00:00', 'admin', null, 'ativo', null, null);
INSERT INTO `usuarios` VALUES ('6486', '0', '0.00', 'teste', 'teste', 'teste@teste.teste', '0.00', 'teste', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-16 11:43:21', '0000-00-00 00:00:00', 'admin', null, null, null, 'false');
INSERT INTO `usuarios` VALUES ('6487', '0', '0.00', 'jjj', 'jjj', 'jjj@jjj.jjj', '0.00', 'jjj', '0000-00-00', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'pendente', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-16 18:20:16', '0000-00-00 00:00:00', 'admin', null, null, null, 'false');
INSERT INTO `usuarios` VALUES ('6488', '0', '0.00', 'zeze', 'zeze', 'zeze@zeze.zeze', '0.00', 'zeze', '2016-04-16', 'avatar-default.png', '', '', 'poupanca', '', '', '', 'ativo', '0', '', '0', '', '', '', '', '', null, '0', '2016-04-16 18:38:59', '2016-04-16 18:38:00', 'admin', null, 'pendente', null, 'false');

-- ----------------------------
-- Table structure for `visitantes`
-- ----------------------------
DROP TABLE IF EXISTS `visitantes`;
CREATE TABLE `visitantes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  `referencia` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of visitantes
-- ----------------------------
