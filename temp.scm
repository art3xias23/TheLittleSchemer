(define eqlist?
  (lambda (l1 l2)
    (cond
      ((and (null? l1) (null? l2)) #t)
      ((and (null? l1) (atom? (car l2))) #f)
      ((null? l1) #f)
       ((null? l2) #f)
      ((and (atom? l1) (null? l2)) #f)
      ((and (atom? (car l1)) (atom? (car l2)))
       (and (equan? (car l1)) (equan? (car l2))
	   (and (eqlist? (cdr l1)) (eqlist? (cdr l2)))))
       ((atom? (car l1)) #f)
       ((atom? (car l2)) #f)
       (else
	 (and (eqlist? (car l1) (car l2)) (eqlist? (cdr l1) (cdr l2)))))))

(define rewriteEqlist?
  (lambda (l1 l2)
    (cond
      ((and (null? l1) (null? l2)) #t)
      ((or (null? l1) (null? l2)) #f)
      ((and (null? l1) (atom? (car l2))) #f)
      ((and (atom? l1) (null? l2)) #f)
      ((and (atom? (car l1)) (atom? (car l2)))
       (and (equan? (car l1)) (equan? (car l2))
	   (and (eqlist? (cdr l1)) (eqlist? (cdr l2)))))
      ((or (atom? l1) (atom? l2)) #f)
       (else
	 (and (eqlist? (car l1) (car l2)) (eqlist? (cdr l1) (cdr l2)))))))



!1. Ask if both are null
!2. Ask if l1 is null and l2 is atom
3. Ask if l2 is null
4. Ask if l1 is atom and l2 is null
5. Ask if both (car l1) and (car l2) are atoms 
	5.1 if equan (car l1) and (car l2), ask eqlist
6. Ask if (car l1) is atom = false
7. Ask if l2 is null?
8. Ask if atom car l2? 



!1. l1 = null, l2 = null
!2. l1 = null, l2 = atom 
!3. l1 = null, l2 = list 
!4. l1 = atom, l2 = null
!5. l1 = atom, l2 = atom 
!6. l1 = atom, l2 = list 
!7. l1 = list, l2 = null
!8. l1 = list, l2 = atom 
9. l1 = list, l2 = list 

((potato) (chips ((with) fish) (chips)))

In order to compare 2 lists. We need to ask 9 questions
Either of the list can be 
 - null
 - atom consed onto a list
 - list consed onto a list

