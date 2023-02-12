sig Account {
	// Every account has 0 or more Resources
	resources : set Resource,
	// every account has 0 or more Users
	users : set User

}


sig User {
	// EVERY USER HAS DIRECT ACCESS TO 0 OR MORE Users
	resources : set Resource,
	//accounts : one Account
	
}


sig Resource { 
	// EVERY RESOURCE HAS 0 OR 1 Pqrent
	parent :lone Resource
}


fact  {
	no r : Resource |
		r in r.^parent
}


fact "no shared users" { // don't need to be named because they are never invoked

	// For each User 'u'
	all u:User |
		// There is an account a
		one a:Account |
			// the user 'u' belongs to 'a'
			u in a.users
}

fact {
	all a : Account |
		#(a.users) = 2
}



run {} for 3 but exactly 3 User

// check NoSharedResources
