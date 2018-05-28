DROP VIEW SZCZOKOLY_MECZU CASCADE CONSTRAINTS 
;

DROP TABLE grupy CASCADE CONSTRAINTS;

DROP TABLE kluby CASCADE CONSTRAINTS;

DROP TABLE kraje CASCADE CONSTRAINTS;

DROP TABLE mecze CASCADE CONSTRAINTS;

DROP TABLE pozycje CASCADE CONSTRAINTS;

DROP TABLE rozgrywki CASCADE CONSTRAINTS;

DROP TABLE sedziowie CASCADE CONSTRAINTS;

DROP TABLE stadiony CASCADE CONSTRAINTS;

DROP TABLE strefy CASCADE CONSTRAINTS;

DROP TABLE sytuacje CASCADE CONSTRAINTS;

DROP TABLE team CASCADE CONSTRAINTS;

DROP TABLE trenerzy CASCADE CONSTRAINTS;

DROP TABLE wyniki_grup CASCADE CONSTRAINTS;

DROP TABLE wyniki_puch CASCADE CONSTRAINTS;

DROP TABLE zawodnicy CASCADE CONSTRAINTS;

DROP TABLE zdarzenia CASCADE CONSTRAINTS;

DROP SEQUENCE wc.seq_id_rozgrywki;

CREATE SEQUENCE SEQ_ID_ROZGRYWKI 
    START WITH 10 
    INCREMENT BY 1 
    MAXVALUE 9999 
    MINVALUE 11 
;


GRANT ALL PRIVILEGES, ALTER, SELECT, KEEP SEQUENCE 
    ON SEQ_ID_ROZGRYWKI TO wc WITH GRANT OPTION 
;

CREATE TABLE grupy (
    id      INTEGER NOT NULL,
    nazwa   VARCHAR2(10) NOT NULL
)
LOGGING;

ALTER TABLE grupy ADD CONSTRAINT grupy_pk PRIMARY KEY ( id );

CREATE TABLE kluby (
    id         INTEGER NOT NULL,
    nazwa      VARCHAR2(100) NOT NULL,
    kraje_id   INTEGER NOT NULL
)
LOGGING;

ALTER TABLE kluby ADD CONSTRAINT kluby_pk PRIMARY KEY ( id );

CREATE TABLE kraje (
    id      INTEGER NOT NULL,
    nazwa   VARCHAR2(50) NOT NULL
)
LOGGING;

ALTER TABLE kraje ADD CONSTRAINT kraje_pk PRIMARY KEY ( id );

CREATE TABLE mecze (
    id             INTEGER NOT NULL,
    nazwa          VARCHAR2(50),
    data           DATE NOT NULL,
    godzina        TIMESTAMP NOT NULL,
    etap           VARCHAR2(50) NOT NULL,
    stadiony_id    INTEGER NOT NULL,
    sedziowie_id   INTEGER NOT NULL
)
LOGGING;

ALTER TABLE mecze ADD CONSTRAINT mecze_pk PRIMARY KEY ( id );

CREATE TABLE pozycje (
    id      INTEGER NOT NULL,
    nazwa   VARCHAR2(15) NOT NULL
)
LOGGING;

ALTER TABLE pozycje ADD CONSTRAINT pozycje_pk PRIMARY KEY ( id );

CREATE TABLE rozgrywki (
    id            INTEGER NOT NULL,
    bramki        INTEGER,
    kartki_zol    INTEGER,
    kartki_czer   INTEGER,
    team_id       INTEGER NOT NULL,
    mecze_id      INTEGER NOT NULL
)
LOGGING;

ALTER TABLE rozgrywki ADD CONSTRAINT rozgrywki_pk PRIMARY KEY ( id );

CREATE TABLE sedziowie (
    id          INTEGER NOT NULL,
    nazwa       VARCHAR2(100) NOT NULL,
    kraje_id    INTEGER NOT NULL,
    strefy_id   INTEGER NOT NULL
)
LOGGING;

ALTER TABLE sedziowie ADD CONSTRAINT sedziowie_pk PRIMARY KEY ( id );

CREATE TABLE stadiony (
    id          INTEGER NOT NULL,
    nazwa       VARCHAR2(100) NOT NULL,
    pojemnosc   INTEGER NOT NULL,
    miasto      VARCHAR2(100) NOT NULL
)
LOGGING;

ALTER TABLE stadiony ADD CONSTRAINT stadiony_pk PRIMARY KEY ( id );

CREATE TABLE strefy (
    id           INTEGER NOT NULL,
    nazwa        VARCHAR2(100) NOT NULL,
    strefa_kod   VARCHAR2(10)
)
LOGGING;

ALTER TABLE strefy ADD CONSTRAINT strefy_pk PRIMARY KEY ( id );

CREATE TABLE sytuacje (
    id      INTEGER NOT NULL,
    nazwa   VARCHAR2(50) NOT NULL
)
LOGGING;

ALTER TABLE sytuacje ADD CONSTRAINT sytuacje_pk PRIMARY KEY ( id );

CREATE TABLE team (
    id            INTEGER NOT NULL,
    nazwa         VARCHAR2(50) NOT NULL,
    grupy_id      INTEGER NOT NULL,
    strefy_id     INTEGER NOT NULL,
    trenerzy_id   INTEGER NOT NULL
)
LOGGING;

CREATE INDEX team__idx ON
    team ( id ASC )
        LOGGING;

ALTER TABLE team ADD CONSTRAINT team_pk PRIMARY KEY ( id );

CREATE TABLE trenerzy (
    id      INTEGER NOT NULL,
    nazwa   VARCHAR2(50) NOT NULL
)
LOGGING;

ALTER TABLE trenerzy ADD CONSTRAINT trenerzy_pk PRIMARY KEY ( id );

CREATE TABLE wyniki_grup (
    id        INTEGER NOT NULL,
    pkt       INTEGER NOT NULL,
    wyg       INTEGER NOT NULL,
    rem       INTEGER NOT NULL,
    por       INTEGER NOT NULL,
    strzel    INTEGER NOT NULL,
    strac     INTEGER NOT NULL,
    team_id   INTEGER NOT NULL
)
LOGGING;


ALTER TABLE wyniki_grup ADD CONSTRAINT wyniki_grup_pk PRIMARY KEY ( id );

CREATE TABLE wyniki_puch (
    id        INTEGER NOT NULL,
    pkt       INTEGER NOT NULL,
    wyg       INTEGER NOT NULL,
    rem       INTEGER NOT NULL,
    por       INTEGER NOT NULL,
    strzel    INTEGER NOT NULL,
    strac     INTEGER NOT NULL,
    team_id   INTEGER NOT NULL
)
LOGGING;


ALTER TABLE wyniki_puch ADD CONSTRAINT wyniki_puch_pk PRIMARY KEY ( id );

CREATE TABLE zawodnicy (
    id           INTEGER NOT NULL,
    nazwa        VARCHAR2(100 CHAR) NOT NULL,
    pozycje_id   INTEGER NOT NULL,
    team_id      INTEGER NOT NULL,
    kluby_id     INTEGER NOT NULL
)
LOGGING;

ALTER TABLE zawodnicy ADD CONSTRAINT zawodnicy_pk PRIMARY KEY ( id );

CREATE TABLE zdarzenia (
    id             INTEGER NOT NULL,
    minuta         INTEGER NOT NULL,
    zawodnicy_id   INTEGER NOT NULL,
    mecze_id       INTEGER NOT NULL,
    sytuacje_id    INTEGER NOT NULL
)
LOGGING;

ALTER TABLE zdarzenia ADD CONSTRAINT zdarzenia_pk PRIMARY KEY ( id );



---------------------------------------------------- INSERTY ----------------------

INSERT INTO GRUPY
  ( ID, nazwa )
  VALUES ( 1, 'Grupa A' );
INSERT INTO GRUPY
  ( ID, nazwa )
  VALUES ( 2, 'Grupa B' );
INSERT INTO GRUPY
  ( ID, nazwa )
  VALUES ( 3, 'Grupa C' );
INSERT INTO GRUPY
  ( ID, nazwa )
  VALUES ( 4, 'Grupa D' );
INSERT INTO GRUPY
  ( ID, nazwa )
  VALUES ( 5, 'Grupa E' );
INSERT INTO GRUPY
  ( ID, nazwa )
  VALUES ( 6, 'Grupa F' );
INSERT INTO GRUPY
  ( ID, nazwa )
  VALUES ( 7, 'Grupa G' );
INSERT INTO GRUPY
  ( ID, nazwa )
  VALUES ( 8, 'Grupa H' );
INSERT INTO KLUBY
  ( ID, nazwa, kraje_ID )
  VALUES ( 1, 'Lech Poznań', 30 );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 1, 'Algieria' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 2, 'Anglia' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 3, 'Arabia Saudyjska' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 4, 'Argentyna' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 5, 'Australia' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 6, 'Bahraj' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 7, 'Belgia' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 8, 'Brazylia' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 9, 'Chorwacja' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 10, 'Dania' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 11, 'Egipt' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 12, 'Etiopia' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 13, 'Francja' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 14, 'Gambia' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 15, 'Hiszpania' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 16, 'Holadnia' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 17, 'Ira' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 18, 'Islandia' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 19, 'Japonia' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 20, 'Kolumbia' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 21, 'Korea Południowa' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 22, 'Kostaryka' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 23, 'Maroko' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 24, 'Meksyk' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 25, 'Niemcy' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 26, 'Nigeria' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 27, 'Panama' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 28, 'Paragwaj' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 29, 'Peru' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 30, 'Polska' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 31, 'Portugalia' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 32, 'Rosja' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 33, 'Senegal' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 34, 'Serbia' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 35, 'Słowenia' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 36, 'Szwajcaria' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 37, 'Szwecja' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 38, 'Tahiti' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 39, 'Tunezja' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 40, 'Turcja' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 41, 'Urugwaj' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 42, 'USA' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 43, 'Uzbekista' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 44, 'Włochy' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 45, 'Zambia' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 46, 'Zjednoczone Emiraty Arabskie' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 47, 'Nowa Zelandia' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 48, 'Salwador' );
