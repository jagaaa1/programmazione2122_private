;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname sorted-char-list) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(define char-list
	(lambda (str)
		(if (= 0 (string-length str))
			null
			(cons (string-ref str 0) (char-list (substring str 1))
			)		
		)
	)
)

(define sorted-ins
	(lambda (x o-list)
		(cond
			(
				(null? o-list)
				(list x)
			)
			(
				(char<=? x (car o-list))
				(cons x o-list)
			)
			(else
				(cons (car o-list) (sorted-ins x (cdr o-list)))
			)
		)
	)
)

; ordina una lista senza ripetizioni
(define sorted-list
	(lambda (nonRep-list)
		(if (= (length nonRep-list) 1)
			 nonRep-list
			; se len > 1 ricorsione con sorted-ins di car nel sorted-list di cdr
			(sorted-ins (car nonRep-list) (sorted-list (cdr nonRep-list)))
		)	
	)
)

(define sorted-char-list
	(lambda (str)
		(sorted-list (char-list str))
	)
)