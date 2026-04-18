import { Card, Group, Stack, Text, Title, Image, Badge, alpha, UnstyledButton, TextInput } from "@mantine/core";
import { useAuth } from "../context/AuthContext";
import { useQuery } from "@tanstack/react-query";
import type { Order } from "../types";
import { Link } from "react-router-dom";
import OrderHistorySkeleton from "./skeletons/OrderHistorySkeleton";
import classes from './OrderHistory.module.css';
import { useState } from "react";
import { IconSearch } from "@tabler/icons-react";

export default function OrderHistory() {
  const { user } = useAuth();
  const [search, setSearch] = useState('');

  const { data: orders, isLoading, error } = useQuery<Order[]>({
    queryKey: ['orders', user?.id],
    queryFn: async () => {
      const res = await fetch(`http://localhost:3000/api/orders/user/${user?.id}`, {
        credentials: 'include'
      });
      if (!res.ok) throw new Error(`API error: ${res.status}`);
      return res.json();
    },
    enabled: !!user
  });

  if (!user) return <Text>Please log in to view your order history.</Text>

  if (isLoading) return <OrderHistorySkeleton />
  if (error) return <Text>Error</Text>

  const parseDate = (dateStr: string) => {
    const date = new Date(dateStr);
    const year = date.getFullYear();
    const month = date.toLocaleString('en-US', { month: 'long' });
    const day = date.getDate();
    return `${month} ${day}, ${year}`;
  };

  console.log(orders, user)

  const groupedOrders = orders
  ? Object.values(
      orders.reduce((acc, o) => {
        (acc[(o.order_num ?? 0)] ??= []).push(o);
        return acc;
      }, {} as Record<string, Order[]>)
    )
  : [];
  
  const filteredGroups = groupedOrders.filter((group) => {
    if (!search.trim()) return true;
    const q = search.toLowerCase();
    return (
      group[0].order_num?.toLowerCase().includes(q) ||
      group.some((item) => item.game_title.toLowerCase().includes(q))
    );
  });

  return (
    <Stack gap='32'>
      <Title>Order History</Title>
      <TextInput
        placeholder="Search by game title or order number..."
        value={search}
        onChange={(e) => setSearch(e.currentTarget.value)}
        size='lg'
        leftSection={<IconSearch size='1.25rem'/>}
      />

      {
        filteredGroups.length === 0 && search && (
          <Text c='dimmed'>No orders match "{search}"...</Text>
        )
      }

      {filteredGroups.map((group) => {
        const order = group[0];
        const orderTotal = group.reduce(
          (sum, o) => sum + o.price * o.copies,
          0
        );

        return (
          <Card key={order.order_num} p="24">
            <Stack gap="16">
              {/* Order header */}
              <Group justify="space-between">
                <Stack gap="4">
                  <Text c="dimmed" fz="sm">Order Number</Text>
                  <Text fz="md">{order.order_num}</Text>
                </Stack>
                <Stack gap="4">
                  <Text c="dimmed" fz="sm">Date</Text>
                  <Text fz="md">{parseDate(order.ordered_at)}</Text>
                </Stack>
                <Stack gap="4">
                  <Text c="dimmed" fz="sm">Total</Text>
                  <Text fz="md" c="violet">${orderTotal.toFixed(2)}</Text>
                </Stack>
              </Group>

              {/* Group of games */}
              <Stack gap="12">
                {group.map((item) => (
                  <UnstyledButton
                    key={item.order_id}
                    p="12"
                    bdrs="md"
                    display='flex'
                    style={{ 
                      gap: '16px', 
                      justifyContent: 'space-between',
                      alignItems: 'center'
                    }}
                    component={Link} 
                    to={`/browse/${item.game_id}`}
                    td='none'
                    className={classes.orderedGameCard}
                  >
                    <Group gap="16" wrap="nowrap">
                      <Image
                        bdrs="md"
                        src={item.thumbnail}
                        w="64"
                        bg="dark.8"
                        style={{ aspectRatio: '3/4', objectFit: 'cover' }}
                        alt={item.game_title}
                      />
                      <Stack gap="4">
                        <Text>{item.game_title}</Text>
                        <Group gap="8">
                          <Badge
                            bg={alpha('var(--mantine-color-violet-9)', 0.2)}
                            tt="none"
                            c="violet"
                            bdrs="sm"
                            fw="400"
                            fz="xs"
                          >
                            {item.is_digital ? 'Digital' : 'Physical'}
                          </Badge>
                          {item.copies > 1 && (
                            <Text fz="sm">× {item.copies}</Text>
                          )}
                        </Group>
                        {
                          !item.is_digital 
                          ? <Text c='dimmed' fz='sm'>{item.store_address} - {item.store_city}, {item.store_state}</Text>
                          : undefined
                        }
                      </Stack>
                    </Group>

                    <Text fw="400">
                      ${(item.price * item.copies).toFixed(2)}
                    </Text>
                  </UnstyledButton>
                ))}
              </Stack>
            </Stack>
          </Card>
        );
      })}
    </Stack>
  );
}