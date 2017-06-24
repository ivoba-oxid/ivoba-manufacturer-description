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

class ivoba_manufacturer_description_manufacturer extends ivoba_manufacturer_description_manufacturer_parent
{

    /**
     * Sets data field value
     *
     * @param string $sFieldName index OR name (eg. 'oxarticles__oxtitle') of a data field to set
     * @param string $sValue value of data field
     * @param int $iDataType field type
     *
     * @return null
     */
    protected function _setFieldData($sFieldName, $sValue, $iDataType = oxField::T_TEXT)
    {
        //preliminar quick check saves 3% of execution time in category lists by avoiding redundant strtolower() call
        if ($sFieldName[2] == 'l' || $sFieldName[2] == 'L' || (isset($sFieldName[16]) && ($sFieldName[16] == 'l' || $sFieldName[16] == 'L'))) {
            if ('extlongdesc' === strtolower($sFieldName) || 'oxmanufacturers__extlongdesc' === strtolower(
                    $sFieldName
                )
            ) {
                $iDataType = oxField::T_RAW;
            }
        }

        return parent::_setFieldData($sFieldName, $sValue, $iDataType);
    }

    /**
     * Returns long description
     *
     * @return string
     */
    public function getManufacturerLongDescription()
    {
        if (isset($this->oxmanufacturers__extlongdesc->value) && $this->oxmanufacturers__extlongdesc instanceof oxField) {
            return oxRegistry::get("oxUtilsView")->parseThroughSmarty($this->oxmanufacturers__extlongdesc->getRawValue(), $this->getId() . $this->getLanguage(), null, true);
        }
    }

    /**
     * assign extlongdesc to oxlongdesc field since manufacturer is handled as category
     * @param string $sName
     * @return string
     */
    public function __get($sName)
    {
        if ($sName === 'is_manufacturer_list') {
          return true;
        }

        return parent::__get($sName);
    }

}
