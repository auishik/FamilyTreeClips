(defrule grand-child
	(child-relation (father ?father) (mother ?mother) (child ?child))
	(person (name ?name))
	(child-relation (father ?name|?child) (mother ?name|?child) (child ?grand))
	=>
	(printout t ?grand " grand child of " ?father " and " ?mother crlf)
	(assert (grand-child-relation (parent ?father) (child ?grand)))
	(assert (grand-child-relation (parent ?mother) (child ?grand)))
)

(defrule great-grand-parent
	(child-relation (father ?father) (mother ?mother) (child ?child))
	(person (name ?name))
	(child-relation (father ?child|?name) (mother ?child|?name) (child ?grand))
	(person (name ?parent))
	(child-relation (father ?grand|?parent) (mother ?grand|?parent) (child ?great))
	=>
	(printout t ?father " and " ?mother " great grand parent of " ?great crlf)
	(assert (great-grand-child-relation (parent ?father) (child ?great)))
	(assert (great-grand-child-relation (parent ?mother) (child ?great)))
)

(defrule brother
	(child-relation (father ?father) (mother ?mother) (child ?siblingone))
	(child-relation (father ?father) (mother ?mother) (child ?siblingtwo&~?siblingone))
	(person (name ?siblingone) (gender male))
	=>
	(printout t ?siblingone " is " ?siblingtwo "'s brother" crlf)
	(assert (brother-relation (brother ?siblingone) (sibling ?siblingtwo)))
)

(defrule sister
	(child-relation (father ?father) (mother ?mother) (child ?siblingone))
	(child-relation (father ?father) (mother ?mother) (child ?siblingtwo&~?siblingone))
	(person (name ?siblingone) (gender female))
	=>
	(printout t ?siblingone " is " ?siblingtwo "'s sister" crlf)
	(assert (sister-relation (sister ?siblingone) (sibling ?siblingtwo)))
)

(defrule daughter
	(child-relation (father ?father) (mother ?mother) (child ?sibling))
	(person (name ?sibling) (gender female))
	=>
	(printout t ?sibling " is " ?father " and " ?mother " s' daughter" crlf)
	(assert (daughter-relation (daughter ?sibling)(father ?father) (mother ?mother)))
)

(defrule son
	(child-relation (father ?father) (mother ?mother) (child ?sibling))
	(person (name ?sibling) (gender male))
	=>
	(printout t ?sibling " is " ?father " and " ?mother " s' son" crlf)
	(assert (son-relation (son ?sibling) (father ?father) (mother ?mother)))
)

(defrule aunt
	(child-relation (father ?father) (mother ?mother) (child ?child))
	(child-relation (father ?grandfather) (mother ?grandmother) (child ?father|?mother))
	(child-relation (father ?grandfather) (mother ?grandmother) (child ?sibling&~?father&~?mother))
	(person (name ?sibling) (gender female))
	=>
	(printout t ?sibling " is " ?child "'s aunt" crlf)
	(assert (uncle-relation (uncle ?sibling) (nephew ?child)))
)

(defrule uncle
	(child-relation (father ?father) (mother ?mother) (child ?child))
	(child-relation (father ?grandfather) (mother ?grandmother) (child ?father|?mother))
	(child-relation (father ?grandfather) (mother ?grandmother) (child ?sibling&~?father&~?mother))
	(person (name ?sibling) (gender male))
	=>
	(printout t ?sibling " is " ?child "'s uncle" crlf)
	(assert (aunt-relation (aunt ?sibling) (nephew ?child)))
)

(defrule brother-in-law
	(child-relation (father ?father) (mother ?mother) (child ?child))
	(person (name ?partner))
	(marriage-relation (husband ?child|?partner) (wife ?child|?partner))
	(child-relation (father ?father) (mother ?mother) (child ?sibling&~?child))
	(person (name ?sibling) (gender male))
	=>
	(printout t ?sibling " is " ?partner "'s brother in law" crlf)
	(assert (brother-in-law-relation (brother ?sibling) (sibling ?partner)))
)

(defrule sister-in-law
	(child-relation (father ?father) (mother ?mother) (child ?child))
	(person (name ?partner))
	(marriage-relation (husband ?child|?partner) (wife ?child|?partner))
	(child-relation (father ?father) (mother ?mother) (child ?sibling&~?child))
	(person (name ?sibling) (gender female))
	=>
	(printout t ?sibling " is " ?partner "'s sister in law" crlf)
	(assert (sister-in-law-relation (sister ?sibling) (sibling ?partner)))
)

(defrule first-cousin
	(child-relation (father ?father) (mother ?mother) (child ?child))
	(child-relation (father ?grandfather) (mother ?grandmother) (child ?father|?mother))
	(child-relation (father ?grandfather) (mother ?grandmother) (child ?sibling&~?father&~?mother))
	(person (name ?relative))
	(child-relation (father ?relative|?sibling) (mother ?relative|?sibling) (child ?cousin))
	=>
	(printout t ?cousin " is " ?child "'s cousin" crlf)
	(assert (first-cousin-relation (cousin ?cousin) (sibling ?child)))
)