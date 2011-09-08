<?php

class ext_oxmanufacturerlist extends ext_oxmanufacturerlist_parent {

    /**
     * overrides parent method
     * Adds category specific fields to manufacturer object
     *
     * @param object $oManufacturer manufacturer object
     *
     * @return null
     */
    protected function _addCategoryFields($oManufacturer) {
        $oManufacturer->oxcategories__oxid = new oxField($oManufacturer->oxmanufacturers__oxid->value);
        $oManufacturer->oxcategories__oxicon = $oManufacturer->oxmanufacturers__oxicon;
        $oManufacturer->oxcategories__oxtitle = $oManufacturer->oxmanufacturers__oxtitle;
        $oManufacturer->oxcategories__oxdesc = $oManufacturer->oxmanufacturers__extlongdesc;

        $oManufacturer->setIsVisible(true);
        $oManufacturer->setHasVisibleSubCats(false);
    }

}

?>
