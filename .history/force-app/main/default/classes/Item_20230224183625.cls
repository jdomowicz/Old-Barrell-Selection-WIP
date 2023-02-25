public with sharing class Item {

  private final Integer Quantity;
  private final Double UnitPrice;


  public Item() {
    system.debug('Constructor with no argument called');
  }

  public Item(Double UnitPrice, Integer Quantity) {
    this.UnitPrice = UnitPrice;
    this.Quantity = Quantity;
  }

  public Double getUnitPrice() {
    return UnitPrice;
  }

  public Double getQuantity() {
    return Quantity;
  }

  public Double getItemValue() {
    return UnitPrice * Quantity;
  }
}
