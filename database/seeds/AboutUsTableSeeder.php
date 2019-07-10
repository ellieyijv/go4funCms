<?php

use Illuminate\Database\Seeder;

class AboutUsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('about_us')->insert([
           "description"=>"南半球的热情在这里绽放，时尚、优雅、活力、传奇，伴随着慵懒的海湾，狂欢！火车一般是从墨尔本南十字火车站出发，从墨尔本到吉朗。其中从墨尔本到吉朗是火车线，周一至周五高峰时期十几分钟一趟，周六、周日基本每个小时都有一趟。",
            'aboutusImg'=>"/img/aboutus.png",
            'herobannerImg'=>"/img/aboutus.png",
            "first_title" => "填充文字澳大利亚墨尔本+凯恩斯+悉尼自由行 经典东海岸每城3晚",
            "first_description" =>"半球的热情在这里绽放，时尚、优雅、活力、传奇……伴随着慵懒的海湾，狂欢！火车一般是从墨尔本南十字火车站出发，从墨尔本到吉朗。其中从墨尔本到吉朗是火车线，周一至周五高峰时期十几分钟一趟，周六、周日基本每个小时",
            'first_img_url'=>"/img/aboutus.png",
           "second_title" =>"填充文字澳大利亚墨尔本+凯恩斯+悉尼自由行 经典东海岸每城3晚",
           "second_description"=>"半球的热情在这里绽放，时尚、优雅、活力、传奇……伴随着慵懒的海湾，狂欢！火车一般是从墨尔本南十字火车站出发，从墨尔本到吉朗。其中从墨尔本到吉朗是火车线，周一至周五高峰时期十几分钟一趟，周六、周日基本每个小时",
            'second_img_url'=>"/img/aboutus.png",
            "third_title" =>"填充文字澳大利亚墨尔本+凯恩斯+悉尼自由行 经典东海岸每城3晚",
            "third_description" =>"半球的热情在这里绽放，时尚、优雅、活力、传奇……伴随着慵懒的海湾，狂欢！火车一般是从墨尔本南十字火车站出发，从墨尔本到吉朗。其中从墨尔本到吉朗是火车线，周一至周五高峰时期十几分钟一趟，周六、周日基本每个小时",
            'third_img_url' => "/img/aboutus.png"  
        ]);
    }
}
