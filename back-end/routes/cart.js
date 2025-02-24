const router = require("express").Router();
const cartController = require('../controllers/cartController');

router.post('/add-cart', cartController.addToCart);
router.get('/cart/:userId', cartController.getAllCart);
router.put('/update-quantity-cart', cartController.updateQuantityCart);
router.delete('/delete-cart/:userId/:productId', cartController.removeFromCart);

module.exports = router;