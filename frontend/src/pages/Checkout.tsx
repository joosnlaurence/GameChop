import { useState } from "react";
import { useCart } from "../context/CartContext";
import { useNavigate } from "react-router-dom";



export default function Checkout() {
  const { items, checkout } = useCart();
  const navigate = useNavigate();

  const [cardNumber, setCardNumber] = useState("");
  const [expiry, setExpiry] = useState("");
  const [cvv, setCvv] = useState("");
  const [nameCard, setNameCard] = useState("");

  const physicalItem = items.filter((item) => item.type === "Physical");
  const digitalItem = items.filter((item) => item.type === "Digital");
  
  const subTotal = items.reduce((sum, item) => 
  {
    const numeric = parseFloat(item.price.toString().replace("$", ""));
    const qty = item.type === "Physical" ? (item.quantity ?? 1) : 1;
    return sum + numeric * qty;
  }, 0);

  const tax = subTotal * 0.08;
  const total = subTotal + tax;

  const handlePlaceOrder = () => 
  {
    checkout();
    navigate("/order-confirmation");
  };

  const inputStyle = {
    width: "100%",
    padding: "0.75rem 1rem",
    backgroundColor: "#0f1118",
    border: "1px solid #2a2d3e",
    borderRadius: "8px",
    color: "white",
    fontSize: "1rem",
    boxSizing: "border-box" as const,
  };

  const labelStyle = {
    color: "#aaa",
    fontSize: "0.85rem",
    marginBottom: "0.4rem",
    display: "block",
  };

  const sectionStyle = {
    backgroundColor: "#1a1d2e",
    borderRadius: "12px",
    padding: "1.5rem",
    marginBottom: "1.5rem",
  };

  return (
    <div style = {{ padding: "2rem", color: "white"}}>
      <h1 style = {{ fontSize: "2rem", marginBottom: "1.5rem"}}>Checkout</h1>

      <div style = {{ display: "flex", gap: "2rem", alignItems: "flex-start"}}>
        <div style = {{flex: 1}}>
          <div style = {sectionStyle}>
            <h2 style = {{marginTop: 0}}>Account</h2>
            <p style = {{color: "aaa", fontSize: "0.85rem", margin: "0 0 0.25rem"}}>Username</p>
            {/*username*/}
            <p style = {{color: "aaa", fontSize: "0.85rem", margin: "0 0 0.25rem"}}>Email</p>
            {/*email*/}
          </div>

          <div style = {sectionStyle}>
            <h2 style = {{marginTop: 0}}>Delivery</h2>

            {/*for physical pickup*/}
            {physicalItem.length > 0 && (
              <>
              <h3 style = {{color: "#7c6ff7", marginTop: 0}}>Physical Pickup</h3>
              <div style = {{backgroundColor: "#0f118", borderRadius: "8px", padding: "1rem", marginBottom: "1rem"}}>
                <p style = {{color: "aaa", fontSize: "0.85rem", margin: "0 0 0.25rem"}}>Pickup Location</p>
                {/*Connect to API for Gamechop location */}
                <p style = {{fontSize: "1.1rem", fontWeight: "bold", margin: "0 0 0.25rem"}}>GameChop - Orlando</p>
                <p style = {{color: "aaa", fontSize: "0.85rem", margin: "0 0 0.75rem"}}>123 Generic Road, Orlando, Fl</p>
                <span style = {{color: "#7c6ff7", fontSize: "0.85rem", cursor: "pointer"}}>
                  Change Store &rsaquo;
                </span>
              </div>

              {physicalItem.map((item) => 
              (
                 <div key = {item.id} style = {{display: "flex", alignItems: "center", gap: "1rem", marginBottom: "1rem"}}>
                  <img src = {item.image} alt = {item.title} style={{width: "50px", height: "50px", borderRadius: "8px", objectFit: "cover"}}/>
                  <div style = {{flex: 1}}>
                    <p style = {{margin: 0, fontWeight: "bold"}}>{item.title}</p>
                    {item.publisher && <p style = {{margin: 0, color: "#aaa", fontSize: "0.85rem"}}>{item.publisher}</p>}
                  </div>
                  <span style = {{backgroundColor: "#2a2d3e", padding: "2px 10px", borderRadius: "6px", fontSize: "0.8rem"}}>
                    Physical
                  </span>
                 </div> 
              ))}
              </>
            )}

            {/*Digital Downloads */}
            {digitalItem.length > 0 && (
              <>
              <h3 style = {{color: "#7c6ff7", marginTop: physicalItem.length > 0 ? "1rem" : 0}}>Digital Downloads</h3>
              {digitalItem.map((item) => (
                <div key = {item.id} style = {{display: "flex", alignItems: "center", gap: "1rem", marginBottom: "1rem"}}>
                  <img src = {item.image} alt = {item.title} style = {{width: "50px", height: "50px", borderRadius: "8px", objectFit: "cover"}}/>
                  <div style = {{flex: 1}}>
                    <p style = {{margin: 0, fontWeight: "bold"}}>{item.title}</p>
                    {item.publisher && <p style = {{margin: 0, color: "#aaa", fontSize: "0.85rem"}}>{item.publisher}</p>}
                  </div>
                  <span style = {{backgroundColor: "#2a2d3e", padding: "2px 10px", borderRadius: "6px", fontSize: "0.8rem"}}>
                    Digital
                  </span>
                </div>
              ))}
                <p style = {{color: "#aaa", fontSize: "0.85rem", marginBottom: 0}}>
                  Available to download in your library
                </p>
              </>
            )}
          </div>

          {/*Payment Section */}
          <div style = {sectionStyle}>
            <h2 style = {{marginTop: 0}}>Payment</h2>
            <div style = {{marginBottom: "1rem"}}>
              <label style = {labelStyle}>Card Number</label>
              <input style = {inputStyle} placeholder = "MM/YY" value = {expiry} onChange = {(e) => setExpiry(e.target.value)}/>
            </div>
            <div style = {{flex: 1}}>
              <label style = {labelStyle}>CVV</label>
              <input style = {inputStyle} placeholder = "123" value = {cvv} onChange = {(e) => setCvv(e.target.value)}/>
            </div>
          </div>
          <div>
            <label style = {labelStyle}>Name on Card</label>
            <input style = {inputStyle} placeholder = " " value = {nameCard} onChange = {(e) => setNameCard(e.target.value)}/>
          </div>
        </div>
      </div>
      {/*actual order summary */}
      <div style = {{backgroundColor: "#1a1d2e", borderRadius: "12px", padding: "1.5rem", width: "340px", flexShrink: 0}}>
        <h2 style = {{marginTop: 0}}>Order Summary</h2>
        {items.map((item) => (
          <div key = {item.id} style = {{marginBottom: "1rem", paddingBottom: "1rem", borderBottom: "1px solid #2a2d3e"}}>
            <div style = {{display: "flex", justifyContent: "space-between", marginBottom: "0.25rem"}}>
              <span style = {{fontWeight: "bold"}}>{item.title}</span>
              <span>{item.price}</span>
            </div>
            <span style = {{backgroundColor: "#2a2d3e", padding: "2px 10px", borderRadius: "6px", fontSize: "0.75rem"}}>
              {item.type ?? "Digital"}
            </span>
          </div>
        ))}
        <div style = {{display: "flex", justifyContent: "space-between", marginBottom: "0.75rem"}}>
          <span style = {{color: "aaa"}}>Subtotal</span>
          <span>${tax.toFixed(2)}</span>
        </div>
        <div style = {{display: "flex", justifyContent: "space-between", marginBottom: "1.5rem"}}>
          <span style = {{color: "#aaa"}}>Tax (8%)</span>
          <span>${tax.toFixed(2)}</span>
        </div>
        <div style = {{display: "flex", justifyContent: "space-betweeen", marginBottom: "1.5rem", fontSize: "1.2rem"}}>
          <span style = {{fontWeight: "bold"}}>Total</span>
          <span style = {{color: "#7c6ff7", fontWeight: "bold"}}>${total.toFixed(2)}</span>
        </div>
        <button onClick = {handlePlaceOrder} style = {{width: "100%", padding: "0.9rem", backgroundColor: "#7x6ff7", color: "white", border: "none", borderRadius: "8px", fontSize: "1rem", cursor: "pointer", fontWeight: "bold"}}>
          Place Order
        </button>
      </div>
    </div>
  );
}