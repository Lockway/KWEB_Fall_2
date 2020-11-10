CREATE TABLE users (
    i INT NOT NULL AUTO_INCREMENT,
	id INT NOT NULL,
    pw varchar(20) NOT NULL,
    nickname varchar(20) NOT NULL,
    imglink varchar(80),
    statemsg varchar(80),
    dropout TINYINT NOT NULL DEFAULT 0,
    regdate DATETIME NOT NULL,

    PRIMARY KEY(i)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE channels (
    i INT NOT NULL AUTO_INCREMENT,
	cname varchar(20) NOT NULL,
    user INT NOT NULL,
    link varchar(80) NOT NULL,
    num INT NOT NULL,
    dropout TINYINT NOT NULL DEFAULT 0,
    gendate DATETIME NOT NULL,

    PRIMARY KEY(i),

    FOREIGN KEY(user)
    REFERENCES users(i) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE chats (
	content varchar(80) NOT NULL,
    writer INT NOT NULL,
    channel INT NOT NULL,
    chatdate DATETIME NOT NULL,

    FOREIGN KEY(writer)
    REFERENCES users(i) ON DELETE CASCADE,

    FOREIGN KEY(channel)
    REFERENCES channels(i) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE blocks (
	doinguser INT NOT NULL,
    doneuser INT NOT NULL,
    blockdate DATETIME NOT NULL,

    FOREIGN KEY(doinguser)
    REFERENCES users(i) ON DELETE CASCADE,
    FOREIGN KEY(doneuser)
    REFERENCES users(i) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE follows (
	follower INT NOT NULL,
    followee INT NOT NULL,
    fdate DATETIME NOT NULL,

    FOREIGN KEY(follower)
    REFERENCES users(i) ON DELETE CASCADE,
    FOREIGN KEY(followee)
    REFERENCES users(i) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;