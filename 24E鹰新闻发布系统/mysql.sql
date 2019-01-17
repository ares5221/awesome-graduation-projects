#数据库
create database aqu;
use aqu;
#--文章表--
create table article(ArticleID int(10) not null auto_increment,ChannelID int(5) not null,ClassId int(5) not null,SpecialId int(5),Title varchar(255) not null,TitleAll varchar(255),TitleIntact varchar(255),Subheading varchar(255),Author varchar(20) ,CopyFrom varchar(255),Inputer varchar(15) ,LinkUrl varchar(255),Ediror varchar(15),Keyword varchar(100) not null,Hits int(8) default 0,UpdateTime varchar(30) not null,Hot bit default '0',OnTop bit default '0',Elite bit default '0',Passed bit default '0',Content text not null,IncludePic int(1),DefaultPicUrl varchar(255),UploadFiles varchar(255),ReadPoint int(5),PaginationType int(3) ,Deleted bit default '0',SkinId int(3),TemplateId int(3), Stars int(3),TitleFontColor varchar(100),TitleFontType int(3),MaxCharPerPage int(7),ShowCommentLink bit default '0',Receive bit default '0',ReceiveUser varchar(15),Received varchar(15),AutoReceiveTime int (3),ReceiveType int(3), Intro text not null,PRIMARY KEY(ArticleID));

#--模板--
create table template(TemplateId int(10) not null auto_increment,TemplateName varchar(255) not null,Content text not null,IsDefault bit,WithType int(10) not null,primary key(TemplateId));

#--模板分类--
create table templateType(Id int(10) not null,Type char(255) not null);

#--文章栏目表--
create table class(Id int(10) not null auto_increment,ParentID int(10) not null,Title varchar(255) not null,ClassDir varchar(255),Flag bit default 0,ChildNum int(10) default 0,Target varchar(255),MaxPerPage int(10) default 20,PRIMARY KEY(Id));
#---网站配置表---
create table config(url varchar(100));
#--处定义标签表--
create table customLable(Id int(10) not null auto_increment,LableName varchar(100),WithClass int(10),IsHot bit default 0,IsNew bit default 0,BarNumber int(10),LetterNumber int(10),IsUpdateTime bit default 0,IsClickNumber bit default 0,staticed bit default 0,dynamic bit default 0,sql text,remark text,primary key(Id));
#---管理员表--
create table aqu_admin(Id int(10) not null auto_increment,AdminName varchar(15) not null,AdminPassword varchar(15) not null,primary key(Id));