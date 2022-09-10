(define atom?
	(lambda(x)
		(and (not (pair? x)) (not (null? x)))))

(define lat?
	(lambda(x)
		(cond
			((null? x) #t)
			((atom? (car x)) (lat? (cdr x)))
			(else #f))))
			
(define member?
	(lambda(a lat)
		(cond
			((null? lat) #f)
			(else (or (eq? (car lat) a) 
				(member? a (cdr lat)))))))


(define rember?
  (lambda (a lat)
    (cond 
      ((null? lat) '())
      (else
        (cond 
                ((eq? a (car lat)) (cdr lat))
                (else (cons (car lat)  (rember? a (cdr lat)))))))))


(define firsts
  (lambda (lat)
    (cond
      ((null? lat) '())
      (else
        (cons (car (car lat)) (firsts(cdr lat)))))))
		
(define? insertR
         (lambda (new old lat)
           (cond
             ((null? lat) '())
           (else
             (cond
               ((eq? old (car lat)) (cons old (cons new (cdr lat))))
               (else
                 (cons (car lat) (insertRI new old (cdr lat)))))))))


(define insertL
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      (else
	(cond
	  ((eq? (car lat) old) (cons new lat))
	  (else
	    (cons (car lat) (insertL new old (cdr lat)))))))))

(define subs
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      (else
	(cond
	  ((eq? (car lat) old) (cons new (cdr lat)))
	  (else
	    (cons (car lat) (subs new old (cdr lat)))))))))

(define subs2
  (lambda (new o1 o2 lat)
    (cond
    ((null? lat) '())
    (else
      (cond
	((or (eq? (car lat) o1) (eq? (car lat) o2)) (cons new (cdr lat)))
	(else
	  (cons (car lat) (subs2 new o1 o2 (cdr lat)))))))))


(define multirember
  (lambda (x lat)
    (cond
      ((null? lat) '())
      (else
	(cond
      	((eq? (car lat) x) (multirember x (cdr lat)))
	(else
	  (cons (car lat) (multirember x (cdr lat) ))))))))
