public with sharing class Item {
  private final Double UnitPrice;
  private final Integer Quantity;

  public Item() {
    system.debug('Constructor with no argument called');
  }

  public Item(Double UnitPrice, Integer quantity) {
    this.UnitPrice = UnitPrice;
    this.Quantity = quantity;
  }

  public Double getUnitPrice() {
    return UnitPrice;
  }

  public Double getQuantity() {
    return UnitPrice * Quantity;
  }

  public Double getItemValue() {
    return UnitPrice * Quantity;
  }
}
