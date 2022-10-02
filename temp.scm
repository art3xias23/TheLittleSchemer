(define set?
  (lambda (lat)
    (cond
      ((null? lat) #t)
      ((member? (car l) (cdr l)) #f)
      (else
	(set (cdr lat))))))

(define makeset
  (lambda (lat)
    (cond 
      ((null? lat) '())
      ((member? (car lat) (cdr lat)) (makeset (cdr lat)))
      (else
	(cons (car lat) (makeset (cdr lat)))))))

    '(apple peach pear peach plum apple lemon peach)
