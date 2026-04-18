import { IconChevronRight } from "@tabler/icons-react";
import { useDisclosure } from '@mantine/hooks';
import { Modal, Button, Divider, Stack, Group, Text, Box, Anchor, Loader, Flex, Autocomplete } from '@mantine/core';
import { IconMapPin} from '@tabler/icons-react'
import { useState, useEffect } from 'react'
import { useStore } from "../context/StoreContext";

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

interface Props
{
  onSelectStore: (store: Store) => void
  label?: string
}


const formatTime = (time: any) => 
{
  if(typeof time === 'object' && time !== null)
  {
    const hour = time.hours ?? 0;
    const minute = String(time.minutes ?? 0).padStart(2,'0');
    const ampm = hour >= 12 ? 'PM' : 'AM';
    const hour12 = hour % 12 === 0 ? 12 : hour % 12;
    return `${hour12}:00 ${ampm}`;
  }

  const timestr = String(time);
  const [hourStr, minute] = timestr.split(':')
  const hour = parseInt(hourStr)
  const ampm = hour >= 12 ? 'PM' : 'AM'
  const hour12 = hour % 12 === 0 ? 12 : hour % 12
  return `${hour12}:00 ${ampm}`
}

export default function SelectStore({onSelectStore, label = "Select Your Store"}: Props) {
  const [opened, {open, close}] = useDisclosure(false);
  const [stores, setStores] = useState<Store[]>([]);
  const { selectedStore, setSelectedStore } = useStore();
  const [loading, setLoading] = useState(true);
  const [cityFilter, setCityFilter] = useState<string | null>(null);
  const [stateFilter, setStateFilter] = useState<string | null>(null);

  useEffect(() => {
    fetch(`http://localhost:3000/api/stores`)
      .then((res) => res.json())
      .then((data) => { setStores(data); setLoading(false); })
      .catch((err) => { console.error('Failed to fetch stores:', err); setLoading(false); });
  }, []);  

  const cityOptions  = [...new Set(stores.map((s) => s.city))].sort();
  const stateOptions = [...new Set(stores.map((s) => s.state))].sort();

  const filteredStores = stores.filter((s) => {
    if (cityFilter  && !s.city.toLowerCase().includes(cityFilter.toLowerCase()))   return false;
    if (stateFilter && !s.state.toLowerCase().includes(stateFilter.toLowerCase())) return false;
    return true;
  });

  return (
    <>
      <Modal.Root opened={opened} onClose={close}>
        <Modal.Overlay />
        <Modal.Content bg='dark.8' bd='1px solid dark.5'>
          <Modal.Header bg='dark.8'>
            <Modal.Title>Select Your Store</Modal.Title>
            <Modal.CloseButton />
          </Modal.Header>
          <Modal.Body>
            <Stack>
              <Group grow>
                <Autocomplete 
                  placeholder="City" 
                  data={cityOptions} 
                  value={cityFilter ?? ''} 
                  onChange={setCityFilter} 
                  clearable
                />
                <Autocomplete 
                  placeholder="State" 
                  data={stateOptions}
                  value={stateFilter ?? ''} 
                  onChange={setStateFilter} 
                  clearable
                />
              </Group>
              <Divider label = "or" labelPosition = "center"/>
                {loading ? (<Loader mx = "auto"/>) : 
                  (<Stack gap = "sm" style = {{maxHeight: 320, overflowY: 'auto'}}>
                    {filteredStores.length === 0 ?
                      (
                        <Text c = "dimmed" size = "sm" ta = "center">No stores found</Text>
                      ) : (

                        filteredStores.map(store =>
                          (
                              <Box key={store.id} bg='dark.7'  p="sm" onClick={()=>{setSelectedStore(store); onSelectStore(store); close()}} style = {{border: '1px solid var(--mantine-color-dark-4)', borderRadius: 8, display: 'flex', justifyContent: 'space-between', alignItems: 'center', cursor:'pointer'}}>
                                <Group>
                                  <Flex align='center' justify='center' bg='dark.8' bdrs='md' p='10'>
                                    <IconMapPin size={20} color='violet' />
                                  </Flex>
                                  <div>
                                    <Text fw = {500} size = "sm">{store.address}</Text>
                                    <Text size = "xs" c = "dimmed">{store.city}, {store.state}</Text>
                                    <Text size = "xs" c = "dimmed">{formatTime(store.open_hour)} - {formatTime(store.close_hour)}</Text> 
                                  </div>
                                </Group>
                                <Anchor 
                                  size="xs" 
                                  href={store.google_map_url} 
                                  target="_blank" 
                                  c="dimmed" 
                                  onClick={(e) => e.stopPropagation()}
                                >Google Maps <IconChevronRight size='1rem'/></Anchor>
                              </Box>
                            )
                        )
                      )
                    }
                    </Stack>
                  )
                }
            </Stack>
          </Modal.Body>
        </Modal.Content>
      </Modal.Root>
      <Button 
        pl='1rem'
        fz='1rem'
        fw='600'
        bg='dark.7'
        bd='1px solid dark.5'
        onClick={open}
      >
        <Group gap='4'>
          {selectedStore ? `GameChop - ${selectedStore.address}` : label} 
          <IconChevronRight size='16'/>
        </Group>
      </Button>
    </>
  );
}