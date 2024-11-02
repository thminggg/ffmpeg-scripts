const { app, BrowserWindow, ipcMain } = require("electron");
const { exec } = require("child_process");
const path = require("path");

function createWindow() {
  const win = new BrowserWindow({
    width: 800,
    height: 600,
    webPreferences: {
      preload: path.join(__dirname, "preload.js"),
      contextIsolation: true,
      enableRemoteModule: false,
    },
  });

  win.loadFile("index.html");
}

ipcMain.on("compress-image", (event, inputImage, outputImage) => {
  console.log("Received Input Image:", inputImage);
  console.log("Received Output Image:", outputImage);

  exec(
    `./images/compress-image.sh ${inputImage} ${outputImage}`,
    (error, stdout, stderr) => {
      if (error) {
        event.reply("compression-result", `Error: ${stderr}`);
        return;
      }
      event.reply("compression-result", stdout);
    }
  );
});

app.whenReady().then(createWindow);
