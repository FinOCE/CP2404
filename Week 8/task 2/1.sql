CREATE TABLE EMP_1 (
	EMP_NUM			VARCHAR(3) PRIMARY KEY,
    EMP_LNAME		VARCHAR(15) NOT NULL,
    EMP_FNAME		VARCHAR(15) NOT NULL,
    EMP_INITIAL		VARCHAR(1),
    EMP_HIREDATE	DATE,
    JOB_CODE		VARCHAR(3),
    FOREIGN KEY (JOB_CODE) REFERENCES JOB(JOB_CODE)
);