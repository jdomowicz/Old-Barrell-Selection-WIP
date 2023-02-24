public with sharing class PassBy {

    public static void timestwo(Integer value) {

        value = value *2;

    }

    public static Integer timestwoInt(Integer value) {

       return value = value *2;

    }


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

    // this already update initial list so we don't have to return unless we want to create new object!!!

        public static list<Integer> timestwoListArrayReturn(list<Integer> listint) {

        for(Integer i=0 ; i < listint.size(); i++){

                listint[i] = listint[i] *2;
        }
        return listint;

    }

        // this return new list!!

        public static list<Integer> timestwoListArrayReturnNewList(list<Integer> listint) {

            List<Integer> deepCopy = listint.clone();

        for(Integer i=0 ; i < newListofIntegers.size(); i++){

                newListofIntegers[i] = newListofIntegers[i] *2;
        }
        return newListofIntegers;

    }

     public static list<Integer> timestwoListArrayReturnNewListTwo(list<Integer> listint) {

            List<Integer> deepCopy = new list<Integer>();


        for(Integer i=0 ; i < newListofIntegers.size(); i++){

                newListofIntegers[i] = newListofIntegers[i] *2;
        }
        return newListofIntegers;

    }

}