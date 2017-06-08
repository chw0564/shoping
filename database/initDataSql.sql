insert into t_sysuser values(null,'超级管理员','admin','admin','1');
insert into t_sysuser values(null,'汤姆','tom','tom','3');
insert into t_sysuser values(null,'杰克','jack','jack','2');

insert into t_product_type values(null,"家电",1);
insert into t_product_type values(null,"数码手机",1);
insert into t_product_type values(null,"电脑",1);
insert into t_product_type values(null,"服装",1);
insert into t_product_type values(null,"书籍",0);

insert into t_product values(null,"TCL XQB55-36SP洗衣机",699,"01.jpg",1,1);
insert into t_product values(null,"TCL Skyworth/创维 32英寸电视",1199,"02.jpg",1,1);
insert into t_product values(null,"Haier/海尔BCD-160TMPQ冰箱",999,"03.jpg",1,1);
insert into t_product values(null,"格力空调壁挂1.5匹",2799,"04.jpg",1,2);

insert into t_product values(null,"佳能 EOS 77D单反",5499.35,"05.jpg",2,1);
insert into t_product values(null,"飞利浦录音笔VTR5100",235,"06.png",2,1);
insert into t_product values(null,"手环高清微型录音笔摄像机",148,"07.jpg",2,2);
insert into t_product values(null,"小米手环2代智能运动",127.90,"08.jpg",2,1);
insert into t_product values(null,"iPhone 7 Plus 128G",6688,"09.jpg",2,1);

insert into t_product values(null,"宁美国度台式电脑",3585,"10.jpg",3,1);
insert into t_product values(null,"国行Apple/苹果 9.7英寸 iPad",3890,"11.jpg",3,1);
insert into t_product values(null,"Lenovo/联想 拯救者 R720-15IKB游戏本",5399,"12.jpg",3,1);
insert into t_product values(null,"Jumper/中柏 EZbook 上网本",1188,"13.jpg",3,2);

insert into t_product values(null,"职业装工作服",168,"14.jpg",4,1);
insert into t_product values(null,"个性短袖T恤",78,"15.jpg",4,1);
insert into t_product values(null,"儿童爵士舞演出服",76,"16.jpg",4,1);
insert into t_product values(null,"职业装女装套装",168,"17.jpg",4,2);

insert into t_product values(null,"Java项目开发实战入门",41.86,"18.jpg",5,1);
insert into t_product values(null,"第一行代码 Android 第2版",67.8,"19.jpg",5,1);
insert into t_product values(null,"PHP从入门到精通",48.86,"20.jpg",5,1);
insert into t_product values(null,"HTML5+CSS3从入门到精通",48.6,"21.jpg",5,2);

insert into t_user values(null,"张三","zhangsan","123");
insert into t_user values(null,"李四","lisi","123");

insert into t_user_address values(null,"南京市浦口区天润城3街区12栋402","18600000001","王二",1);
insert into t_user_address values(null,"南京市浦口区天润城3街区12栋402","18600000002","张三",1);
insert into t_user_address values(null,"南京市浦口区大华柳州苑3栋102","18600000003","豆豆",2);
insert into t_user_address values(null,"南京市浦口区大华柳州苑3栋102","18600000002","李四",2);


insert into t_online_order values(null,"12343446546",1,1,1,"2017-5-14",1,1);
insert into t_online_order values(null,"12343446544",2,1,1,"2017-5-1",2,2);
insert into t_online_order values(null,"12343446589",3,2,1,"2017-4-11",3,1);
insert into t_online_order values(null,"12343446545",4,2,1,"2017-5-7",4,3);
