Feature: Aries agent issue credential functions RFC 0036

  Background: create a schema and credential definition in order to issue a credential
    Given "Acme" has a public did
    And "Acme" is ready to issue a credential

  @T001-AIP10-RFC0036 @AcceptanceTest @P1 @Indy @RFC0036
  Scenario: Issue a credential with the Holder beginning with a proposal
    Given "2" agents
      | name  | role   |
      | Acme  | issuer |
      | Bob   | holder |
    And "Acme" and "Bob" have an existing connection
    When "Bob" proposes a credential to "Acme"
    And "Acme" offers a credential
    And "Bob" requests the credential
    And "Acme" issues the credential
    And "Bob" acknowledges the credential issue
    Then "Bob" has the credential issued

  @T002-AIP10-RFC0036 @AcceptanceTest @P2 @Indy @RFC0036
    Scenario: Issue a credential with the Holder beginning with a proposal with negotiation
    Given "2" agents
      | name  | role   |
      | Acme  | issuer |
      | Bob   | holder |
    And "Acme" and "Bob" have an existing connection
    And "Bob" proposes a credential to "Acme"
    And "Acme" offers a credential
    When "Bob" negotiates the offer with another proposal of the credential to "Acme"
    And "Acme" Offers the credential
    And "Bob" requests the credential
    And "Acme" issues the credential
    And "Bob" acknowledges the credential issue
    Then "Bob" has the credential issued
  
  @T003-AIP10-RFC0036 @AcceptanceTest @P1 @Indy @RFC0036
  Scenario: Issue a credential with the Issuer beginning with an offer
    Given "2" agents
      | name  | role   |
      | Acme  | issuer |
      | Bob   | holder |
    And "Acme" and "Bob" have an existing connection
    When "Acme" offers a credential
    And "Bob" requests the credential
    And "Acme" issues the credential
    And "Bob" acknowledges the credential issue
    Then "Bob" has the credential issued

  @T004-AIP10-RFC0036 @AcceptanceTest @P2 @Indy @RFC0036
  Scenario: Issue a credential with the Issuer beginning with an offer with negotiation
    Given "2" agents
      | name  | role   |
      | Acme  | issuer |
      | Bob   | holder |
    And "Acme" and "Bob" have an existing connection
    And "Acme" offers a credential
    When "Bob" negotiates the offer with a proposal of the credential to "Acme"
    And "Acme" Offers the credential
    And "Bob" requests the credential
    And "Acme" issues the credential
    And "Bob" acknowledges the credential issue
    Then "Bob" has the credential issued

  @T005-AIP10-RFC0036 @wip @AcceptanceTest @P3 @RFC0036
  Scenario: Issue a credential with negotiation beginning from a credential request
    Given "2" agents
      | name  | role   |
      | Acme  | issuer |
      | Bob   | holder |
    And "Acme" and "Bob" have an existing connection
    When "Bob" requests the credential
    And "Acme" offers a credential
    When "Bob" negotiates the offer with a proposal of the credential to "Acme"
    And "Acme" offers a credential
    And "Acme" issues the credential
    And "Bob" acknowledges the credential issue
    Then "Bob" has the credential issued

  @T006-AIP10-RFC0036 @wip @AcceptanceTest @P1 @RFC0036
  Scenario: Issue a credential with the Holder beginning with a request and is accepted
    Given "2" agents
      | name  | role   |
      | Acme  | issuer |
      | Bob   | holder |
    And "Acme" and "Bob" have an existing connection
    When "Bob" requests the credential
    And "Acme" issues the credential
    And "Bob" acknowledges the credential issue
    Then "Bob" has the credential issued