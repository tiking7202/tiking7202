require("dotenv").config();
const pool = require("../config/dbConnect");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const avatarService = require("../services/avatarService");
const { generateAccessToken, generateRefreshToken } = require("../utils/token");

// Đăng ký tài khoản b1
const registerStep1 = async (req, res) => {
  try {
    const { username, password, email, fullname, phonenumber, role, status } = req.body;
    
    // Validate required fields
    if (!username || !password || !email || !fullname || !phonenumber || !role || !status) {
      return res.status(400).send("All fields are required");
    }

    const saltRounds = 10;
    const hashedPassword = await bcrypt.hash(password, saltRounds);

    // Check for existing username
    const existingUsername = await pool.query(
      'SELECT * FROM "User" WHERE username = $1',
      [username]
    );
    if (existingUsername.rows.length > 0) {
      return res.status(400).send("Username đã tồn tại");
    }

    // Check for existing email
    const existingEmail = await pool.query(
      'SELECT * FROM "User" WHERE email = $1',
      [email]
    );
    if (existingEmail.rows.length > 0) {
      return res.status(400).send("Email đã tồn tại, vui lòng chọn email khác");
    }

    // Check for existing fullname
    const existingFullname = await pool.query(
      'SELECT * FROM "User" WHERE fullname = $1',
      [fullname]
    );
    if (existingFullname.rows.length > 0) {
      return res.status(400).send("Họ và tên đã tồn tại, vui lòng chọn họ và tên khác");
    }

    // Check for existing phonenumber
    const existingPhonenumber = await pool.query(
      'SELECT * FROM "User" WHERE phonenumber = $1',
      [phonenumber]
    );
    if (existingPhonenumber.rows.length > 0) {
      return res.status(400).send("Số điện thoại đã tồn tại, vui lòng chọn số điện thoại khác");
    }

    // Insert new user
    const newUser = await pool.query(
      'INSERT INTO "User" (username, password, email, fullname, phonenumber, role, status) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *',
      [username, hashedPassword, email, fullname, phonenumber, role, status]
    );

    res.json(newUser.rows[0]);
  } catch (error) {
    console.error("Error during registration:", error);
    res.status(500).send("Internal Server Error");
  }
};

// Đăng ký tài khoản b2
const registerStep2 = async (req, res) => {
  try {
    // Lưu trữ avatar vào thư mục và cập nhật đường dẫn vào cơ sở dữ liệu
    avatarService.uploadAvatar(req, res, async (err) => {
      if (err) {
        console.error("Error uploading avatar:", err);
        return res.status(500).send("Internal Server Error");
      }
      const { userId } = req.params;
      const { address, identityCard } = req.body;
      if (!address) {
        return res.status(400).send("Địa chỉ không được gửi.");
      }
      const { street, commune, district, province } = address;
      if (!street || !commune || !district || !province) {
        return res.status(400).send("Địa chỉ không đầy đủ.");
      }
      // const avatarPath = req.file.path; // Đường dẫn tới file avatar
      const avatarPath = null;
      const updatedUser = await pool.query(
        'UPDATE "User" SET street = $1, commune = $2, district = $3, province = $4, indentitycard = $5, avatar = $6 WHERE userid = $7 RETURNING *',
        [street, commune, district, province, identityCard, avatarPath, userId]
      );

      res.json(updatedUser.rows[0]);
    });
  } catch (error) {
    console.error("Error updating additional info:", error);
    res.status(500).send("Internal Server Error");
  }
};


const login = async (req, res) => {
    try {
        const { usernameOrEmail, password } = req.body;

        const user = await pool.query(
            'SELECT * FROM "User" WHERE UserName = $1 OR Email = $1',
            [usernameOrEmail]
        );
        
        if (user.rows.length === 0) {
            return res.status(400).send("Tên đăng nhập hoặc email không tồn tại");
        }

        const validPassword = await bcrypt.compare(password, user.rows[0].password);
        if (!validPassword) {
            return res.status(400).send("Mật khẩu không chính xác");
        }

        // Generate access token and refresh token
        const accessToken = generateAccessToken(user.rows[0].userid, user.rows[0].username, user.rows[0].fullname, user.rows[0].role, user.rows[0].avatar);
        const refreshToken = generateRefreshToken(user.rows[0].username);

        // Store refresh token in the database
        await pool.query('UPDATE "User" SET refreshToken = $1 WHERE userid = $2', [
            refreshToken,
            user.rows[0].userid,
        ]);

        res.header("auth-token", accessToken).json({ accessToken, refreshToken, avatar: user.rows[0].avatar });
    } catch (error) {
        console.error("Lỗi khi đăng nhập:", error);
        res.status(500).send("Internal Server Error");
    }
};

const refreshToken = async (req, res) => {
    const { token } = req.body;
    if (!token) return res.status(401).send("Refresh Token is required");

    try {
        const user = jwt.verify(token, process.env.JWT_REFRESH_SECRET);
        const accessToken = generateAccessToken(user.username);
        res.json({ accessToken });
    } catch (error) {
        console.error("Lỗi khi refresh token:", error);
        res.status(403).send("Invalid Refresh Token");
    }
};

const logout = async (req, res) => {
    const { username } = req.body;
    try {
        await pool.query('UPDATE "User" SET refreshtoken = null WHERE username = $1', [username]);

        // Vô hiệu hóa caching
        res.setHeader('Cache-Control', 'no-store');
        res.setHeader('Pragma', 'no-cache');
        res.setHeader('Expires', '0');
        
        res.send("Logged out successfully");
    } catch (error) {
        console.error("Lỗi khi đăng xuất:", error);
        res.status(500).send("Internal Server Error");
    }
};

module.exports = {
    registerStep1,
    registerStep2,
    login,
    refreshToken,
    logout,
};
