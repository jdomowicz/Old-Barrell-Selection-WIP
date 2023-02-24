public with sharing class Item {

    private final Double UnitPrice;
    private final Double Quantiity;

    public Item( Double unitPrice,Integer quantity) {

        this.unitPrice = unitPrice;
        this.Quantiity = quantiity;

    }

    public Double getUnitPrice(){
        return UnitPrice;
    }
}