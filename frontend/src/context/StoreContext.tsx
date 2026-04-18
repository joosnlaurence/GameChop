import { createContext, useContext, useState, type ReactNode } from "react";

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

interface StoreContextType
{
    selectedStore: Store | null
    setSelectedStore: (store: Store) => void
}

const StoreContext = createContext<StoreContextType | null>(null)

export function StoreProvider({ children} : { children: ReactNode})
{
    const [selectedStore, setSelectedStore] = useState<Store | null>(null);

    return (
        <StoreContext.Provider value={{ selectedStore, setSelectedStore }}>
            {children}
        </StoreContext.Provider>
    )
}

export function useStore()
{
    const context = useContext(StoreContext)
    if(!context)
    {
        throw new Error('useStore must be used within a StoreProvider')
    }
    return context;
}