INSERT INTO KRAJE
  ( ID, nazwa )
  VALUES ( 49, 'Chile' );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 1, 'Rosja - Arabia Saudyjska', TO_DATE('2018-06-14','yyyy-mm-dd'), TO_TIMESTAMP('14:00:00','HH24:MI:SS'), 'grupa', 2, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 2, 'Egipt - Urugwaj', TO_DATE('2018-06-15','yyyy-mm-dd'), TO_TIMESTAMP('17:00:00','HH24:MI:SS'), 'grupa', 7, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 3, 'Maroko - Ira', TO_DATE('2018-06-15','yyyy-mm-dd'), TO_TIMESTAMP('17:00:00','HH24:MI:SS'), 'grupa', 9, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 4, 'Portugalia - Hiszpania', TO_DATE('2018-06-15','yyyy-mm-dd'), TO_TIMESTAMP('20:00:00','HH24:MI:SS'), 'grupa', 10, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 5, 'Francja - Australia', TO_DATE('2018-06-16','yyyy-mm-dd'), TO_TIMESTAMP('12:00:00','HH24:MI:SS'), 'grupa', 1, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 6, 'Peru - Dania', TO_DATE('2018-06-16','yyyy-mm-dd'), TO_TIMESTAMP('18:00:00','HH24:MI:SS'), 'grupa', 3, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 7, 'Argentyna - Islandia', TO_DATE('2018-06-16','yyyy-mm-dd'), TO_TIMESTAMP('15:00:00','HH24:MI:SS'), 'grupa', 4, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 8, 'Chorwacja - Nigeria', TO_DATE('2018-06-16','yyyy-mm-dd'), TO_TIMESTAMP('21:00:00','HH24:MI:SS'), 'grupa', 8, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 9, 'Kostaryka - Serbia', TO_DATE('2018-06-17','yyyy-mm-dd'), TO_TIMESTAMP('14:00:00','HH24:MI:SS'), 'grupa', 6, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 10, 'Brazylia - Szwajcaria', TO_DATE('2018-06-17','yyyy-mm-dd'), TO_TIMESTAMP('20:00:00','HH24:MI:SS'), 'grupa', 5, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 11, 'Niemcy - Meksyk', TO_DATE('2018-06-17','yyyy-mm-dd'), TO_TIMESTAMP('17:00:00','HH24:MI:SS'), 'grupa', 2, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 12, 'Szwecja - Korea Południowa', TO_DATE('2018-06-18','yyyy-mm-dd'), TO_TIMESTAMP('14:00:00','HH24:MI:SS'), 'grupa', 11, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 13, 'Belgia - Panama', TO_DATE('2018-06-18','yyyy-mm-dd'), TO_TIMESTAMP('17:00:00','HH24:MI:SS'), 'grupa', 10, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 14, 'Tunezja - Anglia', TO_DATE('2018-06-18','yyyy-mm-dd'), TO_TIMESTAMP('20:00:00','HH24:MI:SS'), 'grupa', 12, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 15, 'Rosja - Egipt', TO_DATE('2018-06-19','yyyy-mm-dd'), TO_TIMESTAMP('20:00:00','HH24:MI:SS'), 'grupa', 9, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 16, 'Kolumbia - Japonia', TO_DATE('2018-06-19','yyyy-mm-dd'), TO_TIMESTAMP('14:00:00','HH24:MI:SS'), 'grupa', 3, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 17, 'Polska - Senegal', TO_DATE('2018-06-19','yyyy-mm-dd'), TO_TIMESTAMP('17:00:00','HH24:MI:SS'), 'grupa', 4, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 18, 'Urugwaj - Arabia Saudyjska', TO_DATE('2018-06-20','yyyy-mm-dd'), TO_TIMESTAMP('17:00:00','HH24:MI:SS'), 'grupa', 5, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 19, 'Portugalia - Maroko', TO_DATE('2018-06-20','yyyy-mm-dd'), TO_TIMESTAMP('14:00:00','HH24:MI:SS'), 'grupa', 2, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 20, 'Iran - Hiszpania', TO_DATE('2018-06-20','yyyy-mm-dd'), TO_TIMESTAMP('20:00:00','HH24:MI:SS'), 'grupa', 1, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 21, 'Francja - Peru', TO_DATE('2018-06-21','yyyy-mm-dd'), TO_TIMESTAMP('14:00:00','HH24:MI:SS'), 'grupa', 7, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 22, 'Dania - Australia', TO_DATE('2018-06-21','yyyy-mm-dd'), TO_TIMESTAMP('17:00:00','HH24:MI:SS'), 'grupa', 6, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 23, 'Argentyna - Chorwacja', TO_DATE('2018-06-21','yyyy-mm-dd'), TO_TIMESTAMP('20:00:00','HH24:MI:SS'), 'grupa', 11, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 24, 'Nigeria - Islandia', TO_DATE('2018-06-22','yyyy-mm-dd'), TO_TIMESTAMP('17:00:00','HH24:MI:SS'), 'grupa', 12, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 25, 'Brazylia - Kostaryka', TO_DATE('2018-06-22','yyyy-mm-dd'), TO_TIMESTAMP('14:00:00','HH24:MI:SS'), 'grupa', 9, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 26, 'Serbia - Szwajcaria', TO_DATE('2018-06-22','yyyy-mm-dd'), TO_TIMESTAMP('20:00:00','HH24:MI:SS'), 'grupa', 8, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 27, 'Niemcy - Szwecja', TO_DATE('2018-06-23','yyyy-mm-dd'), TO_TIMESTAMP('20:00:00','HH24:MI:SS'), 'grupa', 10, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 28, 'Korea Południowa - Meksyk', TO_DATE('2018-06-23','yyyy-mm-dd'), TO_TIMESTAMP('17:00:00','HH24:MI:SS'), 'grupa', 5, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 29, 'Belgia - Tunezja', TO_DATE('2018-06-23','yyyy-mm-dd'), TO_TIMESTAMP('14:00:00','HH24:MI:SS'), 'grupa', 4, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 30, 'Anglia - Panama', TO_DATE('2018-06-24','yyyy-mm-dd'), TO_TIMESTAMP('14:00:00','HH24:MI:SS'), 'grupa', 11, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 31, 'Japonia - Senegal', TO_DATE('2018-06-24','yyyy-mm-dd'), TO_TIMESTAMP('17:00:00','HH24:MI:SS'), 'grupa', 7, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 32, 'Polska - Kolumbia', TO_DATE('2018-06-24','yyyy-mm-dd'), TO_TIMESTAMP('20:00:00','HH24:MI:SS'), 'grupa', 1, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 33, 'Urugwaj - Rosja', TO_DATE('2018-06-25','yyyy-mm-dd'), TO_TIMESTAMP('16:00:00','HH24:MI:SS'), 'grupa', 6, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 34, 'Arabia Saudyjska - Egipt', TO_DATE('2018-06-25','yyyy-mm-dd'), TO_TIMESTAMP('16:00:00','HH24:MI:SS'), 'grupa', 12, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 35, 'Iran - Portugalia', TO_DATE('2018-06-25','yyyy-mm-dd'), TO_TIMESTAMP('20:00:00','HH24:MI:SS'), 'grupa', 3, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 36, 'Hiszpania - Maroko', TO_DATE('2018-06-25','yyyy-mm-dd'), TO_TIMESTAMP('20:00:00','HH24:MI:SS'), 'grupa', 8, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 37, 'Dania - Francja', TO_DATE('2018-06-26','yyyy-mm-dd'), TO_TIMESTAMP('16:00:00','HH24:MI:SS'), 'grupa', 2, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 38, 'Australia - Peru', TO_DATE('2018-06-26','yyyy-mm-dd'), TO_TIMESTAMP('16:00:00','HH24:MI:SS'), 'grupa', 10, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 39, 'Nigeria - Argentyna', TO_DATE('2018-06-26','yyyy-mm-dd'), TO_TIMESTAMP('20:00:00','HH24:MI:SS'), 'grupa', 9, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 40, 'Islandia - Chorwacja', TO_DATE('2018-06-26','yyyy-mm-dd'), TO_TIMESTAMP('20:00:00','HH24:MI:SS'), 'grupa', 5, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 41, 'Serbia - Brazylia', TO_DATE('2018-06-27','yyyy-mm-dd'), TO_TIMESTAMP('20:00:00','HH24:MI:SS'), 'grupa', 4, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 42, 'Szwajcaria - Kostaryka', TO_DATE('2018-06-27','yyyy-mm-dd'), TO_TIMESTAMP('20:00:00','HH24:MI:SS'), 'grupa', 11, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 43, 'Korea Południowa - Niemcy', TO_DATE('2018-06-27','yyyy-mm-dd'), TO_TIMESTAMP('16:00:00','HH24:MI:SS'), 'grupa', 1, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 44, 'Meksyk - Szwecja', TO_DATE('2018-06-27','yyyy-mm-dd'), TO_TIMESTAMP('16:00:00','HH24:MI:SS'), 'grupa', 7, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 45, 'Anglia - Belgia', TO_DATE('2018-06-28','yyyy-mm-dd'), TO_TIMESTAMP('20:00:00','HH24:MI:SS'), 'grupa', 8, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 46, 'Panama - Tunezja', TO_DATE('2018-06-28','yyyy-mm-dd'), TO_TIMESTAMP('20:00:00','HH24:MI:SS'), 'grupa', 3, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 47, 'Japonia - Polska', TO_DATE('2018-06-28','yyyy-mm-dd'), TO_TIMESTAMP('16:00:00','HH24:MI:SS'), 'grupa', 12, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 48, 'Senegal - Kolumbia', TO_DATE('2018-06-28','yyyy-mm-dd'), TO_TIMESTAMP('16:00:00','HH24:MI:SS'), 'grupa', 6, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 49, '1C - 2D', TO_DATE('2018-06-30','yyyy-mm-dd'), TO_TIMESTAMP('16:00:00','HH24:MI:SS'), '1/8', 1, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 50, '1A - 2B', TO_DATE('2018-06-30','yyyy-mm-dd'), TO_TIMESTAMP('20:00:00','HH24:MI:SS'), '1/8', 10, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 51, '1B - 2A', TO_DATE('2018-07-01','yyyy-mm-dd'), TO_TIMESTAMP('16:00:00','HH24:MI:SS'), '1/8', 2, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 52, '1D - 2C', TO_DATE('2018-07-01','yyyy-mm-dd'), TO_TIMESTAMP('20:00:00','HH24:MI:SS'), '1/8', 11, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 53, '1E - 2F', TO_DATE('2018-07-02','yyyy-mm-dd'), TO_TIMESTAMP('16:00:00','HH24:MI:SS'), '1/8', 6, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 54, '1G - 2H', TO_DATE('2018-07-02','yyyy-mm-dd'), TO_TIMESTAMP('20:00:00','HH24:MI:SS'), '1/8', 5, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 55, '1F - 2E', TO_DATE('2018-07-03','yyyy-mm-dd'), TO_TIMESTAMP('16:00:00','HH24:MI:SS'), '1/8', 9, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 56, '1H - 2G', TO_DATE('2018-07-03','yyyy-mm-dd'), TO_TIMESTAMP('20:00:00','HH24:MI:SS'), '1/8', 4, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 57, 'Zwycięzca meczu 49 - Zwycięzca meczu 50', TO_DATE('2018-07-06','yyyy-mm-dd'), TO_TIMESTAMP('16:00:00','HH24:MI:SS'), '1/4', 11, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 58, 'Zwycięzca meczu 53 - Zwycięzca meczu 54', TO_DATE('2018-07-06','yyyy-mm-dd'), TO_TIMESTAMP('20:00:00','HH24:MI:SS'), '1/4', 1, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 59, 'Zwycięzca meczu 55 - Zwycięzca meczu 56', TO_DATE('2018-07-07','yyyy-mm-dd'), TO_TIMESTAMP('16:00:00','HH24:MI:SS'), '1/4', 6, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 60, 'Zwycięzca meczu 51 - Zwycięzca meczu 52', TO_DATE('2018-07-07','yyyy-mm-dd'), TO_TIMESTAMP('20:00:00','HH24:MI:SS'), '1/4', 10, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 61, 'Zwycięzca meczu 57 - Zwycięzca meczu 58', TO_DATE('2018-07-10','yyyy-mm-dd'), TO_TIMESTAMP('20:00:00','HH24:MI:SS'), '1/2', 9, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 62, 'Zwycięzca meczu 59 - Zwycięzca meczu 60', TO_DATE('2018-07-11','yyyy-mm-dd'), TO_TIMESTAMP('20:00:00','HH24:MI:SS'), '1/2', 2, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 63, 'Przegrany meczu 61 - Przegrany meczu 62', TO_DATE('2018-07-14','yyyy-mm-dd'), TO_TIMESTAMP('16:00:00','HH24:MI:SS'), '3 miejsce', 9, 1 );
