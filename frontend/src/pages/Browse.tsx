import { useCart, type CartItem } from "../context/CartContext";


const testGames: CartItem[] = 
[
  {
    id: 1,
    title: "Neon Legends",
    price: "$59.99",
    image: "https://images.unsplash.com/photo-1511512578047-dfb367046420?w=300&h=400&fit=crop",
    type: "Digital",
  },
  {
    id: 2,
    title: "Apex Warriors",
    price: "$49.99",
    image: "https://images.unsplash.com/photo-1612287230202-1ff1d85d1bdf?w=300&h=400&fit=crop",
    type: "Physical",
  },
  {
    id: 3,
    title: "Cyber Frontiers",
    price: "$39.99",
    image: "https://images.unsplash.com/photo-1511512578047-dfb367046420?w=300&h=400&fit=crop",
    type: "Digital",
  },
];

export default function Browse() {
  const { addItem } = useCart();
  return (
    <div style = {{ padding: "2rem", color: "white"}}>
      <h1>Browse Games</h1>
      <div style = {{ display: "flex", gap: "1rem", flexWrap: "wrap"}}>
        {testGames.map((game) => 
          (
            <div key = {game.id} style = {{backgroundColor: "#1a1d2e", borderRadius: "12px", padding: "1rem", width: " 200px"}}>
              <img src = {game.image} alt = {game.title} style = {{width: "100%", borderRadius: "8px"}}/>
              <h3 style = {{margin: "0.5rem 0"}}>{game.title}</h3>
              <p style = {{color: "#7c6ff7", margin: "0 0 0.5rem"}}>{game.price}</p>
              <span style = {{ backgroundColor: "#2a2d3e", padding: "2px 10px", borderRadius: "6px", fontSize: "0.8rem", marginBottom: "0.5rem", display: "inline-block"}}>
                {game.type}
              </span>
              <button onClick = {() => addItem(game)} style = {{width: "100%", marginTop: "0.5rem", padding: "0.5rem", backgroundColor: "#7x6ff7", color: "white", border: "none", borderRadius: "8px", cursor: "pointer"}}>
                Add to Cart
              </button>
            </div>
          ))}
      </div>
    </div>
  );
};