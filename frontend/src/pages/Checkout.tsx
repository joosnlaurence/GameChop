import { useState } from "react";
import { useCart } from "../context/CartContext";
import { useNavigate } from "react-router-dom";
import { useAuth } from "../context/AuthContext";
import { useStore } from "../context/StoreContext";
import { Title, Text, Stack, Grid, Paper, Group, Badge, TextInput, Button, Divider, Box, Image, Card, alpha} from "@mantine/core";
import SelectStore from "../components/SelectStore";


interface Store
{
  id: number
  address: string
  city: string
  state: string
  open_hour: string
  close_hour: string
  google_map_url: string
}


const formatTime = (time: any) => 
{
  const hour = typeof time === 'number' ? time : parseInt(String(time).split(':')[0])
  const ampm = hour >= 12 ? 'PM' : 'AM'
  const hour12 = hour % 12 === 0 ? 12 : hour % 12
  return `${hour12}:00 ${ampm}`
}

export default function Checkout() {
  const { items, checkout } = useCart();
  const navigate = useNavigate();
  const { user } = useAuth();

  const [cardNumber, setCardNumber] = useState("");
  const [expiry, setExpiry] = useState("");
  const [cvv, setCvv] = useState("");
  const [nameCard, setNameCard] = useState("");
  const { selectedStore, setSelectedStore } = useStore();

  const physicalItem = items.filter((item) => item.type === "Physical");
  const digitalItem = items.filter((item) => item.type === "Digital");
  
  const subTotal = items.reduce((sum, item) => 
  {
    const numeric = parseFloat(item.price.toString().replace("$", ""));
    const qty = item.type === "Physical" ? (item.quantity ?? 1) : 1;
    return sum + numeric * qty;
  }, 0);

  const tax = subTotal * 0.08;
  const total = subTotal + tax;

  const handlePlaceOrder = async () =>
  {
    if(!user)
    {
      return;
    }
    try
    {
      const body = {
        userId: user.id,
        items: items.map((item) => ({
          gameId: item.game_id,
          storeId: item.type === 'Physical' ? selectedStore?.id ?? null : null,
          copies: item.quantity ?? 1,
          isDigital: item.type === 'Digital'
        }))
      }
      console.log('Sending Order:', body);

      const res = await fetch('http://localhost:3000/api/orders', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        credentials: 'include',
        body: JSON.stringify(body)
      })

      const data = await res.json();
      console.log('Response:', data);

      if(!res.ok)
      {
        console.error('Order failed:', data.error);
        return;
      }
      const orderNumber = `GC-${Math.floor(10000000 + Math.random() * 90000000)}`;
      const orderState = {
        orderNumber,
        items: [...items],
        subtotal: subTotal,
        tax,
        total,
      };
      checkout();
      navigate("/order-confirmation", { state: orderState });
    }
    catch (err)
    {
      console.error('Order failed:', err)
    }
  };



  return (
    <Box p ="xl" c = "white">
      <Title order = {1} mb = "xl">Checkout</Title>
      <Grid align = "flex-start">
        {/*LEFT COLUMN*/}
        <Grid.Col span = {{base: 12, md: 8}}>
          <Stack gap = "1g">
            {/*ACCOUNT*/}
            <Card p = "xl" radius = "md" bg = "dark.7">
              <Title order = {2} mb = "md">Account</Title>
              <Text size="xs" c="dimmed" mb={4}>Username</Text>
              <Text fw={500} mb="md">{user?.username ?? '-'}</Text>
            </Card>

            {/*DELIVERY*/}
            <Card p="xl" radius="md" bg="dark.7">
              <Title order={2} mb="md">Delivery</Title>
              {/*PHYSICAL PICKUP*/}
              {physicalItem.length > 0 && (
                <Stack gap="sm" mb="md">
                  <Text fw={600} c="violet.4">Physical Pickup</Text>
                  <Paper p="md" radius="md" bg="dark.8">
                    <Text size="xs" c="dimmed" mb={4}>Pickup Location</Text>
                    {selectedStore ? (
                      <>
                        <Text fw={700} size="lg">{selectedStore.state}</Text>
                        <Text size="sm" c="dimmed" mb={4}>{selectedStore.city}, {selectedStore.state}</Text>
                        <Text size="xs" c="dimmed" mb="sm">{formatTime(selectedStore.open_hour)} - {formatTime(selectedStore.close_hour)}</Text>
                      </>
                    ) : (
                      <Text c="dimmed" size="sm" mb="sm">No store selected</Text>
                    )}
                    <SelectStore onSelectStore={setSelectedStore} label={selectedStore ? "Change Store" : "Select a Store"}/>
                  </Paper>

                  {physicalItem.map((item)=> (
                    <Group key = {item.game_id} justify = "space-between">
                      <Group>
                        <Image src={item.thumbnail} alt={item.title} w={50} h={50} radius="md" fit="cover"/>
                        <div>
                          <Text fw={500}>{item.title}</Text>
                          {item.publishers && (
                            <Text size="xs" c="dimmed">
                              {Array.isArray(item.publishers) ? item.publishers[0] : item.publishers}
                            </Text>
                          )}
                        </div>
                      </Group>
                      <Badge tt='none' color={alpha('var(--mantine-color-violet-9)', 0.2)} c="violet" fw='400' variant="filled">Physical</Badge>
                    </Group>
                  ))}
                </Stack>
              )}

              {/*DIGITAL DOWNLOADS*/}
              {digitalItem.length > 0 && (
                <Stack gap="sm">
                  <Text fw={600} c="violet.4" mt={physicalItem.length > 0 ? "md" : 0}>Digital Downloads</Text>
                  {digitalItem.map((item) => (
                    <Group key={item.game_id} justify="space-between">
                      <Group>
                        <Image src={item.thumbnail} alt={item.title} w={50} h={50} radius="md" fit="cover"/>
                        <div>
                          <Text fw={500}>{item.title}</Text>
                          {item.publishers && (
                            <Text size="xs" c="dimmed">
                              {Array.isArray(item.publishers) ? item.publishers[0] : item.publishers}
                            </Text>
                          )}
                        </div>
                      </Group>
                      <Badge tt='none' color={alpha('var(--mantine-color-violet-9)', 0.2)} c="violet" fw='400' variant="filled">Digital</Badge>
                    </Group>
                  ))}

                  <Text size="sm" c="dimmed">Available immediately after purchase in your library</Text>
                </Stack>
              )}
            </Card>

            {/*PAYMENT*/}
            <Card p="xl" radius="md" bg="dark.7">
              <Title order={2} mb="md">Payment</Title>
              <Stack gap="md">
                <TextInput label="Card Number" placeholder="1234 5678 9012 3456" value={cardNumber} onChange={(e) => setCardNumber(e.currentTarget.value)}/>
                <Group grow>
                  <TextInput label="Expiration Date" placeholder="MM/YY" value={expiry} onChange={(e) => setExpiry(e.currentTarget.value)}/>
                  <TextInput label="CVV" placeholder="123" value={cvv} onChange={(e) => setCvv(e.currentTarget.value)}/>
                </Group>
                <TextInput label="Name on Card" placeholder="John Doe" value={nameCard} onChange={(e) => setNameCard(e.currentTarget.value)}/>
              </Stack>
            </Card>
          </Stack>
        </Grid.Col>

        {/*RIGHT COLUMN ORDER SUMMARY*/}
        <Grid.Col span={{base: 12, md: 4}}>
          <Box style={{position:"sticky", top:"2rem"}}>
            <Card p="xl" radius="md" bg="dark.7">
              <Title order={2} mb="md">Order Summary</Title>
              <Stack gap="sm" mb="md">
                {items.map((item) => (
                  <Box key={item.game_id} pb="sm" style={{borderBottom:"1px solid var(--mantine-color-dark-4"}}>
                    <Group justify="space-between" mb={4}>
                      <Text fw={600}>{item.title}</Text>
                      <Text>${parseFloat(item.price.toString().replace("$","")).toFixed(2)}</Text>
                    </Group>
                    <Badge tt='none'  color={alpha('var(--mantine-color-violet-9)', 0.2)} c="violet" fw='400' variant="filled" size="sm">{item.type ?? "Digital"}</Badge>
                  </Box>
                ))}
              </Stack>

              <Group justify="space-between" mb="xs">
                <Text c="dimmed">Subtotal</Text>
                <Text>${subTotal.toFixed(2)}</Text>
              </Group>
              <Group justify="space-between" mb="md">
                <Text c="dimmed">Tax (8%)</Text>
                <Text>${tax.toFixed(2)}</Text>
              </Group>

              <Divider mb="md"/>

              <Group justify="space-between" mb="xl">
                <Text fw={700} size="lg">Total</Text>
                <Text fw={700} size="lg" c="violet.4">${total.toFixed(2)}</Text>
              </Group>

              <Button fullWidth size="lg" color="violet" radius="md" onClick={handlePlaceOrder}>Place Order</Button>
            </Card>
          </Box>
        </Grid.Col>
      </Grid>
    </Box>
  );
}