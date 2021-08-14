import './App.css';
import React from "react";
import ReactDOM from "react-dom";

const axios = require('axios');
function App() {
  const [searchTerm, setSearchTerm] = React.useState("");
  const handleChange = e => {
    setSearchTerm(e.target.value);
    return searchTerm;
  };

  axios.get(`http://localhost:4567/city_profile?city=${searchTerm}`)
    .then(res => {
      const results = res;
      let cityDetails = results.data;
      console.log(cityDetails);
      // this.setState({ res });

  })

  return (
    <div className="App">
      <form onSubmit={handleChange}>
        <input
          type="text"
          value="Austin"
        />
      </form>
    </div>
  );
}

export default App;
