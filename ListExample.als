open util/integer
open LinkedList

one sig ListableObject1 extends ListableObject { }
one sig ListableObject2 extends ListableObject { }
one sig ListableObject3 extends ListableObject { }
one sig ListableObject4 extends ListableObject { }
one sig ListableObject5 extends ListableObject { }

one sig ListableObjectPlaceholder extends ListableObject { }
one sig ListableObjectPlaceholder2 extends ListableObject { }

one sig List extends ListSignature { }


var sig GettedElements in ListableObject {}


pred stutter {
	all list: ListSignature| unchangedList[list]
	unchanged[GettedElements]
}

pred init {
	no List.startElement
	no List.LinkedList
	no GettedElements
} 




run AddAndGet {
	init

	//Add Elements without an Order. If you need the order you need to add the Elements step by step
	//addToList[List, {ListableObject1 + ListableObject2 + ListableObject3 + ListableObject4 + ListableObject5}] and unchanged[GettedElements];
	addToList[List, ListableObject1] and unchanged[GettedElements];
	addToList[List, ListableObject2] and unchanged[GettedElements];
	addToList[List, ListableObject3] and unchanged[GettedElements];
	addToList[List, ListableObject4] and unchanged[GettedElements];
	addToList[List, ListableObject5] and unchanged[GettedElements];

	GettedElements' = getListElementsFromIndex[List, 1, 3] and unchangedList[List];

	stutter





} for 10 steps


run AddAndRemove {
	init

	//Add Elements without an Order. If you need the order you need to add the Elements step by step
	//addToList[List, {ListableObject1 + ListableObject2 + ListableObject3 + ListableObject4 + ListableObject5}] and unchanged[GettedElements];
	addToList[List, ListableObject1] and unchanged[GettedElements];
	addToList[List, ListableObject2] and unchanged[GettedElements];
	addToList[List, ListableObject3] and unchanged[GettedElements];
	addToList[List, ListableObject4] and unchanged[GettedElements];
	addToList[List, ListableObject5] and unchanged[GettedElements];





	removeElementsFromIndex[List, 2, 2] and unchanged[GettedElements];

	stutter





} for 10 steps




run AddAndAddAt	{
	init

	//Add Elements without an Order. If you need the order you need to add the Elements step by step
	//addToList[List, {ListableObject1 + ListableObject2 + ListableObject3 + ListableObject4 + ListableObject5}] and unchanged[GettedElements];
	addToList[List, ListableObject1] and unchanged[GettedElements];
	addToList[List, ListableObject2] and unchanged[GettedElements];
	addToList[List, ListableObject4] and unchanged[GettedElements];
	addToList[List, ListableObject5] and unchanged[GettedElements];

	//addListElementsAtIndex[List, 0, ListableObject3+ListableObjectPlaceholder] and unchanged[GettedElements];
	//addListElementsAtIndex[List, 0, ListableObject3] and unchanged[GettedElements];
	addListElementsAtIndex[List, 2, ListableObject3] and unchanged[GettedElements];
	//addListElementsAtIndex[List, 2, ListableObject3+ListableObjectPlaceholder+ListableObjectPlaceholder2] and unchanged[GettedElements];

	stutter
	
}
