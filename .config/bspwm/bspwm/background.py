"""set random background"""
import os
import random
# BASE_DIR = os.path.dirname(os.path.abspath(__file__))
BASE_DIR = "/home/andres/Pictures/wallpapers"
image = random.choice(os.listdir(BASE_DIR))
image_path= lambda file: os.path.join(BASE_DIR, file)
os.system(f'feh --bg-scale {image_path(image)}')
