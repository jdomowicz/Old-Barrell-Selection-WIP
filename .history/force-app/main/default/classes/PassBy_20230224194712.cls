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

        public static list<Integer> timestwoListArray(list<Integer> listint) {

        for(Integer i=0 ; i < listint.size(); i++){

                listint[i] = listint[i] *2;
        }

    }
}