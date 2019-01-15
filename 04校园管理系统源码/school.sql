/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     2017/8/17 20:00:39                           */
/*==============================================================*/


alter table book_borrow_info
   drop constraint FK_BOOK_BOR_REFERENCE_BOOK_REG;

alter table book_borrow_info
   drop constraint FK_BOOK_BOR_REFERENCE_DOCU_STU;

alter table course_stu_info
   drop constraint FK_COURSE_S_FK_COURSE_DOCU_STU;

alter table course_stu_info
   drop constraint FK_COURSE_S_FK_COURSE_SYSTEM_C;

alter table docu_stu_register
   drop constraint FK_DOCU_STU_FK_DOCU_S_DOCU_STU;

alter table docu_stu_register
   drop constraint FK_DOCU_STU_FK_DOCU_S_SYSTEM_C;

alter table docu_tea_info
   drop constraint FK_DOCU_TEA_FK_DOCU_T_SYSTEM_S;

alter table empl_assign_charge
   drop constraint FK_EMPL_ASS_FK_EMPL_A_DOCU_TEA;

alter table empl_assign_charge
   drop constraint FK_EMPL_ASS_FK_EMPL_A_SYSTEM_C;

alter table empl_assign_course
   drop constraint FK_EMPL_ASS_FK_EMPL_A_DOCU_TEA;

alter table empl_assign_course
   drop constraint FK_EMPL_ASS_FK_EMPL_A_SYSTEM_C;

alter table system_class_info
   drop constraint FK_SYSTEM_C_FK_SYSTEM_SYSTEM_G;

alter table system_class_info
   drop constraint FK_SYSTEM_C_FK_SYSTEM_SYSTEM_S;

drop table book_borrow_info cascade constraints;

drop table book_reginster cascade constraints;

drop index FK_COURSE_S_REFERENCE_SYSTEM_C;

drop index FK_COURSE_S_REFERENCE_DOCU_STU;

drop table course_stu_info cascade constraints;

drop table docu_stu_info cascade constraints;

drop index FK_DOCU_STU_REFERENCE_SYSTEM_C;

drop index FK_DOCU_STU_REFERENCE_DOCU_STU;

drop table docu_stu_register cascade constraints;

drop index FK_docu_tea_info_system_specia;

drop table docu_tea_info cascade constraints;

drop index FK_EMPL_ASS_REFERENCE_DOCU_TEA;

drop index FK_EMPL_ASS_REFERENCE_SYSTEM_C;

drop table empl_assign_charge cascade constraints;

drop index FK_EMPL_ASS_REFERENCE_DOCU_TEA;

drop index FK_EMPL_ASS_REFERENCE_SYSTEM_C;

drop table empl_assign_course cascade constraints;

drop index FK_SYSTEM_C_REFERENCE_SYSTEM_S;

drop index FK_SYSTEM_C_REFERENCE_SYSTEM_G;

drop table system_class_info cascade constraints;

drop table system_course_code cascade constraints;

drop table system_grade_code cascade constraints;

drop table system_specialty_code cascade constraints;

drop table system_users cascade constraints;

drop sequence S_login;

create sequence S_login;

/*==============================================================*/
/* Table: book_borrow_info                                      */
/*==============================================================*/
create table book_borrow_info 
(
   borrowid             VARCHAR2(32)         not null,
   bookid               VARCHAR2(50)         not null,
   sid                  VARCHAR2(12)         not null,
   bookname             VARCHAR2(50),
   price                NUMBER(8,2),
   booktype             VARCHAR2(20),
   borrowdate           DATE,
   returndate           DATE,
   operator             VARCHAR2(8)          not null,
   constraint PK_BOOK_BORROW_INFO primary key (borrowid)
);

/*==============================================================*/
/* Table: book_reginster                                        */
/*==============================================================*/
create table book_reginster 
(
   bookid               VARCHAR2(50)         not null,
   bookname             VARCHAR2(50),
   booktype             VARCHAR2(20),
   writer               VARCHAR2(50),
   press                VARCHAR2(20),
   pressdate            DATE,
   price                NUMBER(8,2),
   regdate              DATE,
   count                INTEGER,
   operator             VARCHAR2(12),
   remark               VARCHAR(200),
   constraint PK_BOOK_REGINSTER primary key (bookid)
);

/*==============================================================*/
/* Table: course_stu_info                                       */
/*==============================================================*/
create table course_stu_info 
(
   sname                VARCHAR2(12)         not null,
   sno                  VARCHAR2(12),
   courseno             VARCHAR2(4),
   score                NUMBER(18,2),
   examtype             VARCHAR2(10),
   examdate             DATE,
   operator             VARCHAR2(10),
   constraint PK_COURSE_STU_INFO primary key (sname)
);

