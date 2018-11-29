class Login extends React.Component {
  constructor(props) {
    super(props);
    this.state = {username: '', password: ''};

    this.handleChangeUser = this.handleChangeUser.bind(this);
    this.handleChangePass = this.handleChangePass.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChangeUser(event) {
    this.setState({username: event.target.value});
  }

  handleChangePass(event) {
    this.setState({password: event.target.value});
  }

  handleSubmit(event) {
    //alert('A name was submitted: ' + this.state.value);
    event.preventDefault();
  }

  render() {
    return (
      <form className="form-container" onSubmit={this.handleSubmit}>
        <h1>Login</h1>
          <div className="form-group">
            <label htmlFor="usernameInput">Username</label>
            <input type="text" className="form-control" id="usernameInput"  placeholder="Username" value={this.state.username} onChange={this.handleChangeUser} />
          </div>

          <div className="form-group">
            <label htmlFor="exampleInputPassword1">Password</label>
            <input type="password" className="form-control" id="exampleInputPassword1" placeholder="Password" value={this.state.password} onChange={this.handleChangePass} />
          </div>
        
        <button type="submit" className="btn btn-block">Submit</button>
      </form>
    );
  }
}

'use strict';

const e = React.createElement;


const domContainer = document.querySelector('#login_container');
ReactDOM.render(e(Login), domContainer);