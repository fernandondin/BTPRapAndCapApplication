@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Item - Interface'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZITEM_I_0063
  as projection on ZITEM_R_0063
{
  key ItemUUID,
      HeaderUUID,
      ItemID,
      Name,
      Description,
      ReleaseDate,
      DiscontinuedDate,
      Price,
      @Semantics.quantity.unitOfMeasure : 'UnitOfMeasure'
      Height,
      @Semantics.quantity.unitOfMeasure : 'UnitOfMeasure'
      Width,
      Depth,
      Quantity,
      UnitOfMeasure,


      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      LastChangedAt,
      /* Associations */
      _Header : redirected to parent ZHEADER_I_0063
}