/*==============================================================*/
/* Index: FK_COURSE_S_REFERENCE_DOCU_STU                        */
/*==============================================================*/
create index FK_COURSE_S_REFERENCE_DOCU_STU on course_stu_info (
   sno ASC
);

/*==============================================================*/
/* Index: FK_COURSE_S_REFERENCE_SYSTEM_C                        */
/*==============================================================*/
create index FK_COURSE_S_REFERENCE_SYSTEM_C on course_stu_info (
   courseno ASC
);

/*==============================================================*/
/* Table: docu_stu_info                                         */
/*==============================================================*/
create table docu_stu_info 
(
   sid                  VARCHAR2(12)         not null,
   sname                VARCHAR2(12),
   sex                  VARCHAR2(4),
   age                  INTEGER,
   idcard               VARCHAR2(20),
   birth                DATE,
   politics             VARCHAR2(10),
   phone                VARCHAR2(15),
   address              VARCHAR2(50),
   health               VARCHAR2(8),
   constraint PK_DOCU_STU_INFO primary key (sid)
);

/*==============================================================*/
/* Table: docu_stu_register                                     */
/*==============================================================*/
create table docu_stu_register 
(
   sname                VARCHAR2(12)         not null,
   classId              VARCHAR2(8),
   sid                  VARCHAR2(12),
   checkdate            DATE,
   operator             VARCHAR2(12),
   enterscore           NUMBER(10,2),
   majorname            varchar2(20),
   constraint PK_DOCU_STU_REGISTER primary key (sname)
);

/*==============================================================*/
/* Index: FK_DOCU_STU_REFERENCE_DOCU_STU                        */
/*==============================================================*/
create index FK_DOCU_STU_REFERENCE_DOCU_STU on docu_stu_register (
   sid ASC
);

/*==============================================================*/
/* Index: FK_DOCU_STU_REFERENCE_SYSTEM_C                        */
/*==============================================================*/
create index FK_DOCU_STU_REFERENCE_SYSTEM_C on docu_stu_register (
   classId ASC
);

/*==============================================================*/
/* Table: docu_tea_info                                         */
/*==============================================================*/
create table docu_tea_info 
(
   tno                  VARCHAR2(20)         not null,
   tname                VARCHAR2(12),
   mno                  VARCHAR(2),
   sex                  VARCHAR2(2),
   age                  INTEGER,
   nation               VARCHAR2(10),
   politics             VARCHAR2(20),
   education            VARCHAR2(10),
   marital              VARCHAR2(4),
   birth                DATE,
   idcard               VARCHAR2(18),
   phone                VARCHAR2(15),
   workdate             DATE,
   jobDesc              VARCHAR(200),
   constraint PK_DOCU_TEA_INFO primary key (tno)
);

/*==============================================================*/
/* Index: FK_docu_tea_info_system_specia                        */
/*==============================================================*/
create index FK_docu_tea_info_system_specia on docu_tea_info (
   
);

/*==============================================================*/
/* Table: empl_assign_charge                                    */
/*==============================================================*/
create table empl_assign_charge 
(
   tname                VARCHAR2(20)         not null,
   classid              VARCHAR2(8)          not null,
   tid                  VARCHAR2(20)         not null,
   majorname            VARCHAR2(10),
   classname            VARCHAR2(10),
   leavedate            DATE,
   jobdate              DATE,
   constraint PK_EMPL_ASSIGN_CHARGE primary key (tname)
);

/*==============================================================*/
/* Index: FK_EMPL_ASS_REFERENCE_SYSTEM_C                        */
/*==============================================================*/
create index FK_EMPL_ASS_REFERENCE_SYSTEM_C on empl_assign_charge (
   classid ASC
);

/*==============================================================*/
/* Index: FK_EMPL_ASS_REFERENCE_DOCU_TEA                        */
/*==============================================================*/
create index FK_EMPL_ASS_REFERENCE_DOCU_TEA on empl_assign_charge (
   tid ASC
);

/*==============================================================*/
/* Table: empl_assign_course                                    */
/*==============================================================*/
create table empl_assign_course 
(
   sname                VARCHAR2(12)         not null,
   tid                  VARCHAR2(20)         not null,
   courseno             VARCHAR2(4)          not null,
   tname                VARCHAR2(10),
   coursename           VARCHAR2(20),
   hiredate             DATE,
   leavedate            DATE,
   constraint PK_EMPL_ASSIGN_COURSE primary key (sname)
);

