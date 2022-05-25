# GAN_data_for_Re-ID
On the Applicability of Synthetic Data for Re-Identification

## Example results

### C2RL

row 1: Centered pallet block -> Rotated left pallet block -> Reconstructed centered pallet block

<p align="center"> <img src="./pics/apple2orange.jpg" width="100%" /> </p>

# Usage

- Environment

    - Python 3.6

    - TensorFlow 2.2, TensorFlow Addons 0.10.0

    - OpenCV, scikit-image, tqdm, oyaml

    - *we recommend [Anaconda](https://www.anaconda.com/distribution/#download-section) or [Miniconda](https://docs.conda.io/en/latest/miniconda.html#linux-installers), then you can create the TensorFlow 2.2 environment with commands below*

        ```console
        conda create -n tensorflow-2.2 python=3.6

        source activate tensorflow-2.2

        conda install scikit-image tqdm tensorflow-gpu=2.2

        conda install -c conda-forge oyaml

        pip install tensorflow-addons==0.10.0
        ```

    - *NOTICE: if you create a new conda environment, remember to activate it before any other command*

        ```console
        source activate tensorflow-2.2
        ```

- Dataset

    - download the pallet-block-502 dataset and extract the images you need

        ```console
        https://zenodo.org/record/6353714
        ```
    - or take the filtered part of the dataset that we used from here
        ```console
        --link--
        ```
 
- Example of training

    ```console
    CUDA_VISIBLE_DEVICES=0 python train.py --dataset pallet-block-502
    ```

    - tensorboard for loss visualization

        ```console
        tensorboard --logdir ./output/pallet-block-502/summaries --port 6006
        ```

- Example of testing
    - To generate images using the trained cycleGAN

    ```console
    CUDA_VISIBLE_DEVICES=0 python test.py --experiment_dir ./output/pallet-block-502
    ```
- The checkpoints for the CycleGAN trained on pallet-block-502, the classifier model as well as the output images of the GAN can be downloaded here
        ```console
        --link--
        ```
    - The downloaded weights should be placed in ./output/pallet-block-502/checkpoints/
    - The downloaded classifier model (and json file) should be placed in ./model_classifier_C_RL/
