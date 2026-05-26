@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Item - Consumption entity'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@Search.searchable: true
@ObjectModel.semanticKey: [ 'ItemID' ]
define view entity ZITEM_C_0063 
as projection on ZITEM_R_0063
{
    key ItemUUID,
    HeaderUUID,
    @Search.defaultSearchElement: true
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
    LocalLastChangedAt,
    LastChangedAt,
    /* Associations */
    _Header: redirected to parent ZHEADER_C_0063
}
