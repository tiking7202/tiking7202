import { faTimes } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import axios from "axios";
import { PropTypes } from "prop-types";
import { useState } from "react";
import { toast } from "react-toastify";
import { API_BASE_URL } from "../../config/config";
import Loading from "../Loading";

export default function ChangeLogoDialog({ onClose, farm, refreshFarm }) {
  const [farmimage, setFarmImage] = useState(farm.farmimage);
  const [farmimage1, setFarmImage1] = useState(farm.farmimage1);
  const [farmimage2, setFarmImage2] = useState(farm.farmimage2);
  const [farmimage3, setFarmImage3] = useState(farm.farmimage3);

  const [farmimageError, setFarmImageError] = useState("");
  const [farmimage1Error, setFarmImage1Error] = useState("");
  const [farmimage2Error, setFarmImage2Error] = useState("");
  const [farmimage3Error, setFarmImage3Error] = useState("");

  const [loading, setLoading] = useState(false); // Thêm state loading

  const farmname = farm.farmname;
  const farmId = farm.farmid;

  const validateForm = () => {
    let isvalid = true;

    if (!farmimage) {
      setFarmImageError("Hình ảnh chính của trang trại là bắt buộc");
      isvalid = false;
    }
    if (!farmimage1) {
      setFarmImage1Error("Hình ảnh phụ 1 của trang trại là bắt buộc");
      isvalid = false;
    }
    if (!farmimage2) {
      setFarmImage2Error("Hình ảnh phụ 2 của trang trại là bắt buộc");
      isvalid = false;
    }
    if (!farmimage3) {
      setFarmImage3Error("Hình ảnh phụ 3 của trang trại là bắt buộc");
      isvalid = false;
    }

    return isvalid;
  };

  const handleSubmit = async () => {
    if (!validateForm()) {
      return;
    }
    setLoading(true);
    try {
      const formData = new FormData();
      formData.append("farmimage", farmimage);
      formData.append("farmimage1", farmimage1);
      formData.append("farmimage2", farmimage2);
      formData.append("farmimage3", farmimage3);
      formData.append("farmId", farmId);
      formData.append("farmname", farmname);

      const response = await axios.put(
        `${API_BASE_URL}/farms/updateimage/${farmId}`,
        formData,
        {
          headers: {
            "Content-Type": "multipart/form-data",
          },
        }
      );

      if (response.status === 200) {
        onClose();
        toast.success("Cập nhật hình ảnh thành công");
        refreshFarm();
      }
    } catch (error) {
      console.error(error);
    } finally {
      setLoading(false); 
    }
  };

  return (
    <div className="z-50 fixed top-0 left-0 inset-0 bg-gray-900 bg-opacity-80 flex justify-center items-center m-auto">
      <div className="bg-white p-4 rounded-lg w-1/2 m-auto text-primary h-7/12 overflow-auto shadow-xl border border-primary">
        <div className="flex justify-end">
          <button
            className="text-primary px-2 hover:bg-primary hover:text-secondary hover:px-2 text-3xl font-bold fixed"
            onClick={onClose}
          >
            <FontAwesomeIcon icon={faTimes} />
          </button>
        </div>
        <h2 className="text-3xl text-center font-bold mb-4">
          Thay đổi hình ảnh trang trại
        </h2>
        {loading ? (
          <div className="flex justify-center items-center h-full w-full">
            <Loading />
          </div>
        ) : (
          <div className="p-3 my-2">
            {/* Input cho farmimage */}
            <div className="bg-secondary m-3 flex">
              <div className="w-full">
                <label
                  className="block text-xl text-primary font-bold mb-2"
                  htmlFor="farmimage"
                >
                  Hình ảnh chính
                </label>
                <input
                  type="file"
                  className="bg-fourth text-base text-primary p-2 rounded-xl w-full border border-gray-500"
                  onChange={(e) => setFarmImage(e.target.files[0])}
                />
                {farmimageError && (
                  <p className="text-red-500 italic">{farmimageError}</p>
                )}
              </div>
            </div>
            {/* Input cho farmimage1 */}
            <div className="bg-secondary m-3 flex">
              <div className="w-full">
                <label
                  className="block text-xl text-primary font-bold mb-2"
                  htmlFor="farmimage1"
                >
                  Hình ảnh phụ 1
                </label>
                <input
                  type="file"
                  className="bg-fourth text-base text-primary p-2 rounded-xl w-full border border-gray-500"
                  onChange={(e) => setFarmImage1(e.target.files[0])}
                />
                {farmimage1Error && (
                  <p className="text-red-500 italic">{farmimage1Error}</p>
                )}
              </div>
            </div>
            {/* Input cho farmimage2 */}
            <div className="bg-secondary m-3 flex">
              <div className="w-full">
                <label
                  className="block text-xl text-primary font-bold mb-2"
                  htmlFor="farmimage2"
                >
                  Hình ảnh phụ 2
                </label>
                <input
                  type="file"
                  className="bg-fourth text-base text-primary p-2 rounded-xl w-full border border-gray-500"
                  onChange={(e) => setFarmImage2(e.target.files[0])}
                />
                {farmimage2Error && (
                  <p className="text-red-500 italic">{farmimage2Error}</p>
                )}
              </div>
            </div>
            {/* Input cho farmimage3 */}
            <div className="bg-secondary m-3 flex">
              <div className="w-full">
                <label
                  className="block text-xl text-primary font-bold mb-2"
                  htmlFor="farmimage3"
                >
                  Hình ảnh phụ 3
                </label>
                <input
                  type="file"
                  className="bg-fourth text-base text-primary p-2 rounded-xl w-full border border-gray-500"
                  onChange={(e) => setFarmImage3(e.target.files[0])}
                />
                {farmimage3Error && (
                  <p className="text-red-500 italic">{farmimage3Error}</p>
                )}
              </div>
            </div>
            <div className="flex justify-end mt-5">
              <button
                className="bg-primary hover:opacity-90 text-white font-bold py-2 px-3 m-3 rounded-lg"
                onClick={handleSubmit}
              >
                Lưu thay đổi
              </button>
            </div>
          </div>
        )}
      </div>
    </div>
  );
}

ChangeLogoDialog.propTypes = {
  onClose: PropTypes.func,
  farm: PropTypes.object,
  refreshFarm: PropTypes.func,
};