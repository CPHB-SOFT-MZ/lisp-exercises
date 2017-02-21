
;;
;; Preamble: Lisp prerequisits
;;

;; These two lines sets the number of binary digits used to represent a float
;; in Lisp. This is necessary because you'll be working with tiny numbers
;; TL;DR ignore these two lines
(setf (EXT:LONG-FLOAT-DIGITS) 35000)
(setf *read-default-float-format* 'long-float)

;; This method rounds a number to a certain precision
;; It takes two arguments: the number to round and the number of digits to
;; round in decimals
;;
;; Example: (roundToPrecision 10.0044 3) -> 10.004
(defun roundToPrecision (number precision)
  (let
    ((p (expt 10 precision)))
    (/ (round (* number p)) p)
  )
)

;;
;; Exercise
;;

;; Exercise
;; Your task is to implement the Gauss-Legendre algorithm for calculating pi
;; and extract 10.000 (ten thousand) digits
;; The reason you need the rounding function above is because you're not
;; interested in more than 10.000 digits. So every time you get a result with
;; the Gauss-Legendre algorithm, you should round it to 10.000.
;; You know you are done when your previously calculated pi value is equal to
;; the next pi value you get -- then the precision within 10.000 digits cannot
;; get any better.

;; Gauss-Legendre algorithm on Wikipedia
;; https://en.wikipedia.org/wiki/Gauss%E2%80%93Legendre_algorithm

(setf a 1L0)
(setf b (/ 1L0 (sqrt 2L0)))
(setf tt (/ 1L0 4L0))
(setf p 1L0)
(setf peepee 1L0)
(setf pie 1L0)

(defun Piep()
  (pip a b tt p pie)
)

(defun nextA (pA pB)
  (/(+ pA pB) 2)
)

(defun nextB (pA pB)
  (sqrt (* pA pB))
)

(defun nextTT (pT pP pA nA)
  (- pT (expt (* pP (- pA nA)) 2))
)

(defun nextP (pP)
  (* 2 pP)
)

(defun pip (nA nB nT nP pie)
  (if (> nP 1)
    ;;(write (roundToPrecision pie 10000)
    (write pie)
  )
  (setf pie
    ( / (expt(+ nA nB) 2) (* 4 nT) )
  )
  (setf peepee p)
  (setf p (nextP nP))
  (pip (nextA nA nB) (nextB nA nB) (nextTT nT peepee nA (nextA nA nB)) peepee pie)
)

(pip a b tt p pie)
;;(write(pip a b tt p pie))
