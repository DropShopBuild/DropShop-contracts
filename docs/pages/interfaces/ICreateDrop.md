# ICreateDrop

Create, edit, and/or cancel a drop.
Events are emmitted for different actions.

## Contents

<!-- START doctoc -->
<!-- END doctoc -->

## Functions

### createDrop

Create a drop.

> Initialize a drop with a unique id that maps to its associated collection of drop data.

Emits a {NewDrop} and a {DropStateUpdated} event.

#### Declaration

```solidity
  function createDrop(
  ) external
```

#### Modifiers:

No modifiers

### editDrop

Edit a drop.

> Let drop creators edit a drop by changing the drop's data.

#### Declaration

```solidity
  function editDrop(
  ) external
```

#### Modifiers:

No modifiers

### cancelDrop

Cancel a drop.

> Let drop creators cancel their drop.

Emits a {DropStateUpdated} event.

#### Declaration

```solidity
  function cancelDrop(
  ) external
```

#### Modifiers:

No modifiers

### dropInfo

Get info about a drop.

> Use a drop's unique id to look up and return its
> associate drop data.

#### Declaration

```solidity
  function dropInfo(
  ) external
```

#### Modifiers:

No modifiers

## Events

### DropStateUpdated

Emitted when a drop has been created, started, in the process
of picking winners, finished, or cancelled.

> Emitted when a `dropID` drop moves into a `newState` DropState

### NewDrop

No description

> Emitted when a drop has been initialized with an assigned `dropID`
> and associated `drop` data.

### DropEdited

No description

> Emitted when a `dropID` drop has been edited with with new
> `editedDrop` data.
