[{if $actCategory->oxcategories__oxthumb->value && $actCategory->getThumbUrl()}]
    <img src="[{$actCategory->getThumbUrl()}]" alt="[{$actCategory->oxcategories__oxtitle->value}]" class="categoryPicture">
[{/if}]

[{* start ivoba manufacturer desc*}]
[{assign var="oConf" value=$oViewConf->getConfig()}]
[{* category shortdesc *}]
[{if $actCategory && $oConf->getConfigParam('ivoba_manufacturer_description_ShowCatShortDescriptionHead') &&
 !$actCategory->is_manufacturer_list &&
  $actCategory->getShortDescription() }]
    <div class="categoryDescription" id="catDesc">[{$actCategory->getShortDescription()}]</div>
[{/if}]
[{* manufacturer shortdesc *}]
[{if $actCategory && $actCategory->is_manufacturer_list &&
  $oConf->getConfigParam('ivoba_manufacturer_description_ShowManuShortDescriptionHead') &&
  $actCategory->getShortDescription() }]
    <div class="categoryDescription manufacturer" id="manufacturerDesc">[{$actCategory->getShortDescription()}]</div>
[{/if}]
[{* category longdesc *}]
[{if $actCategory->oxcategories__oxlongdesc->value && !$actCategory->is_manufacturer_list &&
   $oConf->getConfigParam('ivoba_manufacturer_description_ShowCatLongDescriptionHead') }]
    <div class="categoryDescription longDescription" id="catLongDesc">[{oxeval var=$actCategory->oxcategories__oxlongdesc}]</div>
[{/if}]
[{* manufacturer longdesc in list head *}]
[{if $actCategory && $actCategory->is_manufacturer_list &&
  $oConf->getConfigParam('ivoba_manufacturer_description_ShowManuLongDescriptionHead') }]
    <div class="categoryDescription longDescription manufacturer" id="manufacturerLongDescription">[{oxeval var=$actCategory->getManufacturerLongDescription()}]</div>
    [{/if}]
[{* end ivoba manufacturer desc*}]

[{if $oView->hasVisibleSubCats()}]
    [{assign var="iSubCategoriesCount" value=0}]
    [{oxscript include="js/widgets/oxequalizer.js" priority=10 }]
    [{oxscript add="$(function(){oxEqualizer.equalHeight($( '.subcatList li .content' ));});"}]
    <ul class="subcatList clear">
        <li>
            [{foreach from=$oView->getSubCatList() item=category name=MoreSubCat}]
            [{if $category->getContentCats() }]
            [{foreach from=$category->getContentCats() item=ocont name=MoreCms}]
            [{assign var="iSubCategoriesCount" value=$iSubCategoriesCount+1}]
            <div class="box">
                <h3>
                    <a id="moreSubCms_[{$smarty.foreach.MoreSubCat.iteration}]_[{$smarty.foreach.MoreCms.iteration}]" href="[{$ocont->getLink()}]">[{ $ocont->oxcontents__oxtitle->value }]</a>
                </h3>
                <ul class="content"></ul>
            </div>
            [{/foreach}]
            [{/if}]
            [{if $iSubCategoriesCount%4 == 0}]
        </li><li>
            [{/if}]
            [{if $category->getIsVisible()}]
            [{assign var="iSubCategoriesCount" value=$iSubCategoriesCount+1}]
            [{assign var="iconUrl" value=$category->getIconUrl()}]
            <div class="box">
                <h3>
                    <a id="moreSubCat_[{$smarty.foreach.MoreSubCat.iteration}]" href="[{ $category->getLink() }]">
                        [{$category->oxcategories__oxtitle->value }][{if $oView->showCategoryArticlesCount() && ($category->getNrOfArticles() > 0) }] ([{ $category->getNrOfArticles() }])[{/if}]
                    </a>
                </h3>
                [{if $category->getHasVisibleSubCats()}]
                <ul class="content">
                    [{if $iconUrl}]
                    <li class="subcatPic">
                        <a href="[{ $category->getLink() }]">
                            <img src="[{$category->getIconUrl() }]" alt="[{$category->oxcategories__oxtitle->value}]">
                        </a>
                    </li>
                    [{/if}]
                    [{foreach from=$category->getSubCats() item=subcategory}]
                    [{if $subcategory->getIsVisible()}]
                    [{foreach from=$subcategory->getContentCats() item=ocont name=MoreCms}]
                    <li>
                        <a href="[{$ocont->getLink()}]"><strong>[{ $ocont->oxcontents__oxtitle->value }]</strong></a>
                    </li>
                    [{/foreach}]
                    <li>
                        <a href="[{ $subcategory->getLink() }]">
                            <strong>[{ $subcategory->oxcategories__oxtitle->value }]</strong>[{if $oView->showCategoryArticlesCount() && ($subcategory->getNrOfArticles() > 0) }] ([{ $subcategory->getNrOfArticles() }])[{/if}]
                        </a>
                    </li>
                    [{/if}]
                    [{/foreach}]
                </ul>
                [{else}]
                <div class="content catPicOnly">
                    <div class="subcatPic">
                        [{if $iconUrl}]
                        <a href="[{ $category->getLink() }]">
                            <img src="[{$category->getIconUrl() }]" alt="[{ $category->oxcategories__oxtitle->value }]">
                        </a>
                        [{/if}]
                    </div>
                </div>
                [{/if}]
            </div>
            [{/if}]
            [{if $iSubCategoriesCount%4 == 0}]
        </li>
        <li>
            [{/if}]
            [{/foreach}]
        </li>
    </ul>
[{/if}]
