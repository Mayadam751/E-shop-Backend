import cartRouter from './modules/Cart/cartRouter.js'
import productRouter from './modules/Products/Product.Router.js'
import userRouter from './modules/User/User.Router.js'
import cors from 'cors'


export const indexRouter=(app,express)=>{
    app.use(cors({origin: "http://localhost:3000"}))
    app.use(express.json())
app.use('/user',userRouter)
app.use('/product',productRouter)
app.use('/cart',cartRouter)

}

export default indexRouter