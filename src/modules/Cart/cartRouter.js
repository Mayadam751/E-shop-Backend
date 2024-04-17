import {Router} from 'express'
import addToCart from './cartController/cartController.js'



const cartRouter=Router()
cartRouter.post('/',addToCart)

export default cartRouter