(define tup+
  (lambda (lat lat2)
    (cond
      ((null? lat) lat2)
      ((null? lat2) lat1)
      (else
	(cons (add (car lat) (car lat2)) (tup+ (cdr lat) (cdr lat2)))))))


