from os.path import abspath, dirname, join

from tensorflow.keras.applications.densenet import DenseNet121

def main():
    model_weights_file = "densenet121_weights_tf_dim_ordering_tf_kernels.h5"

    print("🛠 Let's craft some ML 🧠 ...")
    print(f"⏬ Loading {model_weights_file} ...")
    model = DenseNet121(
        weights=join(dirname(abspath(__file__)), 
        'densenet121_weights_tf_dim_ordering_tf_kernels.h5')
    )

    print(f"👀 Printing model summary ...")
    model.summary()
    
    print("✅ Done ! 🏁")
