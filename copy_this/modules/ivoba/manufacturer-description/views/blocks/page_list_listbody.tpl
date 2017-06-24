[{if $oView->getArticleList()|@count > 0}]
    <h1 class="pageHead">[{$oView->getTitle()}]
        [{assign var='rsslinks' value=$oView->getRssLinks() }]
        [{if $rsslinks.activeCategory}]
            <a class="rss js-external" id="rssActiveCategory" href="[{$rsslinks.activeCategory.link}]" title="[{$rsslinks.activeCategory.title}]"><img src="[{$oViewConf->getImageUrl('rss.png')}]" alt="[{$rsslinks.activeCategory.title}]"><span class="FXgradOrange corners glowShadow">[{$rsslinks.activeCategory.title}]</span></a>
        [{/if}]
    </h1>
    <div class="listRefine clear bottomRound">
        [{* start ivoba manufacturer desc *}]
        [{assign var="oConf" value=$oViewConf->getConfig()}]
        [{* category shortdesc *}]
        [{if $actCategory && $oConf->getConfigParam('ivoba_manufacturer_description_ShowCatShortDescriptionLocator') &&
         !$actCategory->is_manufacturer_list &&
          $actCategory->getShortDescription() }]
            <div id="catDescLocator" class="categoryDescription">[{$actCategory->getShortDescription()}]</div>
        [{/if}]
        [{* category longdesc *}]
        [{if $actCategory->oxcategories__oxlongdesc->value && !$actCategory->is_manufacturer_list &&
           $oConf->getConfigParam('ivoba_manufacturer_description_ShowCatLongDescriptionLocator') }]
            <div id="catLongDescLocator" class="categoryDescription longDescription">[{oxeval var=$actCategory->oxcategories__oxlongdesc}]</div>
        [{/if}]
        [{* manufacturer shortdesc *}]
        [{if $actCategory && $actCategory->is_manufacturer_list &&
          $oConf->getConfigParam('ivoba_manufacturer_description_ShowManuShortDescriptionLocator') &&
          $actCategory->getShortDescription() }]
            <div id="manuDescLocator" class="categoryDescription manufacturer">[{$actCategory->getShortDescription()}]</div>
        [{/if}]
        [{* manufacturer longdesc *}]
        [{if $actCategory && $actCategory->is_manufacturer_list &&
          $oConf->getConfigParam('ivoba_manufacturer_description_ShowManuLongDescriptionLocator') &&
          $actCategory->getManufacturerLongDescription()}]
            <div id="manuLongDescLocator" class="categoryDescription LongDescription manufacturer">[{$actCategory->getManufacturerLongDescription()}]</div>
        [{/if}]
        [{* end ivoba manufacturer desc *}]
        [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigationLimitedTop() attributes=$oView->getAttributes() listDisplayType=true itemsPerPage=true sort=true }]
    </div>
    [{* List types: grid|line|infogrid *}]
    [{include file="widget/product/list.tpl" type=$oView->getListDisplayType() listId="productList" products=$oView->getArticleList()}]
    [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigationLimitedBottom() place="bottom"}]
    [{* start ivoba manufacturer desc *}]
    [{if $actCategory &&  $actCategory->is_manufacturer_list &&
         $oConf->getConfigParam('ivoba_manufacturer_description_ShowManuLongDescriptionFooter') &&
         $actCategory->getManufacturerLongDescription() }]
        <div id="manuLongDescLocator" class="categoryDescription LongDescription manufacturer">[{oxeval var=$actCategory->getManufacturerLongDescription()}]</div>
    [{/if}]
    [{* end ivoba manufacturer desc *}]
[{/if}]
