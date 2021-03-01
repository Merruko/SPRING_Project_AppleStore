CREATE TABLE a_users(
    id VARCHAR2(8) PRIMARY KEY,
    password VARCHAR2(8),
    name VARCHAR2(20),
    joindate DATE DEFAULT SYSDATE
);

CREATE TABLE a_booking(
    seq NUMBER(5) PRIMARY KEY,
    goods VARCHAR2(100),
    quantity NUMBER(3),
    name VARCHAR2(20),
    contact VARCHAR2(50),
    email VARCHAR2(100),
    regdate DATE DEFAULT SYSDATE
);

CREATE TABLE a_event(
    seq NUMBER(5) PRIMARY KEY,
    title VARCHAR2(100),
    writer VARCHAR2(20),
    content VARCHAR2(2000),
    filename VARCHAR2(100),
    regdate DATE DEFAULT SYSDATE
);

CREATE TABLE a_goods(
    gid VARCHAR2(100),
    gname VARCHAR2(200),
    price NUMBER(20),
    info VARCHAR2(2000),
    quantity NUMBER(3),
    filename VARCHAR2(100),
    category VARCHAR2(100)
);

INSERT INTO a_users(id, password, name, joindate) VALUES ('kdh9427', '03190216', '관리자', SYSDATE);
INSERT INTO a_event(seq, title, writer, content, filename, regdate) VALUES (1,'이벤트1','관리자','이벤트1','airPod.jpeg',SYSDATE);
INSERT INTO a_goods(gid, gname, price, info, filename, category) VALUES ('A2270','iPad',449000,'32GB, 490g, Retina 디스플레이, A12 Bionic 칩, 8MP 카메라, Wi-Fi + Cellular 모델, iPadOS 14','A2270','Tablet PC');
INSERT INTO a_goods(gid, gname, price, info, filename, category) VALUES ('A5767','Apple Watch Series 6',539000,'40mm, GPS/GNSS, 30.5g, 50미터방수, 32GB, Retina LTPO OLED','A5767','Watch');
INSERT INTO a_goods(gid, gname, price, info, filename, category) VALUES ('A2337','MacBook Air',1290000,'Retina 디스플레이, 13.3형(대각선) LED, Apple M1 칩, 8GB/256GB, Touch ID 센서, 720p FaceTime HD 카메라','A2337','NoteBook');
INSERT INTO a_goods(gid, gname, price, info, filename, category) VALUES ('A2403','iPhone12',1349000,'64GB, 무게: 162g, Super Retina XDR, 6.1형(대각선) 전면 화면 OLED 디스플레이, A14 Bionic 칩, 듀얼 12MP 카메라','A2403','Smart Phone');
INSERT INTO a_goods(gid, gname, price, info, filename, category) VALUES ('A1290','AirPods Pro',329000,'액티브 노이즈 캔슬링, 적응형 EQ, 듀얼 빔포밍 마이크, H1 기반 SiP(System in Package) 설계, Bluetooth 5.0, 음악 감상 24시간 이상','A1290','Earphone');

COMMIT;