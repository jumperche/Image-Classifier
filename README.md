# Image-Classifier
Image Classifier App

https://jumperche.shinyapps.io/CatsVsDogs/




The `Image Classifier App` is a Shiny-based web application that utilizes a pre-trained Keras model (`catsDogs1.h5`) to classify images as either "Cat" or "Dog." The app allows users to upload an image file, processes it, and provides a classification result.

---

## Features

- Upload images in `.jpeg` or `.png` formats.
- Predict if the uploaded image depicts a **Cat** or a **Dog**.
- Uses a pre-trained Keras model for predictions.

---

## Prerequisites

### Required Software
- **R** (version ≥ 4.0)
- **Python** with TensorFlow installed for Keras compatibility.

### R Libraries
Install the required R libraries:

```R
install.packages(c("shiny", "keras", "imager"))
```

Make sure to install and configure TensorFlow with Keras for R using the following command:

```R
install_keras()
```

### Pre-Trained Model
Ensure that the pre-trained model file `catsDogs1.h5` is available in the working directory.

---

## Setup Instructions

### Clone the Repository

```bash
git clone https://github.com/your-repo/image-classifier-app.git
cd image-classifier-app
```

### Load the Pre-Trained Model

Place the `catsDogs1.h5` model file in the same directory as the R script or adjust the path in the code to the model's location.

---

## Running the Application

Run the following commands in your R console to start the app:

```R
library(shiny)
runApp("app_directory")
```

Open the provided URL in your browser to access the app.

---

## How to Use

1. Open the app in your browser.
2. Upload an image in `.jpeg` or `.png` format using the **Upload an image** button.
3. View the classification result in the main panel. The result will be either **Cat** or **Dog**.

---

## Code Explanation

### `classify_image` Function
This function takes an image path as input, processes the image to match the input shape expected by the model (150x150), and normalizes its pixel values. It then predicts the class using the pre-trained Keras model and returns the label ("Cat" or "Dog").

### UI Components
- **File Upload**: Allows users to upload an image file.
- **Classification Result**: Displays the classification result after processing the uploaded image.

### Server Logic
- Reactively processes the uploaded image and passes it to the `classify_image` function.
- Dynamically renders the classification result in the UI.

---

## Example Images

### Input
Upload an image of a cat or a dog in the correct format.

### Output
- **Cat**: The app predicts the image as a cat.
- **Dog**: The app predicts the image as a dog.

---

## Troubleshooting

- **Model Loading Issues**: Ensure the `catsDogs1.h5` file is in the correct directory.
- **TensorFlow Errors**: Check if TensorFlow and Keras are correctly installed for R.
- **File Upload Issues**: Verify that the uploaded file is in `.jpeg` or `.png` format and has valid dimensions.

---

## License

This project is licensed under the BSD 3-Clause License.

---

For issues or feature requests, open an issue on the GitHub repository.
