import connection from "../../../DB/Connection.js"
import jwt from 'jsonwebtoken'
export const allUsers = (req, res, next) => {

    const query = `SELECT * FROM users`
    connection.execute(query, (error, result) => {

        if (error) {
            return res.json({ message: "catch error", error })
        }
        return res.json({ message: "done", result })
    })

}
export const getuser = (req, res, next) => {
    const { id } = req.params

    const query = `SELECT * FROM users WHERE id=${id}`
    connection.execute(query, (error, result) => {

        if (error) {
            return res.json({ message: "catch error", error })
        }
        return res.json({ message: "done", result })
    })

}
export const signUp = (req, res, next) => {
    const { email, name, password } = req.body

    const query = `INSERT INTO users(email,name,password)VALUES('${email}','${name}','${password}')`
    connection.execute(query, (error, result) => {

        if (error) {
            if (error.errno == 1062) {
                return res.json({ message: "email already exists" })
            }
            return res.json({ message: "catch error", error })
        }
        return res.json({ message: "signup success", result,  })
    })

}
export const logIn = (req, res, next) => {
    const { email, password } = req.body;
    const query = `SELECT * FROM users WHERE email = ? AND password = ?`;
    
    connection.execute(query, [email, password], (error, results) => {
        if (error) {
            console.error("Database error:", error);
            return res.status(500).json({ error: 'Internal Server Error' });
        }

        if (results.length > 0) {
            const token = jwt.sign({ email: email, id: results[0].id }, 'mayadasig', { expiresIn: 60 * 60 * 24 });
            return res.status(200).json({ message: 'Login success', token });
        } else {
            return res.status(401).json({ error: 'Invalid email or password' });
        }
    });
};
export const updatePassword = (req, res, next) => {
    const { id } = req.params
    const { password } = req.body
    const query = `UPDATE users SET password='${password}'WHERE id=${id}`
        connection.execute(query, (error, result) => {

            if (error) {
                return res.json({ message: "catch error", error })
            }
            return result.affectedRows? res.json({ message: "done", result }):res.json({message:"user don't exists"})
        }
        )
}
export const deleteUser = (req, res, next) => {
    const { id } = req.params
    
    const query = `DELETE FROM users WHERE id=${id}`
        connection.execute(query, (error, result) => {

            if (error) {
                return res.json({ message: "catch error", error })
            }
            return result.affectedRows? res.json({ message: "done", result }):res.json({message:"user don't exists"})
        }
        )
}
export const profile = (req, res, next) => {
    const { authorization } = req.headers;

    try {
        const payload = jwt.verify(authorization, 'mayadasig');
        const userId = payload.id;

        const query = `SELECT * FROM users WHERE id = ?`;
        connection.execute(query, [userId], (error, results) => {
            if (error) {
                console.error("Database error:", error);
                return res.status(500).json({ message: "Database error", error });
            }

            if (results.length > 0) {
                return res.json({ message: "done", result: results[0] });
            } else {
                return res.status(404).json({ message: "User doesn't exist" });
            }
        });
    } catch (err) {
        if(!payload.id){
            return next(new Error('please login'))
        }
        return res.status(401).json({ message: "Unauthorized" });
    }
};