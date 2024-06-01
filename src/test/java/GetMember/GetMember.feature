@GetMember
Feature: Obtener de Members

  Background:
    * def globalHeaders = read('../CreateMember/headers.json')
    * def sleep = function(pause){ java.lang.Thread.sleep(pause*1000) }




    @ValidarObtenerMiembro
    Scenario Outline:  Validar la obtencion del miembro <Obtener>

      Given url 'http://localhost:5002/api/members/<Obtener>'
      When headers globalHeaders
      * configure charset = null
      * method GET
      Then status 200


      Examples:
        |Obtener|
        | 3     |
        | 4     |