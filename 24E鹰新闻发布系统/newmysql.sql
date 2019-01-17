
#create database aqu;
use aqu;
#
create table article(ArticleID int(10) not null auto_increment,ChannelID int(5) not null,ClassId int(5) not null,SpecialId int(5),Title varchar(255) not null,TitleAll varchar(255),TitleIntact varchar(255),Subheading varchar(255),Author varchar(20) ,CopyFrom varchar(255),Inputer varchar(15) ,LinkUrl varchar(255),Ediror varchar(15),Keyword varchar(100) not null,Hits int(8) default 0,UpdateTime varchar(30) not null,Hot varchar(5) default '0',OnTop varchar(5) default '0',Elite varchar(5) default '0',Passed varchar(5) default '0',Content text not null,IncludePic int(1),DefaultPicUrl varchar(255),UploadFiles varchar(255),ReadPoint int(5),PaginationType int(3) ,Deleted varchar(5) default '0',SkinId int(3),TemplateId int(3), Stars int(3),TitleFontColor varchar(100),TitleFontType int(3),MaxCharPerPage int(7),ShowCommentLink varchar(5) default '0',Receive varchar(5) default '0',ReceiveUser varchar(15),Received varchar(15),AutoReceiveTime int (3),ReceiveType int(3), Intro text not null,PRIMARY KEY(ArticleID));

#
create table template(TemplateId int(10) not null auto_increment,TemplateName varchar(255) not null,Content text not null,IsDefault varchar(5),WithType int(10) not null,primary key(TemplateId));

#
create table templateType(Id int(10) not null,Type char(255) not null);

#
create table class(Id int(10) not null auto_increment,ParentID int(10) not null,Title varchar(255) not null,ClassDir varchar(255),Flag varchar(5) default 0,ChildNum int(10) default 0,Target varchar(255),MaxPerPage int(10) default 20,PRIMARY KEY(Id));
#
create table config(url varchar(100));
#
create table customLable(Id int(10) not null auto_increment,LableName varchar(100),WithClass int(10),IsHot varchar(5) default 0,IsNew varchar(5) default 0,BarNumber int(10),LetterNumber int(10),IsUpdateTime varchar(5) default 0,IsClickNumber varchar(5) default 0,staticed varchar(5) default 0,dynamic varchar(5) default 0,sql text,remark text,primary key(Id));
#
create table aqu_admin(Id int(10) not null auto_increment,AdminName varchar(15) not null,AdminPassword varchar(15) not null,primary key(Id));