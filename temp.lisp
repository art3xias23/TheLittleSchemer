(define subs2
  (lambda (new old1 old2 lat)
    (cond
      ((null? lat) '())
      (else
	(cond
	  ((or (eq? (car lat) old1) 
	  (eq? (car lat) old2)) (cons new (cdr lat)))
	  (else
	    (cons (car lat) (subs2 new old1 old2 (cdr lat)))))))))
