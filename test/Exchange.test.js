import { tokens, EVM_REVERT } from './helpers'

const Token = artifacts.require('./Token')
const Exchange = artifacts.require('./Exchange')

require('chai')
  .use(require('chai-as-promised'))
  .should()

contract('Exchange', ([deployer, feeAccount]) => {
  let exchange;
  let token;
  const feePercent = 10;

  beforeEach(async () => {
    token = await Token.new()
    exchange = await Exchange.new(feeAccount, feePercent)
  })

  describe('deployment', () => {
    it('tracks the fee account', async () => {
      const result = await exchange.feeAccount()
      result.should.equal(feeAccount)
    })

    it('tracks the fee percent', async () => {
      const result = await exchange.feePercent()
      result.toString().should.equal(feePercent.toString())
    })
  })

  describe('depositing tokens', () => {
    beforeEach(async () => {
      await token.approve(exchange.address, tokens(10))
    })

    describe('success', () =>{
      it('tracks the token deposit', async() => {

      })
    })
    describe('failure', () => {

    })
  })
})