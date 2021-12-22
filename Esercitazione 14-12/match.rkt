;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname match) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(define match
	(lambda (u v)
		(if (or (string=? u "") (string=? v ""))
			""
			(let
				(
					(uh (string-ref u 0))
					(vh (string-ref v 0))
					(s (match (substring u 1) (substring v 1)))
				)
				(if (char=? uh vh)
					(string-append (string uh) s)
					(string-append "*" s)
				)
			)
		)
	)
)