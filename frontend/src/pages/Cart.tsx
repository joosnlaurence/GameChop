import { useCart } from "../context/CartContext";
import { useNavigate } from "react-router-dom";


export default function Cart() {
  const { items, removeItem, updateQuantity, checkout} = useCart();
  
  const subtotal = items.reduce((sum, item) =>
  {
    const numeric = parseFloat(item.price.toFixed(2));
    const qty = item.type === "Physical" ? (item.quantity ?? 1) : 1;
    return sum + numeric * qty;
  }, 0);

  const tax = subtotal * 0.08;
  const total = subtotal + tax;
  const navigate = useNavigate();
  
  return (
    <div style = {{ padding: "2rem", color: "white"}}>
      {/* Title if necessary?*/}
      <h1 style = {{ fontSize: "2rem", marginBottom: "1.5rem"}}>
        Your Cart ({items.length})
      </h1>

      
      <div style = {{display: "flex", gap: "2rem", alignItems: "flex-start"}}>
        <div style = {{flex: 1, display: "flex", flexDirection: "column", gap: "1rem"}}>
          {items.length === 0 ?
            (
              <p style = {{color: "#aaa"}}>Your cart is empty.</p>
            ) : (
              items.map((item) => 
              (
                <div key = {item.id} style = {{backgroundColor: "#1a1d2e", borderRadius: "12px", padding: "1rem", display: "flex", alignItems: "center", gap: "1rem", position: "relative",}}>
                  <img src = {item.image} alt = {item.title} style = {{ width: "80px", height: "80px", borderRadius: "8xp", objectFit: "cover"}}/>
                  <div style = {{flex: 1}}>
                    <h3 style = {{margin: 0}}>{item.title}</h3>
                    <p style = {{color: "#7x6ff7", fontWeight: "bold", margin: "0.25rem 0"}}>
                      {item.type === "Physical" && (item.quantity ?? 1) > 1 ? 
                      `${item.price} * ${item.quantity} = $${((item.price) * (item.quantity ?? 1)).toFixed(2)}` : item.price}
                    </p>
                    <div style = {{ display: "flex", gap: "0.5rem", alignItems: "center", marginTop: "0.25rem"}}>
                      <span style = {{backgroundColor: "#2a2d3e", padding: "2px 10px",  borderRadius: "6px", fontSize: "0.8rem"}}>
                        {item.type ?? "Digital"}
                      </span>
                    </div>

                    {item.type === "Physical" && 
                      (
                        <div style = {{ display: "flex", alignItems: "center", gap: "0.5rem", marginTop: "0.5rem"}}>
                          <button onClick = {() => updateQuantity(item.id, (item.quantity ?? 1) - 1)} style = {{width: "24px", height: "24px", borderRadius: "50%", border: "none", backgroundColor: "#2a2d3e", color: "white", cursor: "pointer"}}>
                            -
                          </button>
                          <span>{item.quantity ?? 1}</span>
                          <button onClick = {() => updateQuantity(item.id, (item.quantity ?? 1) + 1)} style = {{width: "24px", height: "24px", borderRadius: "50%", border: "none", backgroundColor: "#2a2d3e", color: "white", cursor: "pointer"}}>
                            +
                          </button>
                        </div>
                      )
                    }
                  </div>

                  <span style = {{color: "#7c6ff7", fontWeight: "bold", fontSize: "1.1rem"}}>
                    ${(item.price * (item.type === "Physical" ? (item.quantity ?? 1) : 1)).toFixed(2)}
                  </span>
                  <button onClick = {() => removeItem(item.id)} style = {{position: "absolute", top: "1rem", right: "1rem", background: "none", border: "none", color: "#aaa", cursor: "pointer", fontSize: "1rem"}}>
                    ✕
                  </button>
                </div>
              ))
            )
          }
        </div>

        {/*Order Summary*/}
        <div style = {{background: "#1a1d2e", borderRadius: "12px", padding: "1.5rem", width: "300px", flexShrink: 0}}>
          <h2 style = {{marginTop: 0}}>Order Summary</h2>
          <div style = {{display: "flex", justifyContent: "space-between", marginBottom: "0.75rem"}}>
            <span style = {{color: "#aaa"}}>Subtotal</span>
            <span>${subtotal.toFixed(2)}</span>
          </div>
          <div style = {{display: "flex", justifyContent: "space-between", marginBottom: "1.5rem"}}>
            <span style = {{color: "#aaa"}}>Tax (8%)</span>
            <span>${tax.toFixed(2)}</span>
          </div>
          <div style = {{display: "flex", justifyContent: "space-between", marginBottom: "1.5rem", fontSize: "1.1rem"}}>
            <span style = {{fontWeight: "bold"}}>Total</span>
            <span style = {{color: "#7x6ff7", fontWeight: "bold"}}>${total.toFixed(2)}</span>
          </div>
          <button onClick = {() => navigate("/checkout")} style = {{width: "100%", padding: "0.9rem", backgroundColor: "#7c6ff7", color: "white", border: "none", borderRadius: "8px", fontSize: "1rem", cursor: "pointer", fontWeight: "bold"}}>
            Checkout
          </button>
        </div>

      </div>
    </div>
  );
}