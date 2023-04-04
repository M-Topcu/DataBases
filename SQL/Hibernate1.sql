SELECT s.student_name, d.name FROM student04 s  inner join diary2 d on s.id=std_id;

SELECT s.student_name, d.name FROM student04 s  LEFT join diary2 d on s.id=std_id;

SELECT s.student_name, d.name FROM student04 s  RIGHT join diary2 d on s.id=std_id;