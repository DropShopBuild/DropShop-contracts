import { MockERC20 } from "../../../types/MockERC20";
import { Raffle } from "../../../types/Raffle";

export const enum raffleStateEnum {
  NOT_STARTED,
  OPEN,
  CALCULATING,
  FINISHED,
}

interface Contracts {
  RaffleContract: Raffle;
  MockERC20Contract: MockERC20;
}

export interface SetupInterface extends Contracts {
  chainId: string;
  user: { address: string } & Contracts;
  sponsor: { address: string } & Contracts;
}
