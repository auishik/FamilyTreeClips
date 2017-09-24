(defrule test-grand-children
	(grand-child-relation (parent Elizabeth) (child ?child))
	=>
	(printout t "Elizabeth's grand child is " ?child crlf)
)

(defrule test-brother-in-law
	(brother-in-law-relation (brother ?brother) (sibling Diana))
	=>
	(printout t "Diana's brother in law is " ?brother crlf)
)

(defrule test-great-grand-children
	(great-grand-child-relation  (parent ?parent) (child Zara))
	=>
	(printout t "Zara's great grand parent is " ?parent crlf)
)