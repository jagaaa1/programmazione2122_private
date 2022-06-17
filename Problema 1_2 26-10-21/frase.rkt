;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname frase) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(define lett-finale
	(lambda (nome)
		(substring nome (- (string-length nome) 1))
	)
)

(define articolo
	(lambda (nome)
		(cond
			((string=? (lett-finale nome) "o") (string-append "il " nome))
			((string=? (lett-finale nome) "a") (string-append "la " nome))
			((string=? (lett-finale nome) "i") (string-append "i " nome))
			((string=? (lett-finale nome) "e") (string-append "le " nome))
		)
	)
)

(define plurale?
    (lambda (nome)
        (if
				(or 
					(string=? (lett-finale nome) "e") 
					(string=? (lett-finale nome) "i")
				)
				true
				false
		  )
    )
)

(define declina
	(lambda (verbo soggetto)
		(if (plurale? soggetto)
			(if (string=? "are" (substring verbo (- (string-length verbo) 3)))
				(string-append 
					(substring verbo 0 (-(string-length verbo) 3)) 
					"ano "
				)
				(string-append 
					(substring verbo 0 (-(string-length verbo) 3)) 
					"ono "
				)
			)
			(if (string=? "are" (substring verbo (- (string-length verbo) 3)))
				(string-append 
					(substring verbo 0 (-(string-length verbo) 3)) 
					"a "
				)
				(string-append 
					(substring verbo 0 (-(string-length verbo) 3)) 
					"e "
				)
			)
		)
	)
)

(define frase
	(lambda (soggetto verbo complemento)
		(string-append 
			(articolo soggetto)
			" "
			(declina verbo soggetto)
			(articolo complemento)
		)
	)
)
