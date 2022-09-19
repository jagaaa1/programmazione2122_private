;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname hanoi) (read-case-sensitive #t) (teachpacks ((lib "drawings.ss" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.ss" "installed-teachpacks")) #f)))

(define hanoi-moves
	(lambda (n)
		(hanoi-rec n 1 2 3)
	)
)

(define hanoi-rec
	(lambda (n s d t)
		(if (= n 1)
			(list (list s d))
			(let
				(
					(m1 (hanoi-rec (- n 1) s t d))
					(m2 (hanoi-rec (- n 1) t d s))
				)
				(append m1 (cons (list s d) m2))
			)
		)
	)
)

(define hanoi-disks 
 (lambda (n k)      
  (hanoi-disks-rec n k '(1 0) '(2 0) '(3 0) n)
  )
 )

(define hanoi-disks-rec    
 (lambda (n k s d t disks) 
  (let
   (
    (l (expt 2 (- n 1)))
    (h (+ (cadr s) (cadr d) (cadr t)))
    )
    (cond
      ((= h disks) (list s d t))
      ((< k l) (hanoi-disks-rec (- n 1) k (list (car s) (+ (cadr s) 1)) t d disks))
      (else (hanoi-disks-rec (- n 1) (- k l) t (list (car d) (+ (cadr d) 1)) s disks))
      )
   )
  )
 )

(define hanoi-picture 
 (lambda (n k)     
  (hanoi-picture-rec n k '(1 0) '(2 0) '(3 0) n (towers-background n))
  )
 )

(define hanoi-picture-rec         
 (lambda (n k s d t disks state) 
  (let
   (
    (l (expt 2 (- n 1)))
    (h (+ (cadr s) (cadr d) (cadr t)))
    )
    (cond
      ((= h disks) state)
      ((< k l) (hanoi-picture-rec (- n 1) k (list (car s) (+ (cadr s) 1) ) t d disks (above (disk-image n disks (car s) (cadr s))  state)))
      (else (hanoi-picture-rec   (- n 1) (- k l) t (list (car d) (+ (cadr d) 1 ) ) s disks (above (disk-image n disks (car d) (cadr d)) state)))
      )
   )
  )
 )