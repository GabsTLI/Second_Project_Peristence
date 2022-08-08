-- Generated by Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   at:        2022-08-08 10:19:10 CST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE board (
    id_board      NUMBER(4) NOT NULL,
    freepositions NUMBER(4)
);

ALTER TABLE board ADD CONSTRAINT board_pk PRIMARY KEY ( id_board );

CREATE TABLE piece (
    player_id_player NUMBER(4) NOT NULL,
    id_piece         NUMBER(4) NOT NULL,
    piece            VARCHAR2(1),
    board_id_board   NUMBER(4) NOT NULL
);

ALTER TABLE piece
    ADD CONSTRAINT piece_pk PRIMARY KEY ( player_id_player,
                                          id_piece,
                                          board_id_board );

CREATE TABLE player (
    id_player        NUMBER(4) NOT NULL,
    player_name      VARCHAR2(50),
    id_typeofplayers NUMBER(4),
    id_typegame      NUMBER(4)
);

ALTER TABLE player ADD CONSTRAINT player_pk PRIMARY KEY ( id_player );

CREATE TABLE round (
    id_round         NUMBER(4) NOT NULL,
    player_id_player NUMBER(4) NOT NULL
);

CREATE UNIQUE INDEX round__idx ON
    round (
        player_id_player
    ASC );

ALTER TABLE round ADD CONSTRAINT round_pk PRIMARY KEY ( id_round );

CREATE TABLE turn (
    id_turn        NUMBER NOT NULL,
    round_id_round NUMBER(4) NOT NULL
);

ALTER TABLE turn ADD CONSTRAINT turn_pk PRIMARY KEY ( id_turn,
                                                      round_id_round );

CREATE TABLE typegame (
    id_typegame      NUMBER(4) NOT NULL,
    typegame         VARCHAR2(25),
    player_id_player NUMBER(4) NOT NULL
);

ALTER TABLE typegame ADD CONSTRAINT typegame_pk PRIMARY KEY ( id_typegame,
                                                              player_id_player );

CREATE TABLE typeofplayer (
    id_typeofplayers NUMBER(4) NOT NULL,
    typeofplayer     VARCHAR2(25),
    player_id_player NUMBER(4) NOT NULL
);

CREATE UNIQUE INDEX typeofplayer__idx ON
    typeofplayer (
        player_id_player
    ASC );

ALTER TABLE typeofplayer ADD CONSTRAINT typeofplayer_pk PRIMARY KEY ( id_typeofplayers );

CREATE TABLE word (
    player_id_player NUMBER(4) NOT NULL,
    id_word          NUMBER(4) NOT NULL,
    secretword       VARCHAR2(50),
    guessedword      VARCHAR2(50)
);

ALTER TABLE word ADD CONSTRAINT word_pk PRIMARY KEY ( player_id_player,
                                                      id_word );

ALTER TABLE piece
    ADD CONSTRAINT piece_board_fk FOREIGN KEY ( board_id_board )
        REFERENCES board ( id_board );

ALTER TABLE piece
    ADD CONSTRAINT piece_player_fk FOREIGN KEY ( player_id_player )
        REFERENCES player ( id_player );

ALTER TABLE round
    ADD CONSTRAINT round_player_fk FOREIGN KEY ( player_id_player )
        REFERENCES player ( id_player );

ALTER TABLE turn
    ADD CONSTRAINT turn_round_fk FOREIGN KEY ( round_id_round )
        REFERENCES round ( id_round );

ALTER TABLE typegame
    ADD CONSTRAINT typegame_player_fk FOREIGN KEY ( player_id_player )
        REFERENCES player ( id_player );

ALTER TABLE typeofplayer
    ADD CONSTRAINT typeofplayer_player_fk FOREIGN KEY ( player_id_player )
        REFERENCES player ( id_player );

ALTER TABLE word
    ADD CONSTRAINT word_player_fk FOREIGN KEY ( player_id_player )
        REFERENCES player ( id_player );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             8
-- CREATE INDEX                             2
-- ALTER TABLE                             15
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
