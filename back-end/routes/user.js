const router = require("express").Router();
const userController = require("../controllers/userController");

router.get("/user/:id", userController.getUserById);
router.put("/user/change-password", userController.changePassword);
router.put("/user/change-info", userController.changeInfo);
router.put(
  "/user/change/avatar/:userId",
  userController.upload.single("avatar"),
  userController.changeAvatarCustomer
);
router.put(
  "/farms/update/avatar/:userId",
  userController.upload.single("avatar"),
  userController.updateAvatarFarm
);
router.get("/farmer", userController.getAllFarmer);
router.get("/farmer/detail/:userId", userController.getFarmerDetails);
router.put("/farmer/update/status/:userId", userController.updateFarmerStatus);

module.exports = router;
