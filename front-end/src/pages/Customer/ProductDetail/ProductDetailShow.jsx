import { useState, useEffect } from "react";
import axios from "axios";
import { useParams } from "react-router-dom";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faShoppingCart,
  faMoneyBillWave,
} from "@fortawesome/free-solid-svg-icons";
import { addToCart } from "../../../service/CustomerService/cartService.js";
import { jwtDecode } from "jwt-decode";
import { useNavigate } from "react-router-dom";
import { toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import FooterCustomer from "../../../components/CustomerComponent/FooterCustomer/FooterCustomer.jsx";
import { API_BASE_URL } from "../../../config/config.js";
import FarmInfoShow from "../../../components/CustomerComponent/FarmInfoShow/FarmInfoShow.jsx";

export default function ProductDetail() {
  const navigate = useNavigate();
  let { id } = useParams();
  const [product, setProduct] = useState(null);
  const [quantity, setQuantity] = useState(1);

  const handleIncrease = () => {
    setQuantity(quantity + 1);
  };

  const handleDecrease = () => {
    if (quantity > 1) {
      setQuantity(quantity - 1);
    }
  };
  useEffect(() => {
    axios
      .get(`${API_BASE_URL}/product/${id}`)
      .then((response) => {
        setProduct(response.data);
      })
      .catch((error) => console.error(error));
  }, [id]);

  const [currentImage, setCurrentImage] = useState("");
  const [isChanging, setIsChanging] = useState(false);

  const changeImage = (newImage) => {
    setIsChanging(true);
    setTimeout(() => {
      setCurrentImage(newImage);
      setIsChanging(false);
    }, 100);
  };

  const handleAddToCart = () => {
    const token = localStorage.getItem("accessToken");
    if (!token) {
      toast.error("Đăng nhập để thêm vào giỏ hàng!", {
        position: "top-right",
        time: 500,
      });
      navigate("/login");
    } else {
      const decodedToken = jwtDecode(token);
      const userId = decodedToken.userid;
      addToCart(product.productid, userId, quantity)
        .then((response) => {
          response;
          toast.success("Thêm vào giỏ hàng thành công!", {
            position: "top-right",
            time: 500,
          });
        })
        .catch((error) => {
          toast.error(error.response.data.message, {
            position: "top-right",
            time: 500,
          });
        });
    }
  };

  return (
    <>
      <FarmInfoShow />
      {product && (
        <div className="bg-fourth py-5">
          <div className="w-4/5 mx-auto bg-white rounded-md flex p-5">
            {product && (
              <>
                <div className="m-5 w-1/2">
                  <img
                    src={currentImage || product.productimage1}
                    alt="product"
                    className={`object-cover rounded-md w-5/6 m-auto h-80 transition duration-100 ease-in-out ${
                      isChanging ? "opacity-0" : ""
                    }`}
                  />
                  <div className="flex justify-center mt-2">
                    <img
                      src={product.productimage1}
                      alt="product"
                      className="object-cover rounded-md mx-3 w-16 h-10 cursor-pointer"
                      onClick={() => changeImage(product.productimage1)}
                    />
                    <img
                      src={product.productimage2}
                      alt="product"
                      className="object-cover rounded-md mx-3 w-16 h-10 cursor-pointer"
                      onClick={() => changeImage(product.productimage2)}
                    />
                    <img
                      src={product.productimage3}
                      alt="product"
                      className="object-cover rounded-md mx-3 w-16 h-10 cursor-pointer"
                      onClick={() => changeImage(product.productimage3)}
                    />
                  </div>
                </div>
                <div className="w-1/2">
                  <h1 className="text-3xl text-primary font-bold">
                    {product.productname}
                  </h1>
                  <p>Danh mục: Rau, củ, quả</p>
                  <div className="">
                    <span className="text-2xl text-primary font-bold">
                      {product.productprice} VNĐ
                    </span>
                    <span className="text-md ml-2">/kg</span>
                  </div>
                  <div className="my-4 w-full h-1 bg-primary"></div>
                  <div className="">
                    <p className="">
                      Giao hàng từ: <span>Đà Lạt</span>
                    </p>
                    <p className="">
                      Số lượng: <span>{product.productquantity} kg</span>
                    </p>
                    <p className="">
                      Trạng thái:{" "}
                      <span>
                        {product.productquantity > 0 ? "Còn hàng" : "Hết hàng"}
                      </span>
                    </p>
                    <p className="flex">
                      Số lượng:{" "}
                      <span className="flex items-center space-x-2 ml-3">
                        <button
                          onClick={handleDecrease}
                          className="px-2 py-1 bg-gray-200 text-gray-700 rounded hover:bg-gray-300"
                        >
                          -
                        </button>
                        <span className="px-2">{quantity}</span>
                        <button
                          onClick={handleIncrease}
                          className="px-2 py-1 bg-gray-200 text-gray-700 rounded hover:bg-gray-300"
                        >
                          +
                        </button>
                      </span>
                    </p>
                    <div className="">
                      <button
                        className="bg-primary text-white p-3 rounded-md mt-4"
                        onClick={handleAddToCart}
                      >
                        Thêm vào giỏ hàng
                        <FontAwesomeIcon
                          icon={faShoppingCart}
                          className="ml-2"
                        />
                      </button>
                      <button className="bg-primary text-white p-3 rounded-md mt-4 ml-2">
                        Mua ngay{" "}
                        <FontAwesomeIcon
                          icon={faMoneyBillWave}
                          className="ml-2"
                        />
                      </button>
                    </div>
                    <p>
                      Ngày hết hạn:{" "}
                      <span>
                        {new Date(product.expirydate).toLocaleDateString(
                          "vi-VN"
                        )}
                      </span>
                    </p>
                    <p>
                      Bình luận:{" "}
                      <span>
                        {new Date(product.expirydate).toLocaleDateString(
                          "vi-VN"
                        )}
                      </span>
                    </p>
                    <p>
                      Đánh giá:{" "}
                      <span>
                        {new Date(product.expirydate).toLocaleDateString(
                          "vi-VN"
                        )}
                      </span>
                    </p>
                  </div>
                </div>
              </>
            )}
          </div>

          <div className="w-4/5 mx-auto bg-white rounded-md p-5 mt-5">
            <h1 className="font-bold text-primary text-2xl">
              Thông tin chi tiết về sản phẩm
            </h1>
          </div>
          <div className="w-4/5 mx-auto bg-white rounded-md p-5 mt-5">
            <p className="text-justify text-base m-3">{product.overviewdes}</p>

            {product.healtbenefit && (
              <>
                <p className="text-justify text-xl font-bold m-3">
                  Lợi ích đối với sức khỏe
                </p>
                <p className="text-justify text-base m-3">
                  {product.healtbenefit}
                </p>
              </>
            )}

            {product.storagemethod && (
              <>
                <p className="text-justify text-xl font-bold m-3">
                  Phương pháp bảo quản sản phẩm
                </p>
                <p className="text-justify text-base m-3">
                  {product.storagemethod}
                </p>
              </>
            )}
            {product.cookingmethod && (
              <>
                <p className="text-justify text-xl font-bold m-3">
                  Phương pháp chế biến sản phẩm
                </p>
                <p className="text-justify text-base m-3">
                  {product.cookingmethod}
                </p>
              </>
            )}
          </div>

          <div className="w-4/5 mx-auto bg-white rounded-md p-5 mt-5">
            <h1 className="font-bold text-primary text-2xl">
              Bình luận, đánh giá
            </h1>
          </div>

          <div className="w-4/5 mx-auto bg-white rounded-md p-5 mt-5">
            <h1 className="font-bold text-primary text-2xl">
              Sản phẩm liên quan
            </h1>
          </div>
        </div>
      )}
      <FooterCustomer />
    </>
  );
}
