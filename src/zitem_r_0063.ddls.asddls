@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Item - Root'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZITEM_R_0063 
as select from zitem_0063_a
association to parent ZHEADER_R_0063    as _Header on  $projection.HeaderUUID = _Header.HeaderUUID
{
    key item_uuid as ItemUUID,
    parent_uuid as HeaderUUID,
    item_id as ItemID,
    name as Name,
    description as Description,
    release_date as ReleaseDate,
    discontinued_date as DiscontinuedDate,
    price as Price,
    @Semantics.quantity.unitOfMeasure : 'UnitOfMeasure'
    height as Height,
    @Semantics.quantity.unitOfMeasure : 'UnitOfMeasure'
    width as Width,
    depth as Depth,
    quantity as Quantity,
    unit_of_measure as UnitOfMeasure,
    
    
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    local_last_changed_at as LocalLastChangedAt,
    @Semantics.systemDateTime.lastChangedAt: true
    last_changed_at as LastChangedAt,
    _Header
}
