public with sharing class Item {

  private final Double UnitPrice;
  private final Integer Quantiity;

  public Item() {
    system.debug('Constructor with no argument called');
  }

  public Item(Double unitPrice, Integer quantity) {

    this.UnitPrice = unitPrice;
    this.Quantiity = quantity;
  }


}