INSERT INTO MECZE
  ( ID, nazwa, data, godzina, etap, stadiony_ID, sedziowie_ID )
  VALUES ( 64, 'Zwycięzca meczu 61 - Zwycięzca meczu 62', TO_DATE('2018-07-15','yyyy-mm-dd'), TO_TIMESTAMP('17:00:00','HH24:MI:SS'), 'finał', 2, 1 );
INSERT INTO POZYCJE
  ( ID, nazwa )
  VALUES ( 1, 'bramkarz' );
INSERT INTO POZYCJE
  ( ID, nazwa )
  VALUES ( 2, 'obrońca' );
INSERT INTO POZYCJE
  ( ID, nazwa )
  VALUES ( 3, 'pomocnik' );
INSERT INTO POZYCJE
  ( ID, nazwa )
  VALUES ( 4, 'napastnik' );
INSERT INTO SEDZIOWIE
  ( ID, nazwa, kraje_ID, strefy_ID )
  VALUES ( 1, ' Andres Cunha ', 41, 5 );
INSERT INTO SEDZIOWIE
  ( ID, nazwa, kraje_ID, strefy_ID )
  VALUES ( 2, ' Antonio Mateu Lahoz ', 15, 6 );
INSERT INTO SEDZIOWIE
  ( ID, nazwa, kraje_ID, strefy_ID )
  VALUES ( 3, ' Bjoern Kuipers ', 15, 6 );
INSERT INTO SEDZIOWIE
  ( ID, nazwa, kraje_ID, strefy_ID )
  VALUES ( 4, ' Cesar Ramos ', 24, 4 );
INSERT INTO SEDZIOWIE
  ( ID, nazwa, kraje_ID, strefy_ID )
  VALUES ( 5, ' Clement Turpin ', 13, 6 );
INSERT INTO SEDZIOWIE
  ( ID, nazwa, kraje_ID, strefy_ID )
  VALUES ( 6, ' Cuneyt Cakir ', 40, 6 );
INSERT INTO SEDZIOWIE
  ( ID, nazwa, kraje_ID, strefy_ID )
  VALUES ( 7, ' Damir Skomina ', 35, 6 );
INSERT INTO SEDZIOWIE
  ( ID, nazwa, kraje_ID, strefy_ID )
  VALUES ( 8, ' Enrique Caceres ', 28, 5 );
INSERT INTO SEDZIOWIE
  ( ID, nazwa, kraje_ID, strefy_ID )
  VALUES ( 9, ' Gianluca Rocchi ', 44, 6 );
INSERT INTO SEDZIOWIE
  ( ID, nazwa, kraje_ID, strefy_ID )
  VALUES ( 10, ' Jair Marrufo ', 42, 4 );
INSERT INTO SEDZIOWIE
  ( ID, nazwa, kraje_ID, strefy_ID )
  VALUES ( 11, ' John Piiti ', 27, 4 );
INSERT INTO SEDZIOWIE
  ( ID, nazwa, kraje_ID, strefy_ID )
  VALUES ( 12, ' Mark Geiger ', 42, 4 );
INSERT INTO SEDZIOWIE
  ( ID, nazwa, kraje_ID, strefy_ID )
  VALUES ( 13, ' Milorad Mazic ', 34, 6 );
INSERT INTO SEDZIOWIE
  ( ID, nazwa, kraje_ID, strefy_ID )
  VALUES ( 14, ' Nestor Pitana ', 4, 5 );
INSERT INTO SEDZIOWIE
  ( ID, nazwa, kraje_ID, strefy_ID )
  VALUES ( 15, ' Ricardo Montero ', 22, 4 );
INSERT INTO SEDZIOWIE
  ( ID, nazwa, kraje_ID, strefy_ID )
  VALUES ( 16, ' Sandro Meira Ricci ', 8, 5 );
INSERT INTO SEDZIOWIE
  ( ID, nazwa, kraje_ID, strefy_ID )
  VALUES ( 17, ' Siergiej Karasiew ', 32, 6 );
INSERT INTO SEDZIOWIE
  ( ID, nazwa, kraje_ID, strefy_ID )
  VALUES ( 18, ' Szymon Marciniak ', 30, 6 );
INSERT INTO SEDZIOWIE
  ( ID, nazwa, kraje_ID, strefy_ID )
  VALUES ( 19, ' Wilmar Roldan ', 20, 5 );
INSERT INTO SEDZIOWIE
  ( ID, nazwa, kraje_ID, strefy_ID )
  VALUES ( 20, 'Alireza Faghani ', 17, 1 );
INSERT INTO SEDZIOWIE
  ( ID, nazwa, kraje_ID, strefy_ID )
  VALUES ( 21, 'Bakary Gassama ', 14, 2 );
INSERT INTO SEDZIOWIE
  ( ID, nazwa, kraje_ID, strefy_ID )
  VALUES ( 22, 'Bamlak Tessema ', 12, 2 );
INSERT INTO SEDZIOWIE
  ( ID, nazwa, kraje_ID, strefy_ID )
  VALUES ( 23, 'Fahad Al Mirdasi ', 3, 1 );
INSERT INTO SEDZIOWIE
  ( ID, nazwa, kraje_ID, strefy_ID )
  VALUES ( 24, 'Felix Brych ', 25, 6 );
INSERT INTO SEDZIOWIE
  ( ID, nazwa, kraje_ID, strefy_ID )
  VALUES ( 25, 'Ghead Grisha ', 11, 2 );
INSERT INTO SEDZIOWIE
  ( ID, nazwa, kraje_ID, strefy_ID )
  VALUES ( 26, 'Janny Sikazwe ', 45, 2 );
INSERT INTO SEDZIOWIE
  ( ID, nazwa, kraje_ID, strefy_ID )
  VALUES ( 27, 'Joel Aguilar ', 48, 4 );
INSERT INTO SEDZIOWIE
  ( ID, nazwa, kraje_ID, strefy_ID )
  VALUES ( 28, 'Julio Bascunan ', 49, 5 );
INSERT INTO SEDZIOWIE
  ( ID, nazwa, kraje_ID, strefy_ID )
  VALUES ( 29, 'Malang Diedhiou ', 33, 2 );
INSERT INTO SEDZIOWIE
  ( ID, nazwa, kraje_ID, strefy_ID )
  VALUES ( 30, 'Mattew Conger ', 47, 3 );
INSERT INTO SEDZIOWIE
  ( ID, nazwa, kraje_ID, strefy_ID )
  VALUES ( 31, 'Mehdi Abid Charef ', 1, 2 );
INSERT INTO SEDZIOWIE
  ( ID, nazwa, kraje_ID, strefy_ID )
  VALUES ( 32, 'Mohammed Mohamed ', 46, 1 );
INSERT INTO SEDZIOWIE
  ( ID, nazwa, kraje_ID, strefy_ID )
  VALUES ( 33, 'Nawaf Shukralla ', 6, 1 );
INSERT INTO SEDZIOWIE
  ( ID, nazwa, kraje_ID, strefy_ID )
  VALUES ( 34, 'Norbert Hauata ', 38, 3 );
INSERT INTO SEDZIOWIE
  ( ID, nazwa, kraje_ID, strefy_ID )
  VALUES ( 35, 'Rawszan Irmatow ', 43, 1 );
INSERT INTO SEDZIOWIE
  ( ID, nazwa, kraje_ID, strefy_ID )
  VALUES ( 36, 'Ryuji Sato ', 19, 1 );
INSERT INTO STADIONY
  ( ID, nazwa, pojemnosc, miasto )
  VALUES ( 1, 'Kazan Arena', 45105, 'Kazań' );
INSERT INTO STADIONY
  ( ID, nazwa, pojemnosc, miasto )
  VALUES ( 2, '�?użniki', 81029, 'Moskwa' );
INSERT INTO STADIONY
  ( ID, nazwa, pojemnosc, miasto )
  VALUES ( 3, 'Mordowija Ariena', 44149, 'Sarańsk' );
INSERT INTO STADIONY
  ( ID, nazwa, pojemnosc, miasto )
  VALUES ( 4, 'Otkrytije Ariena', 44000, 'Moskwa' );
INSERT INTO STADIONY
  ( ID, nazwa, pojemnosc, miasto )
  VALUES ( 5, 'Rostow Arena', 43702, 'Rostów nad Donem' );
INSERT INTO STADIONY
  ( ID, nazwa, pojemnosc, miasto )
  VALUES ( 6, 'Samara Arena', 44918, 'Samara' );
INSERT INTO STADIONY
  ( ID, nazwa, pojemnosc, miasto )
  VALUES ( 7, 'Stadion Centralny', 35000, 'Jekaterynburg' );
INSERT INTO STADIONY
  ( ID, nazwa, pojemnosc, miasto )
  VALUES ( 8, 'Stadion Kaliningrad', 35015, 'Kaliningrad' );
INSERT INTO STADIONY
  ( ID, nazwa, pojemnosc, miasto )
  VALUES ( 9, 'Stadion Kriestowskij', 56196, 'Sankt Petersburg' );
INSERT INTO STADIONY
  ( ID, nazwa, pojemnosc, miasto )
  VALUES ( 10, 'Stadion Olimpijski', 44000, 'Soczi' );
INSERT INTO STADIONY
  ( ID, nazwa, pojemnosc, miasto )
  VALUES ( 11, 'Striełka', 44899, 'Niżny Nowogród' );
INSERT INTO STADIONY
  ( ID, nazwa, pojemnosc, miasto )
  VALUES ( 12, 'Wołgograd Arena', 45015, 'Wołgograd' );
INSERT INTO STREFY
  ( ID, nazwa, strefa_kod )
  VALUES ( 1, 'Asian Football Confederatio', 'AFC' );
INSERT INTO STREFY
  ( ID, nazwa, strefa_kod )
  VALUES ( 2, 'Confédération Africaine de Football', 'CAF' );
INSERT INTO STREFY
  ( ID, nazwa, strefa_kod )
  VALUES ( 3, 'Oceania Football Confederatio', 'OFC' );
INSERT INTO STREFY
  ( ID, nazwa, strefa_kod )
  VALUES ( 4, 'The Confederation of North, Central America and Caribbean Association Football', 'CONCACAF' );
INSERT INTO STREFY
  ( ID, nazwa, strefa_kod )
  VALUES ( 5, 'The South American Football Confederatio', 'CONMEBOL' );
INSERT INTO STREFY
  ( ID, nazwa, strefa_kod )
  VALUES ( 6, 'Union of European Football Associations', 'UEFA' );
INSERT INTO SYTUACJE
  ( ID, nazwa )
  VALUES ( 1, 'bramka' );
INSERT INTO SYTUACJE
  ( ID, nazwa )
  VALUES ( 2, 'czerwona kartka' );
INSERT INTO SYTUACJE
  ( ID, nazwa )
  VALUES ( 3, 'samobój' );
INSERT INTO SYTUACJE
  ( ID, nazwa )
  VALUES ( 4, 'zółta kartka' );
INSERT INTO TEAM
  ( ID, nazwa, grupy_ID, strefy_ID, trenerzy_ID )
  VALUES ( 1, 'Anglia', 7, 6, 10 );
INSERT INTO TEAM
  ( ID, nazwa, grupy_ID, strefy_ID, trenerzy_ID )
  VALUES ( 2, 'Arabia Saudyjska', 1, 1, 24 );
