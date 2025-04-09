## **Add a GitHub self-hosted runner on Ubuntu**

---

# 🛠️ GitHub Self-Hosted Runner Setup on Ubuntu

---

## 🔹 Prerequisites

- An Ubuntu machine with internet access.
- A GitHub repository or organization where you want to add the runner.
- `curl`, `tar`, and `libicu-dev` installed:
  
  ```bash
  sudo apt update
  sudo apt install -y curl tar libicu-dev
  ```

---

## 🔹 1. Create a Runner on GitHub

### ➤ Go to your repo or org:
- **Repository level**:  
  `Settings → Actions → Runners → New self-hosted runner`

- **Organization level**:  
  `Org Settings → Actions → Runners → New self-hosted runner`

### ➤ Select:
- **OS**: Linux  
- **Architecture**: x64

GitHub will show commands like:

```bash
# Create a folder
mkdir actions-runner && cd actions-runner

# Download the latest runner package
curl -o actions-runner-linux-x64-2.317.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.317.0/actions-runner-linux-x64-2.317.0.tar.gz

# Extract the installer
tar xzf ./actions-runner-linux-x64-2.317.0.tar.gz

---

## 🔹 2. Configure the Runner

```bash
./config.sh --url https://github.com/<OWNER>/<REPO> --token <TOKEN>
```
🔁 Replace `<OWNER>`, `<REPO>`, and `<TOKEN>` accordingly.

✅ This step registers the runner with GitHub.  
It will prompt for:

- Runner name (default is fine)
- Work folder (default `_work` is fine)
- Whether to run as a service (say **no** if testing interactively first)

---

## 🔹 3. Run the Runner Interactively

```bash
./run.sh
```

You’ll see logs like:
```
√ Connected to GitHub
Listening for Jobs
```

✅ Keep this terminal open — this means it's working.  
Press `Ctrl+C` to stop.

---

## 🔹 4. Install and Run the Runner as a Systemd Service

Once you’ve confirmed the runner works:

### ➤ Install the service:
```bash
sudo ./svc.sh install
```

### ➤ Start the service:
```bash
sudo ./svc.sh start
```

### ➤ Check service status:
```bash
sudo ./svc.sh status
```

You should see:
```
● actions.runner.<OWNER>-<REPO>.<RUNNER_NAME>.service - GitHub Actions Runner
   Active: active (running)
```

Now the runner runs in the background and auto-starts on boot.

---

## 🔹 5. Confirm Runner Is Online

Go back to:

- **Repo Settings → Actions → Runners**

✅ Your runner should now appear as **Online**.

---

## 🔧 Optional: Uninstall or Reconfigure

### ➤ Stop and remove the service:
```bash
sudo ./svc.sh stop
sudo ./svc.sh uninstall
```

### ➤ Remove runner configuration:
```bash
./config.sh remove
```

Then re-run `./config.sh` with updated values if needed.

---

Let me know if you'd like this in a markdown file for GitHub documentation or wiki!
