Feature: Petstore prime path criterio

  Background:
    * url 'https://petstore.swagger.io/v2'

  Scenario: initialize InserePetInvalido AddNewPetValido UpdateAnExistingPetFalha  

    * def body_create_1 =
    """
      12
    """

    * def body_create_2 =
    """
    {
      "id": 23,
      "category": {
        "id": 5,
        "name": "passaro"
      },
      "name": "bird",
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
      11
    """

    * def url_base = 'https://petstore.swagger.io/v2/pet'

    Given url url_base
    And request body_create_1
    When method post
    Then status 415
    And request body_create_2
    When method post
    Then status 200
    And request body_update_1
    When method put
    Then status 415


  Scenario: initialize AddNewPetValido UpdateAnExistingPetFalha

    * def body_create_4 =
    """
    {
      "id": 30,
      "category": {
        "id": 6,
        "name": "urso"
      },
      "name": "bear",
      "photoUrls": [
        ""
      ],
      "tags": [
        {
          "id": 0,
          "name": ""
        }
      ],
      "status": "pending"
    }
    """
    * def body_update_2 =
    """
      30
    """

    * def url_base = 'https://petstore.swagger.io/v2/pet'

    Given url url_base
    And request body_create_4
    When method post
    Then status 200
    And request body_update_2
    When method put
    Then status 415

  Scenario: initialize AddNewPetValido UpdateAnExistingPetSucess FindPetByIdFalha
   
    * def body_create_5 =
    """
    {
      "id": 111,
      "category": {
        "id": 8,
        "name": "tigre"
      },
      "name": "tiger",
      "photoUrls": [
        ""
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
  
    * def body_update_3 =
    """
    {
      "id": 111,
      "category": {
        "id": 8,
        "name": "tigre"
      },
      "name": "leon",
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
    And request body_create_5
    When method post
    Then status 200
    And request body_update_3
    When method put
    Then status 200
    * url url_base + pet_id_1
    When method get
    Then status 404

  Scenario: initialize AddNewPetValido UpdateAnExistingPetSucess FindPetByIdSucesso DeletesAPet
  
    * def body_create_6 =
    """
    {
      "id": 205,
      "category": {
        "id": 10,
        "name": "peixe"
      },
      "name": "fish",
      "photoUrls": [
        ""
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
  
    * def body_update_4 =
    """
    {
      "id": 205,
      "category": {
        "id": 8,
        "name": "peixe"
      },
      "name": "bill",
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
    * def pet_id_2 = '/205'

    Given url url_base
    And request body_create_6
    When method post
    Then status 200
    And request body_update_4
    When method put
    Then status 200
    * url url_base + pet_id_2
    When method get
    Then status 200
    * url url_base + pet_id_2
    When method delete
    Then status 200