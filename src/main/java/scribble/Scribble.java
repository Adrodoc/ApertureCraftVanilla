package scribble;

import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeMap;

public class Scribble {
    // private static final double G = 9.83;
    private static final double G = 29;

    public static void main(String[] args) {
        calculateG();
//        printMpl();
    }

    private static void printMpl() {
        for (int t = 1; t < 100; t++) {
            double v = t / 20d * G / 20d;
            // System.out.println(t + ":\t" + v);
            System.out
                    .println("/execute @a[score_ACV_TP_TO_min=0,score_ACV_VELOCITY_min="
                            + t
                            + ",score_ACV_VELOCITY="
                            + t
                            + "] ~ ~ ~ /summon ArmorStand ~ ~ ~ {CustomName:\"ACV_Velocity\",Tags:[\"new\"],Motion:[-"
                            + v
                            + ",0.0,0.0],Invisible:1b,Invulnerable:1b,Marker:1b}");
        }
    }

    private static void calculateG() {
        Map<Integer, Integer> map = new TreeMap<Integer, Integer>();
        map.put(1, 4);
        map.put(2, 6);
        map.put(3, 8);
        map.put(4, 9);
        map.put(5, 11);
        map.put(6, 12);
        map.put(7, 13);
        map.put(8, 14);
        map.put(9, 15);
        map.put(10, 16);
        map.put(20, 23);
        map.put(21, 24);
        map.put(22, 25);
        map.put(23, 25);
        map.put(24, 26);
        map.put(25, 26);
        map.put(50, 39);
        map.put(100, 59);
        map.put(200, 92);
        map.put(300, 121);
        map.put(400, 148);
        map.put(500, 175);
        for (Entry<Integer, Integer> entry : map.entrySet()) {
            double height = entry.getKey();
            double ticks = entry.getValue();
            double s = ticks / 20d;
            double g = 2 * height / (s * s);
            System.out.println(height + ":\t" + g);
        }
    }

}
