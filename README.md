# Cityscapes_MMSegmentation Project

This project involves preparing the Cityscapes dataset, compressing it with different JPEG quality levels, and evaluating the mIoU using the DeepLabV3 with ResNet50 pre-trained checkpoint from MMSegmentation.

## Steps to Reproduce

### Step 1: Download Cityscapes Dataset

1. Sign up and create an account on the Cityscapes dataset website.
2. Download the following files:
   - `gtFine_trainvaltest.zip` (241MB) -> Ground truth
   - `leftImg8bit_trainvaltest.zip` (11GB) -> Training RGB Images

### Step 2: Compress Cityscapes Dataset with JPEG

Use ImageMagick to compress the dataset with two different quality levels:
   - Q=0.25
   - Q=0.75

   Example command:
   ```
   $ bash compress.sh 25%
   ```
### Step 3: Training and Inference

Follow the steps from the notebook file.

### Evaluation Results

Here are the evaluation results based on the specified method:

|  Method      | aAcc    | mIoU   | mAcc   |
| :---         | :---:   | :---:  | :---:  |
| Inference-25%| 38.07   | 5.81   | 8.60   |
| Fine-tuning-25% | 78.49 | 19.49  | 25.41  |
| Inference-75% | 34.77   | 5.00   | 9.58   |
| Fine-tuning-75% | 70.20 | 14.47  | 20.28  |
