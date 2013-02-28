//
//  View.m
//  Manhattan
//
//  Created by NYU User on 10/27/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <CoreLocation/CLLocation.h>	//for CLLocationCoordinate2D
#import "View.h"

@implementation View

- (id) initWithFrame: (CGRect) frame
{
    self = [super initWithFrame: frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void) drawRect: (CGRect) rect
{
    // Drawing code
    static CLLocationCoordinate2D a[] = {
        {40.67556080389106, -73.9703893661499},
        {40.67546316122981, -73.97086143493652},
        {40.67523532779746, -73.97107601165771},
        {40.675072589154794, -73.9712905883789},
        {40.67477965859698, -73.97146224975586},
        {40.67451927479847, -73.97159099578857},
        {40.67432398628223, -73.97154808044434},
        {40.67403105243534, -73.9715051651001},
        {40.673640471970806, -73.9715051651001},
        {40.67328243786832, -73.9712905883789},
        {40.67295695065227, -73.97107601165771},
        {40.6727291086556, -73.97086143493652},
        {40.67266401079927, -73.97051811218262},
        {40.67266401079927, -73.97047519683838},
        {40.672436167801614, -73.97047519683838},
        {40.67217577485094, -73.97064685821533},
        {40.67181773288338, -73.97081851959229},
        {40.66136857063693, -73.97961616516113},
        {40.66123835268023, -73.9799165725708},
        {40.66110813446929, -73.98021697998047},
        {40.66091280667626, -73.9802598953247},
        {40.660782587829814, -73.98000240325928},
        {40.66071747831128, -73.97983074188232},
        {40.660750033078486, -73.97953033447266},
        {40.660782587829814, -73.97944450378418},
        {40.658503716866974, -73.97485256195068},
        {40.65837349331769, -73.97455215454102},
        {40.65814560149473, -73.97433757781982},
        {40.65703868728088, -73.9740800857544},
        {40.65150384071989, -73.97227764129639},
        {40.65134104416439, -73.97274971008301},
        {40.65104800936359, -73.97279262542725},
        {40.65072241363121, -73.97266387939453},
        {40.6506572942941, -73.97236347198486},
        {40.650592174893426, -73.97214889526367},
        {40.650624734601685, -73.971848487854},
        {40.65075497327594, -73.97159099578857},
        {40.65088521169599, -73.9715051651001},
        {40.65101544986186, -73.97146224975586},
        {40.65117824721171, -73.9715051651001},
        {40.65488991902444, -73.96193504333496},
        {40.66149878833944, -73.96305084228516},
        {40.661954548296286, -73.96322250366211},
        {40.66244285908011, -73.96305084228516},
        {40.66289861258635, -73.96266460418701},
        {40.663061380941045, -73.96236419677734},
        {40.66325670244236, -73.9619779586792},
        {40.66325670244236, -73.96120548248291},
        {40.66325670244236, -73.960862159729},
        {40.67152478802533, -73.96249294281006},
        {40.67168753532757, -73.96300792694092},
        {40.671850282232604, -73.96356582641602},
        {40.672013028740395, -73.96420955657959},
        {40.67224087318395, -73.96485328674316},
        {40.67246871684894, -73.96549701690674},
        {40.67266401079927, -73.96648406982422},
        {40.67282675532094, -73.96725654602051},
        {40.67292440184326, -73.96790027618408},
        {40.67295695065227, -73.96845817565918},
        {40.67295695065227, -73.96871566772461},
        {40.673119694458904, -73.9689302444458},
        {40.673445180880506, -73.96880149841309},
        {40.673900859201396, -73.96880149841309},
        {40.67448672675216, -73.96888732910156},
        {40.6749098501149, -73.96905899047852},
        {40.67533297079236, -73.96940231323242},
        {40.67559335141301, -73.96996021270752},
        {40.675625898919115, -73.9703893661499},
        {40.675495708799446, -73.97090435028076},
        {40.67536551842556, -73.97103309631348}
	};
	static const size_t n = sizeof a / sizeof a[0];
	
	CGContextRef c = UIGraphicsGetCurrentContext();
	
	CGSize s = self.bounds.size;
	CGContextTranslateCTM(c, s.width / 2, s.height / 2);
	
	//Longitude and latitude in degrees of the heart of Manhattan,
	//probably somewhere around the Angel of the Waters.
	CGFloat xtranslate = 73.96965;
	CGFloat ytranslate = -40.6623;
	CGFloat scale = 15000;	//pixels per degree of latitude
    
	CGContextScaleCTM(c, scale * cos(ytranslate * M_PI / 180), -scale);
	CGContextTranslateCTM(c, xtranslate, ytranslate);
    
	CGContextBeginPath(c);
	CGContextMoveToPoint(c, a[0].longitude, a[0].latitude);
	
	for (size_t i = 1; i < n; ++i) {
		CGContextAddLineToPoint(c, a[i].longitude, a[i].latitude);
	}
	
	CGContextClosePath(c);

	CGContextSetRGBFillColor(c, .31, .71, .3, 1.0);	//green for Prospect Park
    [self drawLake: c];
  	CGContextFillPath(c);
    
    CGContextBeginPath(c);

	CGContextSetRGBFillColor(c, 0.0, 1.0, 0, .5);
	CGContextFillPath(c);
}

- (void)drawLake:(CGContextRef) c
{

   static CLLocationCoordinate2D lake[]  = {
       {40.655687575923785, -73.96693468093872},
       {40.65576082965073, -73.96679520606995},
       {40.655842222586294, -73.96677374839783},
       {40.65599686889035, -73.96676301956177},
       {40.65615965408628, -73.96678447723389},
       {40.65633057811455, -73.96675229072571},
       {40.656468944864315, -73.96669864654541},
       {40.65658289373687, -73.96665573120117},
       {40.656672424857334, -73.9665699005127},
       {40.65671312078148, -73.96643042564392},
       {40.656696842414796, -73.96629095077515},
       {40.65663986810017, -73.96617293357849},
       {40.656574754538156, -73.96603345870972},
       {40.656591032934614, -73.96589398384094},
       {40.656688703229975, -73.96578669548035},
       {40.65670498159865, -73.96569013595581},
       {40.65681079089812, -73.96571159362793},
       {40.65690846087176, -73.96576523780823},
       {40.657054965564136, -73.96586179733276},
       {40.65722588729861, -73.96599054336548},
       {40.65732355666454, -73.96613001823425},
       {40.65744564317089, -73.96645188331604},
       {40.657478199534864, -73.96660208702087},
       {40.65759214668358, -73.96675229072571},
       {40.657665398319274, -73.96693468093872},
       {40.657502616797395, -73.96750330924988},
       {40.65746192135486, -73.96766424179077},
       {40.65746192135486, -73.96791100502014},
       {40.65742122588749, -73.96811485290527},
       {40.65742936498295, -73.96832942962646},
       {40.6575107558829, -73.96851181983948},
       {40.65757586853139, -73.96859765052795},
       {40.65773051081685, -73.96859765052795},
       {40.657836318489814, -73.9685332775116},
       {40.6579095698574, -73.96846890449524},
       {40.65782004039718, -73.96822214126587},
       {40.657803762300595, -73.96783590316772},
       {40.6578688746631, -73.96762132644653},
       {40.65792584792817, -73.96728873252869},
       {40.65793398696206, -73.96648406982422},
       {40.65792584792817, -73.96629095077515},
       {40.65792584792817, -73.96615147590637},
       {40.65784445753461, -73.9660120010376},
       {40.65773051081685, -73.965904712677},
       {40.65757586853139, -73.9657974243164},
       {40.65709566125493, -73.9654004573822},
       {40.656680564044166, -73.965003490448},
       {40.65647708407595, -73.96488547325134},
       {40.65624918577474, -73.96469235420227},
       {40.65609454005558, -73.96445631980896},
       {40.65582594400712, -73.96426320075989},
       {40.65547595359422, -73.96405935287476},
       {40.65515037946874, -73.96429538726807},
       {40.65506898568911, -73.9645528793335},
       {40.655077125071536, -73.96472454071045},
       {40.65511782196881, -73.96485328674316},
       {40.65514224009523, -73.96507859230042},
       {40.65514224009523, -73.96519660949707},
       {40.65519107632131, -73.96541118621826},
       {40.65520735505539, -73.96564722061157},
       {40.65514224009523, -73.96584033966064},
       {40.65483294316671, -73.9663553237915},
       {40.654702712452064, -73.96650552749634},
       {40.65452364480432, -73.96648406982422},
       {40.65441783187751, -73.96661281585693},
       {40.65430387930709, -73.96679520606995},
       {40.654295739830324, -73.96708488464355},
       {40.65426318191335, -73.96753549575806},
       {40.654165508067095, -73.96775007247925},
       {40.65397829946209, -73.96807193756104},
       {40.653905043778, -73.96824359893799},
       {40.653758532168595, -73.96850109100342},
       {40.65365271802834, -73.96888732910156},
       {40.65372597398947, -73.96904826164246},
       {40.65378295079248, -73.96917700767517},
       {40.65370969489392, -73.96946668624878},
       {40.653587601550925, -73.9695954322815},
       {40.653457368405476, -73.96991729736328},
       {40.65306666744393, -73.97026062011719},
       {40.65309922594478, -73.97043228149414},
       {40.65286317645373, -73.97046446800232},
       {40.65276550055797, -73.97041082382202},
       {40.65268410386894, -73.9702820777893},
       {40.65256200864927, -73.97026062011719},
       {40.65250503080362, -73.97048592567444},
       {40.65248061171201, -73.97063612937927},
       {40.65254572926974, -73.97075414657593},
       {40.65264340548722, -73.97066831588745},
       {40.65270038321471, -73.97061467170715},
       {40.65277364022142, -73.97065758705139},
       {40.652855036801185, -73.97075414657593},
       {40.652936433281695, -73.97090435028076},
       {40.653074807070645, -73.97111892700195},
       {40.653131784429746, -73.97126913070679},
       {40.65320504096279, -73.97138714790344},
       {40.653294576616204, -73.97148370742798},
       {40.65355504328839, -73.9715051651001},
       {40.65365271802834, -73.9715051651001},
       {40.65364457847213, -73.97138714790344},
       {40.65365271802834, -73.97121548652649},
       {40.653758532168595, -73.97119402885437},
       {40.65383992754687, -73.97119402885437},
       {40.65397015994561, -73.97125840187073},
       {40.65403527604967, -73.97126913070679},
       {40.65433643720419, -73.97126913070679},
       {40.65447480808973, -73.97125840187073},
       {40.654572481483186, -73.97126913070679},
       {40.65468643359484, -73.97127985954285},
       {40.654914337234295, -73.97125840187073},
       {40.655044567535874, -73.97125840187073},
       {40.65512596134527, -73.97130131721497},
       {40.65523991251161, -73.97138714790344},
       {40.655345724134676, -73.97147297859192},
       {40.65543525691542, -73.97151589393616},
       {40.65549223225879, -73.97154808044434},
       {40.65561432211645, -73.97160172462463},
       {40.65572013314569, -73.97162318229675},
       {40.655777108245786, -73.9716124534607},
       {40.65588291901686, -73.97159099578857},
       {40.655972451076686, -73.97151589393616},
       {40.65611895782453, -73.97119402885437},
       {40.65618407183142, -73.97108674049377},
       {40.656281742722584, -73.9708399772644},
       {40.65632243888502, -73.97064685821533},
       {40.65633057811455, -73.97047519683838},
       {40.65632243888502, -73.9702820777893},
       {40.65627360348711, -73.97016406059265},
       {40.65620035032322, -73.97003531455994},
       {40.65615151483591, -73.96992802619934},
       {40.65616779333565, -73.96970272064209},
       {40.656216628811045, -73.96958470344543},
       {40.65620035032322, -73.9694344997406},
       {40.65613523633223, -73.96914482116699},
       {40.65613523633223, -73.96899461746216},
       {40.656192211077816, -73.96872639656067},
       {40.656208489567625, -73.96856546401978},
       {40.65617593258403, -73.96840453147888},
       {40.65611895782453, -73.96814703941345},
       {40.65615965408628, -73.96794319152832},
       {40.65617593258403, -73.9675784111023},
       {40.65611081856921, -73.96739602088928},
       {40.656061983016386, -73.96727800369263},
       {40.65576082965073, -73.96711707115173},
       {40.65569571523076, -73.96704196929932},
       {40.65563874006115, -73.96687030792236},
       {40.65563874006115, -73.966805934906}
   };
    static const size_t n = sizeof lake / sizeof lake[0];
	//CGContextMoveToPoint(c, 40.655687575923785, -73.96693468093872);
	for (size_t i = 1; i < n; ++i) {
		CGContextAddLineToPoint( c, lake[i].longitude, lake[i].latitude);
	}
	CGContextClosePath( c );
 }
@end
