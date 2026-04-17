import { Button } from "@mantine/core";
import { useAuth } from "../context/AuthContext";
import { api_url } from "../global";

export default function LogoutButton() {
  const { logout } = useAuth();

  const handleLogout = async () => {
    await fetch(api_url('/auth/logout'), {
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