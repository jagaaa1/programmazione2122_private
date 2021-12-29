;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname closest) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(define closest-pair
	(lambda (o-list)
		(cdar (lowest (difference o-list)))
	)
)

(define difference
	(lambda (o-list)
		(if (= 2 (length o-list))
			(cons (list (- (cadr o-list) (car o-list)) (car o-list) (cadr o-list)) null)
			(cons (list (- (cadr o-list) (car o-list)) (car o-list) (cadr o-list)) (difference (cdr o-list)))
		)
	)
)

(define lowest
	(lambda (lst)
		(cond
			((= 1 (length lst)) lst)
			((> (caar lst) (caadr lst)) (lowest (cdr lst)))
			(else
				(lowest (cons (car lst) (cddr lst)))
			)
		)
	)
)
