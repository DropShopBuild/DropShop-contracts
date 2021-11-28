# IRunDrop

Start a drop and/or enter a drop.
Events are emmitted for different actions.

## Contents

<!-- START doctoc -->
<!-- END doctoc -->

## Functions

### startDrop

Start a drop.

> Let a drop organizer start their drop.

Emits a {DropStateUpdated} event defined in {ICreateDrop}

#### Declaration

```solidity
  function startDrop(
  ) external
```

#### Modifiers:

No modifiers

### depositMoney

Enter a drop by depositing money.

> Transfer currency from the participant to the DropShop Contract

Emits a {NewPayment} event.

#### Declaration

```solidity
  function depositMoney(
  ) external
```

#### Modifiers:

No modifiers

### depositPoints

Increase your odds of winning by depositing sponsor tokens.

> Transfer sponsor tokens from the participant to the DropShop Contract

Emits a {NewPointsDeposit} event.

#### Declaration

```solidity
  function depositPoints(
  ) external
```

#### Modifiers:

No modifiers

## Events

### NewPayment

Emitted when a drop receives a currency payment (eg. USDT).

> Emitted when a `sender` sends a `dropID` drop an `amount` in the form of the drop's
> unit of account.

### NewPointsDeposit

Emitted when a drop recieves a deposit of brand/sponsor points/tokens (eg. Nike Tokens)

> Emitted when a `sender` sends a `dropID` drop an `amount` in the form of the drop's
> accepted brand/sponsor points/token.
