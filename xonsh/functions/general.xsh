import os

def sscreen(filename):
    filepath_to_save = os.path.abspath('~/screens/' + filename + '.png')
    if os.path.isfile(filepath_to_save):
        print("File " + filepath_to_save + " already exists, pick a different name")
    else:
        scrot -s @(filepath_to_save)
