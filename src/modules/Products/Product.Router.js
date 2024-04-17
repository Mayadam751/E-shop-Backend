import {Router} from 'express'
import { addProduct, allProducts, deleteProduct, getproduct, updateProduct } from './Controller/Product.controller.js'


const productRouter=Router()
productRouter.get('/',allProducts)
productRouter.post('/',addProduct)
productRouter.get('/:id',getproduct)
productRouter.patch('/:id',updateProduct)
productRouter.delete('/:id',deleteProduct)
export default productRouter