/*==============================================================*/
/* Index: FK_EMPL_ASS_REFERENCE_SYSTEM_C                        */
/*==============================================================*/
create index FK_EMPL_ASS_REFERENCE_SYSTEM_C on empl_assign_course (
   courseno ASC
);

/*==============================================================*/
/* Index: FK_EMPL_ASS_REFERENCE_DOCU_TEA                        */
/*==============================================================*/
create index FK_EMPL_ASS_REFERENCE_DOCU_TEA on empl_assign_course (
   tid ASC
);

/*==============================================================*/
/* Table: system_class_info                                     */
/*==============================================================*/
create table system_class_info 
(
   classid              VARCHAR2(8)          not null,
   gradeno              VARCHAR2(4),
   mno                  VARCHAR2(50),
   classname            VARCHAR2(20),
   constraint PK_SYSTEM_CLASS_INFO primary key (classid)
);

/*==============================================================*/
/* Index: FK_SYSTEM_C_REFERENCE_SYSTEM_G                        */
/*==============================================================*/
create index FK_SYSTEM_C_REFERENCE_SYSTEM_G on system_class_info (
   gradeno ASC
);

/*==============================================================*/
/* Index: FK_SYSTEM_C_REFERENCE_SYSTEM_S                        */
/*==============================================================*/
create index FK_SYSTEM_C_REFERENCE_SYSTEM_S on system_class_info (
   mno ASC
);

/*==============================================================*/
/* Table: system_course_code                                    */
/*==============================================================*/
create table system_course_code 
(
   courseno             VARCHAR2(4)          not null,
   coursename           VARCHAR2(20),
   constraint PK_SYSTEM_COURSE_CODE primary key (courseno)
);

/*==============================================================*/
/* Table: system_grade_code                                     */
/*==============================================================*/
create table system_grade_code 
(
   gradeno              VARCHAR2(4)          not null,
   gradename            VARCHAR2(20),
   constraint PK_SYSTEM_GRADE_CODE primary key (gradeno)
);

/*==============================================================*/
/* Table: system_specialty_code                                 */
/*==============================================================*/
create table system_specialty_code 
(
   mno                  VARCHAR2(50)         not null,
   mname                VARCHAR2(20),
   constraint PK_SYSTEM_SPECIALTY_CODE primary key (mno)
);

/*==============================================================*/
/* Table: system_users                                          */
/*==============================================================*/
create table system_users 
(
   userid               VARCHAR2(50)         not null,
   username             VARCHAR2(50),
   password             VARCHAR2(50),
   constraint PK_SYSTEM_USERS primary key (userid)
);

alter table book_borrow_info
   add constraint FK_BOOK_BOR_REFERENCE_BOOK_REG foreign key (bookid)
      references book_reginster (bookid);

alter table book_borrow_info
   add constraint FK_BOOK_BOR_REFERENCE_DOCU_STU foreign key (sid)
      references docu_stu_info (sid);

alter table course_stu_info
   add constraint FK_COURSE_S_FK_COURSE_DOCU_STU foreign key (sno)
      references docu_stu_info (sid);

alter table course_stu_info
   add constraint FK_COURSE_S_FK_COURSE_SYSTEM_C foreign key (courseno)
      references system_course_code (courseno);

alter table docu_stu_register
   add constraint FK_DOCU_STU_FK_DOCU_S_DOCU_STU foreign key (sid)
      references docu_stu_info (sid);

alter table docu_stu_register
   add constraint FK_DOCU_STU_FK_DOCU_S_SYSTEM_C foreign key (classId)
      references system_class_info (classid);

alter table docu_tea_info
   add constraint FK_DOCU_TEA_FK_DOCU_T_SYSTEM_S foreign key ()
      references system_specialty_code (mno);

alter table empl_assign_charge
   add constraint FK_EMPL_ASS_FK_EMPL_A_DOCU_TEA foreign key (tid)
      references docu_tea_info (tno);

alter table empl_assign_charge
   add constraint FK_EMPL_ASS_FK_EMPL_A_SYSTEM_C foreign key (classid)
      references system_class_info (classid);

alter table empl_assign_course
   add constraint FK_EMPL_ASS_FK_EMPL_A_DOCU_TEA foreign key (tid)
      references docu_tea_info (tno);

alter table empl_assign_course
   add constraint FK_EMPL_ASS_FK_EMPL_A_SYSTEM_C foreign key (courseno)
      references system_course_code (courseno);

alter table system_class_info
   add constraint FK_SYSTEM_C_FK_SYSTEM_SYSTEM_G foreign key (gradeno)
      references system_grade_code (gradeno);

alter table system_class_info
   add constraint FK_SYSTEM_C_FK_SYSTEM_SYSTEM_S foreign key (mno)
      references system_specialty_code (mno);

