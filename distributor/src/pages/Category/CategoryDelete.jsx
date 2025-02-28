import { faTimes } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import axios from "axios";
import { PropTypes } from "prop-types";
import { API_BASE_URL } from "../../config/config";
import { toast } from "react-toastify";

export default function DeleteCategory({
  onClose,
  selectedCategoryId,
  refreshCategoryList,
}) {
  const DeleteCategory = async () => {
    try {
      // Call API here
      const response = await axios.delete(
        `${API_BASE_URL}/distributor/delete/category/${selectedCategoryId}`
      );
      if (response.status === 200) {
        toast.success("Xóa danh mục thành công");
        refreshCategoryList();
        onClose();
      } else {
        toast.error("Xóa danh mục thất bại");
      }
    } catch (error) {
      console.error(error);
    }
  };
  return (
    <div className="z-50 fixed top-0 left-0 inset-0 bg-gray-900 bg-opacity-80 flex justify-center items-center h-screen w-full">
      <div className="bg-white p-6 rounded w-1/2 m-auto text-primary h-11/12 overflow-auto shadow-xl">
        <div className="flex justify-end">
          <button
            className="text-primary px-2 hover:bg-primary hover:text-secondary hover:px-2 text-3xl font-bold fixed"
            onClick={onClose}
          >
            <FontAwesomeIcon icon={faTimes} />
          </button>
        </div>
        <div className="">
          <h2 className="text-2xl text-center font-bold">
            Bạn có muốn xóa danh mục
          </h2>
          <p className="text-center text-lg mt-2">
            Danh mục sẽ bị xóa khỏi hệ thống và không thể khôi phục. Bạn có chắc
            chắn muốn xóa danh mục này không?
          </p>
        </div>

        <div className="flex justify-end mt-5">
          <button
            className="bg-red-600 hover:opacity-90 text-white text-xl font-bold py-2 px-4 rounded-xl w-1/6"
            onClick={onClose}
          >
            Hủy
          </button>

          <button
            className="bg-primary hover:bg-primary-700 text-white text-xl font-bold py-2 px-4 rounded-xl ml-5"
            onClick={DeleteCategory}
          >
            Xác nhận
          </button>
        </div>
      </div>
    </div>
  );
}
DeleteCategory.propTypes = {
  onClose: PropTypes.func,
  selectedCategoryId: PropTypes.string,
  refreshCategoryList: PropTypes.func,
};
