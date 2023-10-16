DROP TABLE IF EXISTS emp_bonus;

CREATE TABLE emp_bonus (
  empno decimal default NULL,
  received date default NULL,
  type integer default NULL
);

INSERT INTO emp_bonus VALUES ('7369','14-MAR-2005',1);
INSERT INTO emp_bonus VALUES ('7900','14-MAR-2005',2);
INSERT INTO emp_bonus VALUES ('7788','14-MAR-2005',3);
