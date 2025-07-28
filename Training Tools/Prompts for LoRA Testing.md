!# 🔍 LoRA Overtraining Detection Prompts
!
!Use these prompts to evaluate if your LoRA model is **overfitting** or **leaking training images**. They are designed to expose subtle failure cases where the model memorizes instead of generalizing.
!
!---
!
!## 📋 Quick Copy Prompt List (Replace `SUBJECT` with your LoRA trigger word)
!
!```text
!a group of people, including SUBJECT, talking at a table
!SUBJECT in the distance, standing by a lake
!SUBJECT in a blurry background of a crowd
!SUBJECT in a cartoon style, wearing a red scarf
!SUBJECT underwater, wearing scuba gear
!SUBJECT in an oil painting style, 1800s setting
!SUBJECT as a Lego character, wide shot
!SUBJECT from behind, walking into a sunset
!SUBJECT laying down on a couch, looking up
!SUBJECT at a far angle, camera on a balcony
!```
!
!---
!
!## 🧠 Prompt Explanations & What to Look For
!
!### 1. **"a group of people, including SUBJECT, talking at a table"**
!- **What It Tests**: Can the model represent SUBJECT in a subtle, blended scene?
!- **What to Look For**: SUBJECT should appear as one of several people — not front and center, not overly sharp.  
!- ❌ **Overfit Sign**: SUBJECT is always perfectly clear and dominant, breaking realism.
!
!---
!
!### 2. **"SUBJECT in the distance, standing by a lake"**
!- **What It Tests**: Can the model scale the subject down and integrate into a wide scene?
!- **What to Look For**: SUBJECT should be small and match the scale of the scene.
!- ❌ **Overfit Sign**: High detail on the face or incorrect proportions from a distance.
!
!---
!
!### 3. **"SUBJECT in a blurry background of a crowd"**
!- **What It Tests**: Does SUBJECT fade naturally into a background?
!- **What to Look For**: SUBJECT should be blurred and de-emphasized in line with crowd placement.
!- ❌ **Overfit Sign**: SUBJECT’s face is detailed or unrealistically sharp for the context.
!
!---
!
!### 4. **"SUBJECT in a cartoon style, wearing a red scarf"**
!- **What It Tests**: Can SUBJECT adapt to artistic or non-realistic domains?
!- **What to Look For**: Cartoon version should still loosely resemble the subject.
!- ❌ **Overfit Sign**: It defaults to a photo-real face or ignores the cartoon aspect.
!
!---
!
!### 5. **"SUBJECT underwater, wearing scuba gear"**
!- **What It Tests**: Pose generalization and environmental context.
!- **What to Look For**: SUBJECT’s face may be partially obscured, with proper underwater lighting and distortion.
!- ❌ **Overfit Sign**: Face is crystal clear with no water distortion or incorrect context handling.
!
!---
!
!### 6. **"SUBJECT in an oil painting style, 1800s setting"**
!- **What It Tests**: Style transfer and time-period flexibility.
!- **What to Look For**: SUBJECT should take on painterly qualities (brush strokes, period clothing).
!- ❌ **Overfit Sign**: Still looks like a modern photo or breaks the style.
!
!---
!
!### 7. **"SUBJECT as a Lego character, wide shot"**
!- **What It Tests**: Drastic abstraction and identity simplification.
!- **What to Look For**: SUBJECT as a Lego figure should retain iconic features like hair or color theme.
!- ❌ **Overfit Sign**: Output looks human instead of stylized Lego.
!
!---
!
!### 8. **"SUBJECT from behind, walking into a sunset"**
!- **What It Tests**: Back view and pose variety.
!- **What to Look For**: No face visible — SUBJECT is shown from behind.
!- ❌ **Overfit Sign**: Face appears even when logically impossible.
!
!---
!
!### 9. **"SUBJECT laying down on a couch, looking up"**
!- **What It Tests**: Perspective and rare body posture.
!- **What to Look For**: SUBJECT’s pose and angle should look natural but challenging.
!- ❌ **Overfit Sign**: Face morphs incorrectly, angle breaks realism.
!
!---
!
!### 10. **"SUBJECT at a far angle, camera on a balcony"**
!- **What It Tests**: Extreme camera positioning and scale.
!- **What to Look For**: SUBJECT is small, distant, and lit consistently with the setting.
!- ❌ **Overfit Sign**: SUBJECT is rendered with perfect clarity or photobashed incorrectly.
!
!---
!
!## 🧪 How to Use These Prompts
!
!1. Run these prompts against multiple checkpoints (e.g., every 250–500 steps).
!2. Look for signs of over-detail, repeated poses, or identity leaking into unrelated styles.
!3. Choose the checkpoint where the model shows the **best balance** of likeness, flexibility, and realism.
!
!---
!
!### 💡 Tip:
!Overfitting usually shows up as:
!- Faces looking too sharp or photoreal in stylized or far-away scenes.
!- The same expression or pose showing up in every image.
!- SUBJECT always being front-and-center no matter what the prompt says.
!
!Keep your LoRA flexible — not just memorized.
!
!---
!
!**Stay sharp and prompt smart.** 🧠✨