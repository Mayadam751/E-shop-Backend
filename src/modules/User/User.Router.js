import {Router} from 'express'
import { allUsers, deleteUser, getuser, logIn, profile, signUp, updatePassword,} from './Controller/User.Controller.js'


const userRouter=Router()
userRouter.get('/',allUsers)
userRouter.get('/profile',profile)
userRouter.get('/:id',getuser)
userRouter.post('/',signUp)
userRouter.post('/login',logIn)
userRouter.patch('/:id',updatePassword)
userRouter.delete('/:id',deleteUser)

export default userRouter