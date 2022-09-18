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


(define multiinsertR
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      (else
	(cond
	  ((eq? (car lat) old) (cons (car lat) (cons new (multiinsertR new old (cdr lat)))))
	  (else
	    (cons (car lat) (multiinsertR new old (cdr lat)))))))))


(define multiinsertL
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      (else
	(cond
	  ((eq? (car lat) old) (cons new (cons (car lat) (multiinsertL new old (cdr lat)))))
	  (else
	    (cons (car lat) (multiinsertL new old (cdr lat)))))))))

(define multisubst
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      (else
	(cond
	  ((eq? (car lat) old) (cons new (multisubst new old (cdr lat))))
	  (else
	    (cons (car lat) (multisubst new old (cdr lat)))))))))

(define add1
    (lambda (x)
      (+ x 1)))

(define sub1                                                                                                              
   (lambda (x)                                                                                                               
     (- x 1)))

(define add                                                                                                               
  (lambda (x y)                                                                                                             
    (cond                                                                                                                     
      ((zero? y) x)                                                                                                           
      (else                                                                                                                    
	(add1 (add (x (sub1 y))))))))

(define sub
  (lambda (x y)
    (cond
      ((zero? y) x)
      (else
	(sub1 (sub x (sub1 y)))))))

(define multi
  (lambda (x y)
    (cond
      ((or (zero? y) (zero? x) ) 0)
      (else
	(add x (multi x (sub1 y)))))))

(define addup 
  (lambda (lat)
    (cond
      ((null? lat) 0)
      (else
	(add (car lat) (addup (cdr lat)))))))

(define tup+
  (lambda (lat lat2)
    (cond
      ((null? lat) lat2)
      ((null? lat2) lat1)
      (else
	(cons (add (car lat) (car lat2)) (tup+ (cdr lat) (cdr lat2)))))))


(define >> 
  (lambda(a b)
    (cond
      ((zero? a) #f)
      ((zero? b) #t)
      (else
	(>>(sub1 a) (sub1 b))))))

(define << 
  (lambda(a b)
    (cond
      ((zero? b) #f)
      ((zero? a) #t)
      (else
	(<<(sub1 a) (sub1 b))))))

(define ===
  (lambda (a b)
    (cond
	((or (>> a b) (<< a b)) #f)
      (else #t))))

(define ^
  (lambda(a b)
    (cond
      ((zero? b) 1)
      (else 
	(* a (^ a (sub1 b)))))))

(define ???
  (lambda (a b)
    (cond
      ((< n m) 0)
      (else
	(add1 (??? (- n m) m))))))

(define lng
  (lambda (lat)
    (cond
      ((null? lat) 0)
      (else
	(add1 (lng (cdr lat)))))))

(define pick
  (lambda (n lat)
    (cond
      ((zero? (sub1 n)) (car lat))
      (else
	(pick (sub1 n) (cdr lat))))))

(define pick2
  (lambda (n lat)
    (cond
      ((=== 1 n) (car lat))
      ((zero? n) '())
      ((null? lat) '())
      (else
	(pick (sub1 n) (cdr lat))))))

(define no-nums
  (lambda (lat)
    (cond
      ((null? lat) '())
      ((number? (car lat)) (no-nums (cdr lat)))
	(else
	  (cons (car lat) (no-nums (cdr lat)))))))

(define all-nums
  (lambda (lat)
    (cond
      ((null? lat) '())
      (else
	(cond
	  ((number? (car lat)) (cons (car lat) (all-nums (cdr lat))))
	  (else
	    (all-nums (cdr lat))))))))

(define equan? 
  (lambda (a b)
    (cond
      ((and (number? a) (number? b)) (= a b))
      ((or (number? a) (number? b)) #f)
      (else
	(eq? a b)))))

(define occur
  (lambda (n lat)
    (cond
      ((null? lat) 0)
      (else
	(cond
	  ((eq? (car lat) n) (add1 (occur n (cdr lat))))
	  (else
	    (occur n (cdr lat))))))))

(define one? 
  (lambda (n)
    (cond
      ((number? n) (= 1 n))
      (else #f))))
