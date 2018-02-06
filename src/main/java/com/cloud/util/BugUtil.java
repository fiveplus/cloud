package com.cloud.util;

import org.apache.log4j.Logger;

public class BugUtil {
    private static final Logger LOGGER = Logger.getLogger(BugUtil.class);

    public static String attack(){
        String[] strs = {
                "caveat! Your service area is under DDOS attack!",
                "caveat! Your service has an accident!",
                "server connection timed out."
        };
        int index = (int)(Math.random() * 10);
        if(index <= 2){
            LOGGER.error(strs[index]);
            sleep();
            return strs[index];
        }
        return null;
    }

    private static void sleep(){
        try{
            int time = 1 + (int)(Math.random() * 10);
            Thread.sleep(time);
        }catch(Exception e){
            LOGGER.error(e);
        }
    }

    public static void main(String[] args){
        int num = 0;
        for(int i = 0; i <= 1000; i++){
            System.out.println("第 " + i + " 次");
            String str = BugUtil.attack();
            if(str != null){
                num++;
            }
        }
        System.out.println("共遭受了" + num + "次攻击");
    }

}
