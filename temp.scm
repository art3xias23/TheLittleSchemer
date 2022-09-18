(define rempick-one
  (lambda (n lat)
    (cond
      ((null? lat) '())
      (else
	(cond
      	  ((one? n) (rempick-one(cdr lat))
	  (else
	    (cons (car lat) (rempick-one (sub1 n) (cdr lat)))))))))

