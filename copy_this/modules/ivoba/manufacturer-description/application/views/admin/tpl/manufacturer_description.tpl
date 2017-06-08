[{include file="headitem.tpl" title="GENERAL_ADMIN_TITLE"|oxmultilangassign}]

<script type="text/javascript">
    <!--
    function loadLang(obj)
    {
        var lang = document.getElementById("catlang");
        if (lang !== null){
          lang.value = obj.value;
        }
        document.myedit.submit();
    }
    //-->
</script>

[{if $readonly }]
[{assign var="readonly" value="readonly disabled"}]
[{else}]
[{assign var="readonly" value=""}]
[{/if}]

<form name="transfer" id="transfer" action="[{ $oViewConf->getSelfLink() }]" method="post">
    [{ $oViewConf->getHiddenSid() }]
    <input type="hidden" name="oxid" value="[{ $oxid }]">
    <input type="hidden" name="cl" value="manufacturer_description">
    <input type="hidden" name="editlanguage" value="[{ $editlanguage }]">
</form>

[{ $editor }]

<form name="myedit" id="myedit" action="[{ $oViewConf->getSelfLink() }]" method="post" onSubmit="copyLongDesc('oxmanufacturers__extlongdesc');" style="padding: 0;margin: 0;height:0;">
    [{ $oViewConf->getHiddenSid() }]
    <input type="hidden" name="cl" value="manufacturer_description">
    <input type="hidden" name="fnc" value="">
    <input type="hidden" name="oxid" value="[{ $oxid }]">
    <input type="hidden" name="voxid" value="[{ $oxid }]">
    <input type="hidden" name="editval[oxmanufacturers__oxid]" value="[{ $oxid }]">
    <input type="hidden" id="catlang" name="catlang" value="[{$manlang}]">
    <input type="hidden" name="editval[oxmanufacturers__extlongdesc]" value="">
    [{if $languages}]
        <label for="chooselang"><b>[{ oxmultilang ident="GENERAL_LANGUAGE" }]</b></label>
        <select name="chooselang" class="editinput" onchange="loadLang(this)" [{ $readonly }]>
                [{foreach key=key item=item from=$languages}]
                <option value="[{$key}]"[{if $manlang == $key}] SELECTED[{/if}]>[{$item->name}]</option>
            [{/foreach}]
        </select>
    [{/if}]
    <br>
    <input type="submit" class="edittext" name="save" value="[{ oxmultilang ident="CATEGORY_TEXT_SAVE" }]"
    onClick="Javascript:document.myedit.fnc.value='save'">
</form>


[{include file="bottomnaviitem.tpl"}]

[{include file="bottomitem.tpl"}]
