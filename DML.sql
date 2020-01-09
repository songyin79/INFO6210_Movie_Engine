use MovieIndustry;

insert into Country
values (1,'North America','United State',7488347),
(86,'Asia','China',9000000);

insert into Company
values (1,'Fox',1);

insert into Movie
values (1, 'Stoker','Horror',2014,'PG-13',7487800,1);

insert into moviereleasedin
values (1,1,'01/01/2014','05/01/2014');

insert into ProductionMember
values (1,'A','B','1,1,0','Male','01/01/1984'),
(2,'K','l','0,0,1','Male','01/01/1984');

insert into [Contract]
values (1,1,'01/01/2014','01/01/2020');

insert into Director
values (1,0.79,300000,7432);

insert into star
values (1,0.74,837489);

insert into ScreenWriter
values (2,7000);

insert into MovieDirected
values (1,1,'01/01/2014','01/01/2020');

insert into MoviePerformed
values (1,1,'xx role');
select * from MovieScript;

insert into MovieScript
values (1,2,'some script name','script descr','horror');

