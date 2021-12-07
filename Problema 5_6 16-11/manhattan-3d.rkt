;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname manhattan-3d) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(define manhattan
    (lambda (x y)
        (cond
            ((= x 0) (+ x 1))
            ((= y 0) (+ y 1))
            (
                (and (> x 0) (> y 0))
                (+
                    (manhattan (- x 1) y)
                    (manhattan x (- y 1))
                )
            )
        )
    )
)

(define manhattan-3d
    (lambda (x y z)
        (cond
            ((= x 0) (manhattan y z))
            ((= y 0) (manhattan x z))
            ((= z 0) (manhattan x y))
            (
                (and (> x 0) (> y 0) (> z 0))
                (+
                    (manhattan-3d (- x 1) y z)
                    (manhattan-3d x (- y 1) z)
                    (manhattan-3d x y (- z 1))
                )
            )
        )
    )
)