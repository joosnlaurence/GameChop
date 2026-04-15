import { Button } from "@mantine/core";
import { useAuth } from "../context/AuthContext";

export default function LogoutButton() {
  const { logout } = useAuth();

  const handleLogout = async () => {
    await fetch('http://localhost:3000/auth/logout', {
      method: 'POST',
      credentials: 'include'
    });

    logout();
  }

  return (
    <Button onClick={handleLogout}>
      Logout
    </Button>
  );
}