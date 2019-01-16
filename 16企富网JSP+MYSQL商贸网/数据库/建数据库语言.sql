#--数据表qyml

CREATE TABLE `qyml` (
id int(10) NOT NULL  auto_increment,
`username` VARCHAR(100) NOT NULL, 
`pass` VARCHAR(100) NOT NULL, 
`question` VARCHAR(100) NOT NULL, 
`answer` VARCHAR(100) NOT NULL, 
`myname` VARCHAR(100)NOT NULL, 
`ch` VARCHAR(100)NOT NULL, 
`address` VARCHAR(100) NOT NULL, 
`post` VARCHAR(100) NOT NULL, 
`zw` VARCHAR(100), 
`tel` VARCHAR(100), 
`fax` VARCHAR(100), 
`email` VARCHAR(100), 
`web` VARCHAR(100), 
`comeon` int(10) DEFAULT '0'  NOT NULL, 
`qymc` VARCHAR(100) , 
`qyjj` TEXT NOT NULL,
`regtime` VARCHAR(100) , 
`yue` int(10) DEFAULT '0'  NOT NULL,  
`frocen` int(10) DEFAULT '0'  NOT NULL,  
`vip` int(10) DEFAULT '0'  NOT NULL,  
`dlid` VARCHAR(100) NOT NULL,  
PRIMARY KEY  (`id`)
);


#--数据表sjxx

CREATE TABLE `sjxx` (
id int(10) NOT NULL  auto_increment,
`dfl` VARCHAR(100) NOT NULL, 
`sfl` VARCHAR(100) NOT NULL, 
`lei` VARCHAR(100) NOT NULL, 
`topic` VARCHAR(100) NOT NULL, 
`content` TEXT NOT NULL,
`myname` VARCHAR(100) NOT NULL, 
`tel` VARCHAR(100) NOT NULL, 
`fax` VARCHAR(100), 
`address` VARCHAR(100) NOT NULL, 
`email` VARCHAR(100), 
`fbtime` VARCHAR(100) NOT NULL, 
`company` VARCHAR(100), 
`post` VARCHAR(100), 
`ok` VARCHAR(100) DEFAULT '1'  NOT NULL, 
`reged` VARCHAR(100) DEFAULT '1'  NOT NULL, 
`web` VARCHAR(100), 
`fileName` VARCHAR(100),
`username` VARCHAR(100),
`fast` VARCHAR(100) DEFAULT '0'  NOT NULL, 
`memid` VARCHAR(100) DEFAULT '0'  , 
`main` VARCHAR(100) DEFAULT '1'  , 
PRIMARY KEY  (`id`)
);


#--数据表dhyfl

CREATE TABLE `dhyfl` (
`id` int(10) unsigned NOT NULL auto_increment,
`dfl` varchar(100) NOT NULL,
`px` int(10) NOT NULL,
PRIMARY KEY  (`id`)
);



#--数据表shyfl


