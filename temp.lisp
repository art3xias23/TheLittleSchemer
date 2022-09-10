(define multirember
  (lambda (x lat)
    (cond
      ((null? lat) '())
      (else
	(cond
      	((eq? (car lat) x) (multirember x (cdr lat)))
	(else
	  (cons (car lat) (multirember x (cdr lat) ))))))))