INSERT INTO TEAM
  ( ID, nazwa, grupy_ID, strefy_ID, trenerzy_ID )
  VALUES ( 3, 'Argentyna', 4, 5, 1 );
INSERT INTO TEAM
  ( ID, nazwa, grupy_ID, strefy_ID, trenerzy_ID )
  VALUES ( 4, 'Australia', 3, 1, 2 );
INSERT INTO TEAM
  ( ID, nazwa, grupy_ID, strefy_ID, trenerzy_ID )
  VALUES ( 5, 'Belgia', 7, 6, 3 );
INSERT INTO TEAM
  ( ID, nazwa, grupy_ID, strefy_ID, trenerzy_ID )
  VALUES ( 6, 'Brazylia', 5, 5, 4 );
INSERT INTO TEAM
  ( ID, nazwa, grupy_ID, strefy_ID, trenerzy_ID )
  VALUES ( 7, 'Chorwacja', 4, 6, 7 );
INSERT INTO TEAM
  ( ID, nazwa, grupy_ID, strefy_ID, trenerzy_ID )
  VALUES ( 8, 'Dania', 3, 6, 8 );
INSERT INTO TEAM
  ( ID, nazwa, grupy_ID, strefy_ID, trenerzy_ID )
  VALUES ( 9, 'Egipt', 1, 2, 9 );
INSERT INTO TEAM
  ( ID, nazwa, grupy_ID, strefy_ID, trenerzy_ID )
  VALUES ( 10, 'Francja', 3, 6, 11 );
INSERT INTO TEAM
  ( ID, nazwa, grupy_ID, strefy_ID, trenerzy_ID )
  VALUES ( 11, 'Hiszpania', 2, 6, 28 );
INSERT INTO TEAM
  ( ID, nazwa, grupy_ID, strefy_ID, trenerzy_ID )
  VALUES ( 12, 'Ira', 2, 1, 14 );
INSERT INTO TEAM
  ( ID, nazwa, grupy_ID, strefy_ID, trenerzy_ID )
  VALUES ( 13, 'Islandia', 4, 6, 13 );
INSERT INTO TEAM
  ( ID, nazwa, grupy_ID, strefy_ID, trenerzy_ID )
  VALUES ( 14, 'Japonia', 8, 1, 15 );
INSERT INTO TEAM
  ( ID, nazwa, grupy_ID, strefy_ID, trenerzy_ID )
  VALUES ( 15, 'Kolumbia', 8, 5, 5 );
INSERT INTO TEAM
  ( ID, nazwa, grupy_ID, strefy_ID, trenerzy_ID )
  VALUES ( 16, 'Korea Południowa', 6, 1, 27 );
INSERT INTO TEAM
  ( ID, nazwa, grupy_ID, strefy_ID, trenerzy_ID )
  VALUES ( 17, 'Kostaryka', 5, 4, 6 );
INSERT INTO TEAM
  ( ID, nazwa, grupy_ID, strefy_ID, trenerzy_ID )
  VALUES ( 18, 'Maroko', 2, 2, 17 );
INSERT INTO TEAM
  ( ID, nazwa, grupy_ID, strefy_ID, trenerzy_ID )
  VALUES ( 19, 'Meksyk', 6, 4, 16 );
INSERT INTO TEAM
  ( ID, nazwa, grupy_ID, strefy_ID, trenerzy_ID )
  VALUES ( 20, 'Niemcy', 6, 6, 12 );
INSERT INTO TEAM
  ( ID, nazwa, grupy_ID, strefy_ID, trenerzy_ID )
  VALUES ( 21, 'Nigeria', 4, 2, 18 );
INSERT INTO TEAM
  ( ID, nazwa, grupy_ID, strefy_ID, trenerzy_ID )
  VALUES ( 22, 'Panama', 7, 4, 19 );
INSERT INTO TEAM
  ( ID, nazwa, grupy_ID, strefy_ID, trenerzy_ID )
  VALUES ( 23, 'Peru', 3, 5, 20 );
INSERT INTO TEAM
  ( ID, nazwa, grupy_ID, strefy_ID, trenerzy_ID )
  VALUES ( 24, 'Polska', 8, 6, 21 );
INSERT INTO TEAM
  ( ID, nazwa, grupy_ID, strefy_ID, trenerzy_ID )
  VALUES ( 25, 'Portugalia', 2, 6, 22 );
INSERT INTO TEAM
  ( ID, nazwa, grupy_ID, strefy_ID, trenerzy_ID )
  VALUES ( 26, 'Rosja', 1, 6, 23 );
INSERT INTO TEAM
  ( ID, nazwa, grupy_ID, strefy_ID, trenerzy_ID )
  VALUES ( 27, 'Senegal', 8, 2, 25 );
INSERT INTO TEAM
  ( ID, nazwa, grupy_ID, strefy_ID, trenerzy_ID )
  VALUES ( 28, 'Serbia', 5, 6, 26 );
INSERT INTO TEAM
  ( ID, nazwa, grupy_ID, strefy_ID, trenerzy_ID )
  VALUES ( 29, 'Szwajcaria', 5, 6, 30 );
INSERT INTO TEAM
  ( ID, nazwa, grupy_ID, strefy_ID, trenerzy_ID )
  VALUES ( 30, 'Szwecja', 6, 6, 29 );
INSERT INTO TEAM
  ( ID, nazwa, grupy_ID, strefy_ID, trenerzy_ID )
  VALUES ( 31, 'Tunezja', 7, 2, 31 );
INSERT INTO TEAM
  ( ID, nazwa, grupy_ID, strefy_ID, trenerzy_ID )
  VALUES ( 32, 'Urugwaj', 1, 5, 32 );
INSERT INTO TRENERZY
  ( ID, NAZWA )
  VALUES ( 1, 'Jorge Sampaoli' );
INSERT INTO TRENERZY
  ( ID, NAZWA )
  VALUES ( 2, 'NetherlandsBert van Marwijk' );
INSERT INTO TRENERZY
  ( ID, NAZWA )
  VALUES ( 3, 'SpainRoberto Martínez' );
INSERT INTO TRENERZY
  ( ID, NAZWA )
  VALUES ( 4, 'Tite' );
INSERT INTO TRENERZY
  ( ID, NAZWA )
  VALUES ( 5, 'ArgentinaJosé Pékerma' );
INSERT INTO TRENERZY
  ( ID, NAZWA )
  VALUES ( 6, 'Óscar Ramírez' );
INSERT INTO TRENERZY
  ( ID, NAZWA )
  VALUES ( 7, 'Zlatko Dalić' );
INSERT INTO TRENERZY
  ( ID, NAZWA )
  VALUES ( 8, 'NorwayAge Hareide' );
INSERT INTO TRENERZY
  ( ID, NAZWA )
  VALUES ( 9, 'ArgentinaHéctor Cúper' );
INSERT INTO TRENERZY
  ( ID, NAZWA )
  VALUES ( 10, 'Gareth Southgate' );
INSERT INTO TRENERZY
  ( ID, NAZWA )
  VALUES ( 11, 'Didier Deschamps' );
INSERT INTO TRENERZY
  ( ID, NAZWA )
  VALUES ( 12, 'Joachim Löw' );
INSERT INTO TRENERZY
  ( ID, NAZWA )
  VALUES ( 13, 'Heimir Hallgrímsso' );
INSERT INTO TRENERZY
  ( ID, NAZWA )
  VALUES ( 14, 'PortugalCarlos Queiroz' );
INSERT INTO TRENERZY
  ( ID, NAZWA )
  VALUES ( 15, 'Akira Nishino' );
INSERT INTO TRENERZY
  ( ID, NAZWA )
  VALUES ( 16, 'ColombiaJuan Carlos Osorio' );
INSERT INTO TRENERZY
  ( ID, NAZWA )
  VALUES ( 17, 'FranceHervé Renard' );
INSERT INTO TRENERZY
  ( ID, NAZWA )
  VALUES ( 18, 'GermanyGernot Rohr' );
INSERT INTO TRENERZY
  ( ID, NAZWA )
  VALUES ( 19, 'ColombiaHernán Darío Gómez' );
INSERT INTO TRENERZY
  ( ID, NAZWA )
  VALUES ( 20, 'ArgentinaRicardo Gareca' );
INSERT INTO TRENERZY
  ( ID, NAZWA )
  VALUES ( 21, 'Adam Nawałka' );
INSERT INTO TRENERZY
  ( ID, NAZWA )
  VALUES ( 22, 'Fernando Santos' );
INSERT INTO TRENERZY
  ( ID, NAZWA )
  VALUES ( 23, 'Stanislav Cherchesov' );
INSERT INTO TRENERZY
  ( ID, NAZWA )
  VALUES ( 24, 'SpainJuan Antonio Pizzi' );
INSERT INTO TRENERZY
  ( ID, NAZWA )
  VALUES ( 25, 'Aliou Cissé' );
INSERT INTO TRENERZY
  ( ID, NAZWA )
  VALUES ( 26, 'Mladen Krstajić' );
INSERT INTO TRENERZY
  ( ID, NAZWA )
  VALUES ( 27, 'Shin Tae-yong' );
INSERT INTO TRENERZY
  ( ID, NAZWA )
  VALUES ( 28, 'Julen Lopetegui' );
INSERT INTO TRENERZY
  ( ID, NAZWA )
  VALUES ( 29, 'Janne Andersso' );
INSERT INTO TRENERZY
  ( ID, NAZWA )
  VALUES ( 30, 'Bosnia and HerzegovinaVladimir Petković' );
INSERT INTO TRENERZY
  ( ID, NAZWA )
  VALUES ( 31, 'Nabil Maâloul' );
