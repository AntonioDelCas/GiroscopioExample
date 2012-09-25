//
//  ViewController.m
//  GiroscopioExample
//
//  Created by antonio jesus delgado castillo on 24/08/12.
//  Copyright (c) 2012 ajdc. All rights reserved.
//

#import "ViewController.h"

//@interface ViewController ()

//@end
@implementation ViewController

@synthesize imagen, x, y, z;


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    /*Se inicializa la variable motionManager*/
    motionManager = [[CMMotionManager alloc] init];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view. // e.g. self.myOutlet = nil;
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}


- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}



#pragma mark - Métodos auxiliares
-(IBAction)cambioActualizaciones:(id)sender {
    /*si el boton está en ON*/
    if ([sender isOn]) {
        /*se comienzan a capturar actualizaciones del giroscopio*/
        [motionManager startGyroUpdates];
        /*se especifica el intervalo de actualización*/
        timer = [NSTimer scheduledTimerWithTimeInterval:1/30.0
                                                 target:self
                                               selector:@selector(doGyroUpdate)
                                               userInfo:nil
                                                repeats:YES];
                 }
    /*si el boton está en OFF*/
    else
    {
        /*se termina la captura actualizaciones del giroscopio*/
        [motionManager stopGyroUpdates];
        /*se para el timer*/
        [timer invalidate];
        /*se pone el texto de los labels vacios*/ x.text = @"";
        y.text = @"";
        z.text = @"";
    }
}
  

-(void)doGyroUpdate {
    /*se recoge la rotación en Z*/
    float rate = motionManager.gyroData.rotationRate.z; /*si el valor absoluto de rate es mayor que 0.2*/
    if (fabs(rate) > .2) {
            /*se declara una variable local direction*/
            float direction;
            /*si rate es mayor que 0*/
            if(rate>0)
            {
                /*direction toma el valor 1*/
                direction=1;
            }
                /*sino*/
            else
            {
                direction=-1;
            }
            /*se incrementa el valor de rotation en +PI/90 o -PI/90 dependiendo*/
        rotation += direction * M_PI/90.0; /*se realiza la rotacion en la imagen*/
        self.imagen.transform = CGAffineTransformMakeRotation(rotation);
    }
    [self setGyro];
}




-(void)setGyro {
    /*se situa en la etiqueta X el valor de la coordenada X*/
    x.text = [[NSString alloc]initWithFormat:@"%f",motionManager.gyroData.rotationRate.x];
    /*se situa en la etiqueta Y el valor de la coordenada Y*/
    y.text = [[NSString alloc]initWithFormat:@"%f",motionManager.gyroData.rotationRate.y];
    /*se situa en la etiqueta Z el valor de la coordenada Z*/
    z.text = [[NSString alloc]initWithFormat:@"%f",motionManager.gyroData.rotationRate.z];
}

@end
