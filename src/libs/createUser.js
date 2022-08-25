import User from "../models/User.js";

export const createAdminUser = async () => {
  const userFound = await User.findOne({ email: "admin123@gmail.com" });

  if (userFound) return;

  const newUser = new User({
    username: "admin123",
    email: "admin123@gmail.com",
  });

  newUser.password = await newUser.encryptPassword("admin12345");

  const admin = await newUser.save();

  console.log("Usuario administrador creado", admin);
};
