Feature: Petstore edge pair criterio

  Background:
    * url 'https://petstore.swagger.io/v2'

  Scenario: initialize InserePetInvalido InserePetInvalido AddNewPetValido UpdateAnExistingPetSucess FindPetByIdFalha  

    * def body_create_1 =
    """
      "12"
    """

    * def body_create_2 =
    """
      12
    """

    * def body_create_3 =
    """
    {
      "id": 1,
      "category": {
        "id": 1,
        "name": "cachorro"
      },
      "name": "totó",
      "photoUrls": [
        ""
      ],
      "tags": [
        {
          "id": 0,
          "name": ""
        }
      ],
      "status": "available"
    }
    """

    * def body_update_1 =
    """
    {
      "id": 1,
      "category": {
        "id": 1,
        "name": "cachorro"
      },
      "name": "chodó",
      "photoUrls": [
        ""
      ],
      "tags": [
        {
          "id": 0,
          "name": ""
        }
      ],
      "status": "available"
    }
    """


    * def url_base = 'https://petstore.swagger.io/v2/pet'
    * def pet_id_1 = '/110'

    Given url url_base
    And request body_create_1
    When method post
    Then status 415
    And request body_create_2
    When method post
    Then status 415
    And request body_create_3
    When method post
    Then status 200
    And request body_update_1
    When method put
    Then status 200
    * url url_base + pet_id_1
    When method get
    Then status 404


  Scenario: initialize AddNewPetValido UpdateAnExistingPetSucess FindPetByIdSucesso DeletesAPet

    
    * def body_create_4 =
    """
    {
      "id": 2,
      "category": {
        "id": 2,
        "name": "gato"
      },
      "name": "miau",
      "photoUrls": [
        ""
      ],
      "tags": [
        {
          "id": 0,
          "name": ""
        }
      ],
      "status": "available"
    }
    """

    * def body_update_2 =
    """
    {
      "id": 2,
      "category": {
        "id": 2,
        "name": "gato"
      },
      "name": "miau",
      "photoUrls": [
        "string"
      ],
      "tags": [
        {
          "id": 0,
          "name": ""
        }
      ],
      "status": "sold"
    }
    """
    * def pet_id_2 = '/2'

    * def url_base = 'https://petstore.swagger.io/v2/pet'

    Given url url_base
    And request body_create_4
    When method post
    Then status 200
    And request body_update_2
    When method put
    Then status 200
    * url url_base + pet_id_2
    When method get
    Then status 200
    * url url_base + pet_id_2
    When method delete
    Then status 200


  Scenario: initialize InserePetInvalido AddNewPetValido UpdateAnExistingPetFalha

    * def body_create_5 =
    """
      "12"
    """

    * def body_create_6 =
    """
    {
      "id": 5,
      "category": {
        "id": 5,
        "name": "rato"
      },
      "name": "mouse",
      "photoUrls": [
        ""
      ],
      "tags": [
        {
          "id": 0,
          "name": ""
        }
      ],
      "status": "available"
    }
    """

    * def body_update_3 =
    """
      5
    """


    * def url_base = 'https://petstore.swagger.io/v2/pet'
    * def pet_id_2 = '/5'

    Given url url_base
    And request body_create_5
    When method post
    Then status 415
    And request body_create_6
    When method post
    Then status 200
    And request body_update_3
    When method put
    Then status 415