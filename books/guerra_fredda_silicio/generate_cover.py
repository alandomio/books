import sys
from PIL import Image, ImageDraw, ImageFont

def draw_text_centered_multiline(draw, text, font, color, width, y_start, line_spacing=10):
    # Word wrap logic
    words = text.split(' ')
    lines = []
    current_line = []
    
    for word in words:
        current_line.append(word)
        # Check size of line
        line_str = ' '.join(current_line)
        # Pillow 10+ uses getbbox or getlength
        bbox = draw.textbbox((0, 0), line_str, font=font)
        line_w = bbox[2] - bbox[0]
        if line_w > width - 80: # 40px margin on each side
            current_line.pop()
            lines.append(' '.join(current_line))
            current_line = [word]
    if current_line:
        lines.append(' '.join(current_line))
        
    y = y_start
    for line in lines:
        bbox = draw.textbbox((0, 0), line, font=font)
        line_w = bbox[2] - bbox[0]
        x = (width - line_w) // 2
        draw.text((x, y), line, font=font, fill=color)
        y += (bbox[3] - bbox[1]) + line_spacing
    return y

def main():
    # Load original image
    try:
        orig_img = Image.open('cover.png').convert('RGBA')
    except Exception as e:
        print(f"Error opening cover.png: {e}")
        sys.exit(1)
        
    # Standard book cover dimensions (2:3 aspect ratio)
    cover_w = 1024
    cover_h = 1536
    
    # Create final canvas with matching dark background color (from image edge or solid black)
    # The image background is near black, let's use #020305 (very dark gray/black)
    bg_color = (2, 3, 5, 255)
    canvas = Image.new('RGBA', (cover_w, cover_h), bg_color)
    
    # Paste the graphic at the bottom
    canvas.paste(orig_img, (0, 512), orig_img)
    
    # Create a smooth vertical transition (fade) from y=512 to y=750 to blend it with bg_color
    draw = ImageDraw.Draw(canvas)
    fade_start = 512
    fade_end = 750
    for y in range(fade_start, fade_end):
        # Calculate opacity of the background color overlay
        alpha = int(255 * (1.0 - (y - fade_start) / (fade_end - fade_start)))
        # Draw a horizontal line of background color with varying alpha
        overlay = Image.new('RGBA', (cover_w, 1), bg_color[:3] + (alpha,))
        canvas.alpha_composite(overlay, (0, y))
        
    # Set up fonts
    try:
        font_author = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf", 26)
        font_title_bold = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf", 60)
        font_subtitle = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf", 22)
    except IOError:
        # Fallback to default
        font_author = ImageFont.load_default()
        font_title_bold = ImageFont.load_default()
        font_subtitle = ImageFont.load_default()
        
    # Draw Author (Top, elegant)
    author_text = "ALAN DOMIO"
    # Manual tracking/letter spacing for author name
    spaced_author = "  ".join(author_text)
    bbox_author = draw.textbbox((0, 0), spaced_author, font=font_author)
    author_w = bbox_author[2] - bbox_author[0]
    draw.text(((cover_w - author_w) // 2, 70), spaced_author, font=font_author, fill=(180, 190, 200, 255))
    
    # Draw title
    title_line1 = "LA GUERRA FREDDA"
    title_line2 = "DEL SILICIO"
    
    bbox_t1 = draw.textbbox((0, 0), title_line1, font=font_title_bold)
    t1_w = bbox_t1[2] - bbox_t1[0]
    draw.text(((cover_w - t1_w) // 2, 160), title_line1, font=font_title_bold, fill=(255, 255, 255, 255))
    
    bbox_t2 = draw.textbbox((0, 0), title_line2, font=font_title_bold)
    t2_w = bbox_t2[2] - bbox_t2[0]
    # Highlight "SILICIO" with a cyan/green color that matches the laser in the artwork
    # Neon green/cyan: (57, 255, 20, 255) or (0, 230, 180, 255)
    draw.text(((cover_w - t2_w) // 2, 240), title_line2, font=font_title_bold, fill=(0, 230, 180, 255))
    
    # Divider line
    draw.line([(cover_w // 2 - 100, 335), (cover_w // 2 + 100, 335)], fill=(0, 230, 180, 150), width=3)
    
    # Draw subtitle
    subtitle_text = "L'Asse Taiwan-Lituania-Olanda e la Catena di Approvvigionamento più Fragile del Pianeta"
    draw_text_centered_multiline(draw, subtitle_text, font_subtitle, (200, 210, 220, 240), cover_w, 360, line_spacing=10)
    
    # Save as PNG
    final_img = canvas.convert('RGB')
    final_img.save('cover.png', 'PNG')
    # Also save a copy in jpeg as cover.jpg just in case
    final_img.save('cover.jpg', 'JPEG', quality=95)
    print("Cover generated and saved to cover.png and cover.jpg successfully!")

if __name__ == '__main__':
    main()
