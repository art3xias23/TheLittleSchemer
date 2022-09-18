(define occur
  (lambda (n lat)
    (cond
      ((null? lat) 0)
      (else
	(cond
	  ((eq? (car lat) n) (add1 (occur n (cdr lat))))
	  (else
	    (occur n (cdr lat))))))))