INSERT INTO TRENERZY
  ( ID, NAZWA )
  VALUES ( 32, 'Óscar Tabárez' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 1, 4, 1, 1, 'Anglia1' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 2, 4, 1, 1, 'Anglia2' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 3, 4, 1, 1, 'Anglia10' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 4, 4, 1, 1, 'Anglia11' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 5, 4, 1, 1, 'Anglia12' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 6, 4, 1, 1, 'Anglia13' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 7, 4, 1, 1, 'Anglia14' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 8, 4, 1, 1, 'Anglia15' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 9, 4, 1, 1, 'Anglia16' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 10, 4, 1, 1, 'Anglia17' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 11, 4, 1, 1, 'Anglia18' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 12, 4, 1, 1, 'Anglia19' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 13, 4, 1, 1, 'Anglia20' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 14, 4, 1, 1, 'Anglia21' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 15, 4, 1, 1, 'Anglia22' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 16, 4, 1, 1, 'Anglia23' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 17, 4, 1, 1, 'Anglia3' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 18, 4, 1, 1, 'Anglia4' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 19, 4, 1, 1, 'Anglia5' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 20, 4, 1, 1, 'Anglia6' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 21, 4, 1, 1, 'Anglia7' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 22, 4, 1, 1, 'Anglia8' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 23, 4, 1, 1, 'Anglia9' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 24, 4, 2, 1, 'Arabia Saudyjska1' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 25, 4, 2, 1, 'Arabia Saudyjska10' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 26, 4, 2, 1, 'Arabia Saudyjska11' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 27, 4, 2, 1, 'Arabia Saudyjska12' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 28, 4, 2, 1, 'Arabia Saudyjska13' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 29, 4, 2, 1, 'Arabia Saudyjska14' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 30, 4, 2, 1, 'Arabia Saudyjska15' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 31, 4, 2, 1, 'Arabia Saudyjska16' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 32, 4, 2, 1, 'Arabia Saudyjska17' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 33, 4, 2, 1, 'Arabia Saudyjska18' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 34, 4, 2, 1, 'Arabia Saudyjska19' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 35, 4, 2, 1, 'Arabia Saudyjska2' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 36, 4, 2, 1, 'Arabia Saudyjska20' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 37, 4, 2, 1, 'Arabia Saudyjska21' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 38, 4, 2, 1, 'Arabia Saudyjska22' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 39, 4, 2, 1, 'Arabia Saudyjska23' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 40, 4, 2, 1, 'Arabia Saudyjska3' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 41, 4, 2, 1, 'Arabia Saudyjska4' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 42, 4, 2, 1, 'Arabia Saudyjska5' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 43, 4, 2, 1, 'Arabia Saudyjska6' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 44, 4, 2, 1, 'Arabia Saudyjska7' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 45, 4, 2, 1, 'Arabia Saudyjska8' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 46, 4, 2, 1, 'Arabia Saudyjska9' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 47, 4, 3, 1, 'Argentyna1' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 48, 4, 3, 1, 'Argentyna10' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 49, 4, 3, 1, 'Argentyna11' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 50, 4, 3, 1, 'Argentyna12' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 51, 4, 3, 1, 'Argentyna13' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 52, 4, 3, 1, 'Argentyna14' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 53, 4, 3, 1, 'Argentyna15' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 54, 4, 3, 1, 'Argentyna16' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 55, 4, 3, 1, 'Argentyna17' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 56, 4, 3, 1, 'Argentyna18' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 57, 4, 3, 1, 'Argentyna19' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 58, 4, 3, 1, 'Argentyna2' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 59, 4, 3, 1, 'Argentyna20' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 60, 4, 3, 1, 'Argentyna21' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 61, 4, 3, 1, 'Argentyna22' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 62, 4, 3, 1, 'Argentyna23' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 63, 4, 3, 1, 'Argentyna3' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 64, 4, 3, 1, 'Argentyna4' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 65, 4, 3, 1, 'Argentyna5' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 66, 4, 3, 1, 'Argentyna6' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 67, 4, 3, 1, 'Argentyna7' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 68, 4, 3, 1, 'Argentyna8' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 69, 4, 3, 1, 'Argentyna9' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 70, 4, 4, 1, 'Australia1' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 71, 4, 4, 1, 'Australia10' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 72, 4, 4, 1, 'Australia11' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 73, 4, 4, 1, 'Australia12' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 74, 4, 4, 1, 'Australia13' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 75, 4, 4, 1, 'Australia14' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 76, 4, 4, 1, 'Australia15' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 77, 4, 4, 1, 'Australia16' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 78, 4, 4, 1, 'Australia17' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 79, 4, 4, 1, 'Australia18' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 80, 4, 4, 1, 'Australia19' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 81, 4, 4, 1, 'Australia2' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 82, 4, 4, 1, 'Australia20' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 83, 4, 4, 1, 'Australia21' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 84, 4, 4, 1, 'Australia22' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 85, 4, 4, 1, 'Australia23' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 86, 4, 4, 1, 'Australia3' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 87, 4, 4, 1, 'Australia4' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 88, 4, 4, 1, 'Australia5' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 89, 4, 4, 1, 'Australia6' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 90, 4, 4, 1, 'Australia7' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 91, 4, 4, 1, 'Australia8' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 92, 4, 4, 1, 'Australia9' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 93, 4, 5, 1, 'Belgia1' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 94, 4, 5, 1, 'Belgia10' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 95, 4, 5, 1, 'Belgia11' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 96, 4, 5, 1, 'Belgia12' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 97, 4, 5, 1, 'Belgia13' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 98, 4, 5, 1, 'Belgia14' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 99, 4, 5, 1, 'Belgia15' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 100, 4, 5, 1, 'Belgia16' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 101, 4, 5, 1, 'Belgia17' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 102, 4, 5, 1, 'Belgia18' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 103, 4, 5, 1, 'Belgia19' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 104, 4, 5, 1, 'Belgia2' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 105, 4, 5, 1, 'Belgia20' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 106, 4, 5, 1, 'Belgia21' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 107, 4, 5, 1, 'Belgia22' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 108, 4, 5, 1, 'Belgia23' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 109, 4, 5, 1, 'Belgia3' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 110, 4, 5, 1, 'Belgia4' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 111, 4, 5, 1, 'Belgia5' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 112, 4, 5, 1, 'Belgia6' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 113, 4, 5, 1, 'Belgia7' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 114, 4, 5, 1, 'Belgia8' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 115, 4, 5, 1, 'Belgia9' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 116, 4, 6, 1, 'Brazylia1' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 117, 4, 6, 1, 'Brazylia10' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 118, 4, 6, 1, 'Brazylia11' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 119, 4, 6, 1, 'Brazylia12' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 120, 4, 6, 1, 'Brazylia13' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 121, 4, 6, 1, 'Brazylia14' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 122, 4, 6, 1, 'Brazylia15' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 123, 4, 6, 1, 'Brazylia16' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 124, 4, 6, 1, 'Brazylia17' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 125, 4, 6, 1, 'Brazylia18' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 126, 4, 6, 1, 'Brazylia19' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 127, 4, 6, 1, 'Brazylia2' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 128, 4, 6, 1, 'Brazylia20' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 129, 4, 6, 1, 'Brazylia21' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 130, 4, 6, 1, 'Brazylia22' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 131, 4, 6, 1, 'Brazylia23' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 132, 4, 6, 1, 'Brazylia3' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 133, 4, 6, 1, 'Brazylia4' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 134, 4, 6, 1, 'Brazylia5' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 135, 4, 6, 1, 'Brazylia6' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 136, 4, 6, 1, 'Brazylia7' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 137, 4, 6, 1, 'Brazylia8' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 138, 4, 6, 1, 'Brazylia9' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 139, 4, 7, 1, 'Chorwacja1' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 140, 4, 7, 1, 'Chorwacja10' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 141, 4, 7, 1, 'Chorwacja11' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 142, 4, 7, 1, 'Chorwacja12' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 143, 4, 7, 1, 'Chorwacja13' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 144, 4, 7, 1, 'Chorwacja14' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 145, 4, 7, 1, 'Chorwacja15' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 146, 4, 7, 1, 'Chorwacja16' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 147, 4, 7, 1, 'Chorwacja17' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 148, 4, 7, 1, 'Chorwacja18' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 149, 4, 7, 1, 'Chorwacja19' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 150, 4, 7, 1, 'Chorwacja2' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 151, 4, 7, 1, 'Chorwacja20' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 152, 4, 7, 1, 'Chorwacja21' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 153, 4, 7, 1, 'Chorwacja22' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 154, 4, 7, 1, 'Chorwacja23' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 155, 4, 7, 1, 'Chorwacja3' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 156, 4, 7, 1, 'Chorwacja4' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 157, 4, 7, 1, 'Chorwacja5' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 158, 4, 7, 1, 'Chorwacja6' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 159, 4, 7, 1, 'Chorwacja7' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 160, 4, 7, 1, 'Chorwacja8' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 161, 4, 7, 1, 'Chorwacja9' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 162, 4, 8, 1, 'Dania1' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 163, 4, 8, 1, 'Dania10' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 164, 4, 8, 1, 'Dania11' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 165, 4, 8, 1, 'Dania12' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 166, 4, 8, 1, 'Dania13' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 167, 4, 8, 1, 'Dania14' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 168, 4, 8, 1, 'Dania15' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 169, 4, 8, 1, 'Dania16' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 170, 4, 8, 1, 'Dania17' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 171, 4, 8, 1, 'Dania18' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 172, 4, 8, 1, 'Dania19' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 173, 4, 8, 1, 'Dania2' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 174, 4, 8, 1, 'Dania20' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 175, 4, 8, 1, 'Dania21' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 176, 4, 8, 1, 'Dania22' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 177, 4, 8, 1, 'Dania23' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 178, 4, 8, 1, 'Dania3' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 179, 4, 8, 1, 'Dania4' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 180, 4, 8, 1, 'Dania5' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 181, 4, 8, 1, 'Dania6' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 182, 4, 8, 1, 'Dania7' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 183, 4, 8, 1, 'Dania8' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 184, 4, 8, 1, 'Dania9' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 185, 4, 9, 1, 'Egipt1' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 186, 4, 9, 1, 'Egipt10' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 187, 4, 9, 1, 'Egipt11' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 188, 4, 9, 1, 'Egipt12' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 189, 4, 9, 1, 'Egipt13' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 190, 4, 9, 1, 'Egipt14' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 191, 4, 9, 1, 'Egipt15' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 192, 4, 9, 1, 'Egipt16' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 193, 4, 9, 1, 'Egipt17' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 194, 4, 9, 1, 'Egipt18' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 195, 4, 9, 1, 'Egipt19' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 196, 4, 9, 1, 'Egipt2' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 197, 4, 9, 1, 'Egipt20' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 198, 4, 9, 1, 'Egipt21' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 199, 4, 9, 1, 'Egipt22' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 200, 4, 9, 1, 'Egipt23' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 201, 4, 9, 1, 'Egipt3' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 202, 4, 9, 1, 'Egipt4' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 203, 4, 9, 1, 'Egipt5' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 204, 4, 9, 1, 'Egipt6' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 205, 4, 9, 1, 'Egipt7' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 206, 4, 9, 1, 'Egipt8' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 207, 4, 9, 1, 'Egipt9' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 208, 4, 10, 1, 'Francja1' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 209, 4, 10, 1, 'Francja10' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 210, 4, 10, 1, 'Francja11' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 211, 4, 10, 1, 'Francja12' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 212, 4, 10, 1, 'Francja13' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 213, 4, 10, 1, 'Francja14' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 214, 4, 10, 1, 'Francja15' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 215, 4, 10, 1, 'Francja16' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 216, 4, 10, 1, 'Francja17' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 217, 4, 10, 1, 'Francja18' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 218, 4, 10, 1, 'Francja19' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 219, 4, 10, 1, 'Francja2' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 220, 4, 10, 1, 'Francja20' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 221, 4, 10, 1, 'Francja21' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 222, 4, 10, 1, 'Francja22' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 223, 4, 10, 1, 'Francja23' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 224, 4, 10, 1, 'Francja3' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 225, 4, 10, 1, 'Francja4' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 226, 4, 10, 1, 'Francja5' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 227, 4, 10, 1, 'Francja6' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 228, 4, 10, 1, 'Francja7' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 229, 4, 10, 1, 'Francja8' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 230, 4, 10, 1, 'Francja9' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 231, 4, 11, 1, 'Hiszpania1' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 232, 4, 11, 1, 'Hiszpania10' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 233, 4, 11, 1, 'Hiszpania11' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 234, 4, 11, 1, 'Hiszpania12' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 235, 4, 11, 1, 'Hiszpania13' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 236, 4, 11, 1, 'Hiszpania14' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 237, 4, 11, 1, 'Hiszpania15' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 238, 4, 11, 1, 'Hiszpania16' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 239, 4, 11, 1, 'Hiszpania17' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 240, 4, 11, 1, 'Hiszpania18' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 241, 4, 11, 1, 'Hiszpania19' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 242, 4, 11, 1, 'Hiszpania2' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 243, 4, 11, 1, 'Hiszpania20' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 244, 4, 11, 1, 'Hiszpania21' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 245, 4, 11, 1, 'Hiszpania22' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 246, 4, 11, 1, 'Hiszpania23' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 247, 4, 11, 1, 'Hiszpania3' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 248, 4, 11, 1, 'Hiszpania4' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 249, 4, 11, 1, 'Hiszpania5' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 250, 4, 11, 1, 'Hiszpania6' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 251, 4, 11, 1, 'Hiszpania7' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 252, 4, 11, 1, 'Hiszpania8' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 253, 4, 11, 1, 'Hiszpania9' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 254, 4, 12, 1, 'Iran1' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 255, 4, 12, 1, 'Iran10' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 256, 4, 12, 1, 'Iran11' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 257, 4, 12, 1, 'Iran12' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 258, 4, 12, 1, 'Iran13' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 259, 4, 12, 1, 'Iran14' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 260, 4, 12, 1, 'Iran15' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 261, 4, 12, 1, 'Iran16' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 262, 4, 12, 1, 'Iran17' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 263, 4, 12, 1, 'Iran18' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 264, 4, 12, 1, 'Iran19' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 265, 4, 12, 1, 'Iran2' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 266, 4, 12, 1, 'Iran20' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 267, 4, 12, 1, 'Iran21' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 268, 4, 12, 1, 'Iran22' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 269, 4, 12, 1, 'Iran23' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 270, 4, 12, 1, 'Iran3' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 271, 4, 12, 1, 'Iran4' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 272, 4, 12, 1, 'Iran5' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 273, 4, 12, 1, 'Iran6' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 274, 4, 12, 1, 'Iran7' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 275, 4, 12, 1, 'Iran8' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 276, 4, 12, 1, 'Iran9' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 277, 4, 13, 1, 'Islandia1' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 278, 4, 13, 1, 'Islandia10' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 279, 4, 13, 1, 'Islandia11' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 280, 4, 13, 1, 'Islandia12' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 281, 4, 13, 1, 'Islandia13' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 282, 4, 13, 1, 'Islandia14' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 283, 4, 13, 1, 'Islandia15' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 284, 4, 13, 1, 'Islandia16' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 285, 4, 13, 1, 'Islandia17' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 286, 4, 13, 1, 'Islandia18' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 287, 4, 13, 1, 'Islandia19' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 288, 4, 13, 1, 'Islandia2' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 289, 4, 13, 1, 'Islandia20' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 290, 4, 13, 1, 'Islandia21' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 291, 4, 13, 1, 'Islandia22' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 292, 4, 13, 1, 'Islandia23' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 293, 4, 13, 1, 'Islandia3' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 294, 4, 13, 1, 'Islandia4' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 295, 4, 13, 1, 'Islandia5' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 296, 4, 13, 1, 'Islandia6' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 297, 4, 13, 1, 'Islandia7' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 298, 4, 13, 1, 'Islandia8' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 299, 4, 13, 1, 'Islandia9' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 300, 4, 14, 1, 'Japonia1' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 301, 4, 14, 1, 'Japonia10' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 302, 4, 14, 1, 'Japonia11' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 303, 4, 14, 1, 'Japonia12' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 304, 4, 14, 1, 'Japonia13' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 305, 4, 14, 1, 'Japonia14' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 306, 4, 14, 1, 'Japonia15' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 307, 4, 14, 1, 'Japonia16' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 308, 4, 14, 1, 'Japonia17' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 309, 4, 14, 1, 'Japonia18' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 310, 4, 14, 1, 'Japonia19' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 311, 4, 14, 1, 'Japonia2' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 312, 4, 14, 1, 'Japonia20' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 313, 4, 14, 1, 'Japonia21' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 314, 4, 14, 1, 'Japonia22' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 315, 4, 14, 1, 'Japonia23' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 316, 4, 14, 1, 'Japonia3' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 317, 4, 14, 1, 'Japonia4' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 318, 4, 14, 1, 'Japonia5' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 319, 4, 14, 1, 'Japonia6' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 320, 4, 14, 1, 'Japonia7' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 321, 4, 14, 1, 'Japonia8' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 322, 4, 14, 1, 'Japonia9' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 323, 4, 15, 1, 'Kolumbia1' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 324, 4, 15, 1, 'Kolumbia10' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 325, 4, 15, 1, 'Kolumbia11' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 326, 4, 15, 1, 'Kolumbia12' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 327, 4, 15, 1, 'Kolumbia13' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 328, 4, 15, 1, 'Kolumbia14' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 329, 4, 15, 1, 'Kolumbia15' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 330, 4, 15, 1, 'Kolumbia16' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 331, 4, 15, 1, 'Kolumbia17' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 332, 4, 15, 1, 'Kolumbia18' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 333, 4, 15, 1, 'Kolumbia19' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 334, 4, 15, 1, 'Kolumbia2' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 335, 4, 15, 1, 'Kolumbia20' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 336, 4, 15, 1, 'Kolumbia21' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 337, 4, 15, 1, 'Kolumbia22' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 338, 4, 15, 1, 'Kolumbia23' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 339, 4, 15, 1, 'Kolumbia3' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 340, 4, 15, 1, 'Kolumbia4' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 341, 4, 15, 1, 'Kolumbia5' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 342, 4, 15, 1, 'Kolumbia6' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 343, 4, 15, 1, 'Kolumbia7' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 344, 4, 15, 1, 'Kolumbia8' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 345, 4, 15, 1, 'Kolumbia9' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 346, 4, 16, 1, 'Korea Południowa1' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 347, 4, 16, 1, 'Korea Południowa10' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 348, 4, 16, 1, 'Korea Południowa11' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 349, 4, 16, 1, 'Korea Południowa12' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 350, 4, 16, 1, 'Korea Południowa13' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 351, 4, 16, 1, 'Korea Południowa14' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 352, 4, 16, 1, 'Korea Południowa15' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 353, 4, 16, 1, 'Korea Południowa16' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 354, 4, 16, 1, 'Korea Południowa17' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 355, 4, 16, 1, 'Korea Południowa18' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 356, 4, 16, 1, 'Korea Południowa19' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 357, 4, 16, 1, 'Korea Południowa2' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 358, 4, 16, 1, 'Korea Południowa20' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 359, 4, 16, 1, 'Korea Południowa21' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 360, 4, 16, 1, 'Korea Południowa22' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 361, 4, 16, 1, 'Korea Południowa23' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 362, 4, 16, 1, 'Korea Południowa3' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 363, 4, 16, 1, 'Korea Południowa4' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 364, 4, 16, 1, 'Korea Południowa5' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 365, 4, 16, 1, 'Korea Południowa6' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 366, 4, 16, 1, 'Korea Południowa7' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 367, 4, 16, 1, 'Korea Południowa8' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 368, 4, 16, 1, 'Korea Południowa9' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 369, 4, 17, 1, 'Kostaryka1' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 370, 4, 17, 1, 'Kostaryka10' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 371, 4, 17, 1, 'Kostaryka11' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 372, 4, 17, 1, 'Kostaryka12' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 373, 4, 17, 1, 'Kostaryka13' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 374, 4, 17, 1, 'Kostaryka14' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 375, 4, 17, 1, 'Kostaryka15' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 376, 4, 17, 1, 'Kostaryka16' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 377, 4, 17, 1, 'Kostaryka17' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 378, 4, 17, 1, 'Kostaryka18' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 379, 4, 17, 1, 'Kostaryka19' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 380, 4, 17, 1, 'Kostaryka2' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 381, 4, 17, 1, 'Kostaryka20' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 382, 4, 17, 1, 'Kostaryka21' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 383, 4, 17, 1, 'Kostaryka22' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 384, 4, 17, 1, 'Kostaryka23' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 385, 4, 17, 1, 'Kostaryka3' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 386, 4, 17, 1, 'Kostaryka4' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 387, 4, 17, 1, 'Kostaryka5' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 388, 4, 17, 1, 'Kostaryka6' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 389, 4, 17, 1, 'Kostaryka7' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 390, 4, 17, 1, 'Kostaryka8' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 391, 4, 17, 1, 'Kostaryka9' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 392, 4, 18, 1, 'Maroko1' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 393, 4, 18, 1, 'Maroko10' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 394, 4, 18, 1, 'Maroko11' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 395, 4, 18, 1, 'Maroko12' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 396, 4, 18, 1, 'Maroko13' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 397, 4, 18, 1, 'Maroko14' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 398, 4, 18, 1, 'Maroko15' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 399, 4, 18, 1, 'Maroko16' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 400, 4, 18, 1, 'Maroko17' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 401, 4, 18, 1, 'Maroko18' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 402, 4, 18, 1, 'Maroko19' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 403, 4, 18, 1, 'Maroko2' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 404, 4, 18, 1, 'Maroko20' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 405, 4, 18, 1, 'Maroko21' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 406, 4, 18, 1, 'Maroko22' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 407, 4, 18, 1, 'Maroko23' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 408, 4, 18, 1, 'Maroko3' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 409, 4, 18, 1, 'Maroko4' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 410, 4, 18, 1, 'Maroko5' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 411, 4, 18, 1, 'Maroko6' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 412, 4, 18, 1, 'Maroko7' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 413, 4, 18, 1, 'Maroko8' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 414, 4, 18, 1, 'Maroko9' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 415, 4, 19, 1, 'Meksyk1' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 416, 4, 19, 1, 'Meksyk10' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 417, 4, 19, 1, 'Meksyk11' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 418, 4, 19, 1, 'Meksyk12' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 419, 4, 19, 1, 'Meksyk13' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 420, 4, 19, 1, 'Meksyk14' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 421, 4, 19, 1, 'Meksyk15' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 422, 4, 19, 1, 'Meksyk16' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 423, 4, 19, 1, 'Meksyk17' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 424, 4, 19, 1, 'Meksyk18' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 425, 4, 19, 1, 'Meksyk19' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 426, 4, 19, 1, 'Meksyk2' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 427, 4, 19, 1, 'Meksyk20' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 428, 4, 19, 1, 'Meksyk21' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 429, 4, 19, 1, 'Meksyk22' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 430, 4, 19, 1, 'Meksyk23' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 431, 4, 19, 1, 'Meksyk3' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 432, 4, 19, 1, 'Meksyk4' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 433, 4, 19, 1, 'Meksyk5' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 434, 4, 19, 1, 'Meksyk6' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 435, 4, 19, 1, 'Meksyk7' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 436, 4, 19, 1, 'Meksyk8' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 437, 4, 19, 1, 'Meksyk9' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 438, 4, 20, 1, 'Niemcy1' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 439, 4, 20, 1, 'Niemcy10' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 440, 4, 20, 1, 'Niemcy11' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 441, 4, 20, 1, 'Niemcy12' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 442, 4, 20, 1, 'Niemcy13' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 443, 4, 20, 1, 'Niemcy14' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 444, 4, 20, 1, 'Niemcy15' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 445, 4, 20, 1, 'Niemcy16' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 446, 4, 20, 1, 'Niemcy17' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 447, 4, 20, 1, 'Niemcy18' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 448, 4, 20, 1, 'Niemcy19' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 449, 4, 20, 1, 'Niemcy2' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 450, 4, 20, 1, 'Niemcy20' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 451, 4, 20, 1, 'Niemcy21' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 452, 4, 20, 1, 'Niemcy22' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 453, 4, 20, 1, 'Niemcy23' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 454, 4, 20, 1, 'Niemcy3' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 455, 4, 20, 1, 'Niemcy4' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 456, 4, 20, 1, 'Niemcy5' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 457, 4, 20, 1, 'Niemcy6' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 458, 4, 20, 1, 'Niemcy7' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 459, 4, 20, 1, 'Niemcy8' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 460, 4, 20, 1, 'Niemcy9' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 461, 4, 21, 1, 'Nigeria1' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 462, 4, 21, 1, 'Nigeria10' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 463, 4, 21, 1, 'Nigeria11' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 464, 4, 21, 1, 'Nigeria12' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 465, 4, 21, 1, 'Nigeria13' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 466, 4, 21, 1, 'Nigeria14' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 467, 4, 21, 1, 'Nigeria15' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 468, 4, 21, 1, 'Nigeria16' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 469, 4, 21, 1, 'Nigeria17' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 470, 4, 21, 1, 'Nigeria18' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 471, 4, 21, 1, 'Nigeria19' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 472, 4, 21, 1, 'Nigeria2' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 473, 4, 21, 1, 'Nigeria20' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 474, 4, 21, 1, 'Nigeria21' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 475, 4, 21, 1, 'Nigeria22' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 476, 4, 21, 1, 'Nigeria23' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 477, 4, 21, 1, 'Nigeria3' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 478, 4, 21, 1, 'Nigeria4' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 479, 4, 21, 1, 'Nigeria5' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 480, 4, 21, 1, 'Nigeria6' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 481, 4, 21, 1, 'Nigeria7' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 482, 4, 21, 1, 'Nigeria8' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 483, 4, 21, 1, 'Nigeria9' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 484, 4, 22, 1, 'Panama1' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 485, 4, 22, 1, 'Panama10' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 486, 4, 22, 1, 'Panama11' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 487, 4, 22, 1, 'Panama12' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 488, 4, 22, 1, 'Panama13' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 489, 4, 22, 1, 'Panama14' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 490, 4, 22, 1, 'Panama15' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 491, 4, 22, 1, 'Panama16' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 492, 4, 22, 1, 'Panama17' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 493, 4, 22, 1, 'Panama18' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 494, 4, 22, 1, 'Panama19' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 495, 4, 22, 1, 'Panama2' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 496, 4, 22, 1, 'Panama20' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 497, 4, 22, 1, 'Panama21' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 498, 4, 22, 1, 'Panama22' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 499, 4, 22, 1, 'Panama23' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 500, 4, 22, 1, 'Panama3' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 501, 4, 22, 1, 'Panama4' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 502, 4, 22, 1, 'Panama5' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 503, 4, 22, 1, 'Panama6' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 504, 4, 22, 1, 'Panama7' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 505, 4, 22, 1, 'Panama8' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 506, 4, 22, 1, 'Panama9' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 507, 4, 23, 1, 'Peru1' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 508, 4, 23, 1, 'Peru10' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 509, 4, 23, 1, 'Peru11' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 510, 4, 23, 1, 'Peru12' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 511, 4, 23, 1, 'Peru13' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 512, 4, 23, 1, 'Peru14' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 513, 4, 23, 1, 'Peru15' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 514, 4, 23, 1, 'Peru16' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 515, 4, 23, 1, 'Peru17' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 516, 4, 23, 1, 'Peru18' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 517, 4, 23, 1, 'Peru19' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 518, 4, 23, 1, 'Peru2' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 519, 4, 23, 1, 'Peru20' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 520, 4, 23, 1, 'Peru21' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 521, 4, 23, 1, 'Peru22' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 522, 4, 23, 1, 'Peru23' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 523, 4, 23, 1, 'Peru3' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 524, 4, 23, 1, 'Peru4' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 525, 4, 23, 1, 'Peru5' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 526, 4, 23, 1, 'Peru6' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 527, 4, 23, 1, 'Peru7' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 528, 4, 23, 1, 'Peru8' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 529, 4, 23, 1, 'Peru9' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 530, 4, 24, 1, 'Polska1' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 531, 4, 24, 1, 'Polska10' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 532, 4, 24, 1, 'Polska11' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 533, 4, 24, 1, 'Polska12' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 534, 4, 24, 1, 'Polska13' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 535, 4, 24, 1, 'Polska14' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 536, 4, 24, 1, 'Polska15' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 537, 4, 24, 1, 'Polska16' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 538, 4, 24, 1, 'Polska17' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 539, 4, 24, 1, 'Polska18' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 540, 4, 24, 1, 'Polska19' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 541, 4, 24, 1, 'Polska2' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 542, 4, 24, 1, 'Polska20' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 543, 4, 24, 1, 'Polska21' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 544, 4, 24, 1, 'Polska22' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 545, 4, 24, 1, 'Polska23' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 546, 4, 24, 1, 'Polska3' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 547, 4, 24, 1, 'Polska4' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 548, 4, 24, 1, 'Polska5' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 549, 4, 24, 1, 'Polska6' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 550, 4, 24, 1, 'Polska7' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 551, 4, 24, 1, 'Polska8' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 552, 4, 24, 1, 'Polska9' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 553, 4, 25, 1, 'Portugalia1' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 554, 4, 25, 1, 'Portugalia10' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 555, 4, 25, 1, 'Portugalia11' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 556, 4, 25, 1, 'Portugalia12' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 557, 4, 25, 1, 'Portugalia13' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 558, 4, 25, 1, 'Portugalia14' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 559, 4, 25, 1, 'Portugalia15' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 560, 4, 25, 1, 'Portugalia16' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 561, 4, 25, 1, 'Portugalia17' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 562, 4, 25, 1, 'Portugalia18' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 563, 4, 25, 1, 'Portugalia19' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 564, 4, 25, 1, 'Portugalia2' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 565, 4, 25, 1, 'Portugalia20' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 566, 4, 25, 1, 'Portugalia21' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 567, 4, 25, 1, 'Portugalia22' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 568, 4, 25, 1, 'Portugalia23' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 569, 4, 25, 1, 'Portugalia3' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 570, 4, 25, 1, 'Portugalia4' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 571, 4, 25, 1, 'Portugalia5' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 572, 4, 25, 1, 'Portugalia6' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 573, 4, 25, 1, 'Portugalia7' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 574, 4, 25, 1, 'Portugalia8' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 575, 4, 25, 1, 'Portugalia9' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 576, 4, 26, 1, 'Rosja1' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 577, 4, 26, 1, 'Rosja10' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 578, 4, 26, 1, 'Rosja11' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 579, 4, 26, 1, 'Rosja12' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 580, 4, 26, 1, 'Rosja13' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 581, 4, 26, 1, 'Rosja14' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 582, 4, 26, 1, 'Rosja15' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 583, 4, 26, 1, 'Rosja16' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 584, 4, 26, 1, 'Rosja17' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 585, 4, 26, 1, 'Rosja18' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 586, 4, 26, 1, 'Rosja19' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 587, 4, 26, 1, 'Rosja2' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 588, 4, 26, 1, 'Rosja20' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 589, 4, 26, 1, 'Rosja21' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 590, 4, 26, 1, 'Rosja22' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 591, 4, 26, 1, 'Rosja23' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 592, 4, 26, 1, 'Rosja3' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 593, 4, 26, 1, 'Rosja4' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 594, 4, 26, 1, 'Rosja5' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 595, 4, 26, 1, 'Rosja6' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 596, 4, 26, 1, 'Rosja7' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 597, 4, 26, 1, 'Rosja8' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 598, 4, 26, 1, 'Rosja9' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 599, 4, 27, 1, 'Senegal1' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 600, 4, 27, 1, 'Senegal10' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 601, 4, 27, 1, 'Senegal11' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 602, 4, 27, 1, 'Senegal12' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 603, 4, 27, 1, 'Senegal13' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 604, 4, 27, 1, 'Senegal14' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 605, 4, 27, 1, 'Senegal15' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 606, 4, 27, 1, 'Senegal16' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 607, 4, 27, 1, 'Senegal17' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 608, 4, 27, 1, 'Senegal18' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 609, 4, 27, 1, 'Senegal19' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 610, 4, 27, 1, 'Senegal2' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 611, 4, 27, 1, 'Senegal20' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 612, 4, 27, 1, 'Senegal21' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 613, 4, 27, 1, 'Senegal22' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 614, 4, 27, 1, 'Senegal23' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 615, 4, 27, 1, 'Senegal3' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 616, 4, 27, 1, 'Senegal4' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 617, 4, 27, 1, 'Senegal5' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 618, 4, 27, 1, 'Senegal6' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 619, 4, 27, 1, 'Senegal7' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 620, 4, 27, 1, 'Senegal8' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 621, 4, 27, 1, 'Senegal9' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 622, 4, 28, 1, 'Serbia1' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 623, 4, 28, 1, 'Serbia10' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 624, 4, 28, 1, 'Serbia11' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 625, 4, 28, 1, 'Serbia12' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 626, 4, 28, 1, 'Serbia13' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 627, 4, 28, 1, 'Serbia14' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 628, 4, 28, 1, 'Serbia15' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 629, 4, 28, 1, 'Serbia16' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 630, 4, 28, 1, 'Serbia17' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 631, 4, 28, 1, 'Serbia18' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 632, 4, 28, 1, 'Serbia19' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 633, 4, 28, 1, 'Serbia2' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 634, 4, 28, 1, 'Serbia20' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 635, 4, 28, 1, 'Serbia21' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 636, 4, 28, 1, 'Serbia22' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 637, 4, 28, 1, 'Serbia23' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 638, 4, 28, 1, 'Serbia3' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 639, 4, 28, 1, 'Serbia4' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 640, 4, 28, 1, 'Serbia5' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 641, 4, 28, 1, 'Serbia6' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 642, 4, 28, 1, 'Serbia7' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 643, 4, 28, 1, 'Serbia8' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 644, 4, 28, 1, 'Serbia9' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 645, 4, 29, 1, 'Szwajcaria1' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 646, 4, 29, 1, 'Szwajcaria10' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 647, 4, 29, 1, 'Szwajcaria11' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 648, 4, 29, 1, 'Szwajcaria12' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 649, 4, 29, 1, 'Szwajcaria13' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 650, 4, 29, 1, 'Szwajcaria14' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 651, 4, 29, 1, 'Szwajcaria15' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 652, 4, 29, 1, 'Szwajcaria16' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 653, 4, 29, 1, 'Szwajcaria17' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 654, 4, 29, 1, 'Szwajcaria18' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 655, 4, 29, 1, 'Szwajcaria19' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 656, 4, 29, 1, 'Szwajcaria2' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 657, 4, 29, 1, 'Szwajcaria20' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 658, 4, 29, 1, 'Szwajcaria21' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 659, 4, 29, 1, 'Szwajcaria22' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 660, 4, 29, 1, 'Szwajcaria23' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 661, 4, 29, 1, 'Szwajcaria3' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 662, 4, 29, 1, 'Szwajcaria4' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 663, 4, 29, 1, 'Szwajcaria5' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 664, 4, 29, 1, 'Szwajcaria6' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 665, 4, 29, 1, 'Szwajcaria7' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 666, 4, 29, 1, 'Szwajcaria8' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 667, 4, 29, 1, 'Szwajcaria9' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 668, 4, 30, 1, 'Szwecja1' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 669, 4, 30, 1, 'Szwecja10' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 670, 4, 30, 1, 'Szwecja11' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 671, 4, 30, 1, 'Szwecja12' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 672, 4, 30, 1, 'Szwecja13' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 673, 4, 30, 1, 'Szwecja14' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 674, 4, 30, 1, 'Szwecja15' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 675, 4, 30, 1, 'Szwecja16' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 676, 4, 30, 1, 'Szwecja17' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 677, 4, 30, 1, 'Szwecja18' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 678, 4, 30, 1, 'Szwecja19' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 679, 4, 30, 1, 'Szwecja2' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 680, 4, 30, 1, 'Szwecja20' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 681, 4, 30, 1, 'Szwecja21' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 682, 4, 30, 1, 'Szwecja22' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 683, 4, 30, 1, 'Szwecja23' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 684, 4, 30, 1, 'Szwecja3' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 685, 4, 30, 1, 'Szwecja4' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 686, 4, 30, 1, 'Szwecja5' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 687, 4, 30, 1, 'Szwecja6' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 688, 4, 30, 1, 'Szwecja7' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 689, 4, 30, 1, 'Szwecja8' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 690, 4, 30, 1, 'Szwecja9' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 691, 4, 31, 1, 'Tunezja1' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 692, 4, 31, 1, 'Tunezja10' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 693, 4, 31, 1, 'Tunezja11' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 694, 4, 31, 1, 'Tunezja12' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 695, 4, 31, 1, 'Tunezja13' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 696, 4, 31, 1, 'Tunezja14' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 697, 4, 31, 1, 'Tunezja15' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 698, 4, 31, 1, 'Tunezja16' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 699, 4, 31, 1, 'Tunezja17' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 700, 4, 31, 1, 'Tunezja18' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 701, 4, 31, 1, 'Tunezja19' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 702, 4, 31, 1, 'Tunezja2' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 703, 4, 31, 1, 'Tunezja20' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 704, 4, 31, 1, 'Tunezja21' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 705, 4, 31, 1, 'Tunezja22' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 706, 4, 31, 1, 'Tunezja23' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 707, 4, 31, 1, 'Tunezja3' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 708, 4, 31, 1, 'Tunezja4' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 709, 4, 31, 1, 'Tunezja5' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 710, 4, 31, 1, 'Tunezja6' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 711, 4, 31, 1, 'Tunezja7' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 712, 4, 31, 1, 'Tunezja8' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 713, 4, 31, 1, 'Tunezja9' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 714, 4, 32, 1, 'Urugwaj1' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 715, 4, 32, 1, 'Urugwaj10' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 716, 4, 32, 1, 'Urugwaj11' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 717, 4, 32, 1, 'Urugwaj12' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 718, 4, 32, 1, 'Urugwaj13' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 719, 4, 32, 1, 'Urugwaj14' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 720, 4, 32, 1, 'Urugwaj15' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 721, 4, 32, 1, 'Urugwaj16' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 722, 4, 32, 1, 'Urugwaj17' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 723, 4, 32, 1, 'Urugwaj18' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 724, 4, 32, 1, 'Urugwaj19' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 725, 4, 32, 1, 'Urugwaj2' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 726, 4, 32, 1, 'Urugwaj20' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 727, 4, 32, 1, 'Urugwaj21' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 728, 4, 32, 1, 'Urugwaj22' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 729, 4, 32, 1, 'Urugwaj23' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 730, 4, 32, 1, 'Urugwaj3' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 731, 4, 32, 1, 'Urugwaj4' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 732, 4, 32, 1, 'Urugwaj5' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 733, 4, 32, 1, 'Urugwaj6' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 734, 4, 32, 1, 'Urugwaj7' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 735, 4, 32, 1, 'Urugwaj8' );
