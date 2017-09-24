(deftemplate person "An individual in the family tree"
	(slot name)
	(slot gender)
)

(deftemplate marriage-relation "Pairs of marriages in the family tree"
	(slot husband)
	(slot wife)
)

(deftemplate child-relation "Child relations"
	(slot father)
	(slot mother)
	(slot child)
)

(deftemplate grand-child-relation "Grand Child relations"
	(slot parent)
	(slot child)
)

(deftemplate great-grand-child-relation  "Great Grand Child relations"
	(slot parent)
	(slot child)
)

(deftemplate brother-relation  "Brother relations"
	(slot brother)
	(slot sibling)
)

(deftemplate sister-relation  "Sister relations"
	(slot sister)
	(slot sibling)
)

(deftemplate daughter-relation  "Daughter relations"
	(slot daughter)
	(slot father)
	(slot mother)
)

(deftemplate son-relation  "Son relations"
	(slot son)
	(slot father)
	(slot mother)
)

(deftemplate uncle-relation  "Uncle relations"
	(slot uncle)
	(slot nephew)
)

(deftemplate aunt-relation  "Aunt relations"
	(slot aunt)
	(slot nephew)
)

(deftemplate sister-in-law-relation  "Sister in law relations"
	(slot sister)
	(slot sibling)
)

(deftemplate brother-in-law-relation  "Brother in law relations"
	(slot brother)
	(slot sibling)
)

(deftemplate first-cousin-relation  "First Cousin relations"
	(slot cousin)
	(slot sibling)
)

(deffacts family-tree "Family Tree"
	
	; All the persons
	
	(person (name George) (gender male))
	(person (name Mum) (gender female))
	(person (name Spencer) (gender male))
	(person (name Kydd) (gender female))
	(person (name Elizabeth) (gender female))
	(person (name Philip) (gender male))
	(person (name Margaret) (gender female))
	(person (name Diana) (gender female))
	(person (name Charles) (gender male))
	(person (name Anne) (gender female))
	(person (name Mark) (gender male))
	(person (name Andrew) (gender male))
	(person (name Sarah) (gender female))
	(person (name Edward) (gender male))
	(person (name William) (gender male))
	(person (name Harry) (gender male))
	(person (name Peter) (gender male))
	(person (name Zara) (gender female))
	(person (name Beatrice) (gender female))
	(person (name Eugenie) (gender female))
	
	;All the marriage relations
	
	(marriage-relation (husband George) (wife Mum))
	(marriage-relation (husband Spencer) (wife Kydd))
	(marriage-relation (husband Philip) (wife Elizabeth))
	(marriage-relation (husband Charles) (wife Diana))
	(marriage-relation (husband Mark) (wife Anne))
	(marriage-relation (husband Andrew) (wife Sarah))
	
	;All the child relations
	
	(child-relation (father George) (mother Mum) (child Elizabeth))
	(child-relation (father George) (mother Mum) (child Margaret))
	(child-relation (father Spencer) (mother Kydd) (child Diana))
	(child-relation (father Philip) (mother Elizabeth) (child Charles))
	(child-relation (father Philip) (mother Elizabeth) (child Anne))
	(child-relation (father Philip) (mother Elizabeth) (child Andrew))
	(child-relation (father Philip) (mother Elizabeth) (child Edward))
	(child-relation (father Charles) (mother Diana) (child William))
	(child-relation (father Charles) (mother Diana) (child Harry))
	(child-relation (father Mark) (mother Anne) (child Peter))
	(child-relation (father Mark) (mother Anne) (child Zara))
	(child-relation (father Andrew) (mother Sarah) (child Beatrice))
	(child-relation (father Andrew) (mother Sarah) (child Eugenie))
)