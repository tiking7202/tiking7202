import { jwtDecode } from "jwt-decode";
import FooterCustomer from "../../../components/CustomerComponent/FooterCustomer/FooterCustomer";
import HeaderCustomer from "../../../components/CustomerComponent/HeaderCustomer/HeaderCustomer";
import { useEffect, useState } from "react";
import { API_BASE_URL } from "../../../config/config";
import axios from "axios";
import { formatDate } from "./../../../utils/formatDate";
import ChangePasswordDialog from "../../../components/ChangePasswordDialog";
import ChangeInfoDialog from "../../../components/ChangeInfoDialog";

export default function DetailInfoPage() {
  const token = localStorage.getItem("accessToken");
  const decodedToken = jwtDecode(token);
  const userId = decodedToken.userid;
  const [user, setUser] = useState({});

  useEffect(() => {
    const fetchUser = async () => {
      const response = await axios.get(`${API_BASE_URL}/user/${userId}`);
      setUser(response.data);
    };

    fetchUser();
  }, [userId]);

  const [isOpenChangePassword, setIsOpenChangePassword] = useState(false);
  const openChangePasswordDialog = () => {
    setIsOpenChangePassword(true);
  };

  const [isOpenChangeInfo, setIsOpenChangeInfo] = useState(false);
  const openChangeInfoDialog = () => {
    setIsOpenChangeInfo(true);
  };

  const refreshUser = async () => {
    const response = await axios.get(`${API_BASE_URL}/user/${userId}`);
    setUser(response.data);
  };

  return (
    <div>
      <HeaderCustomer />
      <div className="bg-fourth pb-7">
        <div className="w-4/5 mx-auto bg-white rounded-md p-5 mt-32">
          <h1 className="font-bold text-primary text-2xl">Thông tin cá nhân</h1>
        </div>
        <div className="rounded-lg w-4/5 m-auto bg-secondary mt-5 p-5">
          {user && (
            <div className="flex flex-wrap justify-between ">
              <div className="p-5 flex flex-col w-7/12">
                <div className="flex">
                  <p className="font-bold text-xl p-3 text-primary">
                    Họ và tên:{" "}
                  </p>
                  <p className="text-xl p-3 font-medium">{user.fullname}</p>
                </div>
                <div className="flex">
                  <p className="font-bold text-xl p-3 text-primary">Email: </p>
                  <p className="text-xl p-3 font-medium">{user.email}</p>
                </div>
                <div className="flex">
                  <p className="font-bold text-xl p-3 text-primary">
                    Username:{" "}
                  </p>
                  <p className="text-xl p-3 font-medium">{user.username}</p>
                </div>
                <div className="flex">
                  <p className="font-bold text-xl p-3 text-primary">Mật khẩu</p>
                  <p
                    className="text-xl p-3 text-primary cursor-pointer italic font-medium"
                    onClick={() => openChangePasswordDialog()}
                  >
                    Thay đổi
                  </p>
                </div>
                <div className="flex">
                  <p className="font-bold text-xl p-3 text-primary">
                    Số điện thoại:{" "}
                  </p>
                  <p className="text-xl p-3 font-medium">{user.phonenumber}</p>
                </div>
                <div className="flex">
                  <p className="font-bold text-xl p-3 text-primary">
                    Địa chỉ:{" "}
                  </p>
                  <p className="text-xl p-3 font-medium">
                    {user.street +
                      ", " +
                      user.commune +
                      ", " +
                      user.district +
                      ", " +
                      user.province +
                      "."}
                  </p>
                </div>
                <div className="flex">
                  <p className="font-bold text-xl p-3 text-primary">
                    Ngày sinh:
                  </p>
                  <p className="text-xl p-3 font-medium">
                    {formatDate(user.dob)}
                  </p>
                </div>
                <div className="flex">
                  <p className="font-bold text-xl p-3 text-primary">Số CCCD:</p>
                  <p className="text-xl p-3 font-medium">
                    {user.indentitycard}
                  </p>
                </div>
                <div className="flex justify-end">
                  <button
                    className="bg-primary text-secondary font-bold text-xl p-2 rounded-md mt-5"
                    onClick={() => openChangeInfoDialog()}
                  >
                    Thay đổi thông tin
                  </button>
                </div>
              </div>

              <div className="p-5 w-4/12 border-l-2 border-primary">
                <div className="flex flex-col items-center">
                  <img
                    src={user.avatar}
                    alt="avatar"
                    className="rounded-full w-60 h-60 object-cover"
                  />
                  <button className="font-bold text-primary text-xl">
                    Thay đổi
                  </button>
                </div>
              </div>
            </div>
          )}
        </div>
      </div>
      <FooterCustomer />
      {isOpenChangePassword && (
        <ChangePasswordDialog
          onClose={() => setIsOpenChangePassword(false)}
          userId={userId}
          Role={user.role}
        />
      )}
      {isOpenChangeInfo && (
        <ChangeInfoDialog
          onClose={() => setIsOpenChangeInfo(false)}
          user={user}
          refreshUser={refreshUser}
        />
      )}
    </div>
  );
}
