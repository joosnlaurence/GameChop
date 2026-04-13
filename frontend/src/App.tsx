import '@mantine/core/styles.css'
import '@mantine/carousel/styles.css'

import { MantineProvider } from '@mantine/core'
import { theme } from './theme'
import { useEffect } from 'react'
import { CartProvider } from "./context/CartContext";
import { BrowserRouter, Routes, Route, useLocation } from 'react-router-dom'
import Home from './pages/Home'
import Layout from './components/Layout'
import Browse from './pages/Browse'
import MyLibrary from './pages/MyLibrary'
import Orders from './pages/OrderHistory'
import GameDetail from './pages/GameDetail'
import Cart from './pages/Cart'
import Checkout from './pages/Checkout'
import OrderConfirmation from './pages/OrderConfirmation'

function ScrollToTop() {
  const { pathname } = useLocation();
  
  useEffect(() => {
    window.scrollTo(0, 0);
  }, [pathname]);

  return null;
}

function App() {
  return (
    <MantineProvider theme={theme} defaultColorScheme='dark'>
      <CartProvider>
      <BrowserRouter>
        <ScrollToTop />
        <Routes>
          <Route element={<Layout />}>
            <Route path='/' element={<Home />} />
            <Route path='/browse'>
              <Route index  element={<Browse />} />
              <Route path=':gameId' element={<GameDetail />}/>
            </Route>
            <Route path='/my-games' element={<MyLibrary />} />
            <Route path='/orders' element={<Orders />} />
            <Route path='/cart' element={<Cart />} />
            <Route path='/checkout' element={<Checkout />} />
            <Route path='/order-confirmation' element={<OrderConfirmation />} />
          </Route>
        </Routes>
      </BrowserRouter>
      </CartProvider>
    </MantineProvider>
  )
}

export default App
