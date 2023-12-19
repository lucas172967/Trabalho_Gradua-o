Feature: Petstore node criterio

  Background:
    * url 'https://petstore.swagger.io/v2'

  Scenario: initialize AddNewPetValido UpdateAnExistingPetSucess FindPetByIdFalha

    * def body_create_1 =
    """
    {
      "id": 10,
      "category": {
        "id": 0,
        "name": "cachorro"
      },
      "name": "primeiro",
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
    "id": 100,
    "category": {
      "id": 0,
      "name": "cachorro"
    },
    "name": "segundo",
    "photoUrls": [
      "string"
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
  * def pet_id = '/0'

  * def url_base = 'https://petstore.swagger.io/v2/pet'

  Given url url_base
  And request body_create_1
  When method post
  Then status 200
  And request body_update_1
  When method put
  Then status 200
  * url url_base + pet_id
  When method get
  Then status 404


  Scenario: initialize AddNewPetValido UpdateAnExistingPetSucess FindPetByIdSucesso DeletesAPet
    
    * def pet_id = '/10'
    * def url_base = 'https://petstore.swagger.io/v2/pet'

    * def body_create_1 =
    """
    {
      "id": 10,
      "category": {
        "id": 0,
        "name": "cachorro"
      },
      "name": "primeiro",
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
      "id": 10,
      "category": {
        "id": 0,
        "name": "cachorro"
      },
      "name": "segundo",
      "photoUrls": [
        "string"
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
    * def pet_id = '/10'

    * def url_base = 'https://petstore.swagger.io/v2/pet'

    Given url url_base
    And request body_create_1
    When method post
    Then status 200
    And request body_update_1
    When method put
    Then status 200
    * url url_base + pet_id
    When method get
    Then status 200
    When method delete
    Then status 200


  Scenario: initialize AddNewPetValido UpdateAnExistingPetFalha
    * def body_create_1 =
    """
    {
      "id": 10,
      "category": {
        "id": 0,
        "name": "cachorro"
      },
      "name": "primeiro",
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
    10
  """

  * def url_base = 'https://petstore.swagger.io/v2/pet'

  Given url url_base
  And request body_create_1
  When method post
  Then status 200
  And request body_update_1
  When method put
  Then status 415