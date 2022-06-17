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

(define next-move
	(lambda (current move)
		(cond
			((= 1 (car move))
				(cond
					((= 2 (cadr move)) (list (list 1 (- (cadr (list-ref current 0)) 1)) (list 2 (+ (cadr (list-ref current 1)) 1)) (list-ref current 2)))
					((= 3 (cadr move)) (list (list 1 (- (cadr (list-ref current 0)) 1)) (list-ref current 1) (list 3 (+ (cadr (list-ref current 2)) 1))))
				)
			)
			((= 2 (car move))
				(cond
					((= 1 (cadr move)) (list (list 1 (+ (cadr (list-ref current 0)) 1)) (list 2 (- (cadr (list-ref current 1)) 1)) (list-ref current 2)))
					((= 3 (cadr move)) (list (list-ref current 0) (list 2 (- (cadr (list-ref current 1)) 1)) (list 3 (+ (cadr (list-ref current 2)) 1))))
				)
			)
			((= 3 (car move))
				(cond
					((= 1 (cadr move)) (list (list 1 (+ (cadr (list-ref current 0)) 1)) (list-ref current 1) (list 3 (- (cadr (list-ref current 2)) 1))))
					((= 2 (cadr move)) (list (list-ref current 0) (list 2 (+ (cadr (list-ref current 1)) 1)) (list 3 (- (cadr (list-ref current 2)) 1))))
				)
			)
			
			
		)
	)
)

(define hanoi-disks
	(lambda (n k)
		(if (= k 0)
			(list (list 1 n) (list 2 0) (list 3 0))
			(next-move (hanoi-disks n (- k 1)) (list-ref (hanoi-moves n) (- k 1)))
		)
	)
)