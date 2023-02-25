public with sharing class PassBy {

    public list<Integer> timestwoList(list<Integer> listint) {

        for(Integer i: listint){
                i = i *2;
        }

    }

    public  void timestwoListArray(list<Integer> listint) {

        for(Integer i=0 ; i < listint.size(); i++){

                listint[i] = listint[i] *2;
        }

    }

    // this already update initial list so we don't have to return unless we want to create new object!!! In this example return is not needed but it wont change the heap size.

        public  list<Integer> timestwoListArrayReturn(list<Integer> listint) {

        for(Integer i=0 ; i < listint.size(); i++){

                listint[i] = listint[i] *2;
        }
        return listint;

    }

        // this return new list!!

        public  list<Integer> timestwoListArrayReturnNewList(list<Integer> listint) {

            List<Integer> deepCopy = listint.clone();

        for(Integer i=0 ; i < deepCopy.size(); i++){

                deepCopy[i] = deepCopy[i] *2;
        }
        return deepCopy;

    }


           // this update the list!! new list will point to the same location in memory!! Heap won't change

     public  list<Integer> timestwoListArrayReturnNewListTwo(list<Integer> listint) {

        // this is not new lsit, just a new pointer to the same location in memory
            List<Integer> deepCopy = new list<Integer>();
            deepCopy = listint;


        for(Integer i=0 ; i < deepCopy.size(); i++){

                deepCopy[i] = deepCopy[i] *2;
        }
        return deepCopy;

    }

}