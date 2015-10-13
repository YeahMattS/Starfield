//your code here
Particle[] space = new Particle[300];

void setup()
{
	size(600, 600);
	background(0);
	
	for (int i = 0; i < space.length - 2; i++)
	{
		space[i] = new NormalParticle();	
	}
	space[298] = new JumboParticle();
	space[299] = new OddballParticle();
}

void draw()
{
	//your code here
	fill(0, 50);
	rect(-100, -100, 700, 700);
	noStroke();
	for (int i = 0; i < space.length; i++)
	{
		space[i].show();
		space[i].move();
		space[i].wrap();
	}
}
class NormalParticle implements Particle
{
	//your code here
	double x, y, angle, speed;
	int c, d;
	NormalParticle()
	{
		x = 300;
		y = 300;
		angle = Math.random()*2*Math.PI;
		speed = (Math.random()*3)+2;
		c = (int)(Math.random()*255);
		d = 10;
	}

	public void show()
	{
		fill(c, c, 0);
		ellipse((float)x, (float)y, d, d);
	}

	public void move()
	{
		x+=speed*Math.cos(angle);
		y+=speed*Math.sin(angle);
	}
	public void wrap()
	{
		if (x > 600 || x < 0 || y > 600 || y < 0)
		{
			x = 300;
			y = 300;
			angle = Math.random()*2*Math.PI;
			speed = (Math.random()*3)+2;
			c = (int)(Math.random()*255);
		}
	}
}

interface Particle
{
	//your code here
	public void show();
	public void move();
	public void wrap();
}

class OddballParticle implements Particle//uses an interface
{
	//your code here
	double x1, x2, x3, y1, y2, y3, n;
	int r;
	OddballParticle()
	{
		x1 = 300;
		x2 = 400;
		x3 = 200;
		y1 = 280;
		y2 = 300;
		y3 = 310;
		n = 0.1;
		r = 0;
	}
	//spaceship that grows in size to imitate movement
	public void show()
	{
		fill(64);
		quad((float)x1, (float)y1, (float)x2, (float)y2, (float)x1, (float)y3, (float)x3, (float)y2);
		stroke(32);
		strokeWeight((float)n);
		line((float)x3, (float)y2, (float)x1, (float)y2+10);
		line((float)x2, (float)y2, (float)x1, (float)y2+10);
		noStroke();
	}
	public void move()
	{
		y1-=0.5;
		x2+=0.5;
		x3-=0.5;
		y3+=0.5;
		n+=0.01;
	}
	public void wrap()
	{
		if (Math.abs(y1-y3) > 800)
		{
			fill(0);
			ellipse(300, 300, r, r);
			if (r < 840)
			{
				r+=2;
			}
			else
			{
				x1 = 300;
				x2 = 400;
				x3 = 200;
				y1 = 280;
				y2 = 300;
				y3 = 310;
				n = 0.1;	
				r = 0;
			}				
		}
	}
}

class JumboParticle extends NormalParticle//uses inheritance
{
	//your code here
	JumboParticle()
	{
		d = 50;
	}
}

