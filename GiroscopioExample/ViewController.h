//
//  ViewController.h
//  GiroscopioExample
//
//  Created by antonio jesus delgado castillo on 24/08/12.
//  Copyright (c) 2012 ajdc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface ViewController : UIViewController
{
    /**Variable que proporciona los servicios motion*/
    CMMotionManager *motionManager;
    /**Variable para establecer el tiempo de actualización*/
    NSTimer *timer;
    /**variable que corresponde a la rotación del dispositivo*/
    float rotation;

}


/**Propiedad correspondiente a la imagen del avión*/
@property(nonatomic, strong) IBOutlet UIImageView *imagen;

/**Propiedad correspondiente la etiqueta de la rotación en X*/
@property(nonatomic, strong) IBOutlet UILabel *x;

/**Propiedad correspondiente la etiqueta de la rotación en Y*/
@property(nonatomic, strong) IBOutlet UILabel *y;

/**Propiedad correspondiente la etiqueta de la rotación en Z*/
@property(nonatomic, strong) IBOutlet UILabel *z;

/**
 * Método llamado cuando se cambia el switch para habilitar
 * o deshabilitar las actualizaciones del giroscopio *
 * @param sender botón que envio la llamada *
 */
-(IBAction)cambioActualizaciones:(id)sender;

/**
 * Método para actualizacion del giro *
 */
-(void)doGyroUpdate;

/**
 * Método para mostrar el valor de la rotacion del dispositivo *
 */
-(void)setGyro;


@end
