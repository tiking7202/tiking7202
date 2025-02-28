import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faUser,
  faShoppingCart,
  faCheckCircle,
} from "@fortawesome/free-solid-svg-icons";
import "../../../../App.css";
import { useNavigate } from "react-router-dom";
import { toast, ToastContainer } from "react-toastify";
import { useEffect } from "react";
import { useToast } from "../../../../context/ToastContext";
import Loading from "../../../../components/Loading";
import { useState } from "react";
import { useLocation } from "react-router-dom";
import { API_BASE_URL } from "../../../../config/config";
import axios from "axios";

function RegisterFarmerStep3() {
  const navigate = useNavigate();
  const [loading, setLoading] = useState(false);

  const location = useLocation();
  const userId = new URLSearchParams(location.search).get("userId");

  const { toastMessage, setToastMessage } = useToast();
  useEffect(() => {
    if (toastMessage) {
      toast.success(toastMessage);
      setToastMessage(null);
    }
  }, [toastMessage, setToastMessage, navigate]);

    const registerFarmerStep3 = async () => {
      try {
        // Call api to register farmer step 3
        const response = await axios.post(
          `${API_BASE_URL}/auth/farmer/register/step3/${userId}`
        );
        setToastMessage(response.data.message);
      } catch (error) {
        console.error("Error:", error);
      }
    };
  
  const handleNext = async () => {
    setLoading(true);
    registerFarmerStep3()
    setLoading(false);
    navigate(`/farmer/login`);
  };
  return (
    <div className="h-screen  bg-fourth flex flex-col">
      {loading ? (
        <div className="flex justify-center items-center h-full w-full">
          <Loading />
        </div>
      ) : (
        <>
          <ToastContainer />
          <div className=" bg-fourth px-10 py-3">
            <div className="bg-white ml-10 mr-10  flex flex-col py-2 rounded-xl shadow-2xl">
              <p className="text-center text-2xl text-primary font-bold p-2">
                ĐĂNG KÝ ĐỂ ĐƯA NÔNG SẢN CỦA BẠN ĐẾN VỚI NGƯỜI TIÊU DÙNG KHẮP NƠI
                TRÊN LÃNH THỔ VIỆT NAM
              </p>
            </div>

            {/* Register form */}
            <div className=" ml-10 mr-10 shadow-2xl bg-white mt-5 flex justify-center py-10 rounded-xl">
              {/* Icon tài khoản */}
              <div className="mr-40 relative flex flex-col items-center">
                {/* Icon */}
                <FontAwesomeIcon
                  icon={faUser}
                  className="text-gray-900 text-4xl"
                />
                <p className="text-center mt-2">Đăng ký tài khoản</p>
                {/* Đường kẻ */}
                <div className="absolute top-1/2 left-full transform -translate-y-1/2 h-0.5 bg-gray-900 w-40  "></div>
              </div>

              {/* Icon giỏ hàng */}
              <div className="mr-40 relative flex flex-col items-center">
                {/* Icon */}
                <FontAwesomeIcon
                  icon={faShoppingCart}
                  className=" text-gray-900 text-4xl"
                />
                <p className="text-center mt-2">Đăng ký gian hàng</p>
                {/* Đường kẻ */}
                <div className="absolute top-1/2 left-full transform -translate-y-1/2 h-0.5 bg-gray-900 w-40"></div>
              </div>

              {/* Icon hoàn thành */}
              <div className="relative flex flex-col items-center">
                {/* Icon */}
                <FontAwesomeIcon
                  icon={faCheckCircle}
                  className="text-green-600 text-4xl"
                />
                <p className="text-center text-green-600 mt-2 font-bold">Hoàn thành</p>
              </div>
            </div>

            {/* Complete */}
            <div className="bg-white flex items-center justify-center flex-col mt-5 ml-40 mr-40 py-5 rounded-xl">
              {/* Icon hoàn thành */}
              <FontAwesomeIcon
                icon={faCheckCircle}
                className="text-primary text-8xl"
              />

              {/* Dòng "ĐĂNG KÝ THÀNH CÔNG" */}
              <p className="text-xl font-extrabold mt-4 text-primary">
                YÊU CẦU ĐÃ GỬI THÀNH CÔNG
              </p>

              {/* Dòng "Chúc mừng bạn đã trở thành nhà cung cấp của AgriMart" */}
              <p className="text-center mt-2 font-semibold text-primary">
                Cảm ơn bạn đã gửi yêu cầu để trở thành nhà cung cấp của AgriMart
              </p>

              <div className="flex justify-center w-full mt-10">
                <button
                  onClick={handleNext}
                  className="bg-primary text-white py-3 px-14 rounded-xl font-bold"
                >
                  Hoàn Thành
                </button>
              </div>
            </div>
          </div>
        </>
      )}
    </div>
  );
}

export default RegisterFarmerStep3;
