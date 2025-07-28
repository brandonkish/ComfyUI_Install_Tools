# 🧪 LoRA Evaluation Prompts: When Is Your LoRA Fully Trained?

This guide provides 3 high-impact prompts to help you **visually evaluate** when your LoRA is effectively trained. These are especially helpful for identity-based LoRA fine-tuning (e.g., faces) on models like **Stable Diffusion** or **Wan2.1 T2V 14B diffusers**.

> Replace `sks person` with your unique **trigger word** used during training.

---

## 🚀 Recommended Tool: Wan2.1 Training Toolkit

For training LoRA on Wan2.1 models, check out the excellent open-source tool:

🔗 **[ai-toolkit by ostris](https://github.com/ostris/ai-toolkit)**  
A lightweight, extensible trainer built for video diffusion and LoRA workflows, including support for **Wan2.1 T2V 14B**.

---

## 🛠️ Prebuilt Job Config (jobConfig.ts)

This repository includes a pre-configured **`jobConfig.ts`** file that works with the `ai-toolkit` UI.

👉 **Where to place it:**

Put `jobConfig.ts` in:

```
ai-toolkit\ui\src\app\jobs\new\
```

This will enable logging to **TensorBoard** by default when new jobs are created using the UI.

The job config includes:
- Proper `log_dir` setup
- Logging interval (`log_every`)
- WandB disabled (optional)

---

## 📊 TensorBoard Integration

This toolkit supports logging to **TensorBoard**, which allows you to visually monitor loss and training progress.

### 🔧 Installation (Windows with PowerShell)

If you're using a Python virtual environment, here’s how to install TensorBoard:

1. Open **PowerShell** in the root folder of your project.
2. Activate your venv:

```powershell
.\.venv\Scripts\Activate.ps1
```

3. Install TensorBoard:

```powershell
pip install tensorboard
```

4. (Optional) Launch TensorBoard in your browser:

```powershell
tensorboard --logdir .\run
```

---

## 🛠️ Enable Logging in Your Job Config

To activate logging and TensorBoard output during training, modify your **`settings.yaml`** (or job YAML) like this:

### Inside the `process:` section, add:

```yaml
process:
  log_dir: '.\run'
  logging:
    log_every: 2
    use_wandb: false
    verbose: false
```

### Explanation:
- `log_dir: '.\run'` — defines the folder where TensorBoard logs are written.
- `logging.log_every: 2` — logs every 2 steps for smoother TensorBoard graphs.
- `use_wandb: false` — disables Weights & Biases (optional).
- `verbose: false` — suppresses extra terminal output.

---

## ✅ Prompt 1: Neutral Portrait

```text
"A close-up portrait of sks person, smiling softly, natural lighting, plain background"
```

### 🔍 What to Look For:
- **Identity likeness**: Facial features, eyes, and skin tone should clearly resemble the subject.
- **Lighting realism**: Skin and shading should appear natural — not overly sharp, flat, or artificial.
- **Expression generalization**: The smile should feel authentic, not copied directly from a training photo.

✔️ **Goal**: Confirm that the model captures the core identity in a neutral, clean setting.

---

## ✅ Prompt 2: Pose and Appearance Variation

```text
"sks person with curly hair, side profile, looking left, cinematic lighting"
```

### 🔍 What to Look For:
- **Pose generalization**: The side profile should be believable and not distorted.
- **Hair variation**: If trained on various hairstyles, the model should reflect that naturally.
- **Lighting interpretation**: Look for soft, dynamic shadows typical of “cinematic” style.

✔️ **Goal**: Test if your LoRA can generalize identity across poses and appearance shifts.

---

## ✅ Prompt 3: Style and Context Flexibility

```text
"sks person in a futuristic cyberpunk city, wearing a hoodie, neon lights"
```

### 🔍 What to Look For:
- **Prompt responsiveness**: Background, clothing, and atmosphere should reflect the cyberpunk theme.
- **Identity retention**: The person should still be recognizable, even in this stylized context.
- **Scene cohesion**: The image should look coherent — no broken artifacts or prompt confusion.

✔️ **Goal**: Test whether your LoRA maintains identity while adapting to new creative prompts.

---

## 🧠 Summary Table

| Prompt | Tests | Good Signs |
|--------|-------|------------|
| **#1: Portrait** | Identity + realism | Face resembles subject, expression looks natural |
| **#2: Side profile** | Pose + hair variation | Angle is believable, hair adapts, identity preserved |
| **#3: Cyberpunk** | Prompt control + style transfer | Identity remains under style pressure, scene looks right |

---

## 🔁 How to Use

1. **Train your LoRA** on image or video data with a unique trigger word (e.g., `sks person`).
2. **Save checkpoints** every ~250–500 steps.
3. At each checkpoint:
    - Load the LoRA into your base model
    - Run the 3 prompts above
    - Compare outputs for likeness, generalization, and prompt-following
4. **Pick the checkpoint** that shows the best balance between identity accuracy and versatility.

---

## 🔧 Optional Tools
- Automate evaluation with a script that generates these prompts in batch
- Use [TensorBoard](https://www.tensorflow.org/tensorboard) for visual tracking of loss + checkpoints
- Consider using **EMA weights** for smoother, more stable outputs

---

**Happy training** 🎨✨
