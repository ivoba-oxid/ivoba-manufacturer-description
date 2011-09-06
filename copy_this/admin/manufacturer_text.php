<?php

class Manufacturer_Text extends oxAdminDetails {

    public function render() {
        parent::render();
        
        $this->_aViewData['edit'] = $o = oxNew('oxmanufacturer');

        $soxId = $this->_aViewData["oxid"] = $this->getEditObjectId();
        if ($soxId != "-1" && isset($soxId)) {
            // load object
            $iLang = oxConfig::getParameter("catlang");

            if (!isset($iLang))
                $iLang = $this->_iEditLang;

            $this->_aViewData["manlang"] = $iLang;

            $o->loadInLang($iLang, $soxId);

            foreach (oxLang::getInstance()->getLanguageNames() as $id => $language) {
                $oLang = new oxStdClass();
                $oLang->sLangDesc = $language;
                $oLang->selected = ($id == $this->_iEditLang);
                $this->_aViewData["otherlang"][$id] = clone $oLang;
            }
        }

        $this->_aViewData["editor"] = $this->_generateTextEditor("100%", 300, $o, "oxmanufacturers__oxlongdesc", "list.tpl.css");

        return "manufacturer_text.tpl";
    }

    /**
     * Saves category description text to DB.
     *
     * @return mixed
     */
    public function save() {
        $myConfig = $this->getConfig();

        $soxId = $this->getEditObjectId();
        $aParams = oxConfig::getParameter("editval");

        $o = oxNew("oxmanufacturer");
        $iLang = oxConfig::getParameter("catlang");
        $iLang = $iLang ? $iLang : 0;

        if ($soxId != "-1") {
            $o->loadInLang($iLang, $soxId);
        } else {
            $aParams['oxmanufacturer__oxid'] = null;
        }
        
        #$o->setLanguage(0);
        $o->assign($aParams);
        $o->setLanguage($iLang);
        $o->save();

        // set oxid if inserted
        $this->setEditObjectId($o->getId());
    }

}
