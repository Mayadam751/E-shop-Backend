const addToCart = (req, res,next) => {
    const { productId, quantity } = req.body;
  
    const sql = 'INSERT INTO cart_items (product_id, quantity) VALUES (?, ?)';
    db.query(sql, [productId, quantity], (err, result) => {
      if (err) {
        res.status(500).json({ error: 'Error adding product to cart' });
      } else {
        res.status(201).json({ message: 'Product added to cart successfully' });
      }
    });
  };
  export default addToCart