INSERT INTO ZAWODNICY
  ( ID, pozycje_ID, team_ID, kluby_ID, nazwa )
  VALUES ( 736, 4, 32, 1, 'Urugwaj9' );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 1, 1, 26 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 2, 1, 2 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 3, 2, 9 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 4, 2, 32 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 5, 3, 18 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 6, 3, 12 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 7, 4, 25 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 8, 4, 11 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 9, 5, 10 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 10, 5, 4 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 11, 6, 23 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 12, 6, 8 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 13, 7, 3 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 14, 7, 13 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 15, 8, 7 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 16, 8, 21 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 17, 9, 17 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 18, 9, 28 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 19, 10, 6 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 20, 10, 29 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 21, 11, 20 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 22, 11, 19 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 23, 12, 30 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 24, 12, 16 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 25, 13, 5 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 26, 13, 22 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 27, 14, 31 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 28, 14, 1 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 29, 15, 26 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 30, 15, 9 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 31, 16, 15 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 32, 16, 14 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 33, 17, 24 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 34, 17, 27 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 35, 18, 32 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 36, 18, 2 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 37, 19, 25 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 38, 19, 18 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 39, 20, 12 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 40, 20, 11 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 41, 21, 10 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 42, 21, 23 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 43, 22, 8 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 44, 22, 4 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 45, 23, 3 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 46, 23, 7 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 47, 24, 21 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 48, 24, 13 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 49, 25, 6 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 50, 25, 17 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 51, 26, 28 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 52, 26, 29 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 53, 27, 20 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 54, 27, 30 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 55, 28, 16 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 56, 28, 19 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 57, 29, 5 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 58, 29, 31 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 59, 30, 1 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 60, 30, 22 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 61, 31, 14 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 62, 31, 27 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 63, 32, 24 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 64, 32, 15 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 65, 33, 32 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 66, 33, 26 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 67, 34, 2 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 68, 34, 9 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 69, 35, 12 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 70, 35, 25 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 71, 36, 11 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 72, 36, 18 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 73, 37, 8 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 74, 37, 10 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 75, 38, 4 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 76, 38, 23 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 77, 39, 21 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 78, 39, 3 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 79, 40, 13 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 80, 40, 7 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 81, 41, 28 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 82, 41, 6 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 83, 42, 29 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 84, 42, 17 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 85, 43, 16 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 86, 43, 20 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 87, 44, 19 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 88, 44, 30 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 89, 45, 1 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 90, 45, 5 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 91, 46, 22 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 92, 46, 31 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 93, 47, 14 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 94, 47, 24 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 95, 48, 27 );
