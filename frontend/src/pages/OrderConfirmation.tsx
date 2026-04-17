import { useLocation, useNavigate } from "react-router-dom";
import {
  Box,
  Button,
  Divider,
  Group,
  Paper,
  Stack,
  Text,
  ThemeIcon,
  Title,
} from "@mantine/core";
import {
  IconCheck,
  IconDownload,
  IconPackage,
} from "@tabler/icons-react";
import type { CartItem } from "../context/CartContext";

interface OrderState {
  orderNumber: string;
  items: CartItem[];
  subtotal: number;
  tax: number;
  total: number;
}

export default function OrderConfirmation() {
  const location = useLocation();
  const navigate = useNavigate();
  const state = location.state as OrderState | null;

  const hasDigital = state?.items.some((i) => i.type === "Digital");
  const hasPhysical = state?.items.some((i) => i.type === "Physical");

  return (
    <Box maw={640} mx="auto" py="xl" px="md">
      {/* Header */}
      <Stack align="center" gap="xs" mb="xl">
        <ThemeIcon size={72} radius="xl" color="violet" variant="light">
          <IconCheck size={40} stroke={2.5} />
        </ThemeIcon>
        <Title order={1} mt="sm">
          Order placed successfully!
        </Title>
        <Text c="dimmed">Thank you for your purchase</Text>
        {state?.orderNumber && (
          <Text size="sm" c="dimmed">
            Order Number:{" "}
            <Text span fw={600} c="white">
              {state.orderNumber}
            </Text>
          </Text>
        )}
      </Stack>

      {/* Order Summary */}
      <Paper p="xl" radius="md" bg="dark.7" mb="md">
        <Title order={3} mb="md">
          Order Summary
        </Title>

        <Stack gap={0}>
          {state?.items.map((item) => (
            <Group
              key={item.game_id}
              justify="space-between"
              py="sm"
              style={{ borderBottom: "1px solid var(--mantine-color-dark-5)" }}
            >
              <Group gap="sm">
                <ThemeIcon
                  size={36}
                  radius="md"
                  color="violet"
                  variant="light"
                >
                  {item.type === "Digital" ? (
                    <IconDownload size={18} />
                  ) : (
                    <IconPackage size={18} />
                  )}
                </ThemeIcon>
                <div>
                  <Text fw={500}>{item.title}</Text>
                  <Text size="xs" c="dimmed">
                    {item.type === "Digital" ? "Digital Download" : "Physical Pickup"}
                  </Text>
                </div>
              </Group>
              <Text fw={500}>
                ${parseFloat(item.price.toString().replace("$", "")).toFixed(2)}
              </Text>
            </Group>
          ))}
        </Stack>

        <Stack gap="xs" mt="md">
          <Group justify="space-between">
            <Text c="dimmed">Subtotal</Text>
            <Text>${state?.subtotal.toFixed(2) ?? "0.00"}</Text>
          </Group>
          <Group justify="space-between">
            <Text c="dimmed">Tax</Text>
            <Text>${state?.tax.toFixed(2) ?? "0.00"}</Text>
          </Group>
          <Divider my="xs" />
          <Group justify="space-between">
            <Text fw={700} size="lg">
              Total
            </Text>
            <Text fw={700} size="lg" c="violet.4">
              ${state?.total.toFixed(2) ?? "0.00"}
            </Text>
          </Group>
        </Stack>
      </Paper>

      {/* What's Next */}
      {(hasDigital || hasPhysical) && (
        <Paper p="xl" radius="md" bg="dark.7" mb="xl">
          <Title order={3} mb="md">
            What's Next?
          </Title>
          <Stack gap="sm">
            {hasDigital && (
              <Paper p="md" radius="md" bg="dark.8">
                <Group gap="sm" align="flex-start">
                  <ThemeIcon size={36} radius="md" color="violet" variant="light" mt={2}>
                    <IconDownload size={18} />
                  </ThemeIcon>
                  <div>
                    <Text fw={600} mb={4}>
                      Digital Downloads
                    </Text>
                    <Text size="sm" c="dimmed">
                      Your digital games are now available in your library. Start
                      downloading and playing immediately!
                    </Text>
                  </div>
                </Group>
              </Paper>
            )}
            {hasPhysical && (
              <Paper p="md" radius="md" bg="dark.8">
                <Group gap="sm" align="flex-start">
                  <ThemeIcon size={36} radius="md" color="violet" variant="light" mt={2}>
                    <IconPackage size={18} />
                  </ThemeIcon>
                  <div>
                    <Text fw={600} mb={4}>
                      Physical Pickup
                    </Text>
                    <Text size="sm" c="dimmed">
                      Your physical games will be ready for pickup at your selected
                      store within 2–4 hours. We'll send you an email when they're
                      ready.
                    </Text>
                  </div>
                </Group>
              </Paper>
            )}
          </Stack>
        </Paper>
      )}

      {/* Actions */}
      <Group grow gap="md">
        <Button
          size="lg"
          color="violet"
          radius="md"
          onClick={() => navigate("/my-games")}
        >
          View Library
        </Button>
        <Button
          size="lg"
          variant="default"
          radius="md"
          onClick={() => navigate("/browse")}
        >
          Continue Shopping
        </Button>
      </Group>
    </Box>
  );
}
