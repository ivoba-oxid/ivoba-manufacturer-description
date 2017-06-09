<?php
/* Please retain this copyright header in all versions of the software
 *
 * Copyright (C) 2017 Ivo Bathke
 *
 * It is published under the MIT Open Source License.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to
 * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 * the Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

class manufacturer_description extends oxAdminDetails
{
    /**
     * @return string
     */
    public function render()
    {
        parent::render();

        $this->_aViewData['edit'] = $o = oxNew('oxmanufacturer');

        $soxId = $this->_aViewData['oxid'] = $this->getEditObjectId();
        if (isset($soxId) && $soxId != '-1') {
            // load object
            $iLang = oxRegistry::getConfig()->getRequestParameter('catlang');

            if (!isset($iLang)) {
                $iLang = $this->_iEditLang;
            }

            $this->_aViewData['manlang'] = $iLang;

            $o->loadInLang($iLang, $soxId);

            foreach (oxRegistry::getLang()->getLanguageNames() as $id => $language) {
                $oLang                              = new stdClass();
                $oLang->sLangDesc                   = $language;
                $oLang->selected                    = ($id == $this->_iEditLang);
                $this->_aViewData['otherlang'][$id] = clone $oLang;
            }
        }

        $this->_aViewData['editor'] = $this->_generateTextEditor(
            '100%',
            300,
            $o,
            'oxmanufacturers__extlongdesc',
            'list.tpl.css'
        );

        return 'manufacturer_description.tpl';
    }

    /**
     * Saves category description text to DB.
     */
    public function save()
    {
        $soxId   = $this->getEditObjectId();
        $aParams = oxRegistry::getConfig()->getRequestParameter('editval');

        $o     = oxNew('oxmanufacturer');
        $iLang = oxRegistry::getConfig()->getRequestParameter('catlang');
        $iLang = $iLang ? $iLang : 0;

        if ($soxId != '-1') {
            $o->loadInLang($iLang, $soxId);
        } else {
            $aParams['oxmanufacturer__oxid'] = null;
        }

        $o->assign($aParams);
        $o->save();

        // set oxid if inserted
        $this->setEditObjectId($o->getId());
    }

}
