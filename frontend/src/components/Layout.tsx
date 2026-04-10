import { Outlet } from "react-router-dom";
import { 
  ActionIcon, 
  Anchor, 
  AppShell, 
  Box, 
  Button, 
  Center, 
  Drawer, 
  Group, 
  SimpleGrid, 
  Stack, 
  Text, 
  TextInput 
} from '@mantine/core';
import { NavLink } from "react-router-dom";
import { 
  IconBrandFacebook, 
  IconBrandInstagram, 
  IconBrandX, 
  IconBrandYoutube, 
  IconSearch, 
  IconShoppingCart, 
} from "@tabler/icons-react";
import { type ReactNode } from 'react';
import { useDisclosure } from '@mantine/hooks';
import classes from './Layout.module.css';

function Link( {to, children} : {to: string, children: ReactNode}) {
  return (
    <Anchor 
      c='dark.0' 
      component={NavLink} 
      to={to}
      ta='center'
      style={{ 
        whiteSpace: 'nowrap', 
      }}
      className={classes.navLink}
    >
      {children}
    </Anchor>
  )
}

function Logo() {
  return (
    <Text 
      component={NavLink} to='/'
      c='violet'
      fz='1.5rem'
      lts='-0.6px'
    >
      GameChop
    </Text>
  )
}

function Footer() {
  return (
    <Stack 
      bg='dark.7'
      px='101px'
      pt='48px'
      gap='32px'
      style={{
        borderTop: '1px solid var(--mantine-color-dark-5)'
      }}
    >
      <SimpleGrid
        spacing='2rem'
        cols={4}
      >
        <Stack>
          <Group>
            <Logo />
          </Group>
          <Text 
            c='dimmed'
            fz='0.875rem'
          >
            Your ultimate destination for the best games at unbeatable prices.
          </Text>
        </Stack>
        <Stack gap='1rem' >
          <Text fw='700'>Company</Text>
          <Stack gap='0.5rem' c='dimmed' fw='600'>
            <Text>About</Text>
            <Text>Contact</Text>
            <Text>Careers</Text>
          </Stack>
        </Stack>
        <Stack gap='1rem'>
          <Text fw='700'>Legal</Text>
          <Stack gap='0.5rem' c='dimmed' fw='600'>
            <Text>Terms of Service</Text>
            <Text>Privacy Policy</Text>
            <Text>Refund Policy</Text>
          </Stack>
        </Stack>
        <Stack>
          <Text>Follow Us</Text>
          <Group gap='1.5rem'>
            <IconBrandFacebook stroke='1.5'/>
            <IconBrandX stroke='1.5'/>
            <IconBrandInstagram stroke='1.5'/>
            <IconBrandYoutube stroke='1.5'/>
          </Group>
        </Stack>
      </SimpleGrid>
      <Center
        py='2rem'
        c='dimmed'
        fz='xs'
        style={{
          borderTop: '1px solid var(--mantine-color-dark-5)'
        }}
      >
        © 2026 GameChop. All rights reserved.
      </Center>
    </Stack>
  )
}

export default function Layout() {
  const [opened, {open, close}] = useDisclosure(false);

  return (
    <AppShell
      p='0'
      bg='dark.9'
      header={{ height: 65 }}
      navbar={{ width: 260, breakpoint: 'sm' }}
    >
      <Drawer opened={opened} onClose={close} title='Authentication'>
        <h1>hi</h1>
      </Drawer>
      <AppShell.Header
        bg='dark.9'
        style={{ paddingInline: 'clamp(1rem, 5vw, 77.5px)' }}
      >
        <Group 
          p='0.875rem 1.5rem'
          h='100%'
          gap='4rem'
        >
          <Group 
            gap='3rem' 
            wrap='nowrap'
            w='100%'
          >
            <Logo />
            <SimpleGrid 
              cols={3}
              w='20rem'
              spacing='0'
              style={{ flexShrink: 0 }}
              ta='center'
            >
              <Link to='/browse'>
                Browse
              </Link>  
              <Link to='/my-games'>
                My Games
              </Link>
              <Link to='/orders'>
                Orders
              </Link>
            </SimpleGrid>
            <TextInput 
              fz='sm'
              flex='1 0 auto'
              leftSection={<IconSearch size='1rem' />}
              placeholder='Search games...' 
            />
            <Group
              gap='0.75rem'
              wrap='nowrap'
            >
              <ActionIcon 
                component={NavLink} to='/cart' 
                variant='subtle' 
                size='36'
                p='4'
              >
                <IconShoppingCart 
                  stroke='1.25'
                />
              </ActionIcon>
              <Button
                p='0.5rem 1rem'
                onClick={open}
                variant='subtle'
              >
                Login
              </Button>
              <Button onClick={open}>
                Sign Up
              </Button>
            </Group>
          </Group>
        </Group>
      </AppShell.Header>

      <AppShell.Main h='100vh'>
        <Outlet />
      </AppShell.Main>

      <Footer />
    </AppShell>
  )
}