INSERT INTO ROZGRYWKI
  ( ID, mecze_ID, team_ID )
  VALUES ( 96, 48, 15 );


-----------------------------------------------------KONIEC INSERTY -----------------
ALTER TABLE kluby
    ADD CONSTRAINT kluby_kraje_fk FOREIGN KEY ( kraje_id )
        REFERENCES kraje ( id )
    NOT DEFERRABLE;

ALTER TABLE mecze
    ADD CONSTRAINT mecze_sedziowie_fk FOREIGN KEY ( sedziowie_id )
        REFERENCES sedziowie ( id )
    NOT DEFERRABLE;

ALTER TABLE mecze
    ADD CONSTRAINT mecze_stadiony_fk FOREIGN KEY ( stadiony_id )
        REFERENCES stadiony ( id )
    NOT DEFERRABLE;

ALTER TABLE rozgrywki
    ADD CONSTRAINT rozgrywki_mecze_fk FOREIGN KEY ( mecze_id )
        REFERENCES mecze ( id )
    NOT DEFERRABLE;

ALTER TABLE rozgrywki
    ADD CONSTRAINT rozgrywki_team_fk FOREIGN KEY ( team_id )
        REFERENCES team ( id )
    NOT DEFERRABLE;

ALTER TABLE sedziowie
    ADD CONSTRAINT sedziowie_kraje_fk FOREIGN KEY ( kraje_id )
        REFERENCES kraje ( id )
    NOT DEFERRABLE;

