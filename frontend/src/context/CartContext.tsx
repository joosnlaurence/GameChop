import {createContext, useContext, useState, type ReactNode} from "react";
import type { Game } from "../components/GameCard";


export interface CartItem extends Game
{
    type: "Digital" | "Physical";
    price: number;
    quantity?: number;
}

interface CartContextType
{
    items: CartItem[];
    addItem: (item: CartItem) => void;
    removeItem: (id: number) => void;
    updateQuantity: (id: number, quantity: number) => void;
    checkout: () => void;
}

const CartContext = createContext<CartContextType | undefined>(undefined);

export const CartProvider = ({ children }: {children: ReactNode}) => 
{
    const[items, setItems] = useState<CartItem[]>([]);

    const addItem = (item: CartItem) =>
    {
        setItems((prev): CartItem[] => 
        {
            const existing = prev.find((i) => i.id === item.id);
            if(existing)
            {
                if(existing.type === "Physical")
                {
                    return prev.map((i) =>
                    i.id === item.id ? {...i, quantity: (i.quantity ?? 1) + 1} : i
                    );
                }

                return prev;
            }

            return [...prev, {...item, quantity: item.type === "Physical" ? 1 : 0}];
        });
    };
    
    const removeItem = (id: number) =>
    {
        setItems((prev): CartItem[] => prev.filter((item) => item.id !== id));
    };

    const updateQuantity = (id: number, quantity: number) => 
    {
        if(quantity < 1)
        {
            removeItem(id);
            return;
        }
        setItems((prev): CartItem[] =>
            prev.map((item) => (item.id === id ? {...item, quantity} : item))
        );
    };

    const checkout = () =>
    {
        setItems([]);
    };

    return (
        <CartContext.Provider value = {{items, addItem, removeItem, updateQuantity, checkout}}>
            {children}
        </CartContext.Provider>
    );
    
};

// may need to split CartProvider component and useCart/CartItem into two files if this causes issues
export const useCart = () =>
{
    const context = useContext(CartContext);
    if(!context)
    {
        throw new Error("useCart must be used within a CartProvider");
    }
    return context;
}