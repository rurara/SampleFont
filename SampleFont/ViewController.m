//
//  ViewController.m
//  SampleFont
//
//

#import "ViewController.h"


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    fontTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 460) style:UITableViewStylePlain];
    
    fontTableView.dataSource = self;
    fontTableView.delegate = self;
    
    NSArray* tempFonts = [UIFont familyNames];
    for(NSString* aFont in tempFonts){
        NSLog(@"%@",aFont);
    }
    
    [self.view addSubview:fontTableView];
	// Do any additional setup after loading the view, typically from a nib.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray* tempFonts = [UIFont familyNames];
    return [tempFonts count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"testcell"];
    
    NSArray* tempFonts = [UIFont familyNames];
    
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero];
        NSString *tempString = [tempFonts objectAtIndex:indexPath.row];
        
        cell.textLabel.text = [NSString stringWithFormat:@"%@/鸡肉/とりにく/チキン/치킨", tempString];
        [cell.textLabel setFont:[UIFont fontWithName:tempString size:10]];
    }

    return cell;
    
}

@end
