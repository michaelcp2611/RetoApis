@CreateMember
Feature: Creacion de Members

  Background:
    * def globalHeaders = read('../CreateMember/headers.json')
    * def body = read('../CreateMember/body.json')
    * def sleep = function(pause){ java.lang.Thread.sleep(pause*1000) }


  @ValidarNombreCorrecto
  Scenario Outline: Validar la creacion del member: <title>
    Given url 'http://localhost:5002/api/members'
    When headers globalHeaders
    * configure charset = null
    * request body
    * method POST
    * match response.name == '<name>'
    Then status 201
    * sleep(2)

    Examples:
      |title  |name     |gender   |
      |Pepita |Pepita   |female   |
      |Angel  |Angel    |male     |




    @ValidarGeneroCorrecto
    Scenario Outline: Validar la creacion del member: <title>
      Given url 'http://localhost:5002/api/members'
      When headers globalHeaders
      * configure charset = null
      * request body
      * method POST
      * match response.msg == 'Gender should be either male or female only'
      Then status 400

      Examples:
        |title  |name     |gender         |
        |Pepita |Pepita   |femenino       |
        |Angel  |Angel    |masculino      |