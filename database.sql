-- =============================================================================
-- CVLAC Carlos Hernan
--       Aza Guadir Carlos Hernan

-- =============================================================================
-- Creacion de Base de Datos Para Investigacion
-- Se encuentra soportada con el diagrama entidad relacion
--
create table GradeWorks
(
    work_id serial not null primary key,
    work_name varchar(1000),
    work_year varchar(4),
    work_iswapp boolean,
    work_ismapp boolean,
    work_isdesk boolean,
    work_isaudi boolean,
    work_isweng boolean,
    work_isdbmn boolean,
    work_isothe boolean,
    work_uevalu boolean,
    work_status varchar(2)
);

create table Methodologies
(
    method_id varchar(4) not null primary key,
    method_name varchar(100)
);

create table WebAplications
(
    app_id integer references GradeWorks(work_id) primary key,
    app_metho varchar(4) references Methodologies(method_id),
    app_types varchar(50),
    app_cmenb smallint,
    app_lease int,
    app_ueval boolean,
    app_lback varchar(500),
    app_lfron varchar(500),
    app_nsgdb varchar(100),
    app_produ boolean,
    app_trodu varchar(50),
    app_updat boolean,
    app_lupda date,
    app_tcost varchar(50),
    app_qualf numeric(3)
);




create table DevelopmentPractice
(
    prac_id serial not null primary key,
    prac_meth varchar(4) references Methodologies(method_id) not null,
    prac_name varchar(500),
    prac_desc text,
    prac_type varchar(100)
);

create table PracticeEvaluation
(
    pe_id serial not null primary key,
    pe_applic integer references WebAplications(app_id) not null,
    pe_practi integer references DevelopmentPractice(prac_id),
    pe_status boolean,
    pe_dateti timestamp
);

create table HeuristicEvaluation
(
    ue_id serial not null primary key,
    ue_applica integer references WebAplications(app_id) not null,
    ue_sysvisi numeric(5,2),
    ue_usrlang numeric(5,2),
    ue_ctrfree numeric(5,2),
    ue_constan numeric(5,2),
    ue_feedbak numeric(5,2),
    ue_errprev numeric(5,2),
    ue_flexefi numeric(5,2),
    ue_edminim numeric(5,2),
    ue_helpdoc numeric(5,2)
);
