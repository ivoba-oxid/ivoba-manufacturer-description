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

$sMetadataVersion = '1.1';
$aModule          = [
    'id' => 'ivoba_manufacturer-description',
    'title' => '<strong>Ivo Bathke</strong>:  <i>Manufacturer Description</i>',
    'description' => 'Add a long description text field to manufacturers',
    'thumbnail' => 'ivoba-oxid.png',
    'version' => '1.0',
    'author' => 'Ivo Bathke',
    'email' => 'ivo.bathke@gmail.com',
    'url' => 'https://oxid.ivo-bathke.name#manufacturer-description',
    'extend' => [
        'oxmanufacturer' => 'ivoba/manufacturer-description/extend/ivoba_manufacturer_description_manufacturer',
        'oxmanufacturerlist' => 'ivoba/manufacturer-description/extend/ivoba_manufacturer_description_manufacturer_list'
    ],
    'files' => [
        'manufacturer_description' => 'ivoba/manufacturer-description/controllers/admin/manufacturer_description.php'
    ],
    'templates' => [
        'manufacturer_description.tpl' => 'ivoba/manufacturer-description/application/views/admin/tpl/manufacturer_description.tpl',
    ],
    'blocks' => [
        [
            'template' => 'page/list/list.tpl',
            'block'    => 'page_list_listbody',
            'file'     => '/views/blocks/manufacturer_description.tpl',
        ]
    ],
    'settings' => [
        ['group' => 'ivoba_manufacturer_description_main', 'name' => 'ivoba_manufacturer_description_ShowShortDescription', 'type' => 'bool', 'value' => false],
        ['group' => 'ivoba_manufacturer_description_main', 'name' => 'ivoba_manufacturer_description_ShowDescriptionAboveList', 'type' => 'bool', 'value' => false],
        ['group' => 'ivoba_manufacturer_description_main', 'name' => 'ivoba_manufacturer_description_ShowDescriptionBelowList', 'type' => 'bool', 'value' => true],
    ],
];