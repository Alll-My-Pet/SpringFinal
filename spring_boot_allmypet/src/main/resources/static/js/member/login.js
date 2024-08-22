function openForgotWindow(event, value) {
  event.preventDefault();
  const width = 700;
  const height = 700;
  const left = (screen.width / 2) - (width / 2);
  const top = (screen.height / 2) - (height / 2);
  if(value == 0){
    window.open('/forgotID', 'ForgotID', `width=${width},height=${height},top=${top},left=${left}`);
  }
  else if(value == 1){
    window.open('/forgotPW', 'ForgotPW', `width=${width},height=${height},top=${top},left=${left}`);
  }
}