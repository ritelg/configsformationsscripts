from os import path

import typer
from PIL import Image


def resize_image(image_path: str, output_path: str, width: int = 0, height: int = 0):
    image = Image.open(image_path)
    typer.echo(f"Original size to {image.width}x{image.height}")
    if width == 0:
        image.thumbnail((image.width, height))
    if height == 0:
        image.thumbnail((width, image.height))

    typer.echo(f"Resizing image to {image.width}x{image.height}")
    image.save(output_path)

def main(
    image_path: str = typer.Argument(..., help="The path to the image to resize"),
    output_path: str = typer.Argument(..., help="The path to the resized image"),
    width: int = typer.Option(0, help="The width of the resized image"),
    height: int = typer.Option(0, help="The height of the resized image")):
    resize_image(image_path, output_path, width, height)

if __name__ == "__main__":
    typer.run(main)
