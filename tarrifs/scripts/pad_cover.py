from PIL import Image, ImageFilter
import sys

def pad_image_to_ratio(input_path, output_path, target_ratio=(2, 3)):
    try:
        img = Image.open(input_path)
        original_width, original_height = img.size
        
        # Calculate target dimensions
        target_width = original_width
        target_height = int(original_width * (target_ratio[1] / target_ratio[0]))
        
        # If original is taller than target ratio, adjust width instead
        if target_height < original_height:
            target_height = original_height
            target_width = int(original_height * (target_ratio[0] / target_ratio[1]))

        # Create background
        # Resize original to cover the target area (zoom)
        bg_scale = max(target_width / original_width, target_height / original_height)
        bg_width = int(original_width * bg_scale)
        bg_height = int(original_height * bg_scale)
        
        background = img.resize((bg_width, bg_height), Image.Resampling.LANCZOS)
        
        # Center crop the background to target size
        left = (bg_width - target_width) / 2
        top = (bg_height - target_height) / 2
        right = (bg_width + target_width) / 2
        bottom = (bg_height + target_height) / 2
        background = background.crop((left, top, right, bottom))
        
        # Blur the background
        background = background.filter(ImageFilter.GaussianBlur(radius=30))
        
        # Darken the background slightly to make the foreground pop
        from PIL import ImageEnhance
        enhancer = ImageEnhance.Brightness(background)
        background = enhancer.enhance(0.6)

        # Paste original in center
        paste_x = (target_width - original_width) // 2
        paste_y = (target_height - original_height) // 2
        
        background.paste(img, (paste_x, paste_y))
        
        # Save
        background.save(output_path, quality=95)
        print(f"Successfully saved padded image to {output_path}")
        print(f"New dimensions: {target_width}x{target_height}")
        
    except Exception as e:
        print(f"Error: {e}")
        sys.exit(1)

if __name__ == "__main__":
    # Hardcoded paths based on context
    INPUT = "/Users/a.domio/.gemini/antigravity/brain/a6b72a1a-1eed-4534-adb4-fb0078d99edf/fortress_america_cover_1764841174398.png"
    OUTPUT = "/Users/a.domio/books/tarrifs/fortress_america_cover.jpg"
    
    pad_image_to_ratio(INPUT, OUTPUT)
