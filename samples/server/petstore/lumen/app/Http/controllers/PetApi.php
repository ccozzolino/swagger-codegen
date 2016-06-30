<?php

/**
 * Swagger Petstore
 * This spec is mainly for testing Petstore server and contains fake endpoints, models. Please do not use this for any other purpose. Special characters: \" \\ 
 *
 * OpenAPI spec version: 1.0.0
 * Contact: apiteam@swagger.io
 *
 * NOTE: This class is auto generated by the swagger code generator program.
 * https://github.com/swagger-api/swagger-codegen.git
 * Do not edit the class manually.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


namespace App\Http\Controllers;

use Illuminate\Support\Facades\Request;

class PetApi extends Controller
{
    /**
     * Constructor
     */
    public function __construct()
    {
    }

    /**
     * Operation addPet
     *
     * Add a new pet to the store.
     *
     *
     * @return Http response
     */
    public function addPet()
    {
        $input = Request::all();

        //path params validation


        //not path params validation
        if (!isset($input['body'])) {
            throw new \InvalidArgumentException('Missing the required parameter $body when calling addPet');
        }
        $body = $input['body'];


        return response('How about implementing addPet as a POST method ?');
    }
    /**
     * Operation updatePet
     *
     * Update an existing pet.
     *
     *
     * @return Http response
     */
    public function updatePet()
    {
        $input = Request::all();

        //path params validation


        //not path params validation
        if (!isset($input['body'])) {
            throw new \InvalidArgumentException('Missing the required parameter $body when calling updatePet');
        }
        $body = $input['body'];


        return response('How about implementing updatePet as a PUT method ?');
    }
    /**
     * Operation findPetsByStatus
     *
     * Finds Pets by status.
     *
     *
     * @return Http response
     */
    public function findPetsByStatus()
    {
        $input = Request::all();

        //path params validation


        //not path params validation
        if (!isset($input['status'])) {
            throw new \InvalidArgumentException('Missing the required parameter $status when calling findPetsByStatus');
        }
        $status = $input['status'];


        return response('How about implementing findPetsByStatus as a GET method ?');
    }
    /**
     * Operation findPetsByTags
     *
     * Finds Pets by tags.
     *
     *
     * @return Http response
     */
    public function findPetsByTags()
    {
        $input = Request::all();

        //path params validation


        //not path params validation
        if (!isset($input['tags'])) {
            throw new \InvalidArgumentException('Missing the required parameter $tags when calling findPetsByTags');
        }
        $tags = $input['tags'];


        return response('How about implementing findPetsByTags as a GET method ?');
    }
    /**
     * Operation deletePet
     *
     * Deletes a pet.
     *
     * @param Long $petId Pet id to delete (required)
     *
     * @return Http response
     */
    public function deletePet($petId)
    {
        $input = Request::all();

        //path params validation


        //not path params validation

        return response('How about implementing deletePet as a DELETE method ?');
    }
    /**
     * Operation getPetById
     *
     * Find pet by ID.
     *
     * @param Long $petId ID of pet to return (required)
     *
     * @return Http response
     */
    public function getPetById($petId)
    {
        $input = Request::all();

        //path params validation


        //not path params validation

        return response('How about implementing getPetById as a GET method ?');
    }
    /**
     * Operation updatePetWithForm
     *
     * Updates a pet in the store with form data.
     *
     * @param Long $petId ID of pet that needs to be updated (required)
     *
     * @return Http response
     */
    public function updatePetWithForm($petId)
    {
        $input = Request::all();

        //path params validation


        //not path params validation

        return response('How about implementing updatePetWithForm as a POST method ?');
    }
    /**
     * Operation uploadFile
     *
     * uploads an image.
     *
     * @param Long $petId ID of pet to update (required)
     *
     * @return Http response
     */
    public function uploadFile($petId)
    {
        $input = Request::all();

        //path params validation


        //not path params validation

        return response('How about implementing uploadFile as a POST method ?');
    }
}
