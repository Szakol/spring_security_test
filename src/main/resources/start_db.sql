CREATE USER MY_USER IDENTIFIED BY "MyPassword";
GRANT CONNECT, CREATE TABLE, CREATE TRIGGER TO MY_USER;
GRANT RESOURCE TO MY_USER;

CREATE TABLE my_user.application_user
(
    id         NUMBER(38, 0) NOT NULL,
    first_name VARCHAR2(255),
    last_name  VARCHAR2(255),
    email      VARCHAR2(255),
    password   VARCHAR2(255),
    CONSTRAINT pk_application_user PRIMARY KEY (id)
);
CREATE TABLE my_user.user_role
(
    id          NUMBER(38, 0) NOT NULL,
    name        VARCHAR2(255),
    description VARCHAR2(255),
    CONSTRAINT pk_user_role PRIMARY KEY (id)
);
CREATE TABLE my_user.user_roles
(
    role_id NUMBER(38, 0) NOT NULL,
    user_id NUMBER(38, 0) NOT NULL,
    CONSTRAINT pk_user_roles PRIMARY KEY (role_id, user_id)
);

ALTER TABLE my_user.user_roles
    ADD CONSTRAINT fk_userol_on_user FOREIGN KEY (user_id) REFERENCES my_user.application_user (id);

ALTER TABLE my_user.user_roles
    ADD CONSTRAINT fk_userol_on_user_role FOREIGN KEY (role_id) REFERENCES my_user.user_role (id);

