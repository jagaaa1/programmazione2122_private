;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname liste) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.ss" "installed-teachpacks")) #f)))

; verifica se x è prensente in una lista
(define belong?
	(lambda (x list)
		(cond
			((null? list) false)
			((equal? x (car list)) true)
			(else (belong? x (cdr list)))
		)
	)
)

; restituisce la posizione di x in una lista
(define position
	(lambda (x list)
		(if (belong? x list)
			(if (equal? x (car list))
				0
				(+ (position x (cdr list)) 1)
			)
			"Non è presente nella lista"
		)
	)
)

; inserisci x in una lista ordinata e senza ripetizioni
(define sorted-ins
	(lambda (x o-list)
		(cond
			(
				(null? o-list)
				(list x)
			)
			((belong? x o-list) o-list)
			(
				(< x (car o-list))
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