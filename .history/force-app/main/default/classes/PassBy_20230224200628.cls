public with sharing class PassBy {

    public static void timestwoList(list<Integer> listint) {

        for(Integer i: listint){
                i = i *2;
        }

    }

    public static void timestwoListArray(list<Integer> listint) {

        for(Integer i=0 ; i < listint.size(); i++){

                listint[i] = listint[i] *2;
        }

    }

    // this already update initial list so we don't have to return unless we want to create new object!!! In this example return is not needed but it wont change the heap size.

        public static list<Integer> timestwoListArrayReturn(list<Integer> listint) {

        for(Integer i=0 ; i < listint.size(); i++){

                listint[i] = listint[i] *2;
        }
        return listint;

    }

        // this return new list!!

        public static list<Integer> timestwoListArrayReturnNewList(list<Integer> listint) {

            List<Integer> deepCopy = listint.clone();

        for(Integer i=0 ; i < deepCopy.size(); i++){

                deepCopy[i] = deepCopy[i] *2;
        }
        return deepCopy;

    }


           // this update the list!! new list will point to the same location in memory

     public static list<Integer> timestwoListArrayReturnNewListTwo(list<Integer> listint) {

            List<Integer> deepCopy = new list<Integer>();
            deepCopy = listint;


        for(Integer i=0 ; i < deepCopy.size(); i++){

                deepCopy[i] = deepCopy[i] *2;
        }
        return deepCopy;

    }

}