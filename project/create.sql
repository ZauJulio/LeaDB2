DROP TABLE IF EXISTS message;

DROP TABLE IF EXISTS member;

DROP TABLE IF EXISTS room;

DROP TABLE IF EXISTS userr;


BEGIN;

  CREATE TABLE room(
    id NUMERIC PRIMARY KEY NOT NULL,
    name VARCHAR [16] NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    closed_at TIMESTAMP DEFAULT NULL,
    fk_user_id NUMERIC NOT NULL
  );

  CREATE TABLE message(
    id NUMERIC PRIMARY KEY NOT NULL,
    content VARCHAR [254] NOT NULL,
    sended_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    fk_user_id NUMERIC NOT NULL,
    fk_room_id NUMERIC NOT NULL
  );

  CREATE TABLE userr(
    id NUMERIC PRIMARY KEY NOT NULL,
    name VARCHAR [16] NOT NULL,
    banned BOOLEAN NOT NULL DEFAULT FALSE,
    email VARCHAR NOT NULL
  );

  CREATE TABLE member(
    id NUMERIC PRIMARY KEY NOT NULL,
    fk_user_id NUMERIC NOT NULL,
    fk_room_id NUMERIC NOT NULL
  );

COMMIT;

BEGIN;

  ALTER TABLE
    room
  ADD
    CONSTRAINT FK_room_user FOREIGN KEY (fk_user_id) REFERENCES userr(id);

  ALTER TABLE
    message
  ADD
    CONSTRAINT FK_message_user FOREIGN KEY (fk_user_id) REFERENCES userr(id);

  ALTER TABLE
    message
  ADD
    CONSTRAINT FK_message_room FOREIGN KEY (fk_room_id) REFERENCES room(id);

  ALTER TABLE
    member
  ADD
    CONSTRAINT FK_member_room FOREIGN KEY (fk_room_id) REFERENCES room(id) ON DELETE RESTRICT;

  ALTER TABLE
    member
  ADD
    CONSTRAINT FK_member_userr FOREIGN KEY (fk_user_id) REFERENCES userr(id) ON DELETE RESTRICT;

COMMIT;