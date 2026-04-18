import { Card, Group, Stack, Skeleton, Title } from "@mantine/core";

const SKELETON_ORDERS = 2;
const SKELETON_ITEMS_PER_ORDER = 2;

export default function OrderHistorySkeleton() {
  return (
    <Stack gap="32">
      <Title>Order History</Title>

      {Array.from({ length: SKELETON_ORDERS }).map((_, orderIdx) => (
        <Card key={orderIdx} p="24">
          <Stack gap="16">
            <Group justify="space-between">
              {Array.from({ length: 3 }).map((_, i) => (
                <Stack gap="4" key={i}>
                  <Skeleton height={12} width={80} />
                  <Skeleton height={16} width={120} />
                </Stack>
              ))}
            </Group>

            <Stack gap="12">
              {Array.from({ length: SKELETON_ITEMS_PER_ORDER }).map((_, itemIdx) => (
                <Group
                  key={itemIdx}
                  bg="dark.7"
                  p="12"
                  bdrs="md"
                  justify="space-between"
                  wrap="nowrap"
                >
                  <Group gap="16" wrap="nowrap">
                    <Skeleton
                      height={85}
                      width={64}
                      radius="md"
                      style={{ flexShrink: 0 }}
                    />
                    <Stack gap="8">
                      <Skeleton height={16} width={180} />
                      <Group gap="8">
                        <Skeleton height={18} width={60} radius="sm" />
                      </Group>
                    </Stack>
                  </Group>

                  {/* Price */}
                  <Skeleton height={16} width={50} />
                </Group>
              ))}
            </Stack>
          </Stack>
        </Card>
      ))}
    </Stack>
  );
}