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
    [self.view addSubview:fontTableView];

    fontArray = [NSMutableArray new];
	// Do any additional setup after loading the view, typically from a nib.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    for (NSString *fontName in [UIFont familyNames]) {
        for (NSString *fontStyleName in [UIFont fontNamesForFamilyName:fontName]) {
            [fontArray addObject:fontStyleName];
            NSLog(@"%@",fontStyleName);
        }
    }

    return [fontArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"testcell"];
    
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero];
        NSString *fontStyleName = [fontArray objectAtIndex:indexPath.row];

        cell.textLabel.text = [NSString stringWithFormat:@"%@/鸡肉/とりにく/チキン/치킨", fontStyleName];
        [cell.textLabel setFont:[UIFont fontWithName:fontStyleName size:10]];
    }

    return cell;
}

@end