CREATE TABLE `shyfl` (
  `id` int(10) NOT NULL auto_increment,
  `sfl` varchar(100) NOT NULL default '',
  `dfl` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1



#--数据表photo


CREATE TABLE `photo` (
  `id` int(100) NOT NULL auto_increment,
  `photoname` varchar(100) NOT NULL default '',
  `phototext` varchar(100) NOT NULL default '',
  `memid` varchar(100) NOT NULL default '',
  `phototime` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1







#--数据表showbar

CREATE TABLE `showbar` (
  `id` int(100) NOT NULL auto_increment,
  `lei` varchar(100) NOT NULL default '',
  `showname` varchar(100) NOT NULL default '',
  `showxing` varchar(100) NOT NULL default '',
  `showaddress` varchar(100) NOT NULL default '',
  `showphoto` varchar(100) NOT NULL default '',
  `myname` varchar(100) NOT NULL default '',
  `tel` varchar(100) NOT NULL default '',
  `address` varchar(100) NOT NULL default '',
  `email` varchar(100) default NULL,
  `memid` varchar(100) NOT NULL default '',
  `company` varchar(100) NOT NULL default '',
  `fbtime` varchar(100) NOT NULL default '',
  `username` varchar(100) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1



CREATE TABLE `message` (
  `id` int(100) NOT NULL auto_increment,
  `sendmem` varchar(100) NOT NULL default '',
  `recemem` varchar(100) NOT NULL default '',
  `flag` varchar(100) NOT NULL default '',
  `sendtime` varchar(100) NOT NULL default '',
  `mtopic` varchar(100) default NULL,
  `mtext` text,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1





CREATE TABLE `favorit` (
  `id` int(100) NOT NULL auto_increment,
  `memid` varchar(100) NOT NULL default '',
  `sjid` varchar(100) NOT NULL default '',
  `sjlei` varchar(100) NOT NULL default '',
  `sjfast` varchar(100) NOT NULL default '',
  `sctime` varchar(100) NOT NULL default '',
  `sjtopic` varchar(100) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1



#--数据表friend
CREATE TABLE `friend` (
  `id` int(100) NOT NULL auto_increment,
  `friendid` varchar(100) NOT NULL ,
  `friendname` varchar(100) NOT NULL ,
  `friendcompany` varchar(100) NOT NULL ,
  `memid` varchar(100) NOT NULL ,
  `friendtime` varchar(100) NOT NULL ,
  PRIMARY KEY  (`id`),
UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1











#--数据表book
CREATE TABLE `book` (
  `id` int(100) NOT NULL auto_increment,
  `status` varchar(100) NOT NULL DEFAULT '0' ,
  `lei` varchar(100) NOT NULL ,
  `lockop` varchar(100) NOT NULL DEFAULT '0' ,
  `topic` varchar(100) NOT NULL ,
  `content` text NOT NULL ,
  `fbmemid` varchar(100) NOT NULL ,
  `fbmem` varchar(100) NOT NULL ,
  `fbmemcompany` varchar(100) NOT NULL ,
  `readnum` int(100)  NOT NULL  DEFAULT '0' ,
  `replynum` int(100)  NOT NULL  DEFAULT '0' ,
  `fbtime` varchar(100) NOT NULL ,
  `pxtime` varchar(100) NOT NULL ,
  `replymem` varchar(100) NOT NULL ,
  `ForR` varchar(100) NOT NULL DEFAULT '0' ,
  `topicid` varchar(100) NOT NULL DEFAULT '0' ,
  PRIMARY KEY  (`id`),
UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1





#--数据表job
CREATE TABLE `job` (
  `id` int(100) NOT NULL auto_increment,
  `topic` varchar(100) NOT NULL ,
  `content` text NOT NULL ,
  `lei` varchar(100) NOT NULL ,
  `jobaddress` varchar(100) NOT NULL ,
  `jobnum` varchar(100) NOT NULL ,
  `myname` varchar(100) NOT NULL ,
  `fbmem` varchar(100) NOT NULL ,
  `fbmemid` varchar(100) NOT NULL ,
  `fbmemcompany` varchar(100) NOT NULL ,
  `tel` varchar(100) NOT NULL ,
  `fax` varchar(100) NOT NULL ,
  `email` varchar(100) NOT NULL ,
  `address` varchar(100) NOT NULL ,
  `fbtime` varchar(100) NOT NULL ,
  PRIMARY KEY  (`id`),
UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1



#--数据表unionbar
CREATE TABLE `unionbar` (
  `id` int(100) NOT NULL auto_increment,
  `webname` varchar(100) NOT NULL ,
  `weburl` varchar(100) NOT NULL ,
  `webtext` text NOT NULL ,
  `hit` int(100)  NOT NULL  DEFAULT '0' ,
  `biglei` varchar(100) NOT NULL ,
  `smalllei` varchar(100) NOT NULL ,
  `fbtime` varchar(100) NOT NULL ,
  `ok` varchar(100) NOT NULL   DEFAULT '0' ,
  `tui` varchar(100) NOT NULL   DEFAULT '0' ,
  `fileName` VARCHAR(100),
  PRIMARY KEY  (`id`),
UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1




#--数据表zixun
CREATE TABLE `zixun` (
  `id` int(100) NOT NULL auto_increment,
  `topic` varchar(100) NOT NULL ,
  `text` text NOT NULL ,
  `fbmem` varchar(100) NOT NULL ,
  `fbtime` varchar(100) NOT NULL ,
  `lei` varchar(100) NOT NULL   DEFAULT '0' ,
  `fileName` VARCHAR(100),
  PRIMARY KEY  (`id`),
UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1



#--数据表visiter
CREATE TABLE `visiter` (
  `id` int(100) NOT NULL auto_increment,
  `sound` varchar(100) NOT NULL    DEFAULT '1' ,
  `css` varchar(100) NOT NULL    DEFAULT '1' ,
  `username` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1







#--数据表dingzhisj
CREATE TABLE `dingzhisj` (
  `id` int(100) NOT NULL auto_increment,
  `gjz` varchar(100)  ,
  `lei` varchar(100)  ,
  `dq` varchar(100)  ,
  `memid` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1







#--数据表grade
CREATE TABLE `grade` (
  `id` int(100) NOT NULL auto_increment,
  `fen` int(100)  DEFAULT '1'  ,
  `memid` varchar(100)  NOT NULL,
  PRIMARY KEY  (`id`),
UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1






#--数据表dl
CREATE TABLE `dl` (
  `id` int(100) NOT NULL auto_increment,
  `dldq` varchar(100) NOT NULL ,
  `dlname` varchar(100) NOT NULL ,
  `password` varchar(100) NOT NULL ,
  `letname` varchar(100) NOT NULL ,
  `address` varchar(100) NOT NULL ,
  `post` varchar(100) NOT NULL ,
  `tel` varchar(100) NOT NULL ,
  `email` varchar(100) NOT NULL ,
  `QQ` varchar(100) NOT NULL default '0',
  `sf` varchar(100) NOT NULL  default '0',
  `bz` text,
  `new` varchar(100) NOT NULL default '0',
  `regtime` varchar(100) NOT NULL ,
  `domain` varchar(100) NOT NULL default '0',
  `domainstatus` varchar(100) NOT NULL default '0',
  `flag` varchar(100) NOT NULL default '0',
  PRIMARY KEY  (`id`),
UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1






#--数据表web
CREATE TABLE `web` (
  `id` int(100) NOT NULL auto_increment,
  `css` varchar(100)  DEFAULT '1'  ,
  `memid` varchar(100)  NOT NULL,
  PRIMARY KEY  (`id`),
UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1



#--数据表finaler
CREATE TABLE `finaler` (
  `id` int(100) NOT NULL auto_increment,
  `finalername` varchar(100)  NOT NULL,
  `finalerpass` varchar(100)  NOT NULL,
  PRIMARY KEY  (`id`),
UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1
insert into finaler values(1,'admin','admin');


#--数据表finalermsg
CREATE TABLE `finalermsg` (
  `id` int(100) NOT NULL auto_increment,
  `sendmem` varchar(100) NOT NULL ,
  `sendtime` varchar(100) NOT NULL ,
  `content` text NOT NULL ,
  `flag` varchar(100) NOT NULL default '0',
  PRIMARY KEY  (`id`),
UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1








#--数据表dlsf
CREATE TABLE `dlsf` (
  `id` int(100) NOT NULL auto_increment,
  `dlsf` varchar(100) NOT NULL ,
  PRIMARY KEY  (`id`),
UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1








#--数据表dlmsg
CREATE TABLE `dlmsg` (
  `id` int(100) NOT NULL auto_increment,
  `flag` varchar(100) NOT NULL default '',
  `sendmem` varchar(100) NOT NULL default '',
  `sendtime` varchar(100) NOT NULL default '',
  `mtopic` varchar(100) default NULL,
  `content` text NOT NULL ,
  `dlid` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`id`),
UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1










#--数据表dqjie
CREATE TABLE `dqjie` (
  `id` int(100) NOT NULL auto_increment,
  `photoname` varchar(100) NOT NULL default '0',
  `jietext`  text NOT NULL ,
  `dlid` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1





#--数据表dqzixun
CREATE TABLE `dqzixun` (
  `id` int(100) NOT NULL auto_increment,
  `lei` varchar(100) NOT NULL default '0',
  `topic` varchar(100) NOT NULL default '0',
  `content`  text NOT NULL ,
  `dlid` varchar(100) NOT NULL default '',
  `fileName` varchar(100) NOT NULL default '0',
  `url` varchar(100) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1
