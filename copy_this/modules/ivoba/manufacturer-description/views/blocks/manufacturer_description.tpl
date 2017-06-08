[{if $oView->getArticleList()|@count > 0}]
<h1 class="pageHead">[{$oView->getTitle()}]
    [{assign var='rsslinks' value=$oView->getRssLinks() }]
    [{if $rsslinks.activeCategory}]
    <a class="rss js-external" id="rssActiveCategory" href="[{$rsslinks.activeCategory.link}]" title="[{$rsslinks.activeCategory.title}]"><img src="[{$oViewConf->getImageUrl('rss.png')}]" alt="[{$rsslinks.activeCategory.title}]"><span class="FXgradOrange corners glowShadow">[{$rsslinks.activeCategory.title}]</span></a>
    [{/if}]
</h1>
<div class="listRefine clear bottomRound">
   [{assign var="oConf" value=$oViewConf->getConfig()}]
   [{if $actCategory && $oConf->getConfigParam('ivoba__manufacturer_description_ShowShortDescription') &&
    $actCategory->getShortDescription() }]
        <div id="catDescLocator" class="categoryDescription">[{$actCategory->getShortDescription()}]</div>
    [{/if}]
    [{if $actCategory->oxcategories__oxlongdesc->value && $oConf->getConfigParam('ivoba_manufacturer_description_ShowCatDescription') }]
        <div id="catLongDescLocator" class="categoryDescription">[{oxeval var=$actCategory->oxcategories__oxlongdesc}]</div>
    [{/if}]
    [{if $actCategory->getLongDescription() && $oConf->getConfigParam('ivoba_manufacturer_description_ShowManufacturerDescription') }]
        <div id="manufacturerLongDescLocator" class="manufacturerDescription">
            [{$actCategory->getLongDescription()}]
        </div>
    [{/if}]
    [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigationLimitedTop() attributes=$oView->getAttributes() listDisplayType=true itemsPerPage=true sort=true }]
</div>
[{* List types: grid|line|infogrid *}]
[{include file="widget/product/list.tpl" type=$oView->getListDisplayType() listId="productList" products=$oView->getArticleList()}]
[{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigationLimitedBottom() place="bottom"}]
[{/if}]