ALTER TABLE sedziowie
    ADD CONSTRAINT sedziowie_strefy_fk FOREIGN KEY ( strefy_id )
        REFERENCES strefy ( id )
    NOT DEFERRABLE;

ALTER TABLE team
    ADD CONSTRAINT team_grupy_fk FOREIGN KEY ( grupy_id )
        REFERENCES grupy ( id )
    NOT DEFERRABLE;

ALTER TABLE team
    ADD CONSTRAINT team_strefy_fk FOREIGN KEY ( strefy_id )
        REFERENCES strefy ( id )
    NOT DEFERRABLE;

ALTER TABLE team
    ADD CONSTRAINT team_trenerzy_fk FOREIGN KEY ( trenerzy_id )
        REFERENCES trenerzy ( id )
    NOT DEFERRABLE;

ALTER TABLE wyniki_grup
    ADD CONSTRAINT wyniki_grup_team_fk FOREIGN KEY ( team_id )
        REFERENCES team ( id )
    NOT DEFERRABLE;

ALTER TABLE wyniki_puch
    ADD CONSTRAINT wyniki_puch_team_fk FOREIGN KEY ( team_id )
        REFERENCES team ( id )
    NOT DEFERRABLE;

ALTER TABLE zawodnicy
    ADD CONSTRAINT zawodnicy_kluby_fk FOREIGN KEY ( kluby_id )
        REFERENCES kluby ( id )
    NOT DEFERRABLE;

ALTER TABLE zawodnicy
    ADD CONSTRAINT zawodnicy_pozycje_fk FOREIGN KEY ( pozycje_id )
        REFERENCES pozycje ( id )
    NOT DEFERRABLE;

ALTER TABLE zawodnicy
    ADD CONSTRAINT zawodnicy_team_fk FOREIGN KEY ( team_id )
        REFERENCES team ( id )
    NOT DEFERRABLE;

ALTER TABLE zdarzenia
    ADD CONSTRAINT zdarzenia_mecze_fk FOREIGN KEY ( mecze_id )
        REFERENCES mecze ( id )
    NOT DEFERRABLE;

ALTER TABLE zdarzenia
    ADD CONSTRAINT zdarzenia_sytuacje_fk FOREIGN KEY ( sytuacje_id )
        REFERENCES sytuacje ( id )
    NOT DEFERRABLE;

ALTER TABLE zdarzenia
    ADD CONSTRAINT zdarzenia_zawodnicy_fk FOREIGN KEY ( zawodnicy_id )
        REFERENCES zawodnicy ( id )
    NOT DEFERRABLE;

CREATE OR REPLACE VIEW SZCZOKOLY_MECZU  AS
SELECT
    mecze.nazwa,
    mecze.data,
    mecze.godzina,
    mecze.etap,
    stadiony.nazwa AS stadion,
    stadiony.miasto,
    sedziowie.nazwa AS sedzia,
    zdarzenia.minuta,
    sytuacje.nazwa AS sytuacja,
    team.nazwa AS zespol,
    trenerzy.nazwa AS trener,
    grupy.nazwa AS grupa
FROM
    mecze,
    stadiony,
    sedziowie,
    zdarzenia,
    sytuacje,
    rozgrywki,
    team,
    trenerzy,
    grupy
WHERE
    stadiony.id = mecze.stadiony_id
    AND   sedziowie.id = mecze.sedziowie_id
    AND   mecze.id = zdarzenia.mecze_id
    AND   sytuacje.id = zdarzenia.sytuacje_id
    AND   mecze.id = rozgrywki.mecze_id
    AND   team.id = rozgrywki.team_id
    AND   trenerzy.id = team.trenerzy_id
    AND   grupy.id = team.grupy_id
GROUP BY
    mecze.nazwa,
    mecze.data,
    mecze.godzina,
    mecze.etap,
    stadiony.nazwa,
    stadiony.miasto,
    sedziowie.nazwa,
    zdarzenia.minuta,
    sytuacje.nazwa,
    team.nazwa,
    trenerzy.nazwa,
    grupy.nazwa 
;
