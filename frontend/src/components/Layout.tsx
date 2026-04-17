import { Outlet } from "react-router-dom";
import { 
  ActionIcon, 
  Anchor, 
  AppShell, 
  Button, 
  Center, 
  Drawer, 
  Group, 
  SimpleGrid, 
  Stack, 
  Text, 
} from '@mantine/core';
import { NavLink } from "react-router-dom";
import { 
  IconBrandFacebook, 
  IconBrandInstagram, 
  IconBrandX, 
  IconBrandYoutube, 
  IconShoppingCart,
} from "@tabler/icons-react";
import { useState, type ReactNode } from 'react';
import { useDisclosure } from '@mantine/hooks';
import { useCart } from "../context/CartContext";
import classes from './Layout.module.css';
import Login from "./Login";
import SignUp from "./SignUp";
import { useAuth } from "../context/AuthContext";
import LogoutButton from "./LogoutButton";
import NavSearch from "./NavSearch";

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

function CartBadge()
{
  const { items } = useCart();

  if(items.length === 0)
  {
    return null;
  }
  return (
    <span style = {{
      position: "absolute",
      top: "-6px",
      right: "-6px",
      backgroundColor: "#7c6ff7",
      color: "white",
      borderRadius: "50%",
      width: "16px",
      height: "16px",
      fontSize: "0.65rem",
      display: "flex",
      alignItems: "center",
      justifyContent: "center",
      fontWeight: "bold",
      pointerEvents: "none"
    }}>
      {items.length}
    </span>
  );
}

function Footer() {
  return (
    <footer>
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
            <Logo />
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
            <Text fw='700'>Follow Us</Text>
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
    </footer>
  )
}

export default function Layout() {
  const [opened, {open, close}] = useDisclosure(false);
  const [authMode, setAuthMode] = useState<'login' | 'signup'>('login');
  const { user } = useAuth();  

  const openLogin = () => {
    setAuthMode('login');
    open();
  }

  const openSignup = () => {
    setAuthMode('signup');
    open();
  }

  return (
    <AppShell
      bg='dark.9'
      header={{ height: 65 }}
    >
      <Drawer 
        opened={opened} 
        onClose={close} 
        styles={{
          header: { backgroundColor: 'var(--mantine-color-dark-8)'},
          content: { backgroundColor: 'var(--mantine-color-dark-8)'}
        }}  
      >
        {
          authMode == 'login' 
          ? 
          <Login onSignUp={() => setAuthMode('signup')} onSuccess={close}/> 
          : 
          <SignUp onLogin={() => setAuthMode('login')} onSuccess={close}/>
        }
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
            <NavSearch />
            <Group
              gap='0.75rem'
              wrap='nowrap'
            >
              <ActionIcon 
                component={NavLink} to='/cart' 
                variant='subtle' 
                size='36'
                p='4'
                style = {{overflow: 'visible'}}
              >
                <IconShoppingCart 
                  stroke='1.25'
                />
                <CartBadge/>
              </ActionIcon>
              {
                user
                ?
                <LogoutButton />
                :
                <>
                  <Button
                    p='0.5rem 1rem'
                    onClick={openLogin}
                    variant='subtle'
                  >
                    Login
                  </Button>
                  <Button onClick={openSignup}>
                    Sign Up
                  </Button>
                </>
              }
            </Group>
          </Group>
        </Group>
      </AppShell.Header>

      <AppShell.Main py='120' px="clamp(1rem, 12vw, 178px)">
        <Outlet />
      </AppShell.Main>
      <Footer />
    </AppShell>
  )
}