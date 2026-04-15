import { IconChevronRight } from "@tabler/icons-react";
import { useDisclosure } from '@mantine/hooks';
import { Modal, Button, Select, TextInput, Divider, Stack, Group, Text, Box, Anchor, Loader } from '@mantine/core';
import { IconMapPin} from '@tabler/icons-react'
import { useState, useEffect } from 'react'

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


export default function SelectStore() {
  const [opened, {open, close}] = useDisclosure(false);
  const [stores, setStores] = useState<Store[]>([]);
  const [loading, setLoading] = useState(true);
  const [cityFilter, setCityFilter] = useState<string | null>(null);
  const [stateFilter, setStateFilter] = useState<string | null>(null);
  const [zipSearch, setZipSearch] = useState('')

  useEffect(() =>
  {
    const params = new URLSearchParams()
    if(cityFilter)
    {
      params.append('city', cityFilter);
    }
    if(stateFilter)
    {
      params.append('state', stateFilter);
    }

    fetch(`http://localhost:3000/api/stores?${params.toString()}`)
    .then(res=>res.json())
    .then(data=>{setStores(data); setLoading(false)})
    .catch(err=>{console.error('Failed to fetch stores:', err); setLoading(false)})
  }, [cityFilter, stateFilter])

  const cityOptions = [...new Set(stores.map(s=>s.city))].map(c=>({value: c, label: c}))
  const stateOptions = [...new Set(stores.map(s=>s.state))].map(s=>({value: s, label: s}))
  const filteredStores = zipSearch ? stores.filter(s=>s.address.includes(zipSearch)) : stores
  
  return (
    <>
      <Modal.Root opened={opened} onClose={close}>
        <Modal.Overlay />
        <Modal.Content>
          <Modal.Header>
            <Modal.Title>Select Your Store</Modal.Title>
            <Modal.CloseButton />
          </Modal.Header>
          <Modal.Body>
            <Stack>
              <Group grow>
                <Select placeholder = "City" data = {cityOptions} value = {cityFilter} onChange = {setCityFilter} clearable/>
                <Select placeholder = "State" data = {stateOptions} value = {stateFilter} onChange = {setStateFilter} clearable/>
              </Group>
              <Divider label = "or" labelPosition = "center"/>
              <TextInput placeholder = "Search by ZIP code" value = {zipSearch} onChange = {e => setZipSearch(e.currentTarget.value)}/>
                {loading ? (<Loader mx = "auto"/>) : 
                  (<Stack gap = "sm" style = {{maxHeight: 320, overflowY: 'auto'}}>
                    {filteredStores.length === 0 ?
                      (
                        <Text c = "dimmed" size = "sm" ta = "center">No stores found</Text>
                      ) : 
                      (
                        filteredStores.map(store =>
                          (
                            <Box key = {store.id} p = "sm" style = {{border: '1px solid var(--mantine-color-dark-4)', borderRadius: 8, display: 'flex', justifyContent: 'space-between', alignItems: 'center'}}>
                              <Group>
                                <IconMapPin size = {20} color = "var(--mantine-color-violet-5)"/>
                                <div>
                                  <Text fw = {500} size = "sm">{store.address}</Text>
                                  <Text size = "xs" c = "dimmed">{store.city}, {store.state}</Text>
                                  <Text size = "xs" c = "dimmed">{store.open_hour} - {store.close_hour}</Text> 
                                </div>
                              </Group>
                              <Anchor size = "xs" href = {store.google_map_url} target = "_blank" c = "dimmed">Google Maps →</Anchor>
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
          Select Your Store  
          <IconChevronRight size='16'/>
        </Group>
      </Button>
    </>
  );
}