(define multiinsertR
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      (else
	(cond
	  ((eq? (cat lat) old) (cons (car lat) (cons new (multiinsertR new old (cdr lat)))))
	  (else
	    (cons (car lat) (multiinsertR new old (cdr lat)))))))))

