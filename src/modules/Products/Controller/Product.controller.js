import connection from "../../../DB/Connection.js"

export const allProducts = (req, res, next) => {

    const query = `SELECT * FROM product`
    connection.execute(query, (error, data) => {

        if (error) {
            return res.json({ message: "catch error", error })
        }
        return res.json({ message: "done", data })
    })

}
export const addProduct = (req, res, next) => {
    const { name,description,price } = req.body

    const query = `INSERT INTO product(name, description, price)VALUES('${name}','${description}','${price}')`
    connection.execute(query, (error, result) => {

        if (error) {
            if (error.errno == 1062) {
                return res.json({ message: "email already exists" })
            }
            return res.json({ message: "catch error", error })
        }
        return res.json({ message: "done", result })
    })

}
export const getproduct = (req, res, next) => {
    const { id } = req.params

    const query = `SELECT * FROM product WHERE id=${id}`
    connection.execute(query, (error, result) => {

        if (error) {
            return res.json({ message: "catch error", error })
        }
        return res.json({ message: "done", result })
    })

}
export const updateProduct = (req, res, next) => {
    const { id } = req.params
    const { name,description,price } = req.body
    const query = `UPDATE product SET name = '${name}', description = '${description}', price = '${price}'
    WHERE id = ${id};`
        connection.execute(query, (error, result) => {

            if (error) {
                return res.json({ message: "catch error", error })
            }
            return result.affectedRows? res.json({ message: "done", result }):res.json({message:"product don't exists"})
        }
        )
}
export const deleteProduct = (req, res, next) => {
    const { id } = req.params
    const query = `DELETE FROM product WHERE id=${id}`
        connection.execute(query, (error, result) => {

            if (error) {
                return res.json({ message: "catch error", error })
            }
            return result.affectedRows? res.json({ message: "done", result }):res.json({message:"product don't exists"})
        }
        )
}


