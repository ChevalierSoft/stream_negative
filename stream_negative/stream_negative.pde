import java.awt.*;	// screen capture

// yolo declarations
PImage	screenshot;

int		w = 1000;
int		h = 980;

int		px = 507;
int		py = 80;

void	settings()
{
	size(w, h);
}

void	setup()
{
	surface.setTitle("SPACE BAR to generate the image    W/A/S/D : resize    ARROWS : move the canvas");
	frameRate(15);
	background(0);
	screenShot();
	image(screenshot, 0, 0, width, height);
	surface.setResizable(true);
	surface.setLocation(px, py);
}

void	draw()
{
	negative();
}

void	negative()
{
	int	loc;

	loadPixels();
	try
	{
		for (int x = 1; x < w; x++)
		{
			for (int y = 0; y < h; y++)
			{
				loc = x + y * width;
				pixels[loc] = color(255 - red(screenshot.pixels[loc]), 255 - green(screenshot.pixels[loc]), 255 - blue(screenshot.pixels[loc]));
			}
		}
		updatePixels();
	}
	catch (Exception e){ screenShot(); println ("m'en tartine la papaille");}
}


void screenShot()
{
	try
	{
		screenshot = new PImage(new Robot().createScreenCapture(new Rectangle(px + 8, py + 31, w, h)));
	}
	catch (AWTException e){}
}

void	keyPressed()
{
	// generate new screenshot
	if (key == ' ')
	{
		surface.setLocation(0, 0);
		surface.setSize(0,0);
		screenShot();
		surface.setLocation(px, py);
		surface.setSize(w,h);
		image(screenshot, 0, 0, width, height);
	}
	
	// resize	
	else if (key == 'w' || key == 'z')
	{
		h -= 20;
		surface.setSize(w,h);
	}
	else if (key == 's')
	{
		h += 20;
		surface.setSize(w,h);
	}
	else if (key == 'a' || key == 'q')
	{
		w -= 20;
		surface.setSize(w,h);
	}
	else if (key == 'd')
	{
		w += 20;
		surface.setSize(w,h);
	}

	// movement
	else if (keyCode == UP)
	{
		py -= 20;
		if (py < 0)
			py = 0;
		surface.setLocation(px, py);
	}
	else if (keyCode == DOWN)
	{
		py += 20;
		if (py > 1060)
			py = 1060;
		surface.setLocation(px, py);
	}
	else if (keyCode == RIGHT)
	{
		px += 20;
		surface.setLocation(px, py);
	}
	else if (keyCode == LEFT)
	{
		px -= 20;
		surface.setLocation(px, py);
	